CREATE TABLE "genreMovies" (
    "id"            SERIAL PRIMARY KEY NOT NULL,
    "genreId"       INT REFERENCES "genre"("id"),
    "moviesId"      INT REFERENCES "movies"("id"),
    "createdAt"     TIMESTAMP DEFAULT NOW(),
    "updatedAt"     TIMESTAMP
);