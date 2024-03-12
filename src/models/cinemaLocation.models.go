package models

import (
	"time"

	"github.com/putragabrielll/fwg17-cinematix-be/src/lib"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)


type CinemaLocation struct {
	Id int `db:"id" json:"id"`
	LocationId int `db:"locationId" json:"locationId"`
	CinemaId int `db:"cinemaId" json:"cinemaId"`
	CreatedAt        time.Time  `db:"createdAt" json:"createdAt"`
	UpdatedAt        *time.Time `db:"updatedAt" json:"updatedAt"`
}


func CinemaLocationId(cinemaId int) (services.CinemaLocation, error){
	sql := `
	SELECT
	"c"."id" AS "cinemaId",
	array_agg(DISTINCT "cl"."id") "cinemaLocationId",
	array_agg(DISTINCT "l"."id") "locationId",
	array_agg(DISTINCT "l"."name") "location"
	FROM "cinema" "c"
	INNER JOIN "cinemaLocation" "cl" ON "cl"."cinemaId" = "c"."id"
	INNER JOIN "location" "l" ON "l"."id" = "cl"."locationId"
	WHERE "c"."id"=$1
	GROUP BY "c"."id";`
	data := services.CinemaLocation{}
	err := lib.DbConnection().Get(&data, sql, cinemaId)
	return data, err
}





func FindOneCinemaLocation(id int) (CinemaLocation, error){
	sql := `
	SELECT * from "cinemaLocation"
	WHERE "id" = $1
	`
	data := CinemaLocation{}
	err := db.Get(&data, sql, id)
	if err != nil {
		return data, err
	}

	return data, err
}