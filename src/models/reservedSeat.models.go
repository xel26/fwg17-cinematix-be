package models

import (
	"github.com/lib/pq"
)

type reservedSeat struct {
	SeatCode pq.StringArray `db:"seatCode" json:"seatCode"`
}

func GetReservedSeat(movieTimeId int, cinemaLocationId int) (reservedSeat, error) {
	sql := `
	SELECT
	array_agg(DISTINCT "od"."seatCode") "seatCode"
	FROM "orderDetail" "od"
	JOIN "order" "o" ON ("o"."id" = "od"."orderId")
	JOIN "moviesTime" "mt" ON ("mt"."id" = "o"."movieTimeId")
	JOIN "cinemaLocation" "cl" ON ("cl"."id" = "o"."cinemaLocationId")
	WHERE "mt"."id" = $1 AND "cl"."id" = $2
	`
	data := reservedSeat{}
	err := db.Get(&data, sql, movieTimeId, cinemaLocationId)
	if err != nil {
		return data, err
	}

	return data, err
}
