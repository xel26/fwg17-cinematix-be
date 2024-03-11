CREATE TABLE "order" (
    "id"                SERIAL PRIMARY KEY NOT NULL,
    "orderNumber"       VARCHAR(50),
    "usersId"           INT REFERENCES "users"("id"),
    "cinemaLocationId"  INT REFERENCES "cinemaLocation"("id"),
    "paymentId"         INT REFERENCES "paymentMethod"("id"),
    "movieTimeId"       INT REFERENCES "moviesTime"("id"),
    "seatCount"         INT,
    "isPaid"            BOOLEAN,
    "isUsed"            BOOLEAN,
    "total"             INT,
    "createdAt"         TIMESTAMP DEFAULT NOW(),
    "updatedAt"         TIMESTAMP
);