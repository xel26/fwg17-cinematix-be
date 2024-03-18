package models

import (
	"time"

	"github.com/lib/pq"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)


type HistoryOrder struct {
	Id int `db:"id" json:"id"`
	OrderNumber string `db:"orderNumber" json:"orderNumber"`
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


func GetHistoryOrder(userId int, page int, limit int, offset int, orderBy string, orderMethod string) (services.Info, error) {
	sql := `
	SELECT
	"o"."id",
	"o"."orderNumber",
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
	LEFT JOIN "orderDetail" "od" ON ("od"."orderId" = "o"."id")
	LEFT JOIN "moviesTime" "mt" ON ("mt"."id" = "o"."movieTimeId")
	LEFT JOIN "movieCinema" "mc" ON ("mc"."id" = "mt"."movieCinemaId")
	LEFT JOIN "movies" "m" ON ("m"."id" = "mc"."moviesId")
	LEFT JOIN "rating" "r" ON ("r"."id" = "m"."ratingId")
	LEFT JOIN "cinema" "c" ON ("c"."id" = "mc"."cinemaId")
	LEFT JOIN "airingTimeDate" "atd" ON ("atd"."id" = "mt"."airingTimeDateId")
	LEFT JOIN "airingTime" "at" ON ("at"."id" = "atd"."airingTimeId")
	LEFT JOIN "date" "d" ON ("d"."id" = "atd"."dateId")
	LEFT JOIN "paymentMethod" "pm" ON ("pm"."id" = "o"."paymentId")
	WHERE "o"."usersId" = $1
	GROUP BY "o"."id", "o"."isUsed", "o"."isPaid", "o"."total", "o"."createdAt", "o"."seatCount", "m"."title", "c"."image", "at"."time", "d"."date", "r"."name", "pm"."accountNumber"
	ORDER BY "` + orderBy + `" ` + orderMethod + `
	LIMIT $2 OFFSET $3
	`

	sqlCount := `
	SELECT COUNT(*)
	FROM "order" "o"
	WHERE "o"."usersId" = $1
	`

	result := services.Info{}

	data := []HistoryOrder{}
	err := db.Select(&data, sql, userId, limit, offset)
	if err != nil {
		return result, err
	}
	result.Data = data

	for i := range data {
		data[i].CreatedAt = data[i].CreatedAt.Add(24 * time.Hour)
	}


	row := db.QueryRow(sqlCount, userId)
	err = row.Scan(&result.Count)

	return result, err
}



// ticket information page
func GetTicket(userId int, orderId int) (HistoryOrder, error) {
	sql := `
	SELECT
	"o"."id",
	"o"."orderNumber",
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