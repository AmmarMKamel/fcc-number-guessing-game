--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    game_id integer NOT NULL,
    user_id integer,
    guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22),
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 650);
INSERT INTO public.games VALUES (2, 1, 354);
INSERT INTO public.games VALUES (3, 2, 761);
INSERT INTO public.games VALUES (4, 2, 427);
INSERT INTO public.games VALUES (5, 1, 516);
INSERT INTO public.games VALUES (6, 1, 66);
INSERT INTO public.games VALUES (7, 1, 3);
INSERT INTO public.games VALUES (8, 3, 4);
INSERT INTO public.games VALUES (9, 4, 203);
INSERT INTO public.games VALUES (10, 4, 24);
INSERT INTO public.games VALUES (11, 5, 81);
INSERT INTO public.games VALUES (12, 5, 845);
INSERT INTO public.games VALUES (13, 4, 69);
INSERT INTO public.games VALUES (14, 4, 756);
INSERT INTO public.games VALUES (15, 4, 433);
INSERT INTO public.games VALUES (16, 3, 16);
INSERT INTO public.games VALUES (17, 6, 242);
INSERT INTO public.games VALUES (18, 6, 644);
INSERT INTO public.games VALUES (19, 7, 480);
INSERT INTO public.games VALUES (20, 7, 363);
INSERT INTO public.games VALUES (21, 6, 210);
INSERT INTO public.games VALUES (22, 6, 467);
INSERT INTO public.games VALUES (23, 6, 219);
INSERT INTO public.games VALUES (24, 8, 14);
INSERT INTO public.games VALUES (25, 9, 274);
INSERT INTO public.games VALUES (26, 9, 483);
INSERT INTO public.games VALUES (27, 10, 36);
INSERT INTO public.games VALUES (28, 10, 684);
INSERT INTO public.games VALUES (29, 9, 513);
INSERT INTO public.games VALUES (30, 9, 68);
INSERT INTO public.games VALUES (31, 9, 62);
INSERT INTO public.games VALUES (32, 11, 987);
INSERT INTO public.games VALUES (33, 11, 660);
INSERT INTO public.games VALUES (34, 12, 323);
INSERT INTO public.games VALUES (35, 12, 929);
INSERT INTO public.games VALUES (36, 11, 834);
INSERT INTO public.games VALUES (37, 11, 431);
INSERT INTO public.games VALUES (38, 11, 498);
INSERT INTO public.games VALUES (39, 13, 801);
INSERT INTO public.games VALUES (40, 13, 457);
INSERT INTO public.games VALUES (41, 14, 664);
INSERT INTO public.games VALUES (42, 14, 212);
INSERT INTO public.games VALUES (43, 13, 391);
INSERT INTO public.games VALUES (44, 13, 798);
INSERT INTO public.games VALUES (45, 13, 983);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1720388627037', 2, 761);
INSERT INTO public.users VALUES (1, 'user_1720388627038', 5, 650);
INSERT INTO public.users VALUES (5, 'user_1720388689344', 2, 81);
INSERT INTO public.users VALUES (4, 'user_1720388689345', 5, 203);
INSERT INTO public.users VALUES (3, 'Ammar', 2, 4);
INSERT INTO public.users VALUES (7, 'user_1720388831860', 2, 480);
INSERT INTO public.users VALUES (6, 'user_1720388831861', 5, 242);
INSERT INTO public.users VALUES (8, 'aMMAR', 1, 14);
INSERT INTO public.users VALUES (10, 'user_1720388899286', 2, 36);
INSERT INTO public.users VALUES (9, 'user_1720388899287', 5, 274);
INSERT INTO public.users VALUES (12, 'user_1720388936959', 2, 323);
INSERT INTO public.users VALUES (11, 'user_1720388936960', 5, 987);
INSERT INTO public.users VALUES (14, 'user_1720388942847', 2, 664);
INSERT INTO public.users VALUES (13, 'user_1720388942848', 5, 801);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 45, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 14, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

