package globalControllers

import (
	"fmt"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
	"github.com/putragabrielll/fwg17-cinematix-be/src/models"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

// mengambil date berdasarkan movieCinemaId melalui table moviesTime
func GetDate(c *gin.Context) {
	movieCinemaId, _ := strconv.Atoi(c.Query("movieCinemaId"))

	result, err := models.GetDate(movieCinemaId)
	if err != nil {
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return
	}

	if len(result) == 0 {
		msg := fmt.Sprintf("data date with movieCinemaId %v not found", movieCinemaId)
		helpers.Utils(err, msg, c)
		return
	}

	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Get date successfully",
		Results: result,
	})
}




// mengambil airing time berdasarkan dateId melalui table airingTimeDateId
func GetAiringTime(c *gin.Context) {
	movieId, _ := strconv.Atoi(c.Query("movieId"))

	result, err := models.GetAiringTime(c, movieId)
	if err != nil {
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return
	}

	if len(result) == 0 {
		msg := "data not found"
		helpers.Utils(err, msg, c)
		return
	}

	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Get airing time successfully",
		Results: result,
	})
}




// mengambil id movieTime berdasarkan airingTimeDateId dan movieCinemaId
func GetMovieTimeId(c *gin.Context) {
	airingTimeDateId, _ := strconv.Atoi(c.Query("airingTimeDateId"))
	movieCinemaId, _ := strconv.Atoi(c.Query("movieCinemaId"))

	result, err := models.GetMovieTimeId(c, airingTimeDateId, movieCinemaId)
	
	if result.Id == 0 {
		msg := fmt.Sprintf("Movie time with airingTimeDateId %v and movieCinemaId %v not found", airingTimeDateId, movieCinemaId)
		helpers.Utils(err, msg, c)
		return
	}

	if err != nil {
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return
	}

	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Get id movieTime successfully",
		Results: result,
	})
}




// mengambil id airingTimeDate berdasarkan airingTimeId dan dateId
func GetAiringTimeDateId(c *gin.Context) {
	airingTimeId, _ := strconv.Atoi(c.Query("airingTimeId"))
	dateId, _ := strconv.Atoi(c.Query("dateId"))

	result, err := models.GetAiringTimeDateId(c, airingTimeId, dateId)
	
	if result.Id == 0 {
		msg := fmt.Sprintf("airingTimeDate with airingTimeId %v and dateId %v not found", airingTimeId, dateId)
		helpers.Utils(err, msg, c)
		return
	}

	if err != nil {
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return
	}

	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Get id airingTimeDate successfully",
		Results: result,
	})
}