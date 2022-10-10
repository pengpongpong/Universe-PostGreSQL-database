--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    size_in_lj numeric(10,2) NOT NULL,
    constellation text,
    age_in_billion numeric(5,2) NOT NULL,
    galaxy_type text
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
-- Name: habitable_zone; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.habitable_zone (
    habitable_zone_id integer NOT NULL,
    name character varying(30),
    planet_id integer NOT NULL,
    habitable_zone boolean
);


ALTER TABLE public.habitable_zone OWNER TO freecodecamp;

--
-- Name: habitable_zone_habitable_zone_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.habitable_zone_habitable_zone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.habitable_zone_habitable_zone_id_seq OWNER TO freecodecamp;

--
-- Name: habitable_zone_habitable_zone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.habitable_zone_habitable_zone_id_seq OWNED BY public.habitable_zone.habitable_zone_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    distance_to_planet_in_km integer,
    size_radius_in_km integer,
    orbital_period_days numeric(7,3) NOT NULL,
    age_in_billion numeric(6,3),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moons_moons_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moons_moons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moons_moons_id_seq OWNER TO freecodecamp;

--
-- Name: moons_moons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moons_moons_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    number_of_moons numeric(20,0),
    planet_type text,
    life_existence boolean,
    planet_orbital_period_in_days integer NOT NULL,
    planet_distance_to_star numeric(7,2) NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planets_planets_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_planets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_planets_id_seq OWNER TO freecodecamp;

--
-- Name: planets_planets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_planets_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    velocity_km_per_second numeric(7,2),
    size_in_million_km numeric(7,3) NOT NULL,
    temperature_in_kelvin integer NOT NULL,
    galaxy_id integer,
    distance_from_sun numeric(10,3)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: stars_stars_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_stars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_stars_id_seq OWNER TO freecodecamp;

--
-- Name: stars_stars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_stars_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: habitable_zone habitable_zone_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitable_zone ALTER COLUMN habitable_zone_id SET DEFAULT nextval('public.habitable_zone_habitable_zone_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moons_moons_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planets_planets_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.stars_stars_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 110000.00, 'Andromeda', 10.01, 'spiral galaxy');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 52.85, 'Sagittarius', 13.61, 'barred spiral galaxy');
INSERT INTO public.galaxy VALUES (3, 'Messier 83', 27.75, 'Hydra', 13.27, 'barred spiral galaxy');
INSERT INTO public.galaxy VALUES (4, 'Canis Major Dwarf Galaxy', 26.00, 'Canis Major', 240.00, 'irregular galaxy');
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 132000.00, 'Virgo', 13.24, 'supergiant elliptical galaxy');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 7000.00, 'Dorado/Mensa', 1.10, 'satellite dwarf galaxy');


