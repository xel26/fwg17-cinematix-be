package adminControllers

import (
	"fmt"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/models"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

func SalesChart(c *gin.Context) {
	movieId, _ := strconv.Atoi(c.Query("movieId"))
	dataSales, err := models.FindSalesChartByMovieId(movieId)
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println(dataSales)
	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Sales Cart",
		Results: dataSales,
	})
}
