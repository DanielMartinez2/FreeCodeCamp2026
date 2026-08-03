--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    games_id integer NOT NULL,
    user_id integer NOT NULL,
    rounds integer NOT NULL,
    played_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_games_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_games_id_seq OWNER TO freecodecamp;

--
-- Name: games_games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_games_id_seq OWNED BY public.games.games_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: usernames_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.usernames_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usernames_user_id_seq OWNER TO freecodecamp;

--
-- Name: usernames_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.usernames_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games games_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN games_id SET DEFAULT nextval('public.games_games_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.usernames_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 18, '2026-08-03 17:25:01.467069');
INSERT INTO public.games VALUES (2, 1, 12, '2026-08-03 17:25:51.38993');
INSERT INTO public.games VALUES (3, 2, 473, '2026-08-03 17:29:07.416221');
INSERT INTO public.games VALUES (4, 2, 819, '2026-08-03 17:29:07.69397');
INSERT INTO public.games VALUES (5, 3, 183, '2026-08-03 17:29:07.966445');
INSERT INTO public.games VALUES (6, 3, 881, '2026-08-03 17:29:08.232118');
INSERT INTO public.games VALUES (7, 2, 294, '2026-08-03 17:29:08.447959');
INSERT INTO public.games VALUES (8, 2, 270, '2026-08-03 17:29:08.696836');
INSERT INTO public.games VALUES (9, 2, 521, '2026-08-03 17:29:09.080721');
INSERT INTO public.games VALUES (10, 4, 115, '2026-08-03 17:32:11.797724');
INSERT INTO public.games VALUES (11, 4, 39, '2026-08-03 17:32:12.013227');
INSERT INTO public.games VALUES (12, 5, 398, '2026-08-03 17:32:12.334081');
INSERT INTO public.games VALUES (13, 5, 176, '2026-08-03 17:32:12.592209');
INSERT INTO public.games VALUES (14, 4, 899, '2026-08-03 17:32:12.875786');
INSERT INTO public.games VALUES (15, 4, 811, '2026-08-03 17:32:13.200322');
INSERT INTO public.games VALUES (16, 4, 223, '2026-08-03 17:32:13.469537');
INSERT INTO public.games VALUES (17, 6, 192, '2026-08-03 17:33:40.924621');
INSERT INTO public.games VALUES (18, 6, 581, '2026-08-03 17:33:41.171417');
INSERT INTO public.games VALUES (19, 7, 96, '2026-08-03 17:33:41.473135');
INSERT INTO public.games VALUES (20, 7, 408, '2026-08-03 17:33:41.70575');
INSERT INTO public.games VALUES (21, 6, 947, '2026-08-03 17:33:41.974269');
INSERT INTO public.games VALUES (22, 6, 510, '2026-08-03 17:33:42.234245');
INSERT INTO public.games VALUES (23, 6, 76, '2026-08-03 17:33:42.560306');
INSERT INTO public.games VALUES (24, 8, 497, '2026-08-03 17:34:34.307591');
INSERT INTO public.games VALUES (25, 8, 652, '2026-08-03 17:34:34.605535');
INSERT INTO public.games VALUES (26, 9, 581, '2026-08-03 17:34:34.991476');
INSERT INTO public.games VALUES (27, 9, 353, '2026-08-03 17:34:35.251185');
INSERT INTO public.games VALUES (28, 8, 951, '2026-08-03 17:34:35.528361');
INSERT INTO public.games VALUES (29, 8, 100, '2026-08-03 17:34:35.724717');
INSERT INTO public.games VALUES (30, 8, 346, '2026-08-03 17:34:35.942018');
INSERT INTO public.games VALUES (31, 10, 135, '2026-08-03 17:37:49.850608');
INSERT INTO public.games VALUES (32, 10, 223, '2026-08-03 17:37:50.070422');
INSERT INTO public.games VALUES (33, 11, 298, '2026-08-03 17:37:50.493144');
INSERT INTO public.games VALUES (34, 11, 993, '2026-08-03 17:37:50.875937');
INSERT INTO public.games VALUES (35, 10, 986, '2026-08-03 17:37:51.160413');
INSERT INTO public.games VALUES (36, 10, 3, '2026-08-03 17:37:51.364286');
INSERT INTO public.games VALUES (37, 10, 265, '2026-08-03 17:37:51.580708');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Daniel');
INSERT INTO public.users VALUES (2, 'user_1785792547065');
INSERT INTO public.users VALUES (3, 'user_1785792547064');
INSERT INTO public.users VALUES (4, 'user_1785792731462');
INSERT INTO public.users VALUES (5, 'user_1785792731461');
INSERT INTO public.users VALUES (6, 'user_1785792820495');
INSERT INTO public.users VALUES (7, 'user_1785792820494');
INSERT INTO public.users VALUES (8, 'user_1785792873885');
INSERT INTO public.users VALUES (9, 'user_1785792873884');
INSERT INTO public.users VALUES (10, 'user_1785793069494');
INSERT INTO public.users VALUES (11, 'user_1785793069493');


--
-- Name: games_games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_games_id_seq', 37, true);


--
-- Name: usernames_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.usernames_user_id_seq', 11, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (games_id);


--
-- Name: users usernames_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT usernames_pkey PRIMARY KEY (user_id);


--
-- Name: users usernames_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT usernames_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

