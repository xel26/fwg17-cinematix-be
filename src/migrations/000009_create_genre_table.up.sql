CREATE TABLE "genre" (
    "id"            SERIAL PRIMARY KEY NOT NULL,
    "name"          VARCHAR(50),
    "createdAt"     TIMESTAMP DEFAULT NOW(),
    "updatedAt"     TIMESTAMP
);