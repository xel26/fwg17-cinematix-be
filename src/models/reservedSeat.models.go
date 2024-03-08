package models

import (
	"github.com/lib/pq"
)

type reservedSeat struct {
	SeatCode pq.StringArray `db:"seatCode" json:"seatCode"`
}

func GetReservedSeat(movieId int, cinemaId int, locationId int, airingTimeId int, dateId int) (reservedSeat, error) {
	sql := `
	SELECT
	array_agg(DISTINCT "od"."seatCode") "seatCode"
	FROM "orderDetail" "od"
	JOIN "order" "o" ON ("o"."id" = "od"."orderId")
	JOIN "moviesTime" "mt" ON ("mt"."id" = "o"."movieTimeId")
	JOIN "movieCinema" "mc" ON ("mc"."id" = "mt"."movieCinemaId")
	JOIN "airingTimeDate" "atd" ON ("atd"."id" = "mt"."airingTimeDateId")
	JOIN "movies" "m" ON ("m"."id" = "mc"."moviesId")
	JOIN "airingTime" "at" ON ("at"."id" = "atd"."airingTimeId")
	JOIN "date" "d" ON ("d"."id" = "atd"."dateId")
	JOIN "cinemaLocation" "cl" ON ("cl"."id" = "o"."cinemaLocationId")
	JOIN "cinema" "c" ON ("c"."id" = "cl"."cinemaId")
	JOIN "location" "l" ON ("l"."id" = "cl"."locationId")
	WHERE "m"."id" = $1 AND "c"."id" = $2 AND "l"."id" = $3 AND "at"."id" = $4 AND "d"."id" = $5
	`
	data := reservedSeat{}
	err := db.Get(&data, sql, movieId, cinemaId, locationId, airingTimeId, dateId)
	if err != nil {
		return data, err
	}

	return data, err
}