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
	movieId, _ := strconv.Atoi(c.Query("movieId"))
	cinemaId, _ := strconv.Atoi(c.Query("cinemaId"))
	locationId, _ := strconv.Atoi(c.Query("locationId"))
	airingTimeId, _ := strconv.Atoi(c.Query("airingTimeId"))
	dateId, _ := strconv.Atoi(c.Query("dateId"))


	result, err := models.GetReservedSeat(movieId, cinemaId, locationId, airingTimeId, dateId)
	if err != nil{
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return
	}

	// if result[0].SeatCode == "null"{
	// 	msg := "reserved seat not found"
	// 	helpers.Utils(nil, msg, c)
	// 	return
	// }

	
	// fmt.Println(result)
	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Get reserved seat success",
		Results: result,
	})
}