CREATE table IF NOT EXISTS "role"(
"id" serial PRIMARY KEY,
"name" varchar(20),
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);
INSERT INTO "role" ("id", "name", "createdAt", "updatedAt")
VALUES
	(1, 'customer', now(), NULL),
	(2, 'administrator', now(), NULL);

CREATE table IF NOT EXISTS "users"(
"id" serial PRIMARY KEY,
"roleId" int NOT NULL DEFAULT 1,
FOREIGN KEY ("roleId") REFERENCES "role"(id),
"email" varchar (50) UNIQUE NOT NULL,
"firstName" varchar (255),
"lastName" varchar (255),
"phoneNumber" varchar (15),
"picture" TEXT,
"point" varchar (50),
"password" varchar (255) NOT NULL,
"createdAt" timestamp DEFAULT now(),
"updatedAt" timestamp 
);

CREATE table IF NOT EXISTS "status"(
"id" serial PRIMARY KEY,
"name" varchar (20),
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);

INSERT INTO "status" ("id", "name", "createdAt", "updatedAt")
VALUES
	(1, 'coming soon', now(), NULL),
	(2, 'now airing', now(), NULL),
	(3, 'expired', now(), NULL);

CREATE table IF NOT EXISTS "rating"(
"id" serial PRIMARY KEY,
"name" varchar (10),
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);

INSERT INTO "rating" ("id", "name", "createdAt", "updatedAt")
VALUES
	(1, 'G', now(), NULL),
	(2, 'PG', now(), NULL),
	(3, 'PG-13', now(), NULL),
	(4, 'R', now(), NULL),
	(5, 'NC-17', now(), NULL);

CREATE table IF NOT EXISTS "movies"(
"id" serial PRIMARY KEY,
"statusId" int NOT NULL,
FOREIGN KEY ("statusId") REFERENCES "status"(id),
"ratingId" int NOT NULL,
FOREIGN KEY ("ratingId") REFERENCES "rating"(id),
"tittle" varchar (255),
"image" text,
"director" varchar (255),
"casts" text,
"duration" varchar (20),
"releaseDate" date,
"sinopsis" text,
"isRecomended" bool,
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);

CREATE table IF NOT EXISTS "genre"(
"id" serial PRIMARY KEY,
"name" varchar (50),
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);

INSERT INTO "genre" ("id", "name", "createdAt", "updatedAt")
VALUES
	(1, 'Action', now(), NULL),
	(2, 'Adventure', now(), NULL);

CREATE table IF NOT EXISTS "genreMovies"(
"id" serial PRIMARY KEY,
"genreId" int NOT NULL,
FOREIGN KEY ("genreId") REFERENCES "genre"(id),
"moviesId" int NOT NULL,
FOREIGN KEY ("moviesId") REFERENCES "movies"(id),
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);

CREATE table IF NOT EXISTS "cinema"(
"id" serial PRIMARY KEY,
"name" varchar (15),
"image" text,
"price" int,
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);

CREATE table IF NOT EXISTS "movieCinema"(
"id" serial PRIMARY KEY,
"cinemaId" int NOT NULL,
FOREIGN KEY ("cinemaId") REFERENCES "cinema"(id),
"moviesId" int NOT NULL,
FOREIGN KEY ("moviesId") REFERENCES "movies"(id),
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);

CREATE table IF NOT EXISTS "location"(
"id" serial PRIMARY KEY,
"name" varchar (150),
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);

CREATE table IF NOT EXISTS "cinemaLocation"(
"id" serial PRIMARY KEY,
"locationId" int NOT NULL,
FOREIGN KEY ("locationId") REFERENCES "location"(id),
"cinemaId" int NOT NULL,
FOREIGN KEY ("cinemaId") REFERENCES "cinema"(id),
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);

CREATE table IF NOT EXISTS "airingTime"(
"id" serial PRIMARY KEY,
"time" time,
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);

CREATE table IF NOT EXISTS "date"(
"id" serial PRIMARY KEY,
"date" date,
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);

CREATE table IF NOT EXISTS "airingTimeDate"(
"id" serial PRIMARY KEY,
"airingTimeId" int NOT NULL,
FOREIGN KEY ("airingTimeId") REFERENCES "airingTime"(id),
"dateId" int NOT NULL,
FOREIGN KEY ("dateId") REFERENCES "date"(id),
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);

CREATE table IF NOT EXISTS "moviesTime"(
"id" serial PRIMARY KEY,
"cinemaId" int NOT NULL,
FOREIGN KEY ("cinemaId") REFERENCES "cinema"(id),
"airingTimeDateId" int NOT NULL,
FOREIGN KEY ("airingTimeDateId") REFERENCES "airingTimeDate"(id),
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);

CREATE table IF NOT EXISTS "paymentMethod"(
"id" serial PRIMARY KEY,
"name" varchar(255),
"image" text,
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);

CREATE table IF NOT EXISTS "order"(
"id" serial PRIMARY KEY,
"orderNumber" varchar(255),
"moviesId" int NOT NULL,
FOREIGN KEY ("moviesId") REFERENCES "movies"(id),
"usersId" int NOT NULL,
FOREIGN KEY ("usersId") REFERENCES "users"(id),
"cinemaLocationId" int NOT NULL,
FOREIGN KEY ("cinemaLocationId") REFERENCES "cinemaLocation"(id),
"paymentId" int NOT NULL,
FOREIGN KEY ("paymentId") REFERENCES "paymentMethod"(id),
"seatCount" int NOT NULL,
"isPaid" bool DEFAULT false,
"isUsed" bool DEFAULT false,
"total" int,
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);

CREATE table IF NOT EXISTS "orderDetail"(
"id" serial PRIMARY KEY,
"orderId" int NOT NULL,
FOREIGN KEY ("orderId") REFERENCES "order"(id),
"seatCode" varchar(10),
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);
