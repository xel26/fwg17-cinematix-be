package customerControllers

import (
	"fmt"
	"net/http"
	"strconv"

	jwt "github.com/appleboy/gin-jwt/v2"
	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
	"github.com/putragabrielll/fwg17-cinematix-be/src/models"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

func GetHistoryOrder(c *gin.Context) {
	claims := jwt.ExtractClaims(c)
	userId := int(claims["id"].(float64))

	result, err := models.GetHistoryOrder(userId)
	if err != nil{
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return
	}

	if len(result) == 0 {
		msg := "data history order not found"
		helpers.Utils(err, msg, c)
		return
	}

	
	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Get history order success",
		Results: result,
	})
}


// for ticket information page
func GetHistoryOrderByOrdeId(c *gin.Context) {
	claims := jwt.ExtractClaims(c)
	userId := int(claims["id"].(float64))

	orderId, _ := strconv.Atoi(c.Query("orderId"))

	result, err := models.GetHistoryOrderByOrdeId(userId, orderId)
	// fmt.Println(result)
	if err != nil{
		msg := err.Error()

		if result.Id == 0 {
			message := fmt.Sprintf("user with id %v does not have order with id %v", userId, orderId)
			msg = message
		}
		
		helpers.Utils(err, msg, c)
		return
	}

	
	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Get history order by orderId success",
		Results: result,
	})
}