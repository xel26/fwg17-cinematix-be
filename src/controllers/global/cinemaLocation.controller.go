package global

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
	"github.com/putragabrielll/fwg17-cinematix-be/src/models"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)


func CinemaLocation(c *gin.Context) {
	cinemaid, _ := strconv.Atoi(c.Param("cinemaid"))
	location, err := models.CinemaLocationId(cinemaid)
	if err != nil {
		msg := "No Data Match "
		helpers.Utils(err, msg, c) // Error Handler
		return
	}

	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Detail Cinema Location",
		Results: location,
	})
}