package models

import (
	"time"

	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
	"github.com/putragabrielll/fwg17-cinematix-be/src/helpers"
)


type HistoryOrder struct {
	IsUsed bool `db:"isUsed" json:"isUsed"`
	IsPaid bool `db:"isPaid" json:"isPaid"`
	Total int `db:"total" json:"total"`
	CreatedAt time.Time `db:"createdAt" json:"expiredDate"`
	SeatCount int `db:"seatCount" json:"seatCount"`
	Title string `db:"title" json:"MovieTitle"`
	Image string `db:"image" json:"cinemaImage"`
	Time time.Time `db:"time" json:"time"`
	Date time.Time `db:"date" json:"date"`
	Rating string `db:"rating" json:"rating"`
	SeatCode pq.StringArray `db:"seatCode" json:"seatCode"`
}


func GetHistoryOrder(c *gin.Context, userId int) ([]HistoryOrder, error) {
	sql := `
	SELECT
	"o"."isUsed",
	"o"."isPaid",
	"o"."total",
	"o"."createdAt",
	"o"."seatCount",
	"m"."title",
	"c"."image",
	"at"."time",
	"d"."date",
	"r"."name" AS "rating",
	array_agg(DISTINCT "od"."seatCode") "seatCode"
	FROM "order" "o"
	JOIN "orderDetail" "od" ON ("od"."orderId" = "o"."id")
	JOIN "movies" "m" ON ("m"."id" = "o"."moviesId")
	JOIN "rating" "r" ON ("r"."id" = "m"."ratingId")
	JOIN "movieCinema" "mc" ON ("mc"."moviesId" = "m"."id")
	JOIN "cinema" "c" ON ("c"."id" = "mc"."cinemaId")
	JOIN "moviesTime" "mt" ON ("mt"."id" = "o"."movieTimeId")
	JOIN "airingTimeDate" "atd" ON ("atd"."id" = "mt"."airingTimeDateId")
	JOIN "airingTime" "at" ON ("at"."id" = "atd"."airingTimeId")
	JOIN "date" "d" ON ("d"."id" = "atd"."dateId")
	WHERE "o"."usersId" = $1
	GROUP BY "o"."isUsed", "o"."isPaid", "o"."total", "o"."createdAt", "o"."seatCount", "m"."title", "c"."image", "at"."time", "d"."date", "r"."name"
	ORDER BY "o"."createdAt" DESC
	`

	result := []HistoryOrder{}
	err := db.Select(&result, sql, userId)
	if err != nil {
		msg := err.Error()
		helpers.Utils(err, msg, c)
		return result, err
	}

	for i := range result {
		result[i].CreatedAt = result[i].CreatedAt.Add(24 * time.Hour)
	}


	return result, err
}