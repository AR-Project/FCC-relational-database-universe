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
    name character varying(50) NOT NULL,
    distance_in_kly integer NOT NULL,
    notes text,
    size_in_kpc integer
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
    name character varying(30),
    planet_id integer,
    discovered_years integer NOT NULL,
    diameter_in_km integer NOT NULL,
    mass_in_kg numeric NOT NULL
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
-- Name: msg; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.msg (
    msg_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer
);


ALTER TABLE public.msg OWNER TO freecodecamp;

--
-- Name: msg_msg_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.msg_msg_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.msg_msg_id_seq OWNER TO freecodecamp;

--
-- Name: msg_msg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.msg_msg_id_seq OWNED BY public.msg.msg_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    mass_in_em real,
    on_gzone boolean,
    total_moon integer,
    discovered_year integer,
    has_life boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    distance_from_sun_in_ly integer,
    total_planet integer,
    notes text
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: msg msg_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.msg ALTER COLUMN msg_id SET DEFAULT nextval('public.msg_msg_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 8100, 'The Milky Way[b] is the galaxy that includes our Solar System, with the name describing the galaxy&#39;s appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye.', 27);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 163, 'The Large Magellanic Cloud (LMC), or Nubecula Major is a satellite galaxy of the Milky Way.[6] At a distance of around 50 kiloparsecs (≈160,000 light-years),[2][7][8][9] the LMC is the second- or third-closest galaxy to the Milky Way, after the Sagittarius Dwarf Spheroidal (~16 kpc) and the possible dwarf irregular galaxy known as the Canis Major Overdensity.', 10);
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 203, 'The Small Magellanic Cloud (SMC), or Nubecula Minor, is a dwarf galaxy near the Milky Way.[4] Classified as a dwarf irregular galaxy, the SMC has a D25 isophotal diameter of about 5.78 kiloparsecs (18,900 light-years),[1][3] and contains several hundred million stars.[4]', 6);
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 752, 'The Andromeda Galaxy (IPA: /ænˈdrɒmɪdə/), also known as Messier 31, M31, or NGC 224 and originally the Andromeda Nebula, is a barred spiral galaxy with diameter of about 46.56 kiloparsecs (152,000 light-years)[8] approximately 2.5 million light-years (770 kiloparsecs) from Earth and the nearest large galaxy to the Milky Way.[6] ', 46);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 970, 'The Triangulum Galaxy is a spiral galaxy 2.73 million light-years (ly) from Earth in the constellation Triangulum. It is catalogued as Messier 33 or NGC (New General Catalogue) 598. With the D25 isophotal diameter of 18.74 kiloparsecs (61,100 light-years), the Triangulum Galaxy is the third-largest member of the Local Group of galaxies, behind the Andromeda Galaxy and the Milky Way. I', 19);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 13000, 'Centaurus A (also known as NGC 5128 or Caldwell 77) is a galaxy in the constellation of Centaurus. It was discovered in 1826 by Scottish astronomer James Dunlop from his home in Parramatta, in New South Wales, Australia. ', 60000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 0, 3475, 734200);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 1877, 22, 10000);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1877, 13, 2000);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1610, 3643, 8931900);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1610, 3121, 4799800);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 1610, 5268, 14819000);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 1610, 4820, 10759000);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 1892, 467, 208);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 1904, 140, 420);
INSERT INTO public.moon VALUES (10, 'Elara', 5, 1905, 80, 27);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 5, 1904, 58, 10);
INSERT INTO public.moon VALUES (12, 'Sinope', 5, 1914, 35, 3);
INSERT INTO public.moon VALUES (13, 'Lysithea', 5, 1938, 42, 4);
INSERT INTO public.moon VALUES (14, 'Carme', 5, 1938, 46, 6);
INSERT INTO public.moon VALUES (15, 'Amanke', 5, 1951, 29, 2);
INSERT INTO public.moon VALUES (16, 'Leda', 5, 1974, 22, 1);
INSERT INTO public.moon VALUES (17, 'Titan', 6, 1655, 5149, 134520000);
INSERT INTO public.moon VALUES (18, 'Iapetus', 6, 1671, 1468, 1805635);
INSERT INTO public.moon VALUES (19, 'Rhea', 6, 1672, 1527, 2306518);
INSERT INTO public.moon VALUES (20, 'Cordelia', 7, 1986, 42, 44);
INSERT INTO public.moon VALUES (21, 'Ophelia', 7, 1986, 47, 53);


