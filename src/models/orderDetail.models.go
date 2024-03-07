package models

import (
	"github.com/gin-gonic/gin"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
)

type OrderDetail struct {
	OrderId  int    `db:"orderId" json:"orderId" form:"orderId"`
	SeatCode string `db:"seatCode" json:"seatCode" form:"seatCode"`
}

func InsertOrderDetail(c *gin.Context, data OrderDetail) (OrderDetail, error) {
	sql := `
	INSERT INTO "orderDetail" ("orderId", "seatCode")
	VALUES (:orderId, :seatCode)
	RETURNING *
	`
	result := OrderDetail{}
	rows, err := db.NamedQuery(sql, data)
	if err != nil {
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return data, err
	}

	for rows.Next() {
		rows.StructScan(&result)
	}

	return result, err
}