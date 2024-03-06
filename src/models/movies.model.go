package models

import (
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

func FindAllMovies(search string, filter string, orderBy string, limit int, offset int) (services.Info, error) {
	sql := `
	SELECT
	"m"."id" "id",
	"m"."statusId" "statusId",
	"m"."ratingId" "ratingId",
	"m"."title" "title",
	"m"."image" "image",
	array_agg(DISTINCT "g"."name") "genre",
	"m"."director" "director",
	"m"."casts" "casts",
	"m"."duration" "duration",
	"m"."releaseDate" "releaseDate",
	"m"."sinopsis" "sinopsis",
	"m"."isRecomended" "isRecomended",
	"m"."createdAt" "createdAt",
	"m"."updatedAt" "updatedAt"
	FROM "movies" "m"
	LEFT JOIN "status" "s" ON "s"."id"="m"."statusId"
	LEFT JOIN "rating" "r" ON "r"."id"="m"."ratingId"
	LEFT JOIN "genreMovies" "gm" ON "gm"."moviesId" = "m"."id"
	LEFT JOIN "genre" "g" ON "g"."id" = "gm"."genreId"
	WHERE "m"."title" ILIKE '%` + search + `%' AND "g"."name" ILIKE '%` + filter + `%'
	GROUP BY "m"."id"
	ORDER BY "` + orderBy + `" ASC
	LIMIT $1
	OFFSET $2
	`
	sqlCount := `SELECT COUNT(*) 
	FROM (SELECT
		"m"."id" "id",
		"m"."statusId" "statusId",
		"m"."ratingId" "ratingId",
		"m"."title" "title",
		"m"."image" "image",
		array_agg(DISTINCT "g"."name") "genre",
		"m"."director" "director",
		"m"."casts" "casts",
		"m"."duration" "duration",
		"m"."releaseDate" "releaseDate",
		"m"."sinopsis" "sinopsis",
		"m"."isRecomended" "isRecomended",
		"m"."createdAt" "createdAt",
		"m"."updatedAt" "updatedAt"
		FROM "movies" "m"
		LEFT JOIN "status" "s" ON "s"."id"="m"."statusId"
		LEFT JOIN "rating" "r" ON "r"."id"="m"."ratingId"
		LEFT JOIN "genreMovies" "gm" ON "gm"."moviesId" = "m"."id"
		LEFT JOIN "genre" "g" ON "g"."id" = "gm"."genreId"
		WHERE "m"."title" ILIKE '%` + search + `%' AND "g"."name" ILIKE '%` + filter + `%'
		GROUP BY "m"."id"
		)`
	result := services.Info{}
	data := []services.Movies{}
	db.Select(&data, sql, limit, offset)
	result.Data = data

	row := db.QueryRow(sqlCount)
	err := row.Scan(&result.Count)

	return result, err
}
