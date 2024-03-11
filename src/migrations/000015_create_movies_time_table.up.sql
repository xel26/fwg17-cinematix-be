CREATE TABLE "moviesTime" (
    "id"                    SERIAL PRIMARY KEY NOT NULL,
    "airingTimeDateId"      INT REFERENCES "airingTimeDate"("id"),
    "movieCinemaId"         INT REFERENCES "movieCinema"("id"),
    "createdAt"             TIMESTAMP DEFAULT NOW(),
    "updatedAt"             TIMESTAMP
);