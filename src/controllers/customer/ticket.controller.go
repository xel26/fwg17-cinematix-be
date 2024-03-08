package customerControllers

import (
	"net/http"
	"strconv"

	jwt "github.com/appleboy/gin-jwt/v2"
	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
	"github.com/putragabrielll/fwg17-cinematix-be/src/models"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

func GetTicket(c *gin.Context) {
	claims := jwt.ExtractClaims(c)
	userId := int(claims["id"].(float64))
	
	orderId, err := strconv.Atoi(c.Query("orderId"))
	if err != nil{
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return
	}

	result, err := models.GetTicket(orderId, userId)
	if err != nil{
		msg := "ticket not found"
		helpers.Utils(err, msg, c)
		return
	}

	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Get ticket success",
		Results: result,
	})
}