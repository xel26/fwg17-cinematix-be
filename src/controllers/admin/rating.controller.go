package adminControllers

import (
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
	adminModels "github.com/putragabrielll/fwg17-cinematix-be/src/models/admin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

func FindAllRating(c *gin.Context){
	rating, err := adminModels.FindAllRating()
	if err != nil {
		msg := err.Error()
		if strings.HasPrefix(err.Error(), "sql: no rows"){
			msg = "data rating not found"
		}

		helpers.Utils(err, msg, c)
		return
	}


	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "List All Rating",
		Results: rating,
	})
}