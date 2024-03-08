package models

import "github.com/putragabrielll/fwg17-cinematix-be/src/services"

func FindMovieCinemaByMovieId(movieId int) (services.MovieCinema, error) {
	sql := `
	SELECT
	"m"."id" AS "movieId",
	array_agg(distinct "c"."id") AS "cinemaId",
	array_agg(distinct "mc"."id") AS "movieCinemaId",
	array_agg(distinct "c"."image") AS "cinemaImage"
	FROM "cinema" AS "c"
	LEFT JOIN "movieCinema" "mc" ON "mc"."cinemaId"="c"."id"
	LEFT JOIN "movies" "m" ON "m"."id"="mc"."moviesId"
	WHERE "m"."id" = $1
	GROUP BY "m"."id"
	`
	data := services.MovieCinema{}
	err := db.Get(&data, sql, movieId)
	return data, err
}
