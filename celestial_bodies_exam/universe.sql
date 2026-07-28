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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth integer NOT NULL,
    radius numeric NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    planet_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth integer NOT NULL,
    radius numeric NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth integer NOT NULL,
    radius numeric NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth integer NOT NULL,
    radius numeric NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moon_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_moon_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth integer NOT NULL,
    radius numeric NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 4600, 413, 473, 'Dwarf planet and large asteroid', false, true, NULL);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 1300, 353, 262, 'Large differentiated asteroid', false, false, NULL);
INSERT INTO public.asteroid VALUES (3, 'Hygiea', 4500, 400, 431, 'Large carbonaceous asteroid', false, true, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 0, 52850, 'Our home galaxy', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 2537000, 110000, 'Nearest major galaxy', false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 10000, 2720000, 30000, 'Small spiral galaxy', false, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 300, 31000000, 30000, 'Grand-design spiral galaxy', false, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 13000, 29300000, 25000, 'Large spiral galaxy with bright bulge', false, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 200, 21000000, 70000, 'Face-on spiral galaxy', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4540, 384, 1737, 'Earth''s natural satellite', false, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 4500, 9, 11, 'Moon of Mars', false, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 4500, 23, 6, 'Small moon of Mars', false, false, 2);
INSERT INTO public.moon VALUES (4, 'Io', 4500, 421, 1821, 'Volcanic moon', false, true, 3);
INSERT INTO public.moon VALUES (5, 'Europa', 4500, 671, 1560, 'Icy moon', false, true, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4500, 1070, 2634, 'Largest moon in the solar system', false, true, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 4500, 1882, 2410, 'Ancient moon', false, true, 3);
INSERT INTO public.moon VALUES (8, 'Titan', 4500, 1221, 2575, 'Largest moon of Saturn', false, true, 4);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4500, 238, 252, 'Icy moon with geysers', false, true, 4);
INSERT INTO public.moon VALUES (10, 'Triton', 4500, 354, 1353, 'Large moon of Neptune', false, true, 5);
INSERT INTO public.moon VALUES (11, 'Oberon', 4500, 583, 761, 'Large moon of Uranus', false, true, 6);
INSERT INTO public.moon VALUES (12, 'Titania', 4500, 435, 788, 'Largest moon of Uranus', false, true, 6);
INSERT INTO public.moon VALUES (13, 'Ariel', 4500, 191, 578, 'Bright moon of Uranus', false, true, 6);
INSERT INTO public.moon VALUES (14, 'Umbriel', 4500, 266, 584, 'Dark moon of Uranus', false, true, 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 4500, 129, 235, 'Small moon of Uranus', false, true, 6);
INSERT INTO public.moon VALUES (16, 'Charon', 4500, 19, 606, 'Moon of Pluto', false, true, 7);
INSERT INTO public.moon VALUES (17, 'Dione', 4500, 377, 561, 'Moon of Saturn', false, true, 8);
INSERT INTO public.moon VALUES (18, 'Rhea', 4500, 527, 764, 'Large moon of Saturn', false, true, 8);
INSERT INTO public.moon VALUES (19, 'Iapetus', 4500, 3561, 734, 'Oddly colored moon', false, true, 8);
INSERT INTO public.moon VALUES (20, 'Hyperion', 4500, 1481, 133, 'Chaotic moon', false, true, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4540, 0, 6371, 'Rocky planet with liquid water', true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4540, 78, 3389, 'Cold rocky planet', false, true, 1);
INSERT INTO public.planet VALUES (3, 'Kepler-186f', 5000, 5000, 12000, 'Potentially habitable exoplanet', false, true, 2);
INSERT INTO public.planet VALUES (4, 'Gliese 581g', 4000, 20000, 14000, 'Hypothetical rocky exoplanet', false, true, 2);
INSERT INTO public.planet VALUES (5, 'Proxima b', 4800, 4000, 7000, 'Closest known exoplanet to Earth', false, true, 3);
INSERT INTO public.planet VALUES (6, 'Barnard b', 6000, 6000, 8000, 'Cold rocky exoplanet', false, true, 3);
INSERT INTO public.planet VALUES (7, 'HD 209458 b', 7000, 150000, 95000, 'Gas giant exoplanet', false, true, 4);
INSERT INTO public.planet VALUES (8, 'WASP-12b', 6000, 1400000, 110000, 'Hot Jupiter exoplanet', false, true, 4);
INSERT INTO public.planet VALUES (9, '51 Pegasi b', 4500, 50000, 90000, 'First discovered hot Jupiter', false, true, 5);
INSERT INTO public.planet VALUES (10, 'HD 189733 b', 5500, 64000, 85000, 'Gas giant with hazy atmosphere', false, true, 5);
INSERT INTO public.planet VALUES (11, 'Trappist-1d', 8000, 3900000, 7000, 'Rocky exoplanet in a habitable zone', false, true, 6);
INSERT INTO public.planet VALUES (12, 'Trappist-1e', 8000, 3900000, 7800, 'Potentially habitable exoplanet', false, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 0, 695700, 'G-type main-sequence star', true, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius A', 242, 8, 1200000, 'Bright binary star', false, true, 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 5000, 41000, 1100000, 'Nearby solar-type star', false, true, 3);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 10000, 640000, 700000000, 'Red supergiant star', false, true, 4);
INSERT INTO public.star VALUES (5, 'Vega', 455, 257000, 1700000, 'Bright A-type star', false, true, 5);
INSERT INTO public.star VALUES (6, 'Rigel', 10000, 860000, 70000000, 'Blue supergiant star', false, true, 6);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moon_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: asteroid asteroid_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_unique UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

