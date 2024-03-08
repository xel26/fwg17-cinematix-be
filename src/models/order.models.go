package models

import (
	"encoding/base64"
	"fmt"

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



type MovieTime struct {
	Id int `db:"id" json:"id"`
	AiringTimeDate string `db:"airingTimeDate" json:"airingTimeDate"`
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




func GetMovieTime(c *gin.Context, movieCinemaId int) ([]MovieTime, error) {
	sql := `
	SELECT
	"mt"."id",
	JSONB_AGG(
        DISTINCT JSONB_BUILD_OBJECT(
            'airingTimeDateId', "atd"."id",
			'airingTime', "at"."time",
			'date', "d"."date"
        )
    ) AS "airingTimeDate"
	FROM "moviesTime" "mt"
	JOIN "airingTimeDate" "atd" ON ("atd"."id" = "mt"."airingTimeDateId")
	JOIN "airingTime" "at" ON ("at"."id" = "atd"."airingTimeId")
	JOIN "date" "d" ON ("d"."id" = "atd"."dateId")
	WHERE "mt"."movieCinemaId" = $1
	GROUP BY "mt"."id"
	`
	data := []MovieTime{}
	err := db.Select(&data, sql, movieCinemaId)
	if err != nil {
		return data, err
	}

	for i := range data{
		encoded := base64.StdEncoding.EncodeToString([]byte(data[i].AiringTimeDate))
		decodedVariants, error := base64.StdEncoding.DecodeString(encoded)
		if error != nil {
			fmt.Println("decode error", error)
			return data, error
		}
	
		data[i].AiringTimeDate = string(decodedVariants)
	}

	
	return data, err
}