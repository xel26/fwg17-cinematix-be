package adminModels

import (
	"database/sql"
	"time"
)

type Genre struct {
	Id        int          `db:"id" json:"id"`
	Name      string       `db:"name" json:"name" form:"name"`
	CreatedAt time.Time    `db:"createdAt" json:"createdAt"`
	UpdatedAt sql.NullTime `db:"updatedAt" json:"updatedAt"`
}

func FindGenreByName(name string) (Genre, error){
	sql := `
	SELECT "id", "name"
	FROM "genre"
	WHERE "name" ILIKE $1
	`
	data := Genre{}
	err := db.Get(&data, sql, name)
	if err != nil {
		return data, err
	}

	return data, err
}