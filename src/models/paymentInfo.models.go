package models

import "time"

type paymentInfo struct {
	AccountNumber string    `db:"accountNumber" json:"noRekeningVirtual"`
	Total         int       `db:"total" json:"totalPayment"`
	CreatedAt     time.Time `db:"createdAt" json:"expiredDate"`
}

func GetPaymentInfo(orderId int) (paymentInfo, error) {
	sql := `
	SELECT
	"o"."total",
	"o"."createdAt",
	"pm"."accountNumber"
	FROM "order" "o"
	JOIN "paymentMethod" "pm" ON ("pm"."id" = "o"."paymentId")
	WHERE "o"."id" = $1
	`
	data := paymentInfo{}
	err := db.Get(&data, sql, orderId)

	data.CreatedAt = data.CreatedAt.Add(24 * time.Hour)
	return data, err
}