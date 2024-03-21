--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Ubuntu 16.2-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.2 (Ubuntu 16.2-1.pgdg22.04+1)

-- Started on 2024-03-15 00:25:39 WIB

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 237 (class 1259 OID 55834)
-- Name: airingTime; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."airingTime" (
    id integer NOT NULL,
    "time" time without time zone,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public."airingTime" OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 55858)
-- Name: airingTimeDate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."airingTimeDate" (
    id integer NOT NULL,
    "airingTimeId" integer,
    "dateId" integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public."airingTimeDate" OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 55857)
-- Name: airingTimeDate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."airingTimeDate_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."airingTimeDate_id_seq" OWNER TO postgres;

--
-- TOC entry 3712 (class 0 OID 0)
-- Dependencies: 240
-- Name: airingTimeDate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."airingTimeDate_id_seq" OWNED BY public."airingTimeDate".id;


--
-- TOC entry 236 (class 1259 OID 55833)
-- Name: airingTime_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."airingTime_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."airingTime_id_seq" OWNER TO postgres;

--
-- TOC entry 3713 (class 0 OID 0)
-- Dependencies: 236
-- Name: airingTime_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."airingTime_id_seq" OWNED BY public."airingTime".id;


--
-- TOC entry 229 (class 1259 OID 55764)
-- Name: cinema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cinema (
    id integer NOT NULL,
    name character varying(20),
    grade character varying(20),
    image text,
    price integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public.cinema OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 55778)
-- Name: cinemaLocation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."cinemaLocation" (
    id integer NOT NULL,
    "locationId" integer,
    "cinemaId" integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public."cinemaLocation" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 55777)
-- Name: cinemaLocation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."cinemaLocation_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."cinemaLocation_id_seq" OWNER TO postgres;

--
-- TOC entry 3714 (class 0 OID 0)
-- Dependencies: 230
-- Name: cinemaLocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."cinemaLocation_id_seq" OWNED BY public."cinemaLocation".id;


--
-- TOC entry 228 (class 1259 OID 55763)
-- Name: cinema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cinema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cinema_id_seq OWNER TO postgres;

--
-- TOC entry 3715 (class 0 OID 0)
-- Dependencies: 228
-- Name: cinema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cinema_id_seq OWNED BY public.cinema.id;


--
-- TOC entry 239 (class 1259 OID 55846)
-- Name: date; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.date (
    id integer NOT NULL,
    date date,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public.date OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 55845)
-- Name: date_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.date_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.date_id_seq OWNER TO postgres;

--
-- TOC entry 3716 (class 0 OID 0)
-- Dependencies: 238
-- Name: date_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.date_id_seq OWNED BY public.date.id;


--
-- TOC entry 233 (class 1259 OID 55800)
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    id integer NOT NULL,
    name character varying(50),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 55812)
-- Name: genreMovies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."genreMovies" (
    id integer NOT NULL,
    "genreId" integer,
    "moviesId" integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public."genreMovies" OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 55811)
-- Name: genreMovies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."genreMovies_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."genreMovies_id_seq" OWNER TO postgres;

--
-- TOC entry 3717 (class 0 OID 0)
-- Dependencies: 234
-- Name: genreMovies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."genreMovies_id_seq" OWNED BY public."genreMovies".id;


--
-- TOC entry 232 (class 1259 OID 55799)
-- Name: genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genre_id_seq OWNER TO postgres;

--
-- TOC entry 3718 (class 0 OID 0)
-- Dependencies: 232
-- Name: genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genre_id_seq OWNED BY public.genre.id;


--
-- TOC entry 227 (class 1259 OID 55752)
-- Name: location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location (
    id integer NOT NULL,
    name character varying(20),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public.location OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 55751)
-- Name: location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.location_id_seq OWNER TO postgres;

--
-- TOC entry 3719 (class 0 OID 0)
-- Dependencies: 226
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.location_id_seq OWNED BY public.location.id;


--
-- TOC entry 243 (class 1259 OID 55880)
-- Name: movieCinema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."movieCinema" (
    id integer NOT NULL,
    "cinemaId" integer,
    "moviesId" integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public."movieCinema" OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 55879)
-- Name: movieCinema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."movieCinema_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."movieCinema_id_seq" OWNER TO postgres;

--
-- TOC entry 3720 (class 0 OID 0)
-- Dependencies: 242
-- Name: movieCinema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."movieCinema_id_seq" OWNED BY public."movieCinema".id;


--
-- TOC entry 225 (class 1259 OID 55728)
-- Name: movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies (
    id integer NOT NULL,
    "statusId" integer,
    "ratingId" integer,
    title character varying(255),
    image text,
    director character varying(100),
    casts text,
    duration character varying(20),
    "releaseDate" date,
    sinopsis text,
    "isRecomended" boolean,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public.movies OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 55902)
-- Name: moviesTime; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."moviesTime" (
    id integer NOT NULL,
    "airingTimeDateId" integer,
    "movieCinemaId" integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public."moviesTime" OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 55901)
-- Name: moviesTime_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."moviesTime_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."moviesTime_id_seq" OWNER TO postgres;

--
-- TOC entry 3721 (class 0 OID 0)
-- Dependencies: 244
-- Name: moviesTime_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."moviesTime_id_seq" OWNED BY public."moviesTime".id;


--
-- TOC entry 224 (class 1259 OID 55727)
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.movies_id_seq OWNER TO postgres;

--
-- TOC entry 3722 (class 0 OID 0)
-- Dependencies: 224
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;


--
-- TOC entry 249 (class 1259 OID 55938)
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    "orderNumber" character varying(50),
    "usersId" integer,
    "cinemaLocationId" integer,
    "paymentId" integer,
    "movieTimeId" integer,
    "seatCount" integer,
    "isPaid" boolean,
    "isUsed" boolean,
    total integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 55970)
-- Name: orderDetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."orderDetail" (
    id integer NOT NULL,
    "orderId" integer,
    "seatCode" character varying(10),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public."orderDetail" OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 55969)
-- Name: orderDetail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."orderDetail_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."orderDetail_id_seq" OWNER TO postgres;

--
-- TOC entry 3723 (class 0 OID 0)
-- Dependencies: 250
-- Name: orderDetail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."orderDetail_id_seq" OWNED BY public."orderDetail".id;


--
-- TOC entry 248 (class 1259 OID 55937)
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_id_seq OWNER TO postgres;

--
-- TOC entry 3724 (class 0 OID 0)
-- Dependencies: 248
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_id_seq OWNED BY public."order".id;


--
-- TOC entry 247 (class 1259 OID 55924)
-- Name: paymentMethod; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."paymentMethod" (
    id integer NOT NULL,
    name character varying(50),
    image text,
    "accountNumber" character varying(30),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public."paymentMethod" OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 55923)
-- Name: paymentMethod_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."paymentMethod_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."paymentMethod_id_seq" OWNER TO postgres;

--
-- TOC entry 3725 (class 0 OID 0)
-- Dependencies: 246
-- Name: paymentMethod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."paymentMethod_id_seq" OWNED BY public."paymentMethod".id;


--
-- TOC entry 223 (class 1259 OID 55716)
-- Name: rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rating (
    id integer NOT NULL,
    name character varying(10),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public.rating OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 55715)
-- Name: rating_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rating_id_seq OWNER TO postgres;

--
-- TOC entry 3726 (class 0 OID 0)
-- Dependencies: 222
-- Name: rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rating_id_seq OWNED BY public.rating.id;


--
-- TOC entry 217 (class 1259 OID 55671)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying(20),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 55670)
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_id_seq OWNER TO postgres;

--
-- TOC entry 3727 (class 0 OID 0)
-- Dependencies: 216
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- TOC entry 215 (class 1259 OID 53217)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    dirty boolean NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 55704)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    id integer NOT NULL,
    name character varying(20),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public.status OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 55703)
-- Name: status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.status_id_seq OWNER TO postgres;

