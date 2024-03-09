package models

import (
	"time"

	"github.com/lib/pq"
)


type HistoryOrder struct {
	Id int `db:"id" json:"id"`
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
	AccountNumber string `db:"accountNumber" json:"accountNumber"`
}


func GetHistoryOrder(userId int) ([]HistoryOrder, error) {
	sql := `
	SELECT
	"o"."id",
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
	"pm"."accountNumber",
	array_agg(DISTINCT "od"."seatCode") "seatCode"
	FROM "order" "o"
	JOIN "orderDetail" "od" ON ("od"."orderId" = "o"."id")
	JOIN "moviesTime" "mt" ON ("mt"."id" = "o"."movieTimeId")
	JOIN "movieCinema" "mc" ON ("mc"."id" = "mt"."movieCinemaId")
	JOIN "movies" "m" ON ("m"."id" = "mc"."moviesId")
	JOIN "rating" "r" ON ("r"."id" = "m"."ratingId")
	JOIN "cinema" "c" ON ("c"."id" = "mc"."cinemaId")
	JOIN "airingTimeDate" "atd" ON ("atd"."id" = "mt"."airingTimeDateId")
	JOIN "airingTime" "at" ON ("at"."id" = "atd"."airingTimeId")
	JOIN "date" "d" ON ("d"."id" = "atd"."dateId")
	JOIN "paymentMethod" "pm" ON ("pm"."id" = "o"."paymentId")
	WHERE "o"."usersId" = $1
	GROUP BY "o"."id", "o"."isUsed", "o"."isPaid", "o"."total", "o"."createdAt", "o"."seatCount", "m"."title", "c"."image", "at"."time", "d"."date", "r"."name", "pm"."accountNumber"
	ORDER BY "o"."createdAt" DESC
	`

	result := []HistoryOrder{}
	err := db.Select(&result, sql, userId)
	if err != nil {
		return result, err
	}

	for i := range result {
		result[i].CreatedAt = result[i].CreatedAt.Add(24 * time.Hour)
	}


	return result, err
}



// ticket information page
func GetHistoryOrderByOrdeId(userId int, orderId int) (HistoryOrder, error) {
	sql := `
	SELECT
	"o"."id",
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
	"pm"."accountNumber",
	array_agg(DISTINCT "od"."seatCode") "seatCode"
	FROM "order" "o"
	JOIN "orderDetail" "od" ON ("od"."orderId" = "o"."id")
	JOIN "moviesTime" "mt" ON ("mt"."id" = "o"."movieTimeId")
	JOIN "movieCinema" "mc" ON ("mc"."id" = "mt"."movieCinemaId")
	JOIN "movies" "m" ON ("m"."id" = "mc"."moviesId")
	JOIN "rating" "r" ON ("r"."id" = "m"."ratingId")
	JOIN "cinema" "c" ON ("c"."id" = "mc"."cinemaId")
	JOIN "airingTimeDate" "atd" ON ("atd"."id" = "mt"."airingTimeDateId")
	JOIN "airingTime" "at" ON ("at"."id" = "atd"."airingTimeId")
	JOIN "date" "d" ON ("d"."id" = "atd"."dateId")
	JOIN "paymentMethod" "pm" ON ("pm"."id" = "o"."paymentId")
	WHERE "o"."usersId" = $1 AND "o"."id" = $2
	GROUP BY "o"."id", "o"."isUsed", "o"."isPaid", "o"."total", "o"."createdAt", "o"."seatCount", "m"."title", "c"."image", "at"."time", "d"."date", "r"."name", "pm"."accountNumber"
	ORDER BY "o"."createdAt" DESC
	`

	result := HistoryOrder{}
	err := db.Get(&result, sql, userId, orderId)
	if err != nil {
		return result, err
	}

	result.CreatedAt = result.CreatedAt.Add(24 * time.Hour)


	return result, err
}