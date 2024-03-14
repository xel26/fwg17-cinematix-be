package adminControllers

import (
	"math"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
	"github.com/putragabrielll/fwg17-cinematix-be/src/models/admin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)


func ListMovies(c *gin.Context) {
	search := c.DefaultQuery("month", "march")
	page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
	limit, _ := strconv.Atoi(c.DefaultQuery("limit", "5"))
	offset := (page - 1) * limit

	countData, _ := adminModels.CountAllMovies(search)
	page_total := int(math.Ceil(float64(countData)/float64(limit)))

	movies, err := adminModels.ListAllMovies(search, limit, offset)
	if err != nil {
		msg := "No Data Match"
		helpers.Utils(err, msg, c) // Error Handler
		return
	}

	pageInfo := &services.PageInfo{
		CurrentPage: page,
		Limit:       limit,
		TotalPage:   page_total,
		TotalData:   countData,
	}

	c.JSON(http.StatusOK, &services.ResponseList{
		Success: true,
		Message: "List all movies",
		PageInfo: *pageInfo,
		Results: movies,
	})
}