CREATE TABLE "orderDetail" (
    "id"                SERIAL PRIMARY KEY NOT NULL,
    "orderId"           INT REFERENCES "order"("id"),
    "seatCode"          VARCHAR(10),
    "createdAt"         TIMESTAMP DEFAULT NOW(),
    "updatedAt"         TIMESTAMP
);