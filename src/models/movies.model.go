package models

import (
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

func FindAllMovies(search string, filter string, orderBy string, limit int, offset int, status string) (services.Info, error) {
	addQuery := ""
	if status == "coming soon" {
		addQuery = ` AND "s"."id" = 1 `
	} else if status == "now airing" {
		addQuery = ` AND "s"."id" = 2 `
	} else {
		addQuery = ""
	}

	sql := `
	SELECT
	"m"."id" AS "id",
	"s"."name" AS "status",
	"r"."name" AS "rating",
	"m"."title" AS "title",
	"m"."image" AS "image",
	array_agg(DISTINCT "g"."name") AS "genre",
	"m"."director" AS "director",
	"m"."casts" AS "casts",
	"m"."duration" AS "duration",
	"m"."releaseDate" AS "releaseDate",
	"m"."sinopsis" AS "sinopsis",
	"m"."isRecomended" AS "isRecomended",
	"m"."createdAt" AS "createdAt",
	"m"."updatedAt" AS "updatedAt"
	FROM "movies" AS "m"
	LEFT JOIN "status" AS "s" ON "s"."id"="m"."statusId"
	LEFT JOIN "rating" AS "r" ON "r"."id"="m"."ratingId"
	LEFT JOIN "genreMovies" AS "gm" ON "gm"."moviesId" = "m"."id"
	LEFT JOIN "genre" AS "g" ON "g"."id" = "gm"."genreId"
	WHERE "m"."title" ILIKE '%` + search + `%' AND "g"."name" ILIKE '%` + filter + `%'` + addQuery +
		`GROUP BY "m"."id", "s"."name", "r"."name"
	ORDER BY "` + orderBy + `" ASC
	LIMIT $1
	OFFSET $2
	`
	sqlCount := `SELECT COUNT(*) 
	FROM (SELECT
		"m"."id" AS "id",
		"s"."name" AS "status",
		"r"."name" AS "rating",
		"m"."title" AS "title",
		"m"."image" AS "image",
		array_agg(DISTINCT "g"."name") AS "genre",
		"m"."director" AS "director",
		"m"."casts" AS "casts",
		"m"."duration" AS "duration",
		"m"."releaseDate" AS "releaseDate",
		"m"."sinopsis" AS "sinopsis",
		"m"."isRecomended" AS "isRecomended",
		"m"."createdAt" AS "createdAt",
		"m"."updatedAt" AS "updatedAt"
		FROM "movies" AS "m"
		LEFT JOIN "status" AS "s" ON "s"."id"="m"."statusId"
		LEFT JOIN "rating" AS "r" ON "r"."id"="m"."ratingId"
		LEFT JOIN "genreMovies" AS "gm" ON "gm"."moviesId" = "m"."id"
		LEFT JOIN "genre" AS "g" ON "g"."id" = "gm"."genreId"
		WHERE "m"."title" ILIKE '%` + search + `%' AND "g"."name" ILIKE '%` + filter + `%'` + addQuery +
		`GROUP BY "m"."id", "s"."name", "r"."name"
	) AS "count"`

	// fmt.Print(sql)
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
	"m"."id" AS "id",
	"s"."name" AS "status",
	"r"."name" AS "rating",
	"m"."title" AS "title",
	"m"."image" AS "image",
	array_agg(DISTINCT "g"."name") AS "genre",
	"m"."director" AS "director",
	"m"."casts" AS "casts",
	"m"."duration" AS "duration",
	"m"."releaseDate" AS "releaseDate",
	"m"."sinopsis" AS "sinopsis",
	"m"."isRecomended" AS "isRecomended",
	"m"."createdAt" AS "createdAt",
	"m"."updatedAt" AS "updatedAt"
	FROM "movies" AS "m"
	LEFT JOIN "status" AS "s" ON "s"."id"="m"."statusId"
	LEFT JOIN "rating" AS "r" ON "r"."id"="m"."ratingId"
	LEFT JOIN "genreMovies" AS "gm" ON "gm"."moviesId" = "m"."id"
	LEFT JOIN "genre" AS "g" ON "g"."id" = "gm"."genreId"
	WHERE "m"."id" = $1
	GROUP BY "m"."id", "s"."name", "r"."name"`
	data := services.Movies{}
	err := db.Get(&data, sql, id)
	return data, err
}
