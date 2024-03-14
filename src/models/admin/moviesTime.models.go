package adminModels

import (
	"database/sql"
	"time"
)



type MoviesTime struct {
	Id               int          `db:"id" json:"id"`
	AiringTimeDateId int          `db:"airingTimeDateId" json:"airingTimeDateId" form:"airingTimeDateId"`
	MovieCinemaId    int          `db:"movieCinemaId" json:"movieCinemaId" form:"movieCinemaId"`
	CreatedAt        time.Time    `db:"createdAt" json:"createdAt"`
	UpdatedAt        sql.NullTime `db:"updatedAt" json:"updatedAt"`
}



func InsertMoviesTime(data MoviesTime) (MoviesTime, error) {
	sql := `
	INSERT INTO "moviesTime"
	("airingTimeDateId", "movieCinemaId")
	VALUES
	(:airingTimeDateId, :movieCinemaId)
	RETURNING *
	`
	result := MoviesTime{}
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