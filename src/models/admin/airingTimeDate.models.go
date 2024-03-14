package adminModels

import (
	"database/sql"
	"time"
)

type AiringTimeDate struct {
	Id           int          `db:"id" json:"id"`
	AiringTimeId int          `db:"airingTimeId" json:"airingTimeId" form:"airingTimeId"`
	DateId       int          `db:"dateId" json:"dateId" form:"dateId"`
	CreatedAt    time.Time    `db:"createdAt" json:"createdAt"`
	UpdatedAt    sql.NullTime `db:"updatedAt" json:"updatedAt"`
}




func FindAiringTimeDate(AiringTimeId int, dateId int) (AiringTimeDate, error){
	sql := `
	SELECT "id" FROM "airingTimeDate"
	WHERE "airingTimeId" = $1 AND "dateId" = $2
	`
	data := AiringTimeDate{}
	err := db.Get(&data, sql, AiringTimeId, dateId)
	if err != nil {
		return data, err
	}

	return data, err
}



func InsertAiringTimeDate(data AiringTimeDate) (AiringTimeDate, error) {
	sql := `
	INSERT INTO "airingTimeDate"
	("airingTimeId", "dateId")
	VALUES
	(:airingTimeId, :dateId)
	RETURNING *
	`
	result := AiringTimeDate{}
	rows, err := db.NamedQuery(sql, data)
	if err != nil {
		return result, err
	}

	for rows.Next(){
		err := rows.StructScan(&result)
		if err != nil{
			return result, err
		}
	}

	return result, err
}