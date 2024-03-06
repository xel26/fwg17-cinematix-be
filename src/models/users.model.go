package models

import (
	"github.com/jmoiron/sqlx"
	"github.com/putragabrielll/fwg17-cinematix-be/src/lib"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

var db *sqlx.DB = lib.DbConnection()

// SELECT users BY id
func FindUsersId(id int) (services.PersonNet, error){
	sql := `SELECT * FROM "users" WHERE "id"=$1`
	data := services.PersonNet{}
	err := lib.DbConnection().Get(&data, sql, id) // id diambil dari parameter id.
	return data, err
}

// UPDATE users
func UpdateUsers(data services.Person) (services.PersonNet, error){ // bisa teruddate jika type untuk fullName di ganti jadi string.
	sql := `
	UPDATE "users" SET 
	"firstName"=COALESCE(NULLIF(:firstName,''),"firstName"),
	"lastName"=COALESCE(NULLIF(:lastName,''),"lastName"),
	"phoneNumber"=COALESCE(NULLIF(:phoneNumber,''),"phoneNumber"),
	"picture"=COALESCE(NULLIF(:picture,''),"picture"),
	"password"=COALESCE(NULLIF(:password,''),"password"),
	"updatedAt"=NOW()
    WHERE id=:id
    RETURNING *
    `
	returning := services.PersonNet{}
	rows, err := lib.DbConnection().NamedQuery(sql, data)
	
	for rows.Next(){
		rows.StructScan(&returning)
	}
	return returning, err
}



// ------------ AUTH ------------
// LOGIN users BY email
func FindUsersByEmail(email string) (services.PersonNet, error) {
	sql := `SELECT * FROM "users" WHERE "email"=$1`
	data := services.PersonNet{}
	err := db.Get(&data, sql, email) // id diambil dari parameter id.
	return data, err
}

// REGISTER users
func RegisterUsers(data services.RLUsers) (services.PersonNet, error) {
	sql := `
	INSERT INTO "users"
    ("email", "password")
    VALUES
    (:email, :password)
    RETURNING *
    `
	returning := services.PersonNet{}
	rows, err := db.NamedQuery(sql, data)
	if err != nil {
		return returning, err
	}

	for rows.Next() { // rows.Next() => akan mengembalikan boolean.
		rows.StructScan(&returning)
	}
	return returning, err
}
