package globalControllers

import (
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
	"github.com/putragabrielll/fwg17-cinematix-be/src/models"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

func GetMovieCinemaId(c *gin.Context) {
	movieId, _ := strconv.Atoi(c.Param("movieId"))

	movieCinemaId, err := models.FindMovieCinemaByMovieId(movieId)
	// fmt.Println(err)
	if err != nil {
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return
	}

	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "ALL Movie Cinema Id",
		Results: movieCinemaId,
	})

}
