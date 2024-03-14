package adminModels

import (
	"database/sql"
	"fmt"
	"time"

	"github.com/jmoiron/sqlx"
	"github.com/putragabrielll/fwg17-cinematix-be/src/lib"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

type Movie struct {
	Id       int    `db:"id" json:"id"`
	StatusId int    `db:"statusId" json:"statusId" form:"statusId"`
	RatingId int    `db:"ratingId" json:"ratingId" form:"ratingId"`
	Title    string `db:"title" json:"title" form:"title"`
	Image    string `db:"image" json:"image"`
	Director string `db:"director" json:"director" form:"director"`
	Casts    string `db:"casts" json:"casts" form:"casts"`
	Duration string `db:"duration" json:"duration" form:"duration"`
	ReleaseDate time.Time `db:"releaseDate" json:"releaseDate" form:"releaseDate"`
	Sinopsis string `db:"sinopsis" json:"sinopsis" form:"sinopsis"`
	IsRecomended bool `db:"isRecomended" json:"isRecomended" form:"isRecomended"`
	CreatedAt time.Time `db:"createdAt" json:"createdAt"`
	UpdatedAt sql.NullTime `db:"updatedAt" json:"updatedAt"`
}



// undefined! tidak bisa akses db di users.model.go walaupun menggunakna "package models" yg sama, sehingga di deklarasi ulang di sini
var db *sqlx.DB = lib.DbConnection()



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
func CountAllMovies(filter string) (int, error) {
	var count int
	fmtsearch := fmt.Sprintf("%v", filter)
	sql := `
	SELECT COUNT(*) FROM (SELECT DISTINCT 
	"m"."id"
	FROM "movies" "m"
	INNER JOIN "genreMovies" "gm" ON "gm"."moviesId"="m"."id"
	INNER JOIN "genre" "g" ON "g"."id"="gm"."genreId"
	WHERE TRIM(UPPER(to_char("m"."createdAt",'Month'))) = UPPER($1))
	`
	err := lib.DbConnection().Get(&count, sql, fmtsearch)
	return count, err
}

// Insert Movies
func InsertMovie(data services.AddNewMovie) (Movie, error) {
	sql := `
	INSERT INTO "movies"
	("statusId", "ratingId", "title", "image", "director", "casts", "duration", "releaseDate", "sinopsis", "isRecomended")
	VALUES
	(:statusId, :ratingId, :title, :image, :director, :casts, :duration, :releaseDate, :sinopsis, :isRecomended)
	RETURNING *
	`
	result := Movie{}
	rows, err := db.NamedQuery(sql, data)
	if err != nil {
		return result, err
	}

	for rows.Next(){
		err := rows.StructScan(&result)
		if err != nil{
			return result, err
		}
	}

	return result, err
}

// Delete Movies
func DeleteMovies(id int) (services.AdminDeleteMovies, error) {
	sql := `
	UPDATE "movies" 
	SET "statusId"=3
	WHERE "id"=$1
	RETURNING *
    `
	data := services.AdminDeleteMovies{}
	err := lib.DbConnection().Get(&data, sql, id)
	return data, err
}
