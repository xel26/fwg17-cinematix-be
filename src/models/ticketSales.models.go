package models

import (
	"github.com/lib/pq"
	"github.com/putragabrielll/fwg17-cinematix-be/src/lib"
)

type TicketSales struct {
	Genre    *string         `db:"genre" json:"genre"`
	Location *string         `db:"location" json:"location"`
	Date     *pq.StringArray `db:"date" json:"date"`
	Week     *pq.StringArray `db:"week" json:"week"`
	Month    *pq.StringArray `db:"month" json:"month"`
	Year     *string         `db:"year" json:"year"`
	Income   *pq.Int64Array  `db:"income" json:"income"`
}

func FindTicketSales(genreId int, locationId int) (TicketSales, error) {
	sql := `
	select 
	"genre",
	"location",
	array_agg("date") as "date",
	array_agg(distinct "week") as "week",
	array_agg(distinct "month") as "month",
	"year",
	array_agg("movie_sales") as "income"
	from (select
	"data"."genre" as "genre",
	"data"."location" as "location",
	sum("data"."total") as "movie_sales",
	"data"."date" as "date",
	"data"."week" as "week",
	"data"."month" as "month",
	"data"."year" as "year"
	from 
	(select "g"."id" as "genreId", "g"."name" as "genre", "l"."id" as "locationId", "l"."name" as "location","o"."total",to_char("o"."createdAt",'dd') as "date",date_part('week', "o"."createdAt") as "week", trim(to_char("o"."createdAt",'month')) as "month", to_char("o"."createdAt", 'yyyy') as "year"
	from "order" "o"
	join "moviesTime" "mt" on "mt"."id"="o"."movieTimeId"
	join "movieCinema" "mc" on "mc"."id"="mt"."movieCinemaId"
	join "movies" "m" on "m"."id"="mc"."moviesId"
	join "genreMovies" "gm" on "gm"."moviesId"="m"."id"
	join "genre" "g" on "g"."id"="gm"."genreId"
	join "cinemaLocation" "cl" on "cl"."id"="o"."cinemaLocationId"
	join "location" "l" on "l"."id"="cl"."locationId"
	) as "data"
	where "data"."genreId" = $1 and "data"."locationId" = $2
	group by "data"."genre","data"."location","data"."date","data"."week" ,"data"."month","data"."year") as "data_sales"
	group by "data_sales"."genre","data_sales"."location","data_sales"."year"
	`
	result := TicketSales{}
	err := lib.DbConnection().Get(&result, sql, genreId, locationId)
	return result, err
}
