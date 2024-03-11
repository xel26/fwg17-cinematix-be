CREATE TABLE "paymentMethod" (
    "id"                    SERIAL PRIMARY KEY NOT NULL,
    "name"                  VARCHAR(50),
    "image"                 TEXT,
    "accountNumber"         VARCHAR(30),
    "createdAt"             TIMESTAMP DEFAULT NOW(),
    "updatedAt"             TIMESTAMP
);