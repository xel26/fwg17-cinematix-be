package adminControllers

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
	adminModels "github.com/putragabrielll/fwg17-cinematix-be/src/models/admin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)


func ListAllAiringTime(c *gin.Context){

	airingTime, err := adminModels.FindAllAiringTime()
	if err != nil {
		msg := "No Data Match"
		helpers.Utils(err, msg, c) // Error Handler
		return
		
	}

	c.JSON(http.StatusOK, services.Response{
		Success:  true,
		Message:  "List all movies",
		Results:  airingTime,
	})
}