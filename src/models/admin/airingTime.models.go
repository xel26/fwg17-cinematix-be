package adminModels

import (
	"database/sql"
	"time"
)

type AiringTime struct {
	Id        int          `db:"id" json:"id"`
	Time      time.Time      `db:"time" json:"time" form:"time"`
	CreatedAt time.Time    `db:"createdAt" json:"createdAt"`
	UpdatedAt sql.NullTime `db:"updatedAt" json:"updatedAt"`
}


func FindByTime(time string) (AiringTime, error){
	sql := `
	SELECT "id", "time"
	FROM "airingTime"
	WHERE "time" = $1
	`
	data := AiringTime{}
	err := db.Get(&data, sql, time)
	if err != nil {
		return data, err
	}

	return data, err
}