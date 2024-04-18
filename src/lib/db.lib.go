package lib

import (
	"log"
	"os"

	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
)



func DbConnection() *sqlx.DB{ // outputnya berupa tipe data *sqlx.DB
	// err := godotenv.Load()
	// if err != nil {
	// 	log.Fatal("Error loading .env file")
	// }

	db, err := sqlx.Connect("postgres", os.Getenv("DATABASE_CONNECT"))

	// // docker compose
	// dbConnect := fmt.Sprintf("user=%s password=%s dbname=%s host=%s port=%s sslmode=disable",
    // os.Getenv("DB_USER"), os.Getenv("DB_PASSWORD"), os.Getenv("DB_NAME"), os.Getenv("DB_HOST"), os.Getenv("DB_PORT"))

	// db, err := sqlx.Connect("postgres", dbConnect)
	
	if err != nil {
		// panic(err.Error())
		log.Fatalln(err)
	}

	err = db.Ping()
	if err != nil {
		// panic(err.Error())
		log.Fatalln(err)
	}

	return db
}