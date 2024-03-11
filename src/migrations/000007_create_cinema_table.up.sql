CREATE TABLE "cinema" (
    "id"            SERIAL PRIMARY KEY NOT NULL,
    "name"          VARCHAR(20),
    "grade"         VARCHAR(20),
    "image"         TEXT,
    "price"         INT,
    "createdAt"     TIMESTAMP DEFAULT NOW(),
    "updatedAt"     TIMESTAMP
);