package middlewares

import (
	"context"
	"fmt"
	"os"
	"strings"

	"github.com/cloudinary/cloudinary-go/v2"
	"github.com/cloudinary/cloudinary-go/v2/api/uploader"
	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"github.com/joho/godotenv"
	"github.com/pkg/errors"
)

func UploadFile(c *gin.Context, form string, dest string) (string, error) {
	godotenv.Load()
	cloudName := os.Getenv("CLOUDINARY_CLOUD_NAME")
	cloudAPI := os.Getenv("CLOUDINARY_API_KEY")
	apiSecret := os.Getenv("CLOUDINARY_API_SECRET")
	cld, _ := cloudinary.NewFromParams(cloudName, cloudAPI, apiSecret)

	var ctx = context.Background()
	file, _ := c.FormFile(form)		// => agar dinamis sehingga fungsi upload dapat di gunakan di table lain dengan nama field yg berbeda, misal "image"
	extensionFile := file.Header["Content-Type"][0]

	ext := map[string]string{
		"image/png":  ".png",
		"image/jpeg": ".jpeg",
		"image/jpg":  ".jpg",
	}
	fileName := fmt.Sprintf("uploads/%v/%v%v", dest, uuid.NewString(), ext[extensionFile])
	renameFile := strings.Trim(strings.Split(fileName, "/")[2], "[]")

	// START VALIDATION FILE EXTENSION
	validTypeFile := []string{
		"image/png",
		"image/jpeg",
		"image/jpg",
	}
	if !(strings.Contains(strings.Join(validTypeFile, ","), extensionFile)) {
		return "", errors.New("Extension not support!")
	}
	if file.Size > (2 * 1024 * 1024) {
		return "", errors.New(("File to over size, Max file upload 2MB!"))
	}
	// END VALIDATION

	
	fileLocCloudinary := fmt.Sprintf("cinematix/%v/%v", dest, renameFile)
	// fileLocCloudinary := fmt.Sprintf("cinematix/movies/%v", renameFile) // untuk numpang upload file ke cloudinary
	resp, err := cld.Upload.Upload(ctx, file, uploader.UploadParams{PublicID: fileLocCloudinary})
	if err != nil {
		return resp.SecureURL, c.Err()
	}

	return resp.SecureURL, c.Err()
}
