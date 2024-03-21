package adminModels

import (
	"database/sql"
	"time"
)

type CinemaLocation struct {
	Id         int          `db:"id" json:"id"`
	LocationId int          `db:"locationId" json:"locationId" form:"locationId"`
	CinemaId   int          `db:"cinemaId" json:"cinemaId" form:"cinemaId"`
	CreatedAt  time.Time    `db:"createdAt" json:"createdAt"`
	UpdatedAt  sql.NullTime `db:"updatedAt" json:"updatedAt"`
}


func FindByLocationId(locationId int) ([]CinemaLocation, error){
	sql := `
	SELECT "locationId", "cinemaId"
	FROM "cinemaLocation"
	WHERE "locationId" = $1
	`
	data := []CinemaLocation{}
	err := db.Select(&data, sql, locationId)
	if err != nil {
		return data, err
	}

	return data, err
}