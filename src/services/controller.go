package services

import (
	"time"

	"github.com/LukaGiorgadze/gonull"
)

// ------------ UNIVERSAL ------------
// PAGE INFO
type PageInfo struct {
	CurrentPage int `json:"currentPage"`
	TotalPage   int `json:"totalPage"`
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

//TOKEN
type TokenTemp struct {
	Token string `json:"token"`
}







// ------------ USERS ------------
// Untuk users model
type Person struct {
	Id          int                        	`db:"id" json:"id"`
	RoleId    	int    						`db:"roleId" json:"roleId"`
	Email       string                     	`db:"email" json:"email" form:"email"`
	FirstName   string     					`db:"firstName" json:"firstName" form:"firstName"`
	LastNamee   string     					`db:"lastName" json:"lastName" form:"lastName"`
	PhoneNumber string    					`db:"phoneNumber" json:"phoneNumber" form:"phoneNumber"`
	Picture     string    					`db:"picture" json:"picture" form:"picture"`
	Point       string                     	`db:"point" json:"point"`
	Password    string                     	`db:"password" json:"password" form:"password"`
	CreatedAt   time.Time                  	`db:"createdAt" json:"createdAt"`
	UpdatedAt   gonull.Nullable[time.Time] 	`db:"updatedAt" json:"updatedAt"`
}
type PersonNet struct { // untuk struck respon saja dimana data yg tidak di isi diperbolehkan nil/nul
	Id          int                        	`db:"id" json:"id"`
	RoleId    	int    						`db:"roleId" json:"roleId"`
	Email       string                     	`db:"email" json:"email" form:"email"`
	FirstName   gonull.Nullable[string]     `db:"firstName" json:"firstName" form:"firstName"`
	LastNamee   gonull.Nullable[string]     `db:"lastName" json:"lastName" form:"lastName"`
	PhoneNumber gonull.Nullable[string]    	`db:"phoneNumber" json:"phoneNumber" form:"phoneNumber"`
	Picture     gonull.Nullable[string]    	`db:"picture" json:"picture" form:"picture"`
	Point       gonull.Nullable[int]        `db:"point" json:"point"`
	Password    string                     	`db:"password" json:"password" form:"password"`
	CreatedAt   time.Time                  	`db:"createdAt" json:"createdAt"`
	UpdatedAt   gonull.Nullable[time.Time] 	`db:"updatedAt" json:"updatedAt"`
}

// AUTH login & register
type RLUsers struct {
	Email    	string 	`db:"email" json:"email" form:"email" binding:"email" binding:"required"`
	Password 	string 	`db:"password" json:"password" form:"password" binding:"required"`
}