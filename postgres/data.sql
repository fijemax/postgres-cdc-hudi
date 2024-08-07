--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3 (Debian 14.3-1.pgdg110+1)
-- Dumped by pg_dump version 14.3 (Debian 14.3-1.pgdg110+1)

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
-- Name: basic; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.basic (
    id integer NOT NULL,
    name character varying(255),
    age integer,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.basic OWNER TO "user";

--
-- Name: basic_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.basic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basic_id_seq OWNER TO "user";

--
-- Name: basic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.basic_id_seq OWNED BY public.basic.id;


--
-- Name: basic id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.basic ALTER COLUMN id SET DEFAULT nextval('public.basic_id_seq'::regclass);


--
-- Data for Name: basic; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.basic (id, name, age, "timestamp") FROM stdin;
2	john	19	2024-08-02 09:26:56.476282+00
3	test	50	2024-08-02 09:26:56.476282+00
\.


--
-- Name: basic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.basic_id_seq', 3, true);


--
-- Name: basic basic_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.basic
    ADD CONSTRAINT basic_pkey PRIMARY KEY (id);


--
-- Name: dbz_publication; Type: PUBLICATION; Schema: -; Owner: user
--

CREATE PUBLICATION dbz_publication FOR ALL TABLES WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION dbz_publication OWNER TO "user";

--
-- PostgreSQL database dump complete
--

