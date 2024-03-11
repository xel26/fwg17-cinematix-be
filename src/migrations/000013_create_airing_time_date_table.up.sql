CREATE TABLE "airingTimeDate" (
    "id"            SERIAL PRIMARY KEY NOT NULL,
    "airingTimeId"  INT REFERENCES "airingTime"("id"),
    "dateId"        INT REFERENCES "date"("id"),
    "createdAt"     TIMESTAMP DEFAULT NOW(),
    "updatedAt"     TIMESTAMP
);