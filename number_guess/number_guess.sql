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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(20) NOT NULL,
    games_played integer,
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
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (47, 'user_1654449362603', 0, 0);
INSERT INTO public.users VALUES (48, 'user_1654449362602', 0, 0);
INSERT INTO public.users VALUES (49, 'gil', 0, 0);
INSERT INTO public.users VALUES (50, 'user_1654449411523', 0, 0);
INSERT INTO public.users VALUES (51, 'user_1654449411522', 0, 0);
INSERT INTO public.users VALUES (52, 'user_1654450009586', 0, 0);
INSERT INTO public.users VALUES (53, 'user_1654450009585', 0, 0);
INSERT INTO public.users VALUES (55, 'user_1654450064672', 0, 8);
INSERT INTO public.users VALUES (108, 'bob', 9, 1);
INSERT INTO public.users VALUES (66, 'user_1654452452269', 2, 7);
INSERT INTO public.users VALUES (54, 'user_1654450064673', 0, 1);
INSERT INTO public.users VALUES (117, 'user_1654454562774', 5, 427);
INSERT INTO public.users VALUES (65, 'user_1654452452270', 5, 3);
INSERT INTO public.users VALUES (57, 'user_1654450286553', 0, 10);
INSERT INTO public.users VALUES (97, 'user_1654453707183', 2, 603);
INSERT INTO public.users VALUES (56, 'user_1654450286554', 0, 9);
INSERT INTO public.users VALUES (131, 'user_1654455102844', 5, 142);
INSERT INTO public.users VALUES (110, 'user_1654454311625', 2, 157);
INSERT INTO public.users VALUES (126, 'user_1654454762976', 2, 392);
INSERT INTO public.users VALUES (68, 'user_1654452470271', 2, 5);
INSERT INTO public.users VALUES (96, 'user_1654453707184', 5, 126);
INSERT INTO public.users VALUES (60, 'user_1654450440499', 0, 10);
INSERT INTO public.users VALUES (67, 'user_1654452470272', 5, 3);
INSERT INTO public.users VALUES (69, 'user_1654452482654', 0, 0);
INSERT INTO public.users VALUES (59, 'user_1654450440500', 0, 1);
INSERT INTO public.users VALUES (70, 'user_1654452482653', 0, 0);
INSERT INTO public.users VALUES (71, 'user_1654452502620', 0, 0);
INSERT INTO public.users VALUES (72, 'user_1654452502619', 0, 0);
INSERT INTO public.users VALUES (73, 'user_1654452525044', 0, 0);
INSERT INTO public.users VALUES (74, 'user_1654452525043', 0, 0);
INSERT INTO public.users VALUES (75, 'user_1654452539264', 0, 0);
INSERT INTO public.users VALUES (62, 'user_1654450501633', 0, 9);
INSERT INTO public.users VALUES (76, 'user_1654452539263', 0, 0);
INSERT INTO public.users VALUES (77, 'user_1654452592072', 0, 0);
INSERT INTO public.users VALUES (78, 'user_1654452592071', 0, 0);
INSERT INTO public.users VALUES (61, 'user_1654450501634', 0, 5);
INSERT INTO public.users VALUES (79, 'user_1654452607199', 0, 0);
INSERT INTO public.users VALUES (80, 'user_1654452607198', 0, 0);
INSERT INTO public.users VALUES (81, 'user_1654452623149', 0, 0);
INSERT INTO public.users VALUES (109, 'user_1654454311626', 5, 449);
INSERT INTO public.users VALUES (82, 'user_1654452623148', 0, 0);
INSERT INTO public.users VALUES (83, 'user_1654452692847', 0, 0);
INSERT INTO public.users VALUES (84, 'user_1654452692846', 0, 0);
INSERT INTO public.users VALUES (64, 'user_1654450771845', 2, 8);
INSERT INTO public.users VALUES (63, 'user_1654450771846', 5, 3);
INSERT INTO public.users VALUES (125, 'user_1654454762977', 5, 442);
INSERT INTO public.users VALUES (86, 'user_1654453058719', 2, 785);
INSERT INTO public.users VALUES (99, 'user_1654453770911', 2, 98);
INSERT INTO public.users VALUES (85, 'user_1654453058720', 5, 393);
INSERT INTO public.users VALUES (87, 'user_1654453068805', 0, 0);
INSERT INTO public.users VALUES (88, 'user_1654453068804', 0, 0);
INSERT INTO public.users VALUES (98, 'user_1654453770912', 5, 103);
INSERT INTO public.users VALUES (139, 'user_1654455173924', 1, 632);
INSERT INTO public.users VALUES (90, 'user_1654453078363', 2, 210);
INSERT INTO public.users VALUES (112, 'user_1654454327977', 2, 849);
INSERT INTO public.users VALUES (120, 'user_1654454587349', 2, 654);
INSERT INTO public.users VALUES (89, 'user_1654453078364', 5, 198);
INSERT INTO public.users VALUES (101, 'user_1654453956138', 2, 963);
INSERT INTO public.users VALUES (111, 'user_1654454327978', 5, 104);
INSERT INTO public.users VALUES (119, 'user_1654454587350', 5, 4);
INSERT INTO public.users VALUES (92, 'user_1654453349741', 2, 311);
INSERT INTO public.users VALUES (100, 'user_1654453956139', 5, 308);
INSERT INTO public.users VALUES (91, 'user_1654453349742', 5, 277);
INSERT INTO public.users VALUES (134, 'user_1654455119179', 2, 414);
INSERT INTO public.users VALUES (94, 'user_1654453495752', 2, 142);
INSERT INTO public.users VALUES (128, 'user_1654454827825', 2, 80);
INSERT INTO public.users VALUES (103, 'user_1654454011810', 2, 169);
INSERT INTO public.users VALUES (93, 'user_1654453495753', 5, 594);
INSERT INTO public.users VALUES (114, 'user_1654454399993', 2, 935);
INSERT INTO public.users VALUES (102, 'user_1654454011811', 5, 269);
INSERT INTO public.users VALUES (127, 'user_1654454827826', 5, 224);
INSERT INTO public.users VALUES (58, 'GIL', 3, 1);
INSERT INTO public.users VALUES (122, 'user_1654454690169', 2, 359);
INSERT INTO public.users VALUES (113, 'user_1654454399994', 5, 161);
INSERT INTO public.users VALUES (105, 'user_1654454194961', 2, 881);
INSERT INTO public.users VALUES (104, 'user_1654454194962', 5, 197);
INSERT INTO public.users VALUES (133, 'user_1654455119180', 5, 369);
INSERT INTO public.users VALUES (121, 'user_1654454690170', 5, 105);
INSERT INTO public.users VALUES (107, 'user_1654454211864', 2, 548);
INSERT INTO public.users VALUES (116, 'user_1654454515196', 2, 142);
INSERT INTO public.users VALUES (106, 'user_1654454211865', 5, 211);
INSERT INTO public.users VALUES (150, 'user_1654455239154', 2, 601);
INSERT INTO public.users VALUES (115, 'user_1654454515197', 5, 285);
INSERT INTO public.users VALUES (146, 'user_1654455180233', 2, 29);
INSERT INTO public.users VALUES (137, 'user_1654455173925', 2, 167);
INSERT INTO public.users VALUES (130, 'user_1654454889476', 2, 265);
INSERT INTO public.users VALUES (118, 'user_1654454562773', 2, 521);
INSERT INTO public.users VALUES (124, 'user_1654454742524', 2, 386);
INSERT INTO public.users VALUES (129, 'user_1654454889477', 5, 413);
INSERT INTO public.users VALUES (123, 'user_1654454742525', 5, 360);
INSERT INTO public.users VALUES (136, 'user_1654455148809', 2, 408);
INSERT INTO public.users VALUES (145, 'user_1654455180234', 5, 243);
INSERT INTO public.users VALUES (135, 'user_1654455148810', 5, 103);
INSERT INTO public.users VALUES (132, 'user_1654455102843', 2, 406);
INSERT INTO public.users VALUES (149, 'user_1654455239155', 5, 344);
INSERT INTO public.users VALUES (144, 'user_1654455176961', 2, 208);
INSERT INTO public.users VALUES (154, 'user_1654455266266', 2, 121);
INSERT INTO public.users VALUES (148, 'user_1654455205760', 2, 110);
INSERT INTO public.users VALUES (143, 'user_1654455176962', 5, 30);
INSERT INTO public.users VALUES (147, 'user_1654455205761', 5, 516);
INSERT INTO public.users VALUES (152, 'user_1654455249788', 2, 663);
INSERT INTO public.users VALUES (153, 'user_1654455266267', 5, 278);
INSERT INTO public.users VALUES (151, 'user_1654455249789', 5, 297);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 154, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (name);


--
-- PostgreSQL database dump complete
--

