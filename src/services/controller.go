package services

import (
	"database/sql"
	"time"

	"github.com/LukaGiorgadze/gonull"
	"github.com/lib/pq"
)

// ------------ UNIVERSAL ------------
// PAGE INFO
type PageInfo struct {
	CurrentPage int `json:"currentPage"`
	TotalPage   int `json:"totalPage"`
	Limit       int `json:"limit"`
	NextPage    int `json:"nextPage"`
	PrevPage    int `json:"prevPage"`
	TotalData   int `json:"totalData"`
}

// RESPONSE ALL DATA
type ResponseList struct {
	Success  bool        `json:"success"`
	Message  string      `json:"message"`
	PageInfo PageInfo    `json:"pageInfo"`
	Results  interface{} `json:"results"`
}

// RESPONSE SELECT DATA by ID
type Response struct {
	Success bool        `json:"success"`
	Message string      `json:"message"`
	Results interface{} `json:"results"`
}

// RESPONSE ERROR
type ResponseBack struct {
	Success bool   `json:"success"`
	Message string `json:"message"`
}

// TOKEN
type TokenTemp struct {
	Token string `json:"token"`
}

// Count
type Info struct {
	Data  interface{}
	Count int
}

// ------------ USERS ------------
// Untuk users model
type Person struct {
	Id          int        `db:"id" json:"id"`
	RoleId      int        `db:"roleId" json:"roleId"`
	Email       string     `db:"email" json:"email" form:"email"`
	FirstName   *string    `db:"firstName" json:"firstName" form:"firstName"`
	LastName    *string    `db:"lastName" json:"lastName" form:"lastName"`
	PhoneNumber *string    `db:"phoneNumber" json:"phoneNumber" form:"phoneNumber"`
	Picture     *string    `db:"picture" json:"picture"`
	Point       *int       `db:"point" json:"point"`
	Password    string     `db:"password" json:"password" form:"password"`
	CreatedAt   *time.Time `db:"createdAt" json:"createdAt"`
	UpdatedAt   *time.Time `db:"updatedAt" json:"updatedAt"`
}
type PersonNet struct { // untuk struck respon saja dimana data yg tidak di isi diperbolehkan nil/nul
	Id          int                        `db:"id" json:"id"`
	RoleId      int                        `db:"roleId" json:"roleId"`
	Email       string                     `db:"email" json:"email" form:"email"`
	FirstName   gonull.Nullable[string]    `db:"firstName" json:"firstName" form:"firstName"`
	LastName    gonull.Nullable[string]    `db:"lastName" json:"lastName" form:"lastName"`
	PhoneNumber gonull.Nullable[string]    `db:"phoneNumber" json:"phoneNumber" form:"phoneNumber"`
	Picture     gonull.Nullable[string]    `db:"picture" json:"picture" form:"picture"`
	Point       gonull.Nullable[int]       `db:"point" json:"point"`
	Password    string                     `db:"password" json:"password" form:"password"`
	CreatedAt   time.Time                  `db:"createdAt" json:"createdAt"`
	UpdatedAt   gonull.Nullable[time.Time] `db:"updatedAt" json:"updatedAt"`
}

// AUTH login & register
type RLUsers struct {
	Email    string `db:"email" json:"email" form:"email" binding:"email,required"`
	Password string `db:"password" json:"password" form:"password" binding:"required"`
	RoleId   int    `db:"roleId" json:"roleId"`
}

// MOVIES

type Movies struct {
	Id            int             `db:"id" json:"id"`
	Status        *string         `db:"status" json:"status" form:"status"`
	Rating        *string         `db:"rating" json:"rating" form:"rating"`
	Title         *string         `db:"title" json:"title" form:"title"`
	Image         *string         `db:"image" json:"image" form:"image"`
	Genre         *pq.StringArray `db:"genre" json:"genre" form:"genre"`
	Director      *string         `db:"director" json:"director" form:"director"`
	Casts         *string         `db:"casts" json:"casts" form:"casts"`
	Duration      *string         `db:"duration" json:"duration" form:"duration"`
	ReleaseDate   *time.Time      `db:"releaseDate" json:"releaseDate" form:"releaseDate"`
	Synopsis      *string         `db:"synopsis" json:"synopsis" form:"synopsis"`
	IsRecommended *bool           `db:"isRecommended" json:"isRecommended" form:"isRecommended"`
	CreatedAt     *time.Time      `db:"createdAt" json:"createdAt" form:"createdAt"`
	UpdatedAt     *time.Time      `db:"updatedAt" json:"updatedAt" form:"updatedAt"`
}

// MOVIE CINEMA

// type MovieCinema struct {
// 	MovieId       int             `db:"movieId" json:"movieId"`
// 	CinemaId      *pq.Int64Array  `db:"cinemaId" json:"cinemaId" form:"cinemaId"`
// 	CinemaName    *pq.StringArray `db:"cinemaName" json:"cinemaName"`
// 	CinemaPrice   *pq.Int64Array  `db:"cinemaPrice" json:"cinemaPrice"`
// 	MovieCinemaId *pq.Int64Array  `db:"movieCinemaId" json:"movieCinemaId" form:"movieCinemaId"`
// 	CinemaImage   *pq.StringArray `db:"cinemaImage" json:"cinemaImage" form:"cinemaImage"`
// }

type MovieCinema struct {
	MovieId       int             `db:"movieId" json:"movieId"`
	Cinema      string  `db:"cinema" json:"cinema" form:"cinema"`
}

// CINEMA LOCATION
type CinemaLocation struct {
	CinemaId         int            `db:"cinemaId" json:"cinemaId"`
	CinemaLocationId pq.StringArray `db:"cinemaLocationId" json:"cinemaLocationId"`
	LocationId       pq.StringArray `db:"locationId" json:"LocationId"`
	Location         pq.StringArray `db:"location" json:"location"`
}

// ------------ ADMIN ------------
// List movies
type AdminListMovies struct {
	Id          int             `db:"id" json:"id"`
	Image       *string         `db:"image" json:"image"`
	Title       *string         `db:"title" json:"title"`
	Genre       *pq.StringArray `db:"genre" json:"genre"`
	ReleaseDate *time.Time      `db:"releaseDate" json:"releaseDate"`
	Duration    *string         `db:"duration" json:"duration"`
}

// ADMIN ADD NEW MOVIE
type AddNewMovie struct {
	Id           int          `db:"id" json:"id"`
	StatusId     int          `db:"statusId" json:"statusId"`
	RatingId     int          `db:"ratingId" json:"ratingId" form:"ratingId"`
	Title        string       `db:"title" json:"title" form:"title"`
	Image        string       `db:"image" json:"image"`
	Director     string       `db:"director" json:"director" form:"director"`
	Casts        string       `db:"casts" json:"casts" form:"casts"`
	Duration     string       `db:"duration" json:"duration" form:"duration"`
	ReleaseDate  string       `db:"releaseDate" json:"releaseDate" form:"releaseDate"`
	Synopsis     string       `db:"synopsis" json:"synopsis" form:"synopsis"`
	IsRecommended bool         `db:"isRecommended" json:"isRecommended"`
	CreatedAt    time.Time    `db:"createdAt" json:"createdAt"`
	UpdatedAt    sql.NullTime `db:"updatedAt" json:"updatedAt"`
	Genre        string       `db:"genre" json:"genre" form:"genre"`
	Location     string       `db:"location" json:"location" form:"location"`
	Date         string       `db:"date" json:"date" form:"date"`
	AiringTime   string       `db:"airingTime" json:"airingTime" form:"airingTime"`
}

// Delete movies
type AdminDeleteMovies struct {
	Id           int        `db:"id" json:"id"`
	StatusId     *int       `db:"statusId" json:"statusId"`
	RatingId     *int       `db:"ratingId" json:"ratingId"`
	Title        *string    `db:"title" json:"title"`
	Image        *string    `db:"image" json:"image"`
	Director     *string    `db:"director" json:"director"`
	Casts        *string    `db:"casts" json:"casts"`
	Duration     *string    `db:"duration" json:"duration"`
	ReleaseDate  *time.Time `db:"releaseDate" json:"releaseDate"`
	Synopsis     *string    `db:"synopsis" json:"synopsis"`
	IsRecommended *bool      `db:"isRecommended" json:"isRecommended"`
	CreatedAt    *time.Time `db:"createdAt" json:"createdAt"`
	UpdatedAt    *time.Time `db:"updatedAt" json:"updatedAt"`
}
