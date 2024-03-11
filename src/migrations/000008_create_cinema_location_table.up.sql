CREATE TABLE "cinemaLocation" (
    "id"            SERIAL PRIMARY KEY NOT NULL,
    "locationId"    INT REFERENCES "location"("id"),
    "cinemaId"      INT REFERENCES "cinema"("id"),
    "createdAt"     TIMESTAMP DEFAULT NOW(),
    "updatedAt"     TIMESTAMP
);