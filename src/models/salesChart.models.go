package models

import (
	"github.com/lib/pq"
	"github.com/putragabrielll/fwg17-cinematix-be/src/lib"
)

type SalesChart struct {
	MovieId    int             `db:"movieId" json:"movieId"`
	MovieTitle *string         `db:"movieTitle" json:"movieTitle"`
	Date       *pq.StringArray `db:"date" json:"date"`
	Week       *pq.StringArray `db:"week" json:"week"`
	Month      *pq.StringArray `db:"month" json:"month"`
	Year       *string         `db:"year" json:"year"`
	Income     *pq.Int64Array  `db:"income" json:"income"`
}

func FindSalesChartByMovieId(movieId int) (SalesChart, error) {
	sql := `
	select 
	"movie_id" as "movieId",
	"movie_title" as "movieTitle",
	array_agg("date") as "date",
	array_agg(distinct "week") as "week",
	array_agg(distinct "month") as "month",
	"year",
	array_agg("movie_sales") as "income"
	from (select 
	"data"."movieId" as "movie_id",
	"data"."title" as "movie_title", 
	sum("data"."total") as "movie_sales",
	"data"."date" as "date",
	"data"."week" as "week",
	"data"."month" as "month",
	"data"."year" as "year"
	from 
	(select "m"."id" as "movieId", "m"."title","o"."total",to_char("o"."createdAt",'dd') as "date",date_part('week', "o"."createdAt") as "week", trim(to_char("o"."createdAt",'month')) as "month", to_char("o"."createdAt", 'yyyy') as "year"
	from "order" "o"
	join "moviesTime" "mt" on "mt"."id"="o"."movieTimeId"
	join "movieCinema" "mc" on "mc"."id"="mt"."movieCinemaId"
	join "movies" "m" on "m"."id"="mc"."moviesId") as "data"
	where "data"."movieId" = $1
	group by "data"."movieId", "data"."title","data"."date","data"."week" ,"data"."month","data"."year") as "data_sales"
	group by "movie_id", "data_sales"."movie_title", "data_sales"."year"
	`

	result := SalesChart{}
	err := lib.DbConnection().Get(&result, sql, movieId)
	return result, err
}