--
-- Data for Name: msg; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.msg VALUES (1, 'I like this planet', 1);
INSERT INTO public.msg VALUES (2, 'This planet is amazing', 2);
INSERT INTO public.msg VALUES (3, 'This is where I lived', 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.05, false, 0, 0, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0.81, false, 0, 0, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, true, 1, 0, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 0.1, true, 2, 0, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 318, false, 80, 0, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 95, false, 83, 0, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 14.5, false, 27, 1781, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 17, false, 14, 1846, false);
INSERT INTO public.planet VALUES (9, 'Alpha Centauri A', 2, 20, false, 0, 2021, false);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri B', 2, 0, false, 0, 2012, false);
INSERT INTO public.planet VALUES (11, 'AEgir planet B', 6, 0, false, 0, 2000, false);
INSERT INTO public.planet VALUES (12, 'Planet c', 6, 0, false, 0, 0, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Solar System', 1, 0, 8, 'The Solar System[c] is the gravitationally bound system of the Sun and the objects that orbit it. It formed 4.6 billion years ago from the gravitational collapse of a giant interstellar molecular cloud.');
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, 4, 3, 'Alpha Centauri is a gravitationally bound system of the closest stars and planets to the Solar System at 4.37 light-years (1.34 parsecs) from the Sun. The name is Latinized from α Centauri, and abbreviated Alpha Cen or α Cen.');
INSERT INTO public.star VALUES (3, 'Barnard&#39;s Star', 1, 6, 0, 'Barnard&#39;s Star /ˈbɑːrnərdz/ is a red dwarf about six light-years from Earth in the constellation of Ophiuchus. It is the fourth-nearest-known individual star to the Sun after the three components of the Alpha Centauri system, and the closest star in the northern celestial hemisphere.');
INSERT INTO public.star VALUES (4, 'Luhman 16', 1, 7, 0, 'Luhman 16 (WISE 1049−5319, WISE J104915.57−531906.1) is a binary brown-dwarf system in the southern constellation Vela at a distance of approximately 6.5 light-years (2.0 parsecs) from the Sun. These are the closest-known brown dwarfs and the closest system found since the measurement of the proper motion of Barnard&#39;s Star in 1916,[9][10] and the third-closest-known system to the Sun (after the Alpha Centauri system and Barnard&#39;s Star).');
INSERT INTO public.star VALUES (5, 'WISE 0855−0714', 1, 7, 0, 'WISE 0855−0714 (full designation WISE J085510.83−071442.5,[6] or W0855 for short) is a sub-brown dwarf 2.28±0.01 parsecs (7.43±0.04 light-years)[5] from Earth, therefore the fourth-closest star or (sub-) brown dwarf system to the Sun,[1] the discovery of which was announced in April 2014 by Kevin Luhman using data from the Wide-field Infrared Survey Explorer (WISE).[1]');
INSERT INTO public.star VALUES (6, 'Epsilon Eridani', 1, 11, 3, 'Epsilon Eridani (Latinized from ε Eridani), formally named Ran,[18] is a star in the southern constellation of Eridanus, at a declination of 9.46° south of the celestial equator.');
INSERT INTO public.star VALUES (7, '61 Cygni', 1, 12, 2, '61 Cygni /ˈsɪɡni/ is a binary star system in the constellation Cygnus, consisting of a pair of K-type dwarf stars that orbit each other in a period of about 659 years.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: msg_msg_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.msg_msg_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: msg msg_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.msg
    ADD CONSTRAINT msg_name_key UNIQUE (name);


--
-- Name: msg msg_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.msg
    ADD CONSTRAINT msg_pkey PRIMARY KEY (msg_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: msg msg_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.msg
    ADD CONSTRAINT msg_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

