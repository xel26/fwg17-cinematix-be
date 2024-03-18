package customerControllers

import (
	"fmt"
	"net/http"
	"strconv"
	"strings"

	jwt "github.com/appleboy/gin-jwt/v2"
	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
	"github.com/putragabrielll/fwg17-cinematix-be/src/lib"
	"github.com/putragabrielll/fwg17-cinematix-be/src/models"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

func CreateOrder(c *gin.Context) {
	claims := jwt.ExtractClaims(c)
	userId := int(claims["id"].(float64))
	
	dataOrder := models.Order{}
	err := c.ShouldBind(&dataOrder)
	if err != nil{
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return
	}

	_, err = models.FindOneCinemaLocation(dataOrder.CinemaLocationId)
	if err != nil{
		msg := err.Error()
		
		if strings.HasPrefix(err.Error(), "sql: no rows"){
			msg = fmt.Sprintf("cinemaLocation with id %v not found", dataOrder.CinemaLocationId)
		}

		helpers.Utils(err, msg, c)
		return
	}

	
	_, err = models.FindOneMovieTime(dataOrder.MovieTimeId)
	if err != nil{
		msg := err.Error()
		
		if strings.HasPrefix(err.Error(), "sql: no rows"){
			msg = fmt.Sprintf("moviesTime with id %v not found", dataOrder.MovieTimeId)
		}

		helpers.Utils(err, msg, c)
		return
	}


	_, err = models.FindOnePaymentMethod(dataOrder.PaymentId)
	if err != nil{
		msg := err.Error()
		
		if strings.HasPrefix(err.Error(), "sql: no rows"){
			msg = fmt.Sprintf("payment method with id %v not found", dataOrder.PaymentId)
		}

		helpers.Utils(err, msg, c)
		return
	}


	dataOrder.UserId = userId
	dataOrder.OrderNumber = lib.RandomNumber(6)
	dataOrder.IsPaid = false
	dataOrder.IsUsed = false

	seatCodeSlice := strings.Split(dataOrder.SeatCode, ",")
	dataOrder.SeatCount = len(seatCodeSlice)

	cinemaPrice, err := models.GetCinemaPrice(dataOrder.MovieTimeId)
	if err != nil{
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return
	}

	dataOrder.Total = cinemaPrice.Price * dataOrder.SeatCount

	order, err := models.InsertOrder(dataOrder)
	if err != nil{
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return
	}

	
	for i := 0; i < order.SeatCount; i++ {
		dataOrderDetail := models.OrderDetail{}
		dataOrderDetail.OrderId = order.Id
		dataOrderDetail.SeatCode = seatCodeSlice[i]

		_, err := models.InsertOrderDetail(c, dataOrderDetail)
		if err != nil{
			msg := err.Error()
			helpers.Utils(err, msg, c)
			return
		}
	}
	

	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "insert order successfully",
		Results: order,
	})
}




func GetDate(c *gin.Context){
	movieCinemaId, _ := strconv.Atoi(c.Query("movieCinemaId"))

	result, err := models.GetDate(movieCinemaId)
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





func UpdatePaidStatusOrder(c *gin.Context){
	orderId, _ := strconv.Atoi(c.Param("orderId"))

	claims := jwt.ExtractClaims(c)
	userId := int(claims["id"].(float64))
	
	dataOrder := models.Order{}
	dataOrder.UserId = userId
	dataOrder.Id = orderId

	order, err := models.UpdatePaidStatusOrder(dataOrder)
	if err != nil{
		msg := err.Error()

		if order.Id == 0 {
			msg = fmt.Sprintf("user with id %v does not have order with id %v", userId, orderId)
		}

		helpers.Utils(err, msg, c)
		return
	}

	c.JSON(http.StatusOK, &services.Response{
		Success: true,
		Message: "update paid status order successfully",
		Results: order,
	})
}