--
-- TOC entry 3728 (class 0 OID 0)
-- Dependencies: 220
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_id_seq OWNED BY public.status.id;


--
-- TOC entry 219 (class 1259 OID 55683)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    "roleId" integer,
    email character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    "firstName" character varying(255),
    "lastName" character varying(255),
    "phoneNumber" character varying(20),
    picture text,
    point integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 55682)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3729 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3453 (class 2604 OID 55837)
-- Name: airingTime id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."airingTime" ALTER COLUMN id SET DEFAULT nextval('public."airingTime_id_seq"'::regclass);


--
-- TOC entry 3457 (class 2604 OID 55861)
-- Name: airingTimeDate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."airingTimeDate" ALTER COLUMN id SET DEFAULT nextval('public."airingTimeDate_id_seq"'::regclass);


--
-- TOC entry 3445 (class 2604 OID 55767)
-- Name: cinema id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema ALTER COLUMN id SET DEFAULT nextval('public.cinema_id_seq'::regclass);


--
-- TOC entry 3447 (class 2604 OID 55781)
-- Name: cinemaLocation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."cinemaLocation" ALTER COLUMN id SET DEFAULT nextval('public."cinemaLocation_id_seq"'::regclass);


--
-- TOC entry 3455 (class 2604 OID 55849)
-- Name: date id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.date ALTER COLUMN id SET DEFAULT nextval('public.date_id_seq'::regclass);


--
-- TOC entry 3449 (class 2604 OID 55803)
-- Name: genre id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre ALTER COLUMN id SET DEFAULT nextval('public.genre_id_seq'::regclass);


--
-- TOC entry 3451 (class 2604 OID 55815)
-- Name: genreMovies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genreMovies" ALTER COLUMN id SET DEFAULT nextval('public."genreMovies_id_seq"'::regclass);


--
-- TOC entry 3443 (class 2604 OID 55755)
-- Name: location id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location ALTER COLUMN id SET DEFAULT nextval('public.location_id_seq'::regclass);


--
-- TOC entry 3459 (class 2604 OID 55883)
-- Name: movieCinema id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."movieCinema" ALTER COLUMN id SET DEFAULT nextval('public."movieCinema_id_seq"'::regclass);


--
-- TOC entry 3441 (class 2604 OID 55731)
-- Name: movies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);


--
-- TOC entry 3461 (class 2604 OID 55905)
-- Name: moviesTime id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."moviesTime" ALTER COLUMN id SET DEFAULT nextval('public."moviesTime_id_seq"'::regclass);


--
-- TOC entry 3465 (class 2604 OID 55941)
-- Name: order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order" ALTER COLUMN id SET DEFAULT nextval('public.order_id_seq'::regclass);


--
-- TOC entry 3467 (class 2604 OID 55973)
-- Name: orderDetail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."orderDetail" ALTER COLUMN id SET DEFAULT nextval('public."orderDetail_id_seq"'::regclass);


--
-- TOC entry 3463 (class 2604 OID 55927)
-- Name: paymentMethod id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."paymentMethod" ALTER COLUMN id SET DEFAULT nextval('public."paymentMethod_id_seq"'::regclass);


--
-- TOC entry 3439 (class 2604 OID 55719)
-- Name: rating id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating ALTER COLUMN id SET DEFAULT nextval('public.rating_id_seq'::regclass);


--
-- TOC entry 3433 (class 2604 OID 55674)
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- TOC entry 3437 (class 2604 OID 55707)
-- Name: status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status ALTER COLUMN id SET DEFAULT nextval('public.status_id_seq'::regclass);


--
-- TOC entry 3435 (class 2604 OID 55686)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3692 (class 0 OID 55834)
-- Dependencies: 237
-- Data for Name: airingTime; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."airingTime" (id, "time", "createdAt", "updatedAt") VALUES (1, '09:30:00', '2024-03-11 16:46:36.797701', NULL);
INSERT INTO public."airingTime" (id, "time", "createdAt", "updatedAt") VALUES (2, '12:25:00', '2024-03-11 16:46:36.797701', NULL);
INSERT INTO public."airingTime" (id, "time", "createdAt", "updatedAt") VALUES (3, '14:45:00', '2024-03-11 16:46:36.797701', NULL);
INSERT INTO public."airingTime" (id, "time", "createdAt", "updatedAt") VALUES (4, '16:50:00', '2024-03-11 16:46:36.797701', NULL);
INSERT INTO public."airingTime" (id, "time", "createdAt", "updatedAt") VALUES (5, '19:05:00', '2024-03-11 16:46:36.797701', NULL);


