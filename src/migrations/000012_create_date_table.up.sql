CREATE TABLE "date" (
    "id"            SERIAL PRIMARY KEY NOT NULL,
    "date"          DATE,
    "createdAt"     TIMESTAMP DEFAULT NOW(),
    "updatedAt"     TIMESTAMP
);