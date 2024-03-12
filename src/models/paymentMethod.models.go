package models

import (
	"time"
)

type PaymentMethod struct {
	Id            int        `db:"id" json:"id"`
	Name          string     `db:"name" json:"name"`
	Image         string     `db:"image" json:"image"`
	AccountNumber string     `db:"accountNumber" json:"accountNumber"`
	CreatedAt     time.Time  `db:"createdAt" json:"createdAt"`
	UpdatedAt     *time.Time `db:"updatedAt" json:"updatedAt"`
}


func FindAllPaymentMethod() ([]PaymentMethod, error){
	sql := `SELECT * from "paymentMethod"`
	data := []PaymentMethod{}
	err := db.Select(&data, sql)

	return data, err
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