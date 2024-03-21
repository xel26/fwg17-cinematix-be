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

func ListAllPaymentMethod(c *gin.Context) {
	search := c.DefaultQuery("search", "")
	page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
	limit, _ := strconv.Atoi(c.DefaultQuery("limit", "8"))
	orderBy := c.DefaultQuery("orderBy", "id")
	orderMethod := c.DefaultQuery("orderMethod", "ASC")

	offset := (page - 1) * limit

	result, err := models.FindAllPaymentMethod(search, limit, offset, orderBy, orderMethod)
	if err != nil {
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return
	}

	if len(result.Data.([]models.PaymentMethod)) == 0 {		// => type asertion
		msg := "no data found"
		helpers.Utils(err, msg, c)
		return
	}

	totalPage := int(math.Ceil(float64(result.Count)/float64(limit)))
	nextPage := page + 1
	if nextPage > totalPage {
		nextPage = 0
	}
	prevPage := page - 1
	if prevPage < 1 {
		prevPage = 0
	}

    

	pageInfo := &services.PageInfo{
		CurrentPage: page,
		NextPage:    nextPage,
        PrevPage:    prevPage,
		Limit:       limit,
		TotalPage:   totalPage,
		TotalData:   result.Count,
	}

	c.JSON(http.StatusOK, &services.ResponseList{
		Success:  true,
		Message:  "List All Payment Method",
		PageInfo: *pageInfo,
		Results:  result.Data,
	})
}