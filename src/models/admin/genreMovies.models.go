package adminModels

import (
	"database/sql"
	"time"
)

type GenreMovies struct {
	Id        int          `db:"id" json:"id" form:"id"`
	GenreId   int          `db:"genreId" json:"genreId" form:"genreId"`
	MoviesId  int          `db:"moviesId" json:"moviesId" form:"moviesId"`
	CreatedAt time.Time    `db:"createdAt" json:"createdAt"`
	UpdatedAt sql.NullTime `db:"updatedAt" json:"updatedAt"`
}


func InsertGenreMovies(data GenreMovies) (GenreMovies, error) {
	sql := `
	INSERT INTO "genreMovies"
	("genreId", "moviesId")
	VALUES
	(:genreId, :moviesId)
	RETURNING *
	`
	result := GenreMovies{}
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