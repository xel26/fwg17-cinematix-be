package adminModels

import (
	"database/sql"
	"time"
)

type Date struct {
	Id   int `db:"id" json:"id"`
	Date string `db:"date" json:"data" form:"date"`
	CreatedAt  time.Time    `db:"createdAt" json:"createdAt"`
	UpdatedAt  sql.NullTime `db:"updatedAt" json:"updatedAt"`
}



func FindByDate (date string) (Date, error){
	sql := `
	SELECT "id", "date"
	FROM "date"
	WHERE "date" = $1
	`
	data := Date{}
	err := db.Get(&data, sql, date)
	if err != nil {
		return data, err
	}

	return data, err
}



func InsertDate(data Date) (Date, error){
	sql := `
	INSERT INTO "date" ("date") VALUES (:date) RETURNING *
	`
	result := Date{}
	rows, err := db.NamedQuery(sql, data)
	if err != nil {
		return result, err
	}

	for rows.Next(){
		err := rows.StructScan(&result)
		if err != nil{
			return result, err
		}
	}

	return result, err
}
