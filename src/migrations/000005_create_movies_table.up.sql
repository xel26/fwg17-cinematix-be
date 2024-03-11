CREATE TABLE "movies" (
    "id"            SERIAL PRIMARY KEY NOT NULL,
    "statusId"      INT REFERENCES "status"("id"),
    "ratingId"      INT REFERENCES "rating"("id"),
    "title"         VARCHAR(255),
    "image"         TEXT,
    "director"      VARCHAR(100),
    "casts"         TEXT,
    "duration"      VARCHAR(20),
    "releaseDate"   DATE,
    "synopsis"      TEXT,
    "isRecommended" BOOLEAN,
    "createdAt"     TIMESTAMP DEFAULT NOW(),
    "updatedAt"     TIMESTAMP
);