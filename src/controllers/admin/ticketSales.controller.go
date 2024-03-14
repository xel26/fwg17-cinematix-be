package adminControllers

import (
	"fmt"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/models"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

func TicketSales(c *gin.Context) {
	genreId, _ := strconv.Atoi(c.Query("genreId"))
	locationId, _ := strconv.Atoi(c.Query("locationId"))
	dataSales, err := models.FindTicketSales(genreId, locationId)
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println(dataSales)
	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Ticket Sales",
		Results: dataSales,
	})
}
