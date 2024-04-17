package customerControllers

import (
	"fmt"
	"math"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
	"github.com/putragabrielll/fwg17-cinematix-be/src/models"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

func ListAllMovies(c *gin.Context) {
	status := c.DefaultQuery("status", "")
	page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
	limit, _ := strconv.Atoi(c.DefaultQuery("limit", "20"))
	search := c.DefaultQuery("search", "")
	filter := c.DefaultQuery("filter", "")
	orderBy := c.DefaultQuery("orderBy", "id")
	orderMethod := c.DefaultQuery("orderMethod", "ASC")

	fmt.Println(search)

	for i := 0; i < len(search); i++ {
		if search[i] == '\'' {
			search = search[:i+1] + "'" + search[i+1:]
			i++
		}
	}

	offset := (page - 1) * limit
	result, err := models.FindAllMovies(search, filter, orderBy, limit, offset, status, orderMethod)

	totalPage := int(math.Ceil(float64(result.Count) / float64(limit)))
	nextPage := page + 1
  
    if !(nextPage <= int(totalPage)) {
		nextPage = int(0)
	}
    prevPage := page - 1


	pageInfo := &services.PageInfo{
		CurrentPage: page,
		NextPage:    nextPage,
		PrevPage:    prevPage,
		Limit:       limit,
		TotalPage:   totalPage,
		TotalData:   result.Count,
	}

	if err != nil {
		msg := "No Data Match"
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

func DetailMovie(c *gin.Context) {
	id, _ := strconv.Atoi(c.Param("id"))

	movie, err := models.FindOneMovies(id)
	if err != nil {
		msg := "Movie Not Found"
		helpers.Utils(err, msg, c)
		return
	}

	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Detail Movie",
		Results: movie,
	})
}
