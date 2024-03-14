package adminModels

import (
	"database/sql"
	"time"
)

type Location struct {
	Id        int          `db:"id" json:"id" form:"id"`
	Name      string       `db:"name" json:"name" form:"name"`
	CreatedAt time.Time    `db:"createdAt" json:"createdAt"`
	UpdatedAt sql.NullTime `db:"updatedAt" json:"updatedAt"`
}


func FindLocationByName(name string) (Location, error){
	sql := `
	SELECT "id", "name"
	FROM "location"
	WHERE "name" ILIKE $1
	`
	data := Location{}
	err := db.Get(&data, sql, name)
	if err != nil {
		return data, err
	}

	return data, err
}