package adminModels

import (
	"database/sql"
	"time"
)

type MovieCinema struct {
	Id        int          `db:"id" json:"id"`
	CinemaId  int          `db:"cinemaId" json:"cinemaId" form:"cinemaId"`
	MoviesId  int          `db:"moviesId" json:"moviesId" form:"moviesId"`
	CreatedAt time.Time    `db:"createdAt" json:"createdAt"`
	UpdatedAt sql.NullTime `db:"updatedAt" json:"updatedAt"`
}



func InsertMovieCinema(data MovieCinema) (MovieCinema, error){
	sql := `
	INSERT INTO "movieCinema"
	("cinemaId", "moviesId")
	VALUES
	(:cinemaId, :moviesId)
	RETURNING *
	`
	result := MovieCinema{}
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