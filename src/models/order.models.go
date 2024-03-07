package models

import (
	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
)

type Order struct {
	OrderNumber      string `db:"orderNumber" json:"orderNumber" form:"orderNumber"`
	MoviesId         int    `db:"moviesId" json:"moviesId" form:"moviesId"`
	UserId           int    `db:"usersId" json:"userId" form:"userId"`
	CinemaLocationId int    `db:"cinemaLocationId" json:"cinemaLocationId" form:"cinemaLocationId"`
	PaymentId        int    `db:"paymentId" json:"paymentId" form:"paymentId"`
	SeatCount        int    `db:"seatCount" json:"seatCount" form:"seatCount"`
	IsPaid           bool   `db:"isPaid" json:"isPaid" form:"isPaid"`
	IsUsed           bool   `db:"isUsed" json:"isUsed" form:"isUsed"`
	Total            int    `db:"total" json:"total" form:"total"`
	MovieTimeId      int    `db:"movieTimeId" json:"movieTimeId" form:"movieTimeId"`
}

func InsertOrder(c *gin.Context, data Order) (Order, error) {
	sql := `
	INSERT INTO "order" ("orderNumber", "moviesId", "usersId", "cinemaLocationId", "paymentId", "seatCount", "isPaid", "isUsed", "total", "movieTimeId")
	VALUES
	(:orderNumber, :moviesId, :usersId, :cinemaLocationId, :paymentId, :seatCount, :isPaid, :isUsed, :total, :movieTimeId)
	RETURNING *
	`
	result := Order{}
	rows, err := db.NamedQuery(sql, data)
	if err != nil {
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return data, err
	}

	for rows.Next(){
		rows.StructScan(&result)
	}

	return result, err
}