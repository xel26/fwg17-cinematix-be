CREATE TABLE "airingTime" (
    "id"            SERIAL PRIMARY KEY NOT NULL,
    "time"          TIME,
    "createdAt"     TIMESTAMP DEFAULT NOW(),
    "updatedAt"     TIMESTAMP
);