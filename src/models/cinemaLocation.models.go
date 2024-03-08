package models

import (
	"github.com/putragabrielll/fwg17-cinematix-be/src/lib"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

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