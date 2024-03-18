package models

import (
	"time"

	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

type PaymentMethod struct {
	Id            int        `db:"id" json:"id"`
	Name          string     `db:"name" json:"name"`
	Image         string     `db:"image" json:"image"`
	AccountNumber string     `db:"accountNumber" json:"accountNumber"`
	CreatedAt     time.Time  `db:"createdAt" json:"createdAt"`
	UpdatedAt     *time.Time `db:"updatedAt" json:"updatedAt"`
}




func FindAllPaymentMethod(search string, limit int, offset int, orderBy string, orderMethod string) (services.Info, error){
	sql := `
	SELECT
	"id",
	"name",
	"image",
	"accountNumber"
	FROM "paymentMethod"
	WHERE "name" ILIKE '%` + search + `%'
	ORDER BY "` + orderBy + `" ` + orderMethod + `
	LIMIT $1 OFFSET $2
	`

	sqlCount := `
	SELECT COUNT(*)
	FROM "paymentMethod"
	WHERE "name" ILIKE '%` + search + `%'
	`

	result := services.Info{}

	data := []PaymentMethod{}
	err := db.Select(&data, sql, limit, offset)
	if err != nil {
		return result, err
	}
	result.Data = data

	row := db.QueryRow(sqlCount)
	err = row.Scan(&result.Count)

	return result, err
}



func FindOnePaymentMethod(id int) (PaymentMethod, error) {
	sql := `
	SELECT * from "paymentMethod"
	WHERE "id" = $1
	`
	data := PaymentMethod{}
	err := db.Get(&data, sql, id)
	if err != nil {
		return data, err
	}

	return data, err
}