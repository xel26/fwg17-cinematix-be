package customerControllers

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
	"github.com/putragabrielll/fwg17-cinematix-be/src/models"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

func GetReservedSeat(c *gin.Context) {
	movieTimeId, _ := strconv.Atoi(c.Query("movieTimeId"))
	cinemaLocationId, _ := strconv.Atoi(c.Query("cinemaLocationId"))

	result, err := models.GetReservedSeat(movieTimeId, cinemaLocationId)
	if err != nil {
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return
	}

	if result.SeatCode == nil {
		msg := "reserved seat not found"
		helpers.Utils(err, msg, c)
		return
	}

	// fmt.Println(result)
	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Get reserved seat success",
		Results: result,
	})
}
