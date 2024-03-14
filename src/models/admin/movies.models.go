package adminModels

import (
	"fmt"

	"github.com/putragabrielll/fwg17-cinematix-be/src/lib"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

// ------------ ADMIN ------------
// SELECT * products
func ListAllMovies(search string, limit int, offset int) ([]services.AdminListMovies, error) {
	fmtsearch := fmt.Sprintf("%v", search)
	sql := `
	SELECT 
	"m"."id",
	"m"."image",
	"m"."title",
	array_agg(distinct "g"."name") AS "genre",
	"m"."releaseDate",
	"m"."duration"
	FROM "movies" "m"
	INNER JOIN "genreMovies" "gm" ON "gm"."moviesId"="m"."id"
	INNER JOIN "genre" "g" ON "g"."id"="gm"."genreId"
	WHERE TRIM(UPPER(to_char("m"."createdAt",'Month'))) = UPPER($1) AND ("m"."statusId" = 1 OR "m"."statusId" = 2)
	GROUP BY "m"."id","m"."image","m"."title", "m"."releaseDate","m"."duration"
	ORDER BY "m"."id" DESC
	LIMIT $2
	OFFSET $3
	`
	data := []services.AdminListMovies{}
	err := lib.DbConnection().Select(&data, sql, fmtsearch, limit, offset)
	return data, err
}


// Count All Movies
func CountAllMovies(filter string) (int, error){
	var count int
	fmtsearch := fmt.Sprintf("%v", filter)
	sql := `
	SELECT DISTINCT 
	COUNT("m"."id")
	FROM "movies" "m"
	INNER JOIN "genreMovies" "gm" ON "gm"."moviesId"="m"."id"
	INNER JOIN "genre" "g" ON "g"."id"="gm"."genreId"
	WHERE TRIM(UPPER(to_char("m"."createdAt",'Month'))) = UPPER($1)
	`
	err := lib.DbConnection().Get(&count, sql, fmtsearch)
	return count, err
}