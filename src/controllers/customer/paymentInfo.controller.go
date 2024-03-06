package customerControllers

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
	"github.com/putragabrielll/fwg17-cinematix-be/src/models"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

func GetPaymentInfo(c *gin.Context) {
	orderId, err := strconv.Atoi(c.Query("orderId"))
	if err != nil{
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return
	}

	result, err := models.GetPaymentInfo(c, orderId)
	if err != nil{
		msg := "payment info not found"
		helpers.Utils(err, msg, c)
		return
	}

	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Get payment info success",
		Results: result,
	})
}