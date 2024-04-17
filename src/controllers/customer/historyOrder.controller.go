package customerControllers

import (
	"fmt"
	"math"
	"net/http"
	"strconv"

	jwt "github.com/appleboy/gin-jwt/v2"
	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
	"github.com/putragabrielll/fwg17-cinematix-be/src/models"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

func GetHistoryOrder(c *gin.Context) {
	claims := jwt.ExtractClaims(c)
	userId := int(claims["id"].(float64))

	page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
	limit, _ := strconv.Atoi(c.DefaultQuery("limit", "3"))
	orderBy := c.DefaultQuery("orderBy", "createdAt")
	orderMethod := c.DefaultQuery("orderMethod", "DESC")

	offset := (page - 1) * limit

	result, err := models.GetHistoryOrder(userId, page, limit, offset, orderBy, orderMethod)
	if err != nil{
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return
	}

	if len(result.Data.([]models.HistoryOrder)) == 0 {		// => type asertion
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
		Success: true,
		Message: "Get history order success",
		PageInfo: *pageInfo,
		Results: result.Data,
	})
}




// for ticket information page
func GetTicket(c *gin.Context) {
	claims := jwt.ExtractClaims(c)
	userId := int(claims["id"].(float64))

	orderId, _ := strconv.Atoi(c.Query("orderId"))

	result, err := models.GetTicket(userId, orderId)
	// fmt.Println(result)
	if err != nil{
		msg := err.Error()

		if result.Id == 0 {
			message := fmt.Sprintf("user with id %v does not have order with id %v", userId, orderId)
			msg = message
		}
		
		helpers.Utils(err, msg, c)
		return
	}

	
	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "Get ticket success",
		Results: result,
	})
}