--
-- Data for Name: habitable_zone; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.habitable_zone VALUES (1, 'Earth', 1, true);
INSERT INTO public.habitable_zone VALUES (2, 'Mars', 2, true);
INSERT INTO public.habitable_zone VALUES (3, 'Mercury', 3, false);
INSERT INTO public.habitable_zone VALUES (4, 'Jupiter', 5, false);
INSERT INTO public.habitable_zone VALUES (5, 'Venus', 4, false);
INSERT INTO public.habitable_zone VALUES (6, 'Saturn', 6, false);
INSERT INTO public.habitable_zone VALUES (7, 'Uranus', 7, false);
INSERT INTO public.habitable_zone VALUES (8, 'Neptune', 8, false);
INSERT INTO public.habitable_zone VALUES (9, 'Proxima Centrauri b', 9, true);
INSERT INTO public.habitable_zone VALUES (10, 'Proxima Centauri c', 10, false);
INSERT INTO public.habitable_zone VALUES (11, 'Proxima Centauri d', 11, true);
INSERT INTO public.habitable_zone VALUES (12, 'Kepler-186f', 12, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth I', 384400, 1737, 27.000, 4.425, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 6000, 11267, 0.319, 4.503, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 23460, 6, 1.260, 2.700, 2);
INSERT INTO public.moon VALUES (4, 'Io', 628300000, 1822, 1.800, 4.500, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 628300000, 1561, 3.500, 0.180, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1070000, 2634, 7.160, 4.503, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 1883000, 2410, 17.000, 4.503, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 181400, 84, 0.500, NULL, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', 11500000, 70, 248.000, NULL, 5);
INSERT INTO public.moon VALUES (10, 'Elara', 11700000, 43, 259.000, NULL, 5);
INSERT INTO public.moon VALUES (11, 'Titan', 1200000, 2575, 16.000, 1.000, 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', 1272000000, 735, 79.321, 4.564, 6);
INSERT INTO public.moon VALUES (13, 'Hyperion', 1500000, 135, 21.000, NULL, 6);
INSERT INTO public.moon VALUES (14, 'Epimethus', 151422, 58, 0.708, NULL, 6);
INSERT INTO public.moon VALUES (16, 'Oberon', 584000, 761, 13.000, NULL, 7);
INSERT INTO public.moon VALUES (17, 'Thalassa', 50000, 41, 0.291, NULL, 8);
INSERT INTO public.moon VALUES (18, 'Hippocamp', 0, 9, 0.958, NULL, 8);
INSERT INTO public.moon VALUES (19, 'Nereid', 340, 170, 360.000, NULL, 8);
INSERT INTO public.moon VALUES (20, 'Galatea', 61953, 87, 0.416, NULL, 8);
INSERT INTO public.moon VALUES (21, 'Despina', 52526, 75, 0.333, NULL, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'terrestrial planet', true, 365, 149.38, 3);
INSERT INTO public.planet VALUES (2, 'Mars', 2, 'rocky planet', false, 687, 219.58, 3);
INSERT INTO public.planet VALUES (3, 'Mercury', 0, 'terrestrial planet', false, 88, 46.68, 3);
INSERT INTO public.planet VALUES (5, 'Jupiter', 80, 'gas giant', false, 4380, 741.24, 3);
INSERT INTO public.planet VALUES (4, 'Venus', 0, 'terrestrial planet', false, 225, 107.83, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', 83, 'gas giant', false, 10585, 1472.40, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, 'ice giant', false, 30660, 2943.50, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, 'ice giant', false, 60225, 4473.90, 3);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', NULL, 'super earth exoplanet', NULL, 11, 7.50, 7);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', NULL, 'candidate super earth', NULL, 1928, 223.00, 7);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', NULL, 'candidate exoplanet', NULL, 5122, 4.30, 7);
INSERT INTO public.planet VALUES (12, 'Kepler-186f', NULL, 'exoplanet', NULL, 130, 53.20, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Andromedae', 110.00, 1.880, 13000, 1, 96.870);
INSERT INTO public.star VALUES (2, 'Beta Andromedae', 7.20, 69.570, 3842, 1, 199.000);
INSERT INTO public.star VALUES (3, 'Sun', 225.00, 0.696, 5778, 2, 0.000);
INSERT INTO public.star VALUES (4, 'Sirius', 16.00, 2.400, 9940, 2, 8.611);
INSERT INTO public.star VALUES (5, 'Rigel', 25.00, 54.890, 11000, 2, 864.300);
INSERT INTO public.star VALUES (6, 'Vega', 20.48, 1.643, 9602, 2, 25.050);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 1100.00, 0.107, 3042, 2, 4246.000);
INSERT INTO public.star VALUES (9, 'Kepler-186f', NULL, 0.364, 3755, 2, 492.500);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: habitable_zone_habitable_zone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.habitable_zone_habitable_zone_id_seq', 12, true);


--
-- Name: moons_moons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moons_moons_id_seq', 21, true);


--
-- Name: planets_planets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_planets_id_seq', 12, true);


--
-- Name: stars_stars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_stars_id_seq', 9, true);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: habitable_zone habitable_zone_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitable_zone
    ADD CONSTRAINT habitable_zone_pkey PRIMARY KEY (habitable_zone_id);


--
-- Name: habitable_zone habitable_zone_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitable_zone
    ADD CONSTRAINT habitable_zone_planet UNIQUE (name);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id PRIMARY KEY (moon_id);


--
-- Name: moon moons_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_name_key UNIQUE (name);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id PRIMARY KEY (planet_id);


--
-- Name: planet planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_name_key UNIQUE (name);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id PRIMARY KEY (star_id);


--
-- Name: star stars_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_name_key UNIQUE (name);


--
-- Name: habitable_zone habitable_zone_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitable_zone
    ADD CONSTRAINT habitable_zone_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moons_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planets_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star stars_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

