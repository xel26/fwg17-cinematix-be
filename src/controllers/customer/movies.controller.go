package customerControllers

import (
	"math"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
	"github.com/putragabrielll/fwg17-cinematix-be/src/models"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

func ListAllMovies(c *gin.Context) {
	page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
	limit, _ := strconv.Atoi(c.DefaultQuery("limit", "6"))
	search := c.DefaultQuery("search", "")
	filter := c.DefaultQuery("filter", "")
	orderBy := c.DefaultQuery("orderBy", "id")

	offset := (page - 1) * limit
	result, err := models.FindAllMovies(search, filter, orderBy, limit, offset)

	totalPage := int(math.Ceil(float64(result.Count) / float64(limit)))

	pageInfo := &services.PageInfo{
		CurrentPage: page,
		Limit:       limit,
		TotalPage:   totalPage,
		TotalData:   result.Count,
	}

	if err != nil {
		msg := "Internal Server Error"
		helpers.Utils(err, msg, c) // Error Handler
		return
	}

	c.JSON(http.StatusOK, &services.ResponseList{
		Success:  true,
		Message:  "List All Movies",
		PageInfo: *pageInfo,
		Results:  result.Data,
	})
}
