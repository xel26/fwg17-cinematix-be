CREATE TABLE "users" (
    "id"            SERIAL PRIMARY KEY NOT NULL,
    "roleId"        INT REFERENCES "role"("id"),
    "email"         VARCHAR(50) UNIQUE NOT NULL,
    "password"      VARCHAR(255) NOT NULL,
    "firstName"     VARCHAR(255),
    "lastName"      VARCHAR(255),
    "phoneNumber"   VARCHAR(20),
    "picture"       TEXT,
    "point"         INT,
    "createdAt"     TIMESTAMP DEFAULT NOW(),
    "updatedAt"     TIMESTAMP
);