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

func CreateOrder(c *gin.Context) {
	claims := jwt.ExtractClaims(c)
	userId := int(claims["id"].(float64))
	fmt.Println(userId)
}




func GetMovieTime(c *gin.Context){
	movieCinemaId, _ := strconv.Atoi(c.Query("movieCinemaId"))

	result, err := models.GetMovieTime(c, movieCinemaId)
	if err != nil{
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return
	}


	if len(result) == 0{
		msg := fmt.Sprintf("movie time with cinemaId %v not found", movieCinemaId)
		helpers.Utils(err, msg, c)
		return
	}

	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Get movie time successfully",
		Results: result,
	})
}