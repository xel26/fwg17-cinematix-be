CREATE TABLE "movieCinema" (
    "id"            SERIAL PRIMARY KEY NOT NULL,
    "cinemaId"      INT REFERENCES "cinema"("id"),
    "moviesId"      INT REFERENCES "movies"("id"),
    "createdAt"     TIMESTAMP DEFAULT NOW(),
    "updatedAt"     TIMESTAMP
);