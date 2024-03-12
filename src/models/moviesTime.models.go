package models

import "time"

type dataMovieTime struct {
	Id               int        `db:"id" json:"id"`
	AiringTimeDateId int        `db:"airingTimeDateId" json:"airingTimeDateId"`
	MovieCinemaId    int        `db:"movieCinemaId" json:"movieCinemaId"`
	CreatedAt        time.Time  `db:"createdAt" json:"createdAt"`
	UpdatedAt        *time.Time `db:"updatedAt" json:"updatedAt"`
}

func FindOneMovieTime(id int) (dataMovieTime, error) {
	sql := `
	SELECT * from "moviesTime"
	WHERE "id" = $1
	`
	data := dataMovieTime{}
	err := db.Get(&data, sql, id)
	if err != nil {
		return data, err
	}

	return data, err
}