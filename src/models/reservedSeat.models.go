package models

import (
	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
)

type reservedSeat struct {
	SeatCode pq.StringArray `db:"seatCode" json:"seatCode"`
}

func GetReservedSeat(c *gin.Context, movieId int, cinemaId int, locationId int, airingTimeId int, dateId int) ([]reservedSeat, error) {
	sql := `
	SELECT
	array_agg(DISTINCT "od"."seatCode") "seatCode"
	FROM "orderDetail" "od"
	JOIN "order" "o" ON ("o"."id" = "od"."orderId")
	JOIN "movies" "m" ON ("m"."id" = "o"."moviesId")
	JOIN "movieCinema" "mc" ON ("mc"."moviesId" = "m"."id")
	JOIN "cinema" "c" ON ("c"."id" = "mc"."cinemaId")
	JOIN "cinemaLocation" "cl" ON ("cl"."cinemaId" = "c"."id")
	JOIN "location" "l" ON ("l"."id" = "cl"."locationId")
	JOIN "moviesTime" "mt" ON ("mt"."cinemaId" = "c"."id")
	JOIN "airingTimeDate" "atd" ON ("atd"."id" = "mt"."airingTimeDateId")
	JOIN "airingTime" "at" ON ("at"."id" = "atd"."airingTimeId")
	JOIN "date" "d" ON ("d"."id" = "atd"."dateId")
	WHERE "m"."id" = $1 AND "c"."id" = $2 AND "l"."id" = $3 AND "at"."id" = $4 AND "d"."id" = $5
	`
	data := []reservedSeat{}
	err := db.Select(&data, sql, movieId, cinemaId, locationId, airingTimeId, dateId)
	if err != nil {
		return data, err
	}

	return data, err
}