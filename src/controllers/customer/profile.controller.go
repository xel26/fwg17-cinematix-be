package customerControllers

import (
	"net/http"

	"github.com/KEINOS/go-argonize"
	jwt "github.com/appleboy/gin-jwt/v2"
	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
	// "github.com/putragabrielll/fwg17-cinematix-be/src/middlewares"
	"github.com/putragabrielll/fwg17-cinematix-be/src/models"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

// SELECT PROFILE USERS
func ProfileUser(c *gin.Context) {
	claims := jwt.ExtractClaims(c)
	id := int(claims["id"].(float64))

	profileUsers, err := models.FindUsersId(id)
	if err != nil {
		msg := "Users not found"
		helpers.Utils(err, msg, c) // Error Handler
		return
	}

	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Detail users",
		Results: profileUsers,
	})
}

// UPDATE PROFILE
func UpdateUser(c *gin.Context) {
	claims := jwt.ExtractClaims(c)
	id := int(claims["id"].(float64))

	profileData := services.Person{}
	c.ShouldBind(&profileData) // untuk memasukkan data dari form ke struck Person{}
	
	if profileData.Password != "" {
		paswdhash := []byte(profileData.Password) // proses hashing password
		hasedPasswd, _ := argonize.Hash(paswdhash)
		profileData.Password = hasedPasswd.String()
	}

	// -------------
	// cekFile, err := middlewares.UploadFile(c, "profile") // fungsi upload file
	// if err != nil {
	// 	msg := fmt.Sprintf("%v", err)
	// 	helpers.Utils(err, msg, c) // Error Handler
	// 	return
	// }
	// profileData.Picture = cekFile
	profileData.Id = id
	// -------------

	updatedUsers, err := models.UpdateUsers(profileData)
	if err != nil {
		msg := "Users not found"
		helpers.Utils(err, msg, c) // Error Handler
		return
	}

	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Users updated successfully!",
		Results: updatedUsers,
	})
}