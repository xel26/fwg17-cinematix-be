package customerControllers

import (
	"net/http"

	jwt "github.com/appleboy/gin-jwt/v2"
	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
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