--
-- TOC entry 3696 (class 0 OID 55858)
-- Dependencies: 241
-- Data for Name: airingTimeDate; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (1, 1, 1, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (2, 1, 2, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (3, 1, 3, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (4, 1, 4, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (5, 1, 5, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (6, 2, 1, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (7, 2, 2, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (8, 2, 3, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (9, 2, 4, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (10, 2, 5, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (11, 3, 1, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (12, 3, 2, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (13, 3, 3, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (14, 3, 4, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (15, 3, 5, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (16, 4, 1, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (17, 4, 2, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (18, 4, 3, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (19, 4, 4, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (20, 4, 5, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (21, 5, 1, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (22, 5, 2, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (23, 5, 3, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (24, 5, 4, '2024-03-11 16:46:37.080697', NULL);
INSERT INTO public."airingTimeDate" (id, "airingTimeId", "dateId", "createdAt", "updatedAt") VALUES (25, 5, 5, '2024-03-11 16:46:37.080697', NULL);


--
-- TOC entry 3684 (class 0 OID 55764)
-- Dependencies: 229
-- Data for Name: cinema; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cinema (id, name, grade, image, price, "createdAt", "updatedAt") VALUES (4, 'CGV', 'ScreenX', 'https://res.cloudinary.com/drsh7022q/image/upload/v1710291343/cinematix/cinema/3f9652da-6a12-4d2d-b99c-dc80bd3cc0b9.png.png', 60000, '2024-03-11 16:46:36.275538', NULL);
INSERT INTO public.cinema (id, name, grade, image, price, "createdAt", "updatedAt") VALUES (3, 'CGV', 'Regular', 'https://res.cloudinary.com/drsh7022q/image/upload/v1710291399/cinematix/cinema/78f49758-c79b-4df9-845e-008f63fb0997.png.png ', 50000, '2024-03-11 16:46:36.275538', NULL);
INSERT INTO public.cinema (id, name, grade, image, price, "createdAt", "updatedAt") VALUES (1, 'XXI', 'Regular', 'https://res.cloudinary.com/drsh7022q/image/upload/v1710291445/cinematix/cinema/09fafd52-65f8-459a-82c3-530bcc24a764.jpeg.jpg ', 25000, '2024-03-11 16:46:36.275538', NULL);
INSERT INTO public.cinema (id, name, grade, image, price, "createdAt", "updatedAt") VALUES (2, 'XXI', 'Premiere', 'https://res.cloudinary.com/drsh7022q/image/upload/v1710291492/cinematix/cinema/1049e400-a8d1-433a-a605-c98aa4ba76fe.jpeg.jpg ', 35000, '2024-03-11 16:46:36.275538', NULL);


--
-- TOC entry 3686 (class 0 OID 55778)
-- Dependencies: 231
-- Data for Name: cinemaLocation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."cinemaLocation" (id, "locationId", "cinemaId", "createdAt", "updatedAt") VALUES (1, 1, 1, '2024-03-11 16:46:36.397738', NULL);
INSERT INTO public."cinemaLocation" (id, "locationId", "cinemaId", "createdAt", "updatedAt") VALUES (2, 1, 2, '2024-03-11 16:46:36.397738', NULL);
INSERT INTO public."cinemaLocation" (id, "locationId", "cinemaId", "createdAt", "updatedAt") VALUES (3, 1, 3, '2024-03-11 16:46:36.397738', NULL);
INSERT INTO public."cinemaLocation" (id, "locationId", "cinemaId", "createdAt", "updatedAt") VALUES (4, 1, 4, '2024-03-11 16:46:36.397738', NULL);
INSERT INTO public."cinemaLocation" (id, "locationId", "cinemaId", "createdAt", "updatedAt") VALUES (5, 2, 1, '2024-03-11 16:46:36.397738', NULL);
INSERT INTO public."cinemaLocation" (id, "locationId", "cinemaId", "createdAt", "updatedAt") VALUES (6, 2, 2, '2024-03-11 16:46:36.397738', NULL);
INSERT INTO public."cinemaLocation" (id, "locationId", "cinemaId", "createdAt", "updatedAt") VALUES (7, 2, 3, '2024-03-11 16:46:36.397738', NULL);
INSERT INTO public."cinemaLocation" (id, "locationId", "cinemaId", "createdAt", "updatedAt") VALUES (8, 2, 4, '2024-03-11 16:46:36.397738', NULL);
INSERT INTO public."cinemaLocation" (id, "locationId", "cinemaId", "createdAt", "updatedAt") VALUES (9, 3, 1, '2024-03-11 16:46:36.397738', NULL);
INSERT INTO public."cinemaLocation" (id, "locationId", "cinemaId", "createdAt", "updatedAt") VALUES (10, 3, 2, '2024-03-11 16:46:36.397738', NULL);
INSERT INTO public."cinemaLocation" (id, "locationId", "cinemaId", "createdAt", "updatedAt") VALUES (11, 3, 3, '2024-03-11 16:46:36.397738', NULL);
INSERT INTO public."cinemaLocation" (id, "locationId", "cinemaId", "createdAt", "updatedAt") VALUES (12, 3, 4, '2024-03-11 16:46:36.397738', NULL);
INSERT INTO public."cinemaLocation" (id, "locationId", "cinemaId", "createdAt", "updatedAt") VALUES (13, 4, 1, '2024-03-11 16:46:36.397738', NULL);
INSERT INTO public."cinemaLocation" (id, "locationId", "cinemaId", "createdAt", "updatedAt") VALUES (14, 4, 2, '2024-03-11 16:46:36.397738', NULL);
INSERT INTO public."cinemaLocation" (id, "locationId", "cinemaId", "createdAt", "updatedAt") VALUES (15, 4, 3, '2024-03-11 16:46:36.397738', NULL);
INSERT INTO public."cinemaLocation" (id, "locationId", "cinemaId", "createdAt", "updatedAt") VALUES (16, 4, 4, '2024-03-11 16:46:36.397738', NULL);


--
-- TOC entry 3694 (class 0 OID 55846)
-- Dependencies: 239
-- Data for Name: date; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.date (id, date, "createdAt", "updatedAt") VALUES (1, '2024-03-11', '2024-03-11 16:46:36.898178', NULL);
INSERT INTO public.date (id, date, "createdAt", "updatedAt") VALUES (2, '2024-03-12', '2024-03-11 16:46:36.898178', NULL);
INSERT INTO public.date (id, date, "createdAt", "updatedAt") VALUES (3, '2024-03-13', '2024-03-11 16:46:36.898178', NULL);
INSERT INTO public.date (id, date, "createdAt", "updatedAt") VALUES (4, '2024-03-14', '2024-03-11 16:46:36.898178', NULL);
INSERT INTO public.date (id, date, "createdAt", "updatedAt") VALUES (5, '2024-03-15', '2024-03-11 16:46:36.898178', NULL);


--
-- TOC entry 3688 (class 0 OID 55800)
-- Dependencies: 233
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.genre (id, name, "createdAt", "updatedAt") VALUES (1, 'Action', '2024-03-11 16:46:36.510917', NULL);
INSERT INTO public.genre (id, name, "createdAt", "updatedAt") VALUES (2, 'Adventure', '2024-03-11 16:46:36.510917', NULL);
INSERT INTO public.genre (id, name, "createdAt", "updatedAt") VALUES (3, 'Comedy', '2024-03-11 16:46:36.510917', NULL);
INSERT INTO public.genre (id, name, "createdAt", "updatedAt") VALUES (4, 'Horror', '2024-03-11 16:46:36.510917', NULL);
INSERT INTO public.genre (id, name, "createdAt", "updatedAt") VALUES (5, 'Thriller', '2024-03-11 16:46:36.510917', NULL);
INSERT INTO public.genre (id, name, "createdAt", "updatedAt") VALUES (6, 'Romance', '2024-03-11 16:46:36.510917', NULL);
INSERT INTO public.genre (id, name, "createdAt", "updatedAt") VALUES (7, 'Drama', '2024-03-11 16:46:36.510917', NULL);
INSERT INTO public.genre (id, name, "createdAt", "updatedAt") VALUES (8, 'Animation', '2024-03-11 16:46:36.510917', NULL);


--
-- TOC entry 3690 (class 0 OID 55812)
-- Dependencies: 235
-- Data for Name: genreMovies; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."genreMovies" (id, "genreId", "moviesId", "createdAt", "updatedAt") VALUES (1, 4, 1, '2024-03-11 16:46:36.631208', NULL);
INSERT INTO public."genreMovies" (id, "genreId", "moviesId", "createdAt", "updatedAt") VALUES (2, 1, 2, '2024-03-11 16:46:36.631208', NULL);
INSERT INTO public."genreMovies" (id, "genreId", "moviesId", "createdAt", "updatedAt") VALUES (3, 2, 2, '2024-03-11 16:46:36.631208', NULL);
INSERT INTO public."genreMovies" (id, "genreId", "moviesId", "createdAt", "updatedAt") VALUES (4, 6, 3, '2024-03-11 16:46:36.631208', NULL);
INSERT INTO public."genreMovies" (id, "genreId", "moviesId", "createdAt", "updatedAt") VALUES (5, 7, 3, '2024-03-11 16:46:36.631208', NULL);
INSERT INTO public."genreMovies" (id, "genreId", "moviesId", "createdAt", "updatedAt") VALUES (6, 1, 4, '2024-03-11 16:46:36.631208', NULL);
INSERT INTO public."genreMovies" (id, "genreId", "moviesId", "createdAt", "updatedAt") VALUES (7, 2, 4, '2024-03-11 16:46:36.631208', NULL);


--
-- TOC entry 3682 (class 0 OID 55752)
-- Dependencies: 227
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.location (id, name, "createdAt", "updatedAt") VALUES (1, 'Bandung', '2024-03-11 16:46:36.164894', NULL);
INSERT INTO public.location (id, name, "createdAt", "updatedAt") VALUES (2, 'Jakarta', '2024-03-11 16:46:36.164894', NULL);
INSERT INTO public.location (id, name, "createdAt", "updatedAt") VALUES (3, 'Semarang', '2024-03-11 16:46:36.164894', NULL);
INSERT INTO public.location (id, name, "createdAt", "updatedAt") VALUES (4, 'Surabaya', '2024-03-11 16:46:36.164894', NULL);


--
-- TOC entry 3698 (class 0 OID 55880)
-- Dependencies: 243
-- Data for Name: movieCinema; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."movieCinema" (id, "cinemaId", "moviesId", "createdAt", "updatedAt") VALUES (1, 1, 1, '2024-03-11 16:46:37.198357', NULL);
INSERT INTO public."movieCinema" (id, "cinemaId", "moviesId", "createdAt", "updatedAt") VALUES (2, 1, 2, '2024-03-11 16:46:37.198357', NULL);
INSERT INTO public."movieCinema" (id, "cinemaId", "moviesId", "createdAt", "updatedAt") VALUES (3, 1, 3, '2024-03-11 16:46:37.198357', NULL);
INSERT INTO public."movieCinema" (id, "cinemaId", "moviesId", "createdAt", "updatedAt") VALUES (4, 1, 4, '2024-03-11 16:46:37.198357', NULL);
INSERT INTO public."movieCinema" (id, "cinemaId", "moviesId", "createdAt", "updatedAt") VALUES (5, 2, 1, '2024-03-11 16:46:37.198357', NULL);
INSERT INTO public."movieCinema" (id, "cinemaId", "moviesId", "createdAt", "updatedAt") VALUES (6, 2, 2, '2024-03-11 16:46:37.198357', NULL);
INSERT INTO public."movieCinema" (id, "cinemaId", "moviesId", "createdAt", "updatedAt") VALUES (7, 2, 3, '2024-03-11 16:46:37.198357', NULL);
INSERT INTO public."movieCinema" (id, "cinemaId", "moviesId", "createdAt", "updatedAt") VALUES (8, 2, 4, '2024-03-11 16:46:37.198357', NULL);
INSERT INTO public."movieCinema" (id, "cinemaId", "moviesId", "createdAt", "updatedAt") VALUES (9, 3, 1, '2024-03-11 16:46:37.198357', NULL);
INSERT INTO public."movieCinema" (id, "cinemaId", "moviesId", "createdAt", "updatedAt") VALUES (10, 3, 2, '2024-03-11 16:46:37.198357', NULL);
INSERT INTO public."movieCinema" (id, "cinemaId", "moviesId", "createdAt", "updatedAt") VALUES (11, 3, 3, '2024-03-11 16:46:37.198357', NULL);
INSERT INTO public."movieCinema" (id, "cinemaId", "moviesId", "createdAt", "updatedAt") VALUES (12, 3, 4, '2024-03-11 16:46:37.198357', NULL);
INSERT INTO public."movieCinema" (id, "cinemaId", "moviesId", "createdAt", "updatedAt") VALUES (13, 4, 1, '2024-03-11 16:46:37.198357', NULL);
INSERT INTO public."movieCinema" (id, "cinemaId", "moviesId", "createdAt", "updatedAt") VALUES (14, 4, 2, '2024-03-11 16:46:37.198357', NULL);
INSERT INTO public."movieCinema" (id, "cinemaId", "moviesId", "createdAt", "updatedAt") VALUES (15, 4, 3, '2024-03-11 16:46:37.198357', NULL);
INSERT INTO public."movieCinema" (id, "cinemaId", "moviesId", "createdAt", "updatedAt") VALUES (16, 4, 4, '2024-03-11 16:46:37.198357', NULL);


--
-- TOC entry 3680 (class 0 OID 55728)
-- Dependencies: 225
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.movies (id, "statusId", "ratingId", title, image, director, casts, duration, "releaseDate", sinopsis, "isRecomended", "createdAt", "updatedAt") VALUES (3, 2, 2, 'Ayat-Ayat Cinta', 'https://res.cloudinary.com/drsh7022q/image/upload/v1709884229/cinematix/movies/dfa6c7e6-6f34-4f9e-8ef6-1dce9b7acccc.jpeg.jpg', 'Hanung Bramantyo', 'Fedi Nuril, Rianti Cartwright, Carissa Putri, Melanie Putria, Zaskia Adya Mecca', '120 minutes', '2024-03-01', 'The clever Fahri bin Abdillah goes on scholarship to Egypt to undertake study for a master''s degree in Islam at Al-Azhar University, Cairo; his parents had to sell their rice field to help him as well. Fahri has a plan for his life to be achieved through his perseverance and discipline. He plans to marry when his thesis is accepted. He has yet to have a close relationship with a woman beyond what he had with his mother and grandmother.', false, '2024-03-11 16:46:36.05305', NULL);
INSERT INTO public.movies (id, "statusId", "ratingId", title, image, director, casts, duration, "releaseDate", sinopsis, "isRecomended", "createdAt", "updatedAt") VALUES (1, 2, 3, 'Satan''s Slaves', 'https://res.cloudinary.com/drsh7022q/image/upload/v1709884121/cinematix/movies/ee9c4b60-65e4-499c-84c4-bb57a14e8700.jpeg.jpg', 'Joko Anwar', 'Tara Basro ,Bront Palarae, Ayu Laksmi, Endy Arfian, Nasar Anuz, Muhammad Adhiyat, Elly D. Luthan, Dimas Aditya, Arswendi Nasution, Timothy Joddy, Egi Fedly', '107 minutes', '2024-09-20', 'The film focuses on a struggling family living in the countryside in 1981: Mawarni, her husband Bahri, his mother Rahma, and the couple’s four children: 22-year-old Rini, 16-year-old Toni, 10-year-old Bondi, and six-year-old Ian, who is deaf. The family live amid financial hardship as Mawarni is ill and bedridden, and the royalties from her former singing career are long gone', true, '2024-03-11 16:46:36.05305', NULL);
INSERT INTO public.movies (id, "statusId", "ratingId", title, image, director, casts, duration, "releaseDate", sinopsis, "isRecomended", "createdAt", "updatedAt") VALUES (2, 2, 1, 'Spiderman - Home Coming', 'https://res.cloudinary.com/drsh7022q/image/upload/v1709884181/cinematix/movies/7b312fe0-feb0-416c-94b3-0d9bfbfb22c9.jpeg.jpg', 'Jon Watts', 'Tom Holland, Michael Keaton, Jon Favreau, Gwyneth Paltrow, Zendaya, Donald Glover, Jacob Batalon, Laura Harrier, Tony Revolori, Bokeem Woodbine, Tyne Daly, Marisa Tomei, Robert Downey Jr.', '133 minutes', '2024-03-25', 'Following the Battle of New York in 2012,[a] Adrian Toomes and his salvage company are contracted to clean up the city, but their operation is taken over by the Department of Damage Control (DODC), a partnership between Tony Stark and the U.S. government. Enraged at being driven out of business, Toomes persuades his employees to keep the Chitauri technology they have already scavenged and use it to create and sell advanced weapons, including a flying Vulture suit Toomes uses to steal Chitauri power cells.', false, '2024-03-11 16:46:36.05305', NULL);
INSERT INTO public.movies (id, "statusId", "ratingId", title, image, director, casts, duration, "releaseDate", sinopsis, "isRecomended", "createdAt", "updatedAt") VALUES (4, 2, 4, 'Deadpool & Wolverine', 'https://res.cloudinary.com/drsh7022q/image/upload/v1709884302/cinematix/movies/4bc40ea4-a077-4f29-ab71-d649fe021650.jpeg.jpg', 'Shawn Levy', 'Ryan Reynolds, Hugh Jackman, Emma Corrin, Morena Baccarin, Rob Delaney, Leslie Uggams, Karan Soni, Matthew Macfadyen', '165 minutes', '2024-07-26', 'The Time Variance Authority (TVA), a bureaucratic organization that exists outside of time and space and monitors the timeline, pull Wade Wilson / Deadpool from his quiet life and set him on a mission that will change the history of the Marvel Cinematic Universe (MCU) alongside Wolverine.', true, '2024-03-11 16:46:36.05305', NULL);


--
-- TOC entry 3700 (class 0 OID 55902)
-- Dependencies: 245
-- Data for Name: moviesTime; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (1, 1, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (2, 1, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (3, 1, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (4, 1, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (5, 1, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (6, 1, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (7, 1, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (8, 1, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (9, 1, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (10, 1, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (11, 1, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (12, 1, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (13, 1, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (14, 1, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (15, 1, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (16, 1, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (17, 2, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (18, 2, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (19, 2, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (20, 2, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (21, 2, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (22, 2, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (23, 2, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (24, 2, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (25, 2, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (26, 2, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (27, 2, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (28, 2, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (29, 2, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (30, 2, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (31, 2, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (32, 2, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (33, 3, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (34, 3, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (35, 3, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (36, 3, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (37, 3, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (38, 3, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (39, 3, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (40, 3, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (41, 3, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (42, 3, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (43, 3, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (44, 3, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (45, 3, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (46, 3, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (47, 3, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (48, 3, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (49, 4, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (50, 4, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (51, 4, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (52, 4, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (53, 4, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (54, 4, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (55, 4, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (56, 4, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (57, 4, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (58, 4, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (59, 4, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (60, 4, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (61, 4, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (62, 4, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (63, 4, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (64, 4, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (65, 5, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (66, 5, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (67, 5, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (68, 5, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (69, 5, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (70, 5, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (71, 5, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (72, 5, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (73, 5, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (74, 5, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (75, 5, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (76, 5, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (77, 5, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (78, 5, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (79, 5, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (80, 5, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (81, 6, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (82, 6, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (83, 6, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (84, 6, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (85, 6, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (86, 6, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (87, 6, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (88, 6, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (89, 6, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (90, 6, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (91, 6, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (92, 6, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (93, 6, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (94, 6, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (95, 6, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (96, 6, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (97, 7, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (98, 7, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (99, 7, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (100, 7, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (101, 7, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (102, 7, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (103, 7, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (104, 7, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (105, 7, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (106, 7, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (107, 7, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (108, 7, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (109, 7, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (110, 7, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (111, 7, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (112, 7, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (113, 8, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (114, 8, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (115, 8, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (116, 8, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (117, 8, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (118, 8, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (119, 8, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (120, 8, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (121, 8, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (122, 8, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (123, 8, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (124, 8, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (125, 8, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (126, 8, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (127, 8, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (128, 8, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (129, 9, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (130, 9, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (131, 9, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (132, 9, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (133, 9, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (134, 9, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (135, 9, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (136, 9, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (137, 9, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (138, 9, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (139, 9, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (140, 9, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (141, 9, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (142, 9, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (143, 9, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (144, 9, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (145, 10, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (146, 10, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (147, 10, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (148, 10, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (149, 10, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (150, 10, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (151, 10, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (152, 10, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (153, 10, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (154, 10, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (155, 10, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (156, 10, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (157, 10, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (158, 10, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (159, 10, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (160, 10, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (161, 11, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (162, 11, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (163, 11, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (164, 11, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (165, 11, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (166, 11, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (167, 11, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (168, 11, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (169, 11, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (170, 11, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (171, 11, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (172, 11, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (173, 11, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (174, 11, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (175, 11, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (176, 11, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (177, 12, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (178, 12, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (179, 12, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (180, 12, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (181, 12, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (182, 12, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (183, 12, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (184, 12, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (185, 12, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (186, 12, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (187, 12, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (188, 12, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (189, 12, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (190, 12, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (191, 12, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (192, 12, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (193, 13, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (194, 13, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (195, 13, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (196, 13, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (197, 13, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (198, 13, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (199, 13, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (200, 13, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (201, 13, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (202, 13, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (203, 13, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (204, 13, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (205, 13, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (206, 13, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (207, 13, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (208, 13, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (209, 14, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (210, 14, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (211, 14, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (212, 14, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (213, 14, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (214, 14, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (215, 14, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (216, 14, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (217, 14, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (218, 14, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (219, 14, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (220, 14, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (221, 14, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (222, 14, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (223, 14, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (224, 14, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (225, 15, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (226, 15, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (227, 15, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (228, 15, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (229, 15, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (230, 15, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (231, 15, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (232, 15, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (233, 15, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (234, 15, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (235, 15, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (236, 15, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (237, 15, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (238, 15, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (239, 15, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (240, 15, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (241, 16, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (242, 16, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (243, 16, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (244, 16, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (245, 16, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (246, 16, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (247, 16, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (248, 16, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (249, 16, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (250, 16, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (251, 16, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (252, 16, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (253, 16, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (254, 16, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (255, 16, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (256, 16, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (257, 17, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (258, 17, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (259, 17, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (260, 17, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (261, 17, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (262, 17, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (263, 17, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (264, 17, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (265, 17, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (266, 17, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (267, 17, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (268, 17, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (269, 17, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (270, 17, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (271, 17, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (272, 17, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (273, 18, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (274, 18, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (275, 18, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (276, 18, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (277, 18, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (278, 18, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (279, 18, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (280, 18, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (281, 18, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (282, 18, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (283, 18, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (284, 18, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (285, 18, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (286, 18, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (287, 18, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (288, 18, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (289, 19, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (290, 19, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (291, 19, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (292, 19, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (293, 19, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (294, 19, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (295, 19, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (296, 19, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (297, 19, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (298, 19, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (299, 19, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (300, 19, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (301, 19, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (302, 19, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (303, 19, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (304, 19, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (305, 20, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (306, 20, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (307, 20, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (308, 20, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (309, 20, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (310, 20, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (311, 20, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (312, 20, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (313, 20, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (314, 20, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (315, 20, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (316, 20, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (317, 20, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (318, 20, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (319, 20, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (320, 20, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (321, 21, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (322, 21, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (323, 21, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (324, 21, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (325, 21, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (326, 21, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (327, 21, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (328, 21, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (329, 21, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (330, 21, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (331, 21, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (332, 21, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (333, 21, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (334, 21, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (335, 21, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (336, 21, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (337, 22, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (338, 22, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (339, 22, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (340, 22, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (341, 22, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (342, 22, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (343, 22, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (344, 22, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (345, 22, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (346, 22, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (347, 22, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (348, 22, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (349, 22, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (350, 22, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (351, 22, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (352, 22, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (353, 23, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (354, 23, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (355, 23, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (356, 23, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (357, 23, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (358, 23, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (359, 23, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (360, 23, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (361, 23, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (362, 23, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (363, 23, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (364, 23, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (365, 23, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (366, 23, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (367, 23, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (368, 23, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (369, 24, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (370, 24, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (371, 24, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (372, 24, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (373, 24, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (374, 24, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (375, 24, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (376, 24, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (377, 24, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (378, 24, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (379, 24, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (380, 24, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (381, 24, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (382, 24, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (383, 24, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (384, 24, 16, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (385, 25, 1, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (386, 25, 2, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (387, 25, 3, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (388, 25, 4, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (389, 25, 5, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (390, 25, 6, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (391, 25, 7, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (392, 25, 8, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (393, 25, 9, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (394, 25, 10, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (395, 25, 11, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (396, 25, 12, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (397, 25, 13, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (398, 25, 14, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (399, 25, 15, '2024-03-11 16:46:37.320246', NULL);
INSERT INTO public."moviesTime" (id, "airingTimeDateId", "movieCinemaId", "createdAt", "updatedAt") VALUES (400, 25, 16, '2024-03-11 16:46:37.320246', NULL);


--
-- TOC entry 3704 (class 0 OID 55938)
-- Dependencies: 249
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."order" (id, "orderNumber", "usersId", "cinemaLocationId", "paymentId", "movieTimeId", "seatCount", "isPaid", "isUsed", total, "createdAt", "updatedAt") VALUES (1, '015705', 1, 5, 4, 5, 2, false, false, 70000, '2024-03-11 18:08:40.628244', NULL);
INSERT INTO public."order" (id, "orderNumber", "usersId", "cinemaLocationId", "paymentId", "movieTimeId", "seatCount", "isPaid", "isUsed", total, "createdAt", "updatedAt") VALUES (2, '248844', 1, 1, 4, 97, 2, false, false, 50000, '2024-03-11 22:05:11.133434', NULL);
INSERT INTO public."order" (id, "orderNumber", "usersId", "cinemaLocationId", "paymentId", "movieTimeId", "seatCount", "isPaid", "isUsed", total, "createdAt", "updatedAt") VALUES (3, '182256', 1, 1, 4, 97, 3, false, false, 75000, '2024-03-12 11:16:45.106404', NULL);
INSERT INTO public."order" (id, "orderNumber", "usersId", "cinemaLocationId", "paymentId", "movieTimeId", "seatCount", "isPaid", "isUsed", total, "createdAt", "updatedAt") VALUES (4, '638287', 1, 5, 3, 1, 4, false, false, 100000, '2024-03-13 07:33:39.209559', NULL);
INSERT INTO public."order" (id, "orderNumber", "usersId", "cinemaLocationId", "paymentId", "movieTimeId", "seatCount", "isPaid", "isUsed", total, "createdAt", "updatedAt") VALUES (5, '154473', 1, 5, 2, 1, 4, false, false, 100000, '2024-03-13 07:34:06.745254', NULL);
INSERT INTO public."order" (id, "orderNumber", "usersId", "cinemaLocationId", "paymentId", "movieTimeId", "seatCount", "isPaid", "isUsed", total, "createdAt", "updatedAt") VALUES (6, '550416', 1, 4, 3, 64, 3, false, false, 180000, '2024-03-13 07:39:06.287429', NULL);
INSERT INTO public."order" (id, "orderNumber", "usersId", "cinemaLocationId", "paymentId", "movieTimeId", "seatCount", "isPaid", "isUsed", total, "createdAt", "updatedAt") VALUES (7, '528050', 1, 2, 8, 86, 3, false, false, 105000, '2024-03-13 07:54:47.65526', NULL);
INSERT INTO public."order" (id, "orderNumber", "usersId", "cinemaLocationId", "paymentId", "movieTimeId", "seatCount", "isPaid", "isUsed", total, "createdAt", "updatedAt") VALUES (8, '843238', 1, 5, 5, 161, 4, false, false, 100000, '2024-03-13 08:02:36.970443', NULL);
INSERT INTO public."order" (id, "orderNumber", "usersId", "cinemaLocationId", "paymentId", "movieTimeId", "seatCount", "isPaid", "isUsed", total, "createdAt", "updatedAt") VALUES (9, '743461', 1, 8, 3, 14, 3, true, false, 180000, '2024-03-13 08:06:25.165629', '2024-03-13 08:06:47.158799');
INSERT INTO public."order" (id, "orderNumber", "usersId", "cinemaLocationId", "paymentId", "movieTimeId", "seatCount", "isPaid", "isUsed", total, "createdAt", "updatedAt") VALUES (10, '027128', 1, 9, 8, 84, 3, true, false, 75000, '2024-03-13 08:09:29.693541', '2024-03-13 08:25:08.55823');
INSERT INTO public."order" (id, "orderNumber", "usersId", "cinemaLocationId", "paymentId", "movieTimeId", "seatCount", "isPaid", "isUsed", total, "createdAt", "updatedAt") VALUES (11, '382057', 1, 5, 6, 194, 3, true, false, 75000, '2024-03-13 08:26:04.227363', '2024-03-13 08:26:06.050152');
INSERT INTO public."order" (id, "orderNumber", "usersId", "cinemaLocationId", "paymentId", "movieTimeId", "seatCount", "isPaid", "isUsed", total, "createdAt", "updatedAt") VALUES (12, '033035', 1, 2, 2, 7, 3, true, false, 105000, '2024-03-13 09:31:07.651642', '2024-03-13 09:31:09.093276');
INSERT INTO public."order" (id, "orderNumber", "usersId", "cinemaLocationId", "paymentId", "movieTimeId", "seatCount", "isPaid", "isUsed", total, "createdAt", "updatedAt") VALUES (13, '300447', 1, 6, 7, 6, 4, true, false, 140000, '2024-03-13 09:37:43.435961', '2024-03-13 09:37:45.675633');
INSERT INTO public."order" (id, "orderNumber", "usersId", "cinemaLocationId", "paymentId", "movieTimeId", "seatCount", "isPaid", "isUsed", total, "createdAt", "updatedAt") VALUES (14, '634534', 1, 2, 3, 87, 3, true, false, 105000, '2024-03-13 09:46:41.901389', '2024-03-13 09:46:56.512065');


--
-- TOC entry 3706 (class 0 OID 55970)
-- Dependencies: 251
-- Data for Name: orderDetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (1, 1, 'F4', '2024-03-11 18:08:40.749877', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (2, 1, 'F5', '2024-03-11 18:08:40.770211', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (3, 2, 'F4', '2024-03-11 22:05:11.189792', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (4, 2, 'F5', '2024-03-11 22:05:11.209115', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (5, 3, 'E4', '2024-03-12 11:16:45.315399', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (6, 3, 'E5', '2024-03-12 11:16:45.326351', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (7, 3, 'E6', '2024-03-12 11:16:45.337497', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (8, 4, 'E5', '2024-03-13 07:33:39.268492', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (9, 4, 'D7', '2024-03-13 07:33:39.285299', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (10, 4, 'C7', '2024-03-13 07:33:39.296532', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (11, 4, 'B7', '2024-03-13 07:33:39.308073', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (12, 5, 'E5', '2024-03-13 07:34:06.776039', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (13, 5, 'D7', '2024-03-13 07:34:06.787119', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (14, 5, 'C7', '2024-03-13 07:34:06.798278', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (15, 5, 'B7', '2024-03-13 07:34:06.809722', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (16, 6, 'C7', '2024-03-13 07:39:06.318629', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (17, 6, 'C9', '2024-03-13 07:39:06.330214', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (18, 6, 'C10', '2024-03-13 07:39:06.341002', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (19, 7, 'C10', '2024-03-13 07:54:47.682802', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (20, 7, 'C11', '2024-03-13 07:54:47.693922', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (21, 7, 'D12', '2024-03-13 07:54:47.705084', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (22, 8, 'C4', '2024-03-13 08:02:36.982327', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (23, 8, 'C3', '2024-03-13 08:02:36.993035', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (24, 8, 'C5', '2024-03-13 08:02:37.004113', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (25, 8, 'C6', '2024-03-13 08:02:37.015184', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (26, 9, 'A7', '2024-03-13 08:06:25.293292', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (27, 9, 'A6', '2024-03-13 08:06:25.308737', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (28, 9, 'A5', '2024-03-13 08:06:25.319869', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (29, 10, 'B11', '2024-03-13 08:09:29.732727', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (30, 10, 'B12', '2024-03-13 08:09:29.775646', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (31, 10, 'B13', '2024-03-13 08:09:29.788366', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (32, 11, 'E11', '2024-03-13 08:26:04.245757', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (33, 11, 'E12', '2024-03-13 08:26:04.256673', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (34, 11, 'E13', '2024-03-13 08:26:04.267815', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (35, 12, 'D14', '2024-03-13 09:31:07.725734', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (36, 12, 'C14', '2024-03-13 09:31:07.73905', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (37, 12, 'B14', '2024-03-13 09:31:07.749695', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (38, 13, 'E14', '2024-03-13 09:37:43.466173', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (39, 13, 'E13', '2024-03-13 09:37:43.477213', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (40, 13, 'E12', '2024-03-13 09:37:43.488414', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (41, 13, 'E11', '2024-03-13 09:37:43.499751', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (42, 14, 'B12', '2024-03-13 09:46:42.144083', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (43, 14, 'B13', '2024-03-13 09:46:42.158726', NULL);
INSERT INTO public."orderDetail" (id, "orderId", "seatCode", "createdAt", "updatedAt") VALUES (44, 14, 'B14', '2024-03-13 09:46:42.169815', NULL);


--
-- TOC entry 3702 (class 0 OID 55924)
-- Dependencies: 247
-- Data for Name: paymentMethod; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."paymentMethod" (id, name, image, "accountNumber", "createdAt", "updatedAt") VALUES (1, 'Google Pay', 'https://res.cloudinary.com/drsh7022q/image/upload/v1709883210/cinematix/paymentMethod/272f59aa-3a00-49b8-9a72-1a1590bc3373.png.png', '12321328913829724', '2024-03-11 16:46:37.454618', NULL);
INSERT INTO public."paymentMethod" (id, name, image, "accountNumber", "createdAt", "updatedAt") VALUES (2, 'VISA', 'https://res.cloudinary.com/drsh7022q/image/upload/v1709883265/cinematix/paymentMethod/c33f2a00-4c51-4336-a4e9-1e644bb31785.png.png', '45980756430982713', '2024-03-11 16:46:37.454618', NULL);
INSERT INTO public."paymentMethod" (id, name, image, "accountNumber", "createdAt", "updatedAt") VALUES (3, 'Gopay', 'https://res.cloudinary.com/drsh7022q/image/upload/v1709883329/cinematix/paymentMethod/e3c8133f-0f9d-49bc-a813-dd28982458d4.png.png', '67890451234567890', '2024-03-11 16:46:37.454618', NULL);
INSERT INTO public."paymentMethod" (id, name, image, "accountNumber", "createdAt", "updatedAt") VALUES (4, 'PayPal', 'https://res.cloudinary.com/drsh7022q/image/upload/v1709883455/cinematix/paymentMethod/78ec75cf-ed53-46fe-9484-6a4ba7a9225c.png.png', '98765432101234567', '2024-03-11 16:46:37.454618', NULL);
INSERT INTO public."paymentMethod" (id, name, image, "accountNumber", "createdAt", "updatedAt") VALUES (5, 'DANA', 'https://res.cloudinary.com/drsh7022q/image/upload/v1709883636/cinematix/paymentMethod/9e3db832-f1bd-426c-8cc4-3033c9bd8648.png.png', '24680135792468013', '2024-03-11 16:46:37.454618', NULL);
INSERT INTO public."paymentMethod" (id, name, image, "accountNumber", "createdAt", "updatedAt") VALUES (6, 'BCA', 'https://res.cloudinary.com/drsh7022q/image/upload/v1709883798/cinematix/paymentMethod/0538132c-febe-480d-a03e-30fcc24673fa.png.png', '13579246802468013', '2024-03-11 16:46:37.454618', NULL);
INSERT INTO public."paymentMethod" (id, name, image, "accountNumber", "createdAt", "updatedAt") VALUES (7, 'BRI', 'https://res.cloudinary.com/drsh7022q/image/upload/v1709883841/cinematix/paymentMethod/2e15a2bd-cdd4-4226-a9a8-73f969dda5f2.png.png', '98765432123456789', '2024-03-11 16:46:37.454618', NULL);
INSERT INTO public."paymentMethod" (id, name, image, "accountNumber", "createdAt", "updatedAt") VALUES (8, 'OVO', 'https://res.cloudinary.com/drsh7022q/image/upload/v1709883870/cinematix/paymentMethod/6d060a3c-6aad-401c-8528-6561627e97ee.jpeg.jpg', '54321678901234567', '2024-03-11 16:46:37.454618', NULL);


--
-- TOC entry 3678 (class 0 OID 55716)
-- Dependencies: 223
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rating (id, name, "createdAt", "updatedAt") VALUES (1, 'G', '2024-03-11 16:46:35.919505', NULL);
INSERT INTO public.rating (id, name, "createdAt", "updatedAt") VALUES (2, 'PG', '2024-03-11 16:46:35.919505', NULL);
INSERT INTO public.rating (id, name, "createdAt", "updatedAt") VALUES (3, 'PG-13', '2024-03-11 16:46:35.919505', NULL);
INSERT INTO public.rating (id, name, "createdAt", "updatedAt") VALUES (4, 'R', '2024-03-11 16:46:35.919505', NULL);
INSERT INTO public.rating (id, name, "createdAt", "updatedAt") VALUES (5, 'NC-17', '2024-03-11 16:46:35.919505', NULL);


--
-- TOC entry 3672 (class 0 OID 55671)
-- Dependencies: 217
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.role (id, name, "createdAt", "updatedAt") VALUES (1, 'customer', '2024-03-11 16:46:35.697301', NULL);
INSERT INTO public.role (id, name, "createdAt", "updatedAt") VALUES (2, 'administrator', '2024-03-11 16:46:35.697301', NULL);


--
-- TOC entry 3670 (class 0 OID 53217)
-- Dependencies: 215
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.schema_migrations (version, dirty) VALUES (33, false);


--
-- TOC entry 3676 (class 0 OID 55704)
-- Dependencies: 221
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.status (id, name, "createdAt", "updatedAt") VALUES (1, 'coming soon', '2024-03-11 16:46:35.808443', NULL);
INSERT INTO public.status (id, name, "createdAt", "updatedAt") VALUES (2, 'now airing', '2024-03-11 16:46:35.808443', NULL);
INSERT INTO public.status (id, name, "createdAt", "updatedAt") VALUES (3, 'expired', '2024-03-11 16:46:35.808443', NULL);


--
-- TOC entry 3674 (class 0 OID 55683)
-- Dependencies: 219
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, "roleId", email, password, "firstName", "lastName", "phoneNumber", picture, point, "createdAt", "updatedAt") VALUES (6, 1, 'natasha@mail.com', '$argon2id$v=19$m=65536,t=1,p=2$L1ya+ROG4VrO2mAm10zFvw$X3Rf7wsUR+hSzL64iNZBTBc9Dw+V5RPfhIBjNfB7ORc', NULL, NULL, NULL, NULL, NULL, '2024-03-11 23:25:31.199361', NULL);
INSERT INTO public.users (id, "roleId", email, password, "firstName", "lastName", "phoneNumber", picture, point, "createdAt", "updatedAt") VALUES (1, 1, 'dzul@mail.com', '$argon2id$v=19$m=65536,t=1,p=2$VFlPe9W27t1G5anKLmp5Zw$IFTIflH+burSc4og37WFGnImSqabIwJlKex4UIW4Aic', 'Dzulfiqar', 'Siraj', '1234567788900', NULL, NULL, '2024-03-11 16:49:38.363279', '2024-03-12 23:20:04.263546');
INSERT INTO public.users (id, "roleId", email, password, "firstName", "lastName", "phoneNumber", picture, point, "createdAt", "updatedAt") VALUES (2, 2, 'artemis@mail.com', '$argon2id$v=19$m=65536,t=1,p=2$qMlVyORgGtdlHtLmO1A8pQ$pzmDmgQJckaxN9ua0fAdj8NUpS/D1uXKB/PULAamG54', NULL, NULL, NULL, NULL, NULL, '2024-03-11 23:23:11.264655', NULL);


--
-- TOC entry 3730 (class 0 OID 0)
-- Dependencies: 240
-- Name: airingTimeDate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."airingTimeDate_id_seq"', 25, true);


--
-- TOC entry 3731 (class 0 OID 0)
-- Dependencies: 236
-- Name: airingTime_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."airingTime_id_seq"', 5, true);


--
-- TOC entry 3732 (class 0 OID 0)
-- Dependencies: 230
-- Name: cinemaLocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."cinemaLocation_id_seq"', 16, true);


--
-- TOC entry 3733 (class 0 OID 0)
-- Dependencies: 228
-- Name: cinema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cinema_id_seq', 4, true);


--
-- TOC entry 3734 (class 0 OID 0)
-- Dependencies: 238
-- Name: date_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.date_id_seq', 5, true);


--
-- TOC entry 3735 (class 0 OID 0)
-- Dependencies: 234
-- Name: genreMovies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."genreMovies_id_seq"', 7, true);


--
-- TOC entry 3736 (class 0 OID 0)
-- Dependencies: 232
-- Name: genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genre_id_seq', 8, true);


--
-- TOC entry 3737 (class 0 OID 0)
-- Dependencies: 226
-- Name: location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.location_id_seq', 4, true);


--
-- TOC entry 3738 (class 0 OID 0)
-- Dependencies: 242
-- Name: movieCinema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."movieCinema_id_seq"', 16, true);


--
-- TOC entry 3739 (class 0 OID 0)
-- Dependencies: 244
-- Name: moviesTime_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."moviesTime_id_seq"', 400, true);


--
-- TOC entry 3740 (class 0 OID 0)
-- Dependencies: 224
-- Name: movies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movies_id_seq', 4, true);


--
-- TOC entry 3741 (class 0 OID 0)
-- Dependencies: 250
-- Name: orderDetail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."orderDetail_id_seq"', 44, true);


--
-- TOC entry 3742 (class 0 OID 0)
-- Dependencies: 248
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_id_seq', 14, true);


--
-- TOC entry 3743 (class 0 OID 0)
-- Dependencies: 246
-- Name: paymentMethod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."paymentMethod_id_seq"', 8, true);


--
-- TOC entry 3744 (class 0 OID 0)
-- Dependencies: 222
-- Name: rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rating_id_seq', 5, true);


--
-- TOC entry 3745 (class 0 OID 0)
-- Dependencies: 216
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 2, true);


--
-- TOC entry 3746 (class 0 OID 0)
-- Dependencies: 220
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_id_seq', 3, true);


--
-- TOC entry 3747 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- TOC entry 3498 (class 2606 OID 55864)
-- Name: airingTimeDate airingTimeDate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."airingTimeDate"
    ADD CONSTRAINT "airingTimeDate_pkey" PRIMARY KEY (id);


--
-- TOC entry 3494 (class 2606 OID 55840)
-- Name: airingTime airingTime_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."airingTime"
    ADD CONSTRAINT "airingTime_pkey" PRIMARY KEY (id);


--
-- TOC entry 3488 (class 2606 OID 55784)
-- Name: cinemaLocation cinemaLocation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."cinemaLocation"
    ADD CONSTRAINT "cinemaLocation_pkey" PRIMARY KEY (id);


--
-- TOC entry 3486 (class 2606 OID 55772)
-- Name: cinema cinema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinema
    ADD CONSTRAINT cinema_pkey PRIMARY KEY (id);


--
-- TOC entry 3496 (class 2606 OID 55852)
-- Name: date date_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.date
    ADD CONSTRAINT date_pkey PRIMARY KEY (id);


--
-- TOC entry 3492 (class 2606 OID 55818)
-- Name: genreMovies genreMovies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genreMovies"
    ADD CONSTRAINT "genreMovies_pkey" PRIMARY KEY (id);


--
-- TOC entry 3490 (class 2606 OID 55806)
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- TOC entry 3484 (class 2606 OID 55758)
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- TOC entry 3500 (class 2606 OID 55886)
-- Name: movieCinema movieCinema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."movieCinema"
    ADD CONSTRAINT "movieCinema_pkey" PRIMARY KEY (id);


--
-- TOC entry 3502 (class 2606 OID 55908)
-- Name: moviesTime moviesTime_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."moviesTime"
    ADD CONSTRAINT "moviesTime_pkey" PRIMARY KEY (id);


--
-- TOC entry 3482 (class 2606 OID 55736)
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- TOC entry 3508 (class 2606 OID 55976)
-- Name: orderDetail orderDetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."orderDetail"
    ADD CONSTRAINT "orderDetail_pkey" PRIMARY KEY (id);


--
-- TOC entry 3506 (class 2606 OID 55944)
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- TOC entry 3504 (class 2606 OID 55932)
-- Name: paymentMethod paymentMethod_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."paymentMethod"
    ADD CONSTRAINT "paymentMethod_pkey" PRIMARY KEY (id);


--
-- TOC entry 3480 (class 2606 OID 55722)
-- Name: rating rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (id);


--
-- TOC entry 3472 (class 2606 OID 55677)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 3470 (class 2606 OID 53221)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3478 (class 2606 OID 55710)
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- TOC entry 3474 (class 2606 OID 55693)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3476 (class 2606 OID 55691)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3516 (class 2606 OID 55865)
-- Name: airingTimeDate airingTimeDate_airingTimeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."airingTimeDate"
    ADD CONSTRAINT "airingTimeDate_airingTimeId_fkey" FOREIGN KEY ("airingTimeId") REFERENCES public."airingTime"(id);


--
-- TOC entry 3517 (class 2606 OID 55870)
-- Name: airingTimeDate airingTimeDate_dateId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."airingTimeDate"
    ADD CONSTRAINT "airingTimeDate_dateId_fkey" FOREIGN KEY ("dateId") REFERENCES public.date(id);


--
-- TOC entry 3512 (class 2606 OID 55790)
-- Name: cinemaLocation cinemaLocation_cinemaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."cinemaLocation"
    ADD CONSTRAINT "cinemaLocation_cinemaId_fkey" FOREIGN KEY ("cinemaId") REFERENCES public.cinema(id);


--
-- TOC entry 3513 (class 2606 OID 55785)
-- Name: cinemaLocation cinemaLocation_locationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."cinemaLocation"
    ADD CONSTRAINT "cinemaLocation_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES public.location(id);


--
-- TOC entry 3514 (class 2606 OID 55819)
-- Name: genreMovies genreMovies_genreId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genreMovies"
    ADD CONSTRAINT "genreMovies_genreId_fkey" FOREIGN KEY ("genreId") REFERENCES public.genre(id);


--
-- TOC entry 3515 (class 2606 OID 55824)
-- Name: genreMovies genreMovies_moviesId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genreMovies"
    ADD CONSTRAINT "genreMovies_moviesId_fkey" FOREIGN KEY ("moviesId") REFERENCES public.movies(id);


--
-- TOC entry 3518 (class 2606 OID 55887)
-- Name: movieCinema movieCinema_cinemaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."movieCinema"
    ADD CONSTRAINT "movieCinema_cinemaId_fkey" FOREIGN KEY ("cinemaId") REFERENCES public.cinema(id);


--
-- TOC entry 3519 (class 2606 OID 55892)
-- Name: movieCinema movieCinema_moviesId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."movieCinema"
    ADD CONSTRAINT "movieCinema_moviesId_fkey" FOREIGN KEY ("moviesId") REFERENCES public.movies(id);


--
-- TOC entry 3520 (class 2606 OID 55909)
-- Name: moviesTime moviesTime_airingTimeDateId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."moviesTime"
    ADD CONSTRAINT "moviesTime_airingTimeDateId_fkey" FOREIGN KEY ("airingTimeDateId") REFERENCES public."airingTimeDate"(id);


--
-- TOC entry 3521 (class 2606 OID 55914)
-- Name: moviesTime moviesTime_movieCinemaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."moviesTime"
    ADD CONSTRAINT "moviesTime_movieCinemaId_fkey" FOREIGN KEY ("movieCinemaId") REFERENCES public."movieCinema"(id);


--
-- TOC entry 3510 (class 2606 OID 55742)
-- Name: movies movies_ratingId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT "movies_ratingId_fkey" FOREIGN KEY ("ratingId") REFERENCES public.rating(id);


--
-- TOC entry 3511 (class 2606 OID 55737)
-- Name: movies movies_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT "movies_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public.status(id);


--
-- TOC entry 3526 (class 2606 OID 55977)
-- Name: orderDetail orderDetail_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."orderDetail"
    ADD CONSTRAINT "orderDetail_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public."order"(id);


--
-- TOC entry 3522 (class 2606 OID 55950)
-- Name: order order_cinemaLocationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "order_cinemaLocationId_fkey" FOREIGN KEY ("cinemaLocationId") REFERENCES public."cinemaLocation"(id);


--
-- TOC entry 3523 (class 2606 OID 55960)
-- Name: order order_movieTimeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "order_movieTimeId_fkey" FOREIGN KEY ("movieTimeId") REFERENCES public."moviesTime"(id);


--
-- TOC entry 3524 (class 2606 OID 55955)
-- Name: order order_paymentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "order_paymentId_fkey" FOREIGN KEY ("paymentId") REFERENCES public."paymentMethod"(id);


--
-- TOC entry 3525 (class 2606 OID 55945)
-- Name: order order_usersId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "order_usersId_fkey" FOREIGN KEY ("usersId") REFERENCES public.users(id);


--
-- TOC entry 3509 (class 2606 OID 55694)
-- Name: users users_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public.role(id);


-- Completed on 2024-03-15 00:25:39 WIB

--
-- PostgreSQL database dump complete
--

