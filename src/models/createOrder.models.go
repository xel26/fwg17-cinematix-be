package models

import (
	"time"
)

type Order struct {
	Id               int        `db:"id" json:"id"`
	OrderNumber      string     `db:"orderNumber" json:"orderNumber" form:"orderNumber"`
	UserId           int        `db:"usersId" json:"userId" form:"userId"`
	CinemaLocationId int        `db:"cinemaLocationId" json:"cinemaLocationId" form:"cinemaLocationId"`
	PaymentId        int        `db:"paymentId" json:"paymentId" form:"paymentId"`
	MovieTimeId      int        `db:"movieTimeId" json:"movieTimeId" form:"movieTimeId"`
	SeatCount        int        `db:"seatCount" json:"seatCount" form:"seatCount"`
	IsPaid           bool       `db:"isPaid" json:"isPaid" form:"isPaid"`
	IsUsed           bool       `db:"isUsed" json:"isUsed" form:"isUsed"`
	Total            int        `db:"total" json:"total" form:"total"`
	SeatCode         string     `db:"seatCode" json:"seatCode" form:"seatCode"`
	CreatedAt        time.Time  `db:"createdAt" json:"createdAt"`
	UpdatedAt        *time.Time `db:"updatedAt" json:"updatedAt"`
}

type cinemaPrice struct {
	Price int `db:"price" json:"price"`
}

func InsertOrder(data Order) (Order, error) {
	sql := `
	INSERT INTO "order" ("orderNumber", "usersId", "cinemaLocationId", "paymentId", "seatCount", "isPaid", "isUsed", "total", "movieTimeId")
	VALUES
	(:orderNumber, :usersId, :cinemaLocationId, :paymentId, :seatCount, :isPaid, :isUsed, :total, :movieTimeId)
	RETURNING *
	`
	result := Order{}
	rows, err := db.NamedQuery(sql, data)
	if err != nil {
		return result, err
	}

	for rows.Next() {
		err := rows.StructScan(&result)
		if err != nil {
			return result, err
		}
	}

	return result, err
}

func GetCinemaPrice(MovieTime int) (cinemaPrice, error) {
	sql := `
	SELECT "c"."price"
	FROM "cinema" "c"
	JOIN "movieCinema" "mc" ON ("mc"."cinemaId" = "c"."id")
	JOIN "moviesTime" "mt" ON ("mt"."movieCinemaId" = "mc"."id")
	WHERE "mt"."id" = $1
	`
	data := cinemaPrice{}
	err := db.Get(&data, sql, MovieTime)
	if err != nil {
		return data, err
	}

	return data, err
}
