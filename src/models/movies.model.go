package models

import (
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

func FindAllMovies(search string, filter string, orderBy string, limit int, offset int) (services.Info, error) {
	sql := `
	SELECT
	"m"."id" "id",
	"s"."name" "status",
	"r"."name" "rating",
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
	GROUP BY "m"."id", "s"."name", "r"."name"
	ORDER BY "` + orderBy + `" ASC
	LIMIT $1
	OFFSET $2
	`
	sqlCount := `SELECT COUNT(*) 
	FROM (SELECT
		"m"."id" "id",
		"s"."name" "status",
		"r"."name" "rating",
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
		GROUP BY "m"."id", "s"."name", "r"."name"
	)`
	result := services.Info{}
	data := []services.Movies{}
	db.Select(&data, sql, limit, offset)
	result.Data = data

	row := db.QueryRow(sqlCount)
	err := row.Scan(&result.Count)

	return result, err
}

func FindOneMovies(id int) (services.Movies, error) {
	sql := `SELECT
	"m"."id" "id",
	"s"."name" "status",
	"r"."name" "rating",
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
	WHERE "m"."id" = $1
	GROUP BY "m"."id", "s"."name", "r"."name"`
	data := services.Movies{}
	err := db.Get(&data, sql, id)
	return data, err
}
