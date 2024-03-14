package adminModels

import (
	"database/sql"
	"time"
)

type Rating struct {
	Id        int          `db:"id" json:"id"`
	Name      string       `db:"name" json:"name" form:"name"`
	CreatedAt time.Time    `db:"createdAt" json:"createdAt"`
	UpdatedAt sql.NullTime `db:"updatedAt" json:"updatedAt"`
}


// sementara belum di beri paginasi
func FindAllRating() ([]Rating, error){
	sql := `
	SELECT * FROM "rating"
	`
	data := []Rating{}
	err := db.Select(&data, sql)
	if err != nil {
		return data, err
	}

	return data, err
}



func FindOneRating(id int) (Rating, error) {
	sql := `
	SELECT * FROM "rating" WHERE "id" = $1
	`
	data := Rating{}
	err := db.Get(&data, sql, id)
	if err != nil {
		return data, err
	}

	return data, err
}