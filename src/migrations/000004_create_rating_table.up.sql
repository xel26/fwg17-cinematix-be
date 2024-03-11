CREATE TABLE "rating" (
    "id"            SERIAL PRIMARY KEY NOT NULL,
    "name"          VARCHAR(10),
    "createdAt"     TIMESTAMP DEFAULT NOW(),
    "updatedAt"     TIMESTAMP
);