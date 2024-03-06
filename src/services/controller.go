package services

import (
	"time"

	"github.com/LukaGiorgadze/gonull"
)

// ------------ UNIVERSAL ------------
// Page Info
type PageInfo struct {
	CurrentPage int `json:"currentPage"`
	TotalPage   int `json:"totalPage"`
	NextPage    int `json:"nextPage"`
	PrevPage    int `json:"prevPage"`
	TotalData   int `json:"totalData"`
}

// Response ALL DATA
type ResponseAll struct {
	Success  bool        `json:"success"`
	Message  string      `json:"message"`
	PageInfo PageInfo    `json:"pageInfo"`
	Results  interface{} `json:"results"`
}

type ResponseList struct {
	Success bool        `json:"success"`
	Message string      `json:"message"`
	Results interface{} `json:"results"`
}

// RESPONSE ERROR
type ResponseBack struct {
	Success bool   `json:"success"`
	Message string `json:"message"`
}

//Token
type TokenTemp struct {
	Token string `json:"token"`
}







// ------------ USERS ------------
// Untuk users model
type Person struct {
	Id          int                        `db:"id" json:"id"`
	FullName    string                     `db:"fullName" json:"fullName" form:"fullName"`
	Email       string                     `db:"email" json:"email" form:"email" binding:"email" binding:"required"`
	PhoneNumber string                     `db:"phoneNumber" json:"phoneNumber" form:"phoneNumber"`
	Address     string                     `db:"address" json:"address" form:"address"`
	Picture     string                     `db:"picture" json:"picture"`
	Role        string                     `db:"role" json:"role"`
	Password    string                     `db:"password" json:"password" form:"password" binding:"required"`
	CreatedAt   time.Time                  `db:"createdAt" json:"createdAt"`
	UpdatedAt   gonull.Nullable[time.Time] `db:"updatedAt" json:"updatedAt"`
}
type PersonNet struct { // untuk struck respon saja dimana data yg tidak di isi diperbolehkan nil/nul
	Id          int                        `db:"id" json:"id"`
	FullName    gonull.Nullable[string]    `db:"fullName" json:"fullName" form:"fullName"`
	Email       string                     `db:"email" json:"email" form:"email"`
	PhoneNumber gonull.Nullable[string]    `db:"phoneNumber" json:"phoneNumber" form:"phoneNumber"`
	Address     gonull.Nullable[string]    `db:"address" json:"address" form:"address"`
	Picture     gonull.Nullable[string]    `db:"picture" json:"picture" form:"picture"`
	Role        string                     `db:"role" json:"role"`
	Password    string                     `db:"password" json:"password" form:"password"`
	CreatedAt   time.Time                  `db:"createdAt" json:"createdAt"`
	UpdatedAt   gonull.Nullable[time.Time] `db:"updatedAt" json:"updatedAt"`
}

// AUTH login & register
type RLUsers struct {
	Email    	string 	`db:"email" json:"email" form:"email" binding:"email" binding:"required"`
	Role     	string 	`db:"role" json:"role"`
	Password 	string 	`db:"password" json:"password" form:"password" binding:"required"`
}