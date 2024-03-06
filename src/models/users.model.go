package models

import (
	"github.com/jmoiron/sqlx"
	"github.com/putragabrielll/fwg17-cinematix-be/src/lib"
	"github.com/putragabrielll/fwg17-cinematix-be/src/services"
)

var db *sqlx.DB = lib.DbConnection()

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
