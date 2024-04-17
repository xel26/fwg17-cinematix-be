package models

import (
	"github.com/gin-gonic/gin"
)

type MovieTime struct {
	Date           string `db:"date" json:"date"`
}

// type MovieTime struct {
// 	Date           pq.StringArray `db:"date" json:"date"`
// }

type AiringTimeDate struct {
	AiringTimeId     int    `db:"airingTimeId" json:"airingTimeId"`
	AiringTime       string `db:"time" json:"airingTime"`
}

type GetId struct {
	Id int `db:"id" json:"id"`
}

// mengambil date berdasarkan movieCinemaId melalui table moviesTime
func GetDate(movieCinemaId int) ([]MovieTime, error) {
	sql := `
	SELECT
	DISTINCT JSONB_BUILD_OBJECT(
		'dateId', "d"."id",
		'date', "d"."date"
	) AS "date"
	FROM "moviesTime" "mt"
	JOIN "airingTimeDate" "atd" ON ("atd"."id" = "mt"."airingTimeDateId")
	JOIN "date" "d" ON ("d"."id" = "atd"."dateId")
	WHERE "mt"."movieCinemaId" = $1
	`

	data := []MovieTime{}
	err := db.Select(&data, sql, movieCinemaId)
	if err != nil {
		return data, err
	}

	return data, err
}

// mengambil airing time berdasarkan dateId melalui table airingTimeDate
func GetAiringTime(c *gin.Context, movieId int) ([]AiringTimeDate, error) {
	sql := `
	SELECT
	"at"."id" AS "airingTimeId",
	"at"."time"
	FROM "airingTimeDate" "atd"
	LEFT JOIN "airingTime" "at" ON ("at"."id" = "atd"."airingTimeId")
	LEFT JOIN "moviesTime" "mv" ON ("mv"."airingTimeDateId" = "atd"."id")
	LEFT JOIN "movieCinema" "mc" ON ("mc"."id" = "mv"."movieCinemaId")
	LEFT JOIN "movies" "m" ON ("m"."id" = "mc"."moviesId")
	WHERE "m"."id" = $1
	GROUP BY "at"."id"
	`
	data := []AiringTimeDate{}
	err := db.Select(&data, sql, movieId)
	if err != nil {
		return data, err
	}

	return data, err
}

// mengambil id movieTime berdasarkan airingTimeDateId dan movieCinemaId
func GetMovieTimeId(c *gin.Context, airingTimeDateId int, movieCinemaId int) (GetId, error) {
	sql := `
	SELECT "moviesTime"."id"
	FROM "moviesTime"
	WHERE "airingTimeDateId" = $1 AND "movieCinemaId" = $2
	`
	data := GetId{}
	err := db.Get(&data, sql, airingTimeDateId, movieCinemaId)
	if err != nil {
		return data, err
	}

	return data, err
}

// mengambil id airingTimeDate berdasarkan airingTimeId dan dateId
func GetAiringTimeDateId(c *gin.Context, airingTimeId int, dateId int) (GetId, error) {
	sql := `
	SELECT "airingTimeDate"."id"
	FROM "airingTimeDate"
	WHERE "airingTimeId" = $1 AND "dateId" = $2
	`
	data := GetId{}
	err := db.Get(&data, sql, airingTimeId, dateId)
	if err != nil {
		return data, err
	}

	return data, err
}
