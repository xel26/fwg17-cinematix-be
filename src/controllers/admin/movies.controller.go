package adminControllers

import (
	"math"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
	adminModels "github.com/putragabrielll/fwg17-cinematix-be/src/models/admin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

func ListMovies(c *gin.Context) {
	// search := c.DefaultQuery("month", "march")
	search := c.DefaultQuery("month", "")
	page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
	limit, _ := strconv.Atoi(c.DefaultQuery("limit", "12"))
	offset := (page - 1) * limit

	countData, _ := adminModels.CountAllMovies(search)
	page_total := int(math.Ceil(float64(countData) / float64(limit)))

	nextPage := page + 1
  
    if !(nextPage <= int(page_total)) {
		nextPage = int(0)
	}
    prevPage := page - 1

	movies, err := adminModels.ListAllMovies(search, limit, offset)
	if err != nil {
		msg := "No Data Match"
		helpers.Utils(err, msg, c) // Error Handler
		return
	}

	pageInfo := &services.PageInfo{
		CurrentPage: page,
		Limit:       limit,
		PrevPage: prevPage,
		NextPage: nextPage,
		TotalPage:   page_total,
		TotalData:   countData,
	}

	c.JSON(http.StatusOK, &services.ResponseList{
		Success:  true,
		Message:  "List all movies",
		PageInfo: *pageInfo,
		Results:  movies,
	})
}

func DeleteMovies(c *gin.Context) {
	id, _ := strconv.Atoi(c.Param("id"))

	deleteMovies, err := adminModels.DeleteMovies(id)

	if err != nil {
		msg := "No Data Match"
		helpers.Utils(err, msg, c) // Error Handler
		return
	}
	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Delete movies successfully",
		Results: deleteMovies,
	})

}
