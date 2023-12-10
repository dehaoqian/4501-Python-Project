--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: rent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rent (
    index bigint,
    zipcode integer,
    state text,
    date date,
    average_price double precision
);


ALTER TABLE public.rent OWNER TO postgres;

--
-- Name: ix_rent_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_rent_index ON public.rent USING btree (index);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: tree; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tree (
    tree_id text,
    spc_common text,
    zipcode integer,
    status text,
    health text,
    geometry public.geometry(Point,4326)
);


ALTER TABLE public.tree OWNER TO postgres;

--
-- Name: idx_tree_geometry; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tree_geometry ON public.tree USING gist (geometry);


--
-- PostgreSQL database dump complete
--



--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: zipcode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zipcode (
    unique_key integer NOT NULL,
    zipcode integer,
    neighborhood text NOT NULL,
    state text NOT NULL,
    county text NOT NULL,
    geometry public.geometry(Polygon,4326) NOT NULL
);


ALTER TABLE public.zipcode OWNER TO postgres;

--
-- Name: zipcode_unique_key_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.zipcode_unique_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.zipcode_unique_key_seq OWNER TO postgres;

--
-- Name: zipcode_unique_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.zipcode_unique_key_seq OWNED BY public.zipcode.unique_key;


--
-- Name: zipcode unique_key; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zipcode ALTER COLUMN unique_key SET DEFAULT nextval('public.zipcode_unique_key_seq'::regclass);


--
-- Name: zipcode zipcode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zipcode
    ADD CONSTRAINT zipcode_pkey PRIMARY KEY (unique_key);


--
-- Name: idx_zipcode_geometry; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_zipcode_geometry ON public.zipcode USING gist (geometry);


--
-- Name: ix_zipcode_zipcode; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_zipcode_zipcode ON public.zipcode USING btree (zipcode);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: complaint; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.complaint (
    unique_key integer,
    created_date timestamp without time zone,
    complaint_type text,
    geometry public.geometry(Point,4326),
    zipcode integer
);


ALTER TABLE public.complaint OWNER TO postgres;

--
-- Name: idx_complaint_geometry; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_complaint_geometry ON public.complaint USING gist (geometry);


--
-- PostgreSQL database dump complete
--

