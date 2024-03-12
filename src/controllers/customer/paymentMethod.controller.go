package customerControllers

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
	"github.com/putragabrielll/fwg17-cinematix-be/src/models"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

func ListAllPaymentMethod(c *gin.Context) {
	result, err := models.FindAllPaymentMethod()
	if err != nil {
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return
	}

	c.JSON(http.StatusOK, &services.Response{
		Success:  true,
		Message:  "List All Payment Method",
		Results:  result,
	})
}