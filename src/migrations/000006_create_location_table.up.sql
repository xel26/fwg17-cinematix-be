CREATE TABLE "location" (
    "id"            SERIAL PRIMARY KEY NOT NULL,
    "name"          VARCHAR(20),
    "createdAt"     TIMESTAMP DEFAULT NOW(),
    "updatedAt"     TIMESTAMP
);