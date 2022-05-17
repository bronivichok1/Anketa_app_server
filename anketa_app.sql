--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-05-17 14:50:23

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
-- TOC entry 234 (class 1259 OID 17361)
-- Name: cath_reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cath_reports (
    id integer NOT NULL,
    value integer,
    ball_value numeric,
    selectvalue character varying(255),
    "itemId" integer,
    "cathedraId" integer,
    colvo integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    cath_result_id integer
);


ALTER TABLE public.cath_reports OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17360)
-- Name: cath_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cath_reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cath_reports_id_seq OWNER TO postgres;

--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 233
-- Name: cath_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cath_reports_id_seq OWNED BY public.cath_reports.id;


--
-- TOC entry 232 (class 1259 OID 17346)
-- Name: cath_results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cath_results (
    id integer NOT NULL,
    result numeric,
    "cathedraId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.cath_results OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17345)
-- Name: cath_results_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cath_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cath_results_id_seq OWNER TO postgres;

--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 231
-- Name: cath_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cath_results_id_seq OWNED BY public.cath_results.id;


--
-- TOC entry 230 (class 1259 OID 17339)
-- Name: cath_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cath_types (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.cath_types OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17338)
-- Name: cath_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cath_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cath_types_id_seq OWNER TO postgres;

--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 229
-- Name: cath_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cath_types_id_seq OWNED BY public.cath_types.id;


--
-- TOC entry 210 (class 1259 OID 17023)
-- Name: cathedras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cathedras (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    user_name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    faculty_id integer,
    clin_or_teor character varying(250),
    cath_type_id integer,
    user_id integer
);


ALTER TABLE public.cathedras OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17022)
-- Name: cathedras_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cathedras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cathedras_id_seq OWNER TO postgres;

--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 209
-- Name: cathedras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cathedras_id_seq OWNED BY public.cathedras.id;


--
-- TOC entry 236 (class 1259 OID 17376)
-- Name: colvo_selects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colvo_selects (
    id integer NOT NULL,
    colvo integer,
    "select_namesId" integer,
    ball integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    cathedra_id integer,
    cath_result_id integer
);


ALTER TABLE public.colvo_selects OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17375)
-- Name: colvo_selects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.colvo_selects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colvo_selects_id_seq OWNER TO postgres;

--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 235
-- Name: colvo_selects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.colvo_selects_id_seq OWNED BY public.colvo_selects.id;


--
-- TOC entry 240 (class 1259 OID 25548)
-- Name: dates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dates (
    id integer NOT NULL,
    "firstDate" character varying(255) NOT NULL,
    "lastDate" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.dates OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 25547)
-- Name: dates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dates_id_seq OWNER TO postgres;

--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 239
-- Name: dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dates_id_seq OWNED BY public.dates.id;


--
-- TOC entry 228 (class 1259 OID 17325)
-- Name: faculties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faculties (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.faculties OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17324)
-- Name: faculties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.faculties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faculties_id_seq OWNER TO postgres;

--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 227
-- Name: faculties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faculties_id_seq OWNED BY public.faculties.id;


--
-- TOC entry 214 (class 1259 OID 17051)
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    num character varying(255),
    ball numeric,
    help character varying(255),
    formula character varying(255),
    type character varying(255),
    formula_comment character varying(255),
    "parentId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer
);


ALTER TABLE public.items OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17050)
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO postgres;

--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 213
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- TOC entry 226 (class 1259 OID 17309)
-- Name: massivlocals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.massivlocals (
    id integer NOT NULL,
    value integer,
    "userId" integer,
    "itemId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.massivlocals OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17308)
-- Name: massivlocals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.massivlocals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.massivlocals_id_seq OWNER TO postgres;

--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 225
-- Name: massivlocals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.massivlocals_id_seq OWNED BY public.massivlocals.id;


--
-- TOC entry 222 (class 1259 OID 17255)
-- Name: massivs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.massivs (
    id integer NOT NULL,
    value integer,
    "userId" integer,
    "itemId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    result_id integer
);


ALTER TABLE public.massivs OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17254)
-- Name: massivs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.massivs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.massivs_id_seq OWNER TO postgres;

--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 221
-- Name: massivs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.massivs_id_seq OWNED BY public.massivs.id;


--
-- TOC entry 238 (class 1259 OID 25538)
-- Name: rating_tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rating_tables (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    formula character varying(255),
    active boolean DEFAULT true,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.rating_tables OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 25537)
-- Name: rating_tables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rating_tables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rating_tables_id_seq OWNER TO postgres;

--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 237
-- Name: rating_tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rating_tables_id_seq OWNED BY public.rating_tables.id;


--
-- TOC entry 224 (class 1259 OID 17297)
-- Name: reportlocals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reportlocals (
    id integer NOT NULL,
    value integer,
    ball_value numeric,
    selectvalue character varying(255),
    "itemId" integer,
    "resultId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer
);


ALTER TABLE public.reportlocals OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17296)
-- Name: reportlocals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reportlocals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reportlocals_id_seq OWNER TO postgres;

--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 223
-- Name: reportlocals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reportlocals_id_seq OWNED BY public.reportlocals.id;


--
-- TOC entry 218 (class 1259 OID 17076)
-- Name: reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reports (
    id integer NOT NULL,
    value integer,
    ball_value numeric,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer,
    "itemId" integer,
    "resultId" integer,
    selectvalue character varying(250),
    cathedra_id integer
);


ALTER TABLE public.reports OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17075)
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_id_seq OWNER TO postgres;

--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 217
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;


--
-- TOC entry 216 (class 1259 OID 17069)
-- Name: results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.results (
    id integer NOT NULL,
    result numeric,
    "userId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    cathedra_id integer,
    cath_result_id integer
);


ALTER TABLE public.results OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17068)
-- Name: results_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.results_id_seq OWNER TO postgres;

--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 215
-- Name: results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.results_id_seq OWNED BY public.results.id;


--
-- TOC entry 220 (class 1259 OID 17098)
-- Name: select_names; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.select_names (
    id integer NOT NULL,
    name character varying(255),
    select_help character varying(255),
    ball integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "itemId" integer
);


ALTER TABLE public.select_names OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17097)
-- Name: select_names_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.select_names_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.select_names_id_seq OWNER TO postgres;

--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 219
-- Name: select_names_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.select_names_id_seq OWNED BY public.select_names.id;


--
-- TOC entry 212 (class 1259 OID 17032)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying(255) NOT NULL,
    fullname character varying(255),
    role character varying(255) DEFAULT 'USER'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "cathedraId" integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17031)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3252 (class 2604 OID 17364)
-- Name: cath_reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cath_reports ALTER COLUMN id SET DEFAULT nextval('public.cath_reports_id_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 17349)
-- Name: cath_results id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cath_results ALTER COLUMN id SET DEFAULT nextval('public.cath_results_id_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 17342)
-- Name: cath_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cath_types ALTER COLUMN id SET DEFAULT nextval('public.cath_types_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 17026)
-- Name: cathedras id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cathedras ALTER COLUMN id SET DEFAULT nextval('public.cathedras_id_seq'::regclass);


--
-- TOC entry 3253 (class 2604 OID 17379)
-- Name: colvo_selects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colvo_selects ALTER COLUMN id SET DEFAULT nextval('public.colvo_selects_id_seq'::regclass);


--
-- TOC entry 3256 (class 2604 OID 25551)
-- Name: dates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dates ALTER COLUMN id SET DEFAULT nextval('public.dates_id_seq'::regclass);


--
-- TOC entry 3249 (class 2604 OID 17328)
-- Name: faculties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculties ALTER COLUMN id SET DEFAULT nextval('public.faculties_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 17054)
-- Name: items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 17312)
-- Name: massivlocals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.massivlocals ALTER COLUMN id SET DEFAULT nextval('public.massivlocals_id_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 17258)
-- Name: massivs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.massivs ALTER COLUMN id SET DEFAULT nextval('public.massivs_id_seq'::regclass);


--
-- TOC entry 3254 (class 2604 OID 25541)
-- Name: rating_tables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating_tables ALTER COLUMN id SET DEFAULT nextval('public.rating_tables_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 17300)
-- Name: reportlocals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reportlocals ALTER COLUMN id SET DEFAULT nextval('public.reportlocals_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 17079)
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 17072)
-- Name: results id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results ALTER COLUMN id SET DEFAULT nextval('public.results_id_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 17101)
-- Name: select_names id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.select_names ALTER COLUMN id SET DEFAULT nextval('public.select_names_id_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 17035)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3466 (class 0 OID 17361)
-- Dependencies: 234
-- Data for Name: cath_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cath_reports (id, value, ball_value, selectvalue, "itemId", "cathedraId", colvo, "createdAt", "updatedAt", cath_result_id) FROM stdin;
1001	0	208	\N	8	1	2	2022-05-17 12:12:14.768+03	2022-05-17 12:12:14.768+03	57
1002	0	0	\N	9	1	0	2022-05-17 12:12:14.778+03	2022-05-17 12:12:14.778+03	57
1003	4	4	\N	10	1	1	2022-05-17 12:12:14.78+03	2022-05-17 12:12:14.78+03	57
1004	4	4	\N	11	1	1	2022-05-17 12:12:14.781+03	2022-05-17 12:12:14.781+03	57
1005	0	200	\N	12	1	2	2022-05-17 12:12:14.782+03	2022-05-17 12:12:14.782+03	57
1006	0	790	\N	13	1	2	2022-05-17 12:12:14.784+03	2022-05-17 12:12:14.784+03	57
1007	0	150	\N	15	1	1	2022-05-17 12:12:14.785+03	2022-05-17 12:12:14.785+03	57
1008	0	300	\N	16	1	1	2022-05-17 12:12:14.786+03	2022-05-17 12:12:14.786+03	57
1009	0	50	\N	17	1	2	2022-05-17 12:12:14.787+03	2022-05-17 12:12:14.787+03	57
1010	0	0	\N	18	1	2	2022-05-17 12:12:14.788+03	2022-05-17 12:12:14.788+03	57
1011	0	0	1.25	19	1	2	2022-05-17 12:12:14.789+03	2022-05-17 12:12:14.789+03	57
1012	0	0	\N	20	1	2	2022-05-17 12:12:14.791+03	2022-05-17 12:12:14.791+03	57
1013	0	50	\N	21	1	2	2022-05-17 12:12:14.792+03	2022-05-17 12:12:14.792+03	57
1014	0	200	\N	22	1	2	2022-05-17 12:12:14.793+03	2022-05-17 12:12:14.793+03	57
1015	0	0	\N	25	1	2	2022-05-17 12:12:14.794+03	2022-05-17 12:12:14.794+03	57
1016	0	0	\N	27	1	2	2022-05-17 12:12:14.795+03	2022-05-17 12:12:14.795+03	57
1017	0	0	\N	28	1	2	2022-05-17 12:12:14.795+03	2022-05-17 12:12:14.795+03	57
1018	0	120	\N	29	1	1	2022-05-17 12:12:14.796+03	2022-05-17 12:12:14.796+03	57
1019	0	0	\N	34	1	0	2022-05-17 12:12:14.797+03	2022-05-17 12:12:14.797+03	57
1020	0	20	\N	35	1	1	2022-05-17 12:12:14.798+03	2022-05-17 12:12:14.798+03	57
901	0	223	\N	8	1	2	2022-05-12 16:49:05.587+03	2022-05-12 16:49:05.587+03	53
902	0	0	\N	9	1	0	2022-05-12 16:49:05.589+03	2022-05-12 16:49:05.589+03	53
903	12	12	\N	10	1	2	2022-05-12 16:49:05.59+03	2022-05-12 16:49:05.59+03	53
904	11	11	\N	11	1	2	2022-05-12 16:49:05.593+03	2022-05-12 16:49:05.593+03	53
905	0	200	\N	12	1	2	2022-05-12 16:49:05.596+03	2022-05-12 16:49:05.596+03	53
906	0	1405	\N	13	1	2	2022-05-12 16:49:05.598+03	2022-05-12 16:49:05.598+03	53
907	0	300	\N	15	1	2	2022-05-12 16:49:05.6+03	2022-05-12 16:49:05.6+03	53
908	0	600	\N	16	1	2	2022-05-12 16:49:05.602+03	2022-05-12 16:49:05.602+03	53
909	0	75	\N	17	1	2	2022-05-12 16:49:05.605+03	2022-05-12 16:49:05.605+03	53
910	0	0	\N	18	1	2	2022-05-12 16:49:05.607+03	2022-05-12 16:49:05.607+03	53
911	0	0	1.75	19	1	2	2022-05-12 16:49:05.608+03	2022-05-12 16:49:05.608+03	53
912	0	0	\N	20	1	2	2022-05-12 16:49:05.612+03	2022-05-12 16:49:05.612+03	53
913	0	75	\N	21	1	2	2022-05-12 16:49:05.614+03	2022-05-12 16:49:05.614+03	53
914	0	200	\N	22	1	2	2022-05-12 16:49:05.616+03	2022-05-12 16:49:05.616+03	53
915	0	0	\N	25	1	2	2022-05-12 16:49:05.617+03	2022-05-12 16:49:05.617+03	53
916	0	0	\N	27	1	2	2022-05-12 16:49:05.618+03	2022-05-12 16:49:05.618+03	53
917	0	0	\N	28	1	2	2022-05-12 16:49:05.619+03	2022-05-12 16:49:05.619+03	53
918	0	240	\N	29	1	2	2022-05-12 16:49:05.62+03	2022-05-12 16:49:05.62+03	53
919	0	0	\N	34	1	0	2022-05-12 16:49:05.621+03	2022-05-12 16:49:05.621+03	53
920	0	65	\N	35	1	2	2022-05-12 16:49:05.623+03	2022-05-12 16:49:05.623+03	53
1021	0	0	\N	38	1	0	2022-05-17 12:12:14.799+03	2022-05-17 12:12:14.799+03	57
1022	0	0	\N	39	1	0	2022-05-17 12:12:14.802+03	2022-05-17 12:12:14.802+03	57
1023	0	0	\N	40	1	0	2022-05-17 12:12:14.804+03	2022-05-17 12:12:14.804+03	57
1024	0	0	\N	41	1	0	2022-05-17 12:12:14.806+03	2022-05-17 12:12:14.806+03	57
1025	0	0	\N	42	1	0	2022-05-17 12:12:14.808+03	2022-05-17 12:12:14.808+03	57
1026	0	0	\N	43	1	0	2022-05-17 12:12:14.81+03	2022-05-17 12:12:14.81+03	57
1027	0	0	\N	44	1	0	2022-05-17 12:12:14.812+03	2022-05-17 12:12:14.812+03	57
1028	0	0	\N	47	1	0	2022-05-17 12:12:14.813+03	2022-05-17 12:12:14.813+03	57
1029	0	0	\N	48	1	0	2022-05-17 12:12:14.816+03	2022-05-17 12:12:14.816+03	57
1030	0	0	\N	49	1	0	2022-05-17 12:12:14.817+03	2022-05-17 12:12:14.817+03	57
1031	0	0	\N	50	1	0	2022-05-17 12:12:14.819+03	2022-05-17 12:12:14.819+03	57
1032	0	0	\N	51	1	0	2022-05-17 12:12:14.821+03	2022-05-17 12:12:14.821+03	57
1033	0	0	\N	52	1	0	2022-05-17 12:12:14.822+03	2022-05-17 12:12:14.822+03	57
1034	0	0	\N	53	1	0	2022-05-17 12:12:14.824+03	2022-05-17 12:12:14.824+03	57
1035	0	0	\N	54	1	0	2022-05-17 12:12:14.827+03	2022-05-17 12:12:14.827+03	57
1036	0	0	\N	55	1	0	2022-05-17 12:12:14.828+03	2022-05-17 12:12:14.828+03	57
1037	0	0	\N	56	1	0	2022-05-17 12:12:14.83+03	2022-05-17 12:12:14.83+03	57
1038	0	0	\N	57	1	0	2022-05-17 12:12:14.831+03	2022-05-17 12:12:14.831+03	57
1039	0	0	\N	58	1	0	2022-05-17 12:12:14.834+03	2022-05-17 12:12:14.834+03	57
1040	0	0	\N	59	1	0	2022-05-17 12:12:14.836+03	2022-05-17 12:12:14.836+03	57
1041	0	0	\N	60	1	0	2022-05-17 12:12:14.838+03	2022-05-17 12:12:14.838+03	57
1042	0	0	\N	61	1	0	2022-05-17 12:12:14.84+03	2022-05-17 12:12:14.84+03	57
1043	0	0	\N	62	1	0	2022-05-17 12:12:14.842+03	2022-05-17 12:12:14.842+03	57
1044	0	0	\N	63	1	0	2022-05-17 12:12:14.843+03	2022-05-17 12:12:14.843+03	57
1045	0	0	\N	64	1	0	2022-05-17 12:12:14.844+03	2022-05-17 12:12:14.844+03	57
1046	0	0	\N	65	1	0	2022-05-17 12:12:14.846+03	2022-05-17 12:12:14.846+03	57
1047	0	0	\N	66	1	0	2022-05-17 12:12:14.847+03	2022-05-17 12:12:14.847+03	57
1048	0	0	\N	67	1	0	2022-05-17 12:12:14.848+03	2022-05-17 12:12:14.848+03	57
1049	0	0	\N	68	1	0	2022-05-17 12:12:14.849+03	2022-05-17 12:12:14.849+03	57
1050	0	0	\N	69	1	0	2022-05-17 12:12:14.851+03	2022-05-17 12:12:14.851+03	57
1051	0	0	\N	70	1	0	2022-05-17 12:12:14.852+03	2022-05-17 12:12:14.852+03	57
1052	0	0	\N	71	1	0	2022-05-17 12:12:14.853+03	2022-05-17 12:12:14.853+03	57
1053	0	0	\N	72	1	0	2022-05-17 12:12:14.854+03	2022-05-17 12:12:14.854+03	57
1054	0	0	\N	73	1	0	2022-05-17 12:12:14.855+03	2022-05-17 12:12:14.855+03	57
1055	0	0	\N	74	1	0	2022-05-17 12:12:14.857+03	2022-05-17 12:12:14.857+03	57
1056	0	0	\N	75	1	0	2022-05-17 12:12:14.858+03	2022-05-17 12:12:14.858+03	57
1057	0	0	\N	76	1	0	2022-05-17 12:12:14.859+03	2022-05-17 12:12:14.859+03	57
1058	0	0	\N	78	1	0	2022-05-17 12:12:14.86+03	2022-05-17 12:12:14.86+03	57
1059	0	0	\N	79	1	0	2022-05-17 12:12:14.861+03	2022-05-17 12:12:14.861+03	57
1060	0	0	\N	80	1	0	2022-05-17 12:12:14.862+03	2022-05-17 12:12:14.862+03	57
1061	0	0	\N	81	1	0	2022-05-17 12:12:14.863+03	2022-05-17 12:12:14.863+03	57
1062	0	0	\N	82	1	0	2022-05-17 12:12:14.864+03	2022-05-17 12:12:14.864+03	57
1063	0	181.67	\N	83	1	1	2022-05-17 12:12:14.865+03	2022-05-17 12:12:14.865+03	57
1064	0	0	\N	84	1	0	2022-05-17 12:12:14.866+03	2022-05-17 12:12:14.866+03	57
1065	0	0	\N	85	1	0	2022-05-17 12:12:14.867+03	2022-05-17 12:12:14.867+03	57
1066	0	0	\N	86	1	0	2022-05-17 12:12:14.868+03	2022-05-17 12:12:14.868+03	57
1067	0	16.67	\N	87	1	1	2022-05-17 12:12:14.87+03	2022-05-17 12:12:14.87+03	57
1068	0	0	\N	88	1	0	2022-05-17 12:12:14.875+03	2022-05-17 12:12:14.875+03	57
1069	0	0	\N	89	1	0	2022-05-17 12:12:14.876+03	2022-05-17 12:12:14.876+03	57
1070	0	0	\N	90	1	0	2022-05-17 12:12:14.877+03	2022-05-17 12:12:14.877+03	57
1071	0	0	\N	91	1	0	2022-05-17 12:12:14.879+03	2022-05-17 12:12:14.879+03	57
1072	0	0	\N	92	1	0	2022-05-17 12:12:14.88+03	2022-05-17 12:12:14.88+03	57
1073	0	0	\N	93	1	0	2022-05-17 12:12:14.881+03	2022-05-17 12:12:14.881+03	57
1074	0	0	\N	94	1	0	2022-05-17 12:12:14.882+03	2022-05-17 12:12:14.882+03	57
1075	0	0	\N	95	1	0	2022-05-17 12:12:14.883+03	2022-05-17 12:12:14.883+03	57
1076	0	0	\N	96	1	0	2022-05-17 12:12:14.884+03	2022-05-17 12:12:14.884+03	57
1077	0	125	\N	97	1	1	2022-05-17 12:12:14.885+03	2022-05-17 12:12:14.885+03	57
1078	0	0	\N	98	1	0	2022-05-17 12:12:14.886+03	2022-05-17 12:12:14.886+03	57
1079	0	0	\N	99	1	0	2022-05-17 12:12:14.887+03	2022-05-17 12:12:14.887+03	57
1080	0	0	\N	100	1	0	2022-05-17 12:12:14.889+03	2022-05-17 12:12:14.889+03	57
1081	0	0	\N	101	1	0	2022-05-17 12:12:14.891+03	2022-05-17 12:12:14.891+03	57
1082	0	0	\N	102	1	0	2022-05-17 12:12:14.893+03	2022-05-17 12:12:14.893+03	57
1083	0	0	\N	103	1	0	2022-05-17 12:12:14.894+03	2022-05-17 12:12:14.894+03	57
1084	0	0	\N	104	1	0	2022-05-17 12:12:14.895+03	2022-05-17 12:12:14.895+03	57
1085	0	0	\N	106	1	0	2022-05-17 12:12:14.897+03	2022-05-17 12:12:14.897+03	57
1086	0	0	\N	107	1	0	2022-05-17 12:12:14.898+03	2022-05-17 12:12:14.898+03	57
1087	0	0	\N	108	1	0	2022-05-17 12:12:14.899+03	2022-05-17 12:12:14.899+03	57
1088	0	0	\N	109	1	0	2022-05-17 12:12:14.901+03	2022-05-17 12:12:14.901+03	57
1089	0	0	\N	110	1	0	2022-05-17 12:12:14.902+03	2022-05-17 12:12:14.902+03	57
1090	0	0	\N	111	1	0	2022-05-17 12:12:14.903+03	2022-05-17 12:12:14.903+03	57
1091	0	0	\N	112	1	0	2022-05-17 12:12:14.905+03	2022-05-17 12:12:14.905+03	57
1092	0	0	\N	113	1	0	2022-05-17 12:12:14.907+03	2022-05-17 12:12:14.907+03	57
1093	0	0	\N	114	1	0	2022-05-17 12:12:14.908+03	2022-05-17 12:12:14.908+03	57
1094	4	40	\N	115	1	1	2022-05-17 12:12:14.91+03	2022-05-17 12:12:14.91+03	57
1095	0	0	\N	116	1	0	2022-05-17 12:12:14.911+03	2022-05-17 12:12:14.911+03	57
1096	0	0	\N	117	1	0	2022-05-17 12:12:14.912+03	2022-05-17 12:12:14.912+03	57
1097	0	0	\N	118	1	0	2022-05-17 12:12:14.913+03	2022-05-17 12:12:14.913+03	57
1098	0	0	\N	119	1	0	2022-05-17 12:12:14.914+03	2022-05-17 12:12:14.914+03	57
1099	0	0	\N	120	1	0	2022-05-17 12:12:14.916+03	2022-05-17 12:12:14.916+03	57
1100	0	0	\N	121	1	0	2022-05-17 12:12:14.917+03	2022-05-17 12:12:14.917+03	57
1101	0	0	\N	122	1	0	2022-05-17 12:12:14.918+03	2022-05-17 12:12:14.918+03	57
1102	0	0	\N	123	1	0	2022-05-17 12:12:14.92+03	2022-05-17 12:12:14.92+03	57
1103	0	0	\N	124	1	0	2022-05-17 12:12:14.921+03	2022-05-17 12:12:14.921+03	57
1104	0	0	\N	125	1	0	2022-05-17 12:12:14.922+03	2022-05-17 12:12:14.922+03	57
1105	0	0	\N	126	1	0	2022-05-17 12:12:14.923+03	2022-05-17 12:12:14.923+03	57
1106	0	0	\N	127	1	0	2022-05-17 12:12:14.924+03	2022-05-17 12:12:14.924+03	57
1107	0	0	\N	128	1	0	2022-05-17 12:12:14.925+03	2022-05-17 12:12:14.925+03	57
1108	0	0	\N	129	1	0	2022-05-17 12:12:14.926+03	2022-05-17 12:12:14.926+03	57
1109	0	0	\N	130	1	0	2022-05-17 12:12:14.927+03	2022-05-17 12:12:14.927+03	57
1110	0	0	\N	131	1	0	2022-05-17 12:12:14.928+03	2022-05-17 12:12:14.928+03	57
1111	0	0	\N	132	1	0	2022-05-17 12:12:14.93+03	2022-05-17 12:12:14.93+03	57
1112	0	0	\N	133	1	0	2022-05-17 12:12:14.931+03	2022-05-17 12:12:14.931+03	57
1113	0	0	\N	134	1	0	2022-05-17 12:12:14.932+03	2022-05-17 12:12:14.932+03	57
1114	0	0	\N	135	1	0	2022-05-17 12:12:14.933+03	2022-05-17 12:12:14.933+03	57
1115	0	0	\N	136	1	0	2022-05-17 12:12:14.934+03	2022-05-17 12:12:14.934+03	57
1116	0	0	\N	138	1	0	2022-05-17 12:12:14.935+03	2022-05-17 12:12:14.935+03	57
1117	0	0	\N	140	1	0	2022-05-17 12:12:14.937+03	2022-05-17 12:12:14.937+03	57
1118	0	0	\N	141	1	0	2022-05-17 12:12:14.938+03	2022-05-17 12:12:14.938+03	57
1119	0	0	\N	142	1	0	2022-05-17 12:12:14.939+03	2022-05-17 12:12:14.939+03	57
1120	0	0	\N	143	1	0	2022-05-17 12:12:14.94+03	2022-05-17 12:12:14.94+03	57
1121	0	0	\N	144	1	0	2022-05-17 12:12:14.941+03	2022-05-17 12:12:14.941+03	57
1122	0	0	\N	145	1	0	2022-05-17 12:12:14.943+03	2022-05-17 12:12:14.943+03	57
1123	0	0	\N	146	1	0	2022-05-17 12:12:14.944+03	2022-05-17 12:12:14.944+03	57
1124	0	0	\N	147	1	0	2022-05-17 12:12:14.945+03	2022-05-17 12:12:14.945+03	57
1125	0	0	\N	149	1	0	2022-05-17 12:12:14.946+03	2022-05-17 12:12:14.946+03	57
1126	0	0	\N	150	1	0	2022-05-17 12:12:14.947+03	2022-05-17 12:12:14.947+03	57
1127	0	0	\N	152	1	0	2022-05-17 12:12:14.949+03	2022-05-17 12:12:14.949+03	57
1128	0	0	\N	155	1	0	2022-05-17 12:12:14.953+03	2022-05-17 12:12:14.953+03	57
1129	0	0	\N	157	1	0	2022-05-17 12:12:14.957+03	2022-05-17 12:12:14.957+03	57
1130	0	0	\N	158	1	0	2022-05-17 12:12:14.959+03	2022-05-17 12:12:14.959+03	57
1131	0	185	\N	159	1	1	2022-05-17 12:12:14.96+03	2022-05-17 12:12:14.96+03	57
1132	0	0	\N	160	1	0	2022-05-17 12:12:14.961+03	2022-05-17 12:12:14.961+03	57
1133	4	160	\N	161	1	1	2022-05-17 12:12:14.962+03	2022-05-17 12:12:14.962+03	57
1134	0	0	\N	162	1	0	2022-05-17 12:12:14.963+03	2022-05-17 12:12:14.963+03	57
1135	0	0	\N	163	1	0	2022-05-17 12:12:14.964+03	2022-05-17 12:12:14.964+03	57
1136	0	0	\N	164	1	0	2022-05-17 12:12:14.964+03	2022-05-17 12:12:14.964+03	57
1137	5	25	\N	165	1	1	2022-05-17 12:12:14.966+03	2022-05-17 12:12:14.966+03	57
1138	0	0	\N	166	1	0	2022-05-17 12:12:14.967+03	2022-05-17 12:12:14.967+03	57
1139	0	0	\N	168	1	0	2022-05-17 12:12:14.968+03	2022-05-17 12:12:14.968+03	57
1140	0	0	\N	170	1	0	2022-05-17 12:12:14.969+03	2022-05-17 12:12:14.969+03	57
1141	0	0	\N	172	1	0	2022-05-17 12:12:14.97+03	2022-05-17 12:12:14.97+03	57
1142	0	0	\N	173	1	0	2022-05-17 12:12:14.971+03	2022-05-17 12:12:14.971+03	57
1143	0	0	\N	174	1	0	2022-05-17 12:12:14.972+03	2022-05-17 12:12:14.972+03	57
1144	0	0	\N	176	1	0	2022-05-17 12:12:14.973+03	2022-05-17 12:12:14.973+03	57
1145	0	0	\N	177	1	0	2022-05-17 12:12:14.974+03	2022-05-17 12:12:14.974+03	57
1146	0	0	\N	178	1	0	2022-05-17 12:12:14.975+03	2022-05-17 12:12:14.975+03	57
1147	0	0	\N	179	1	0	2022-05-17 12:12:14.976+03	2022-05-17 12:12:14.976+03	57
1148	0	0	\N	180	1	0	2022-05-17 12:12:14.977+03	2022-05-17 12:12:14.977+03	57
1149	0	0	\N	181	1	0	2022-05-17 12:12:14.978+03	2022-05-17 12:12:14.978+03	57
1150	0	0	\N	182	1	0	2022-05-17 12:12:14.979+03	2022-05-17 12:12:14.979+03	57
1151	0	0	\N	183	1	0	2022-05-17 12:12:14.98+03	2022-05-17 12:12:14.98+03	57
1152	0	0	\N	184	1	0	2022-05-17 12:12:14.98+03	2022-05-17 12:12:14.98+03	57
1153	0	0	\N	185	1	0	2022-05-17 12:12:14.981+03	2022-05-17 12:12:14.981+03	57
1154	0	0	\N	186	1	0	2022-05-17 12:12:14.982+03	2022-05-17 12:12:14.982+03	57
1155	0	0	\N	187	1	0	2022-05-17 12:12:14.983+03	2022-05-17 12:12:14.983+03	57
1156	0	0	\N	188	1	0	2022-05-17 12:12:14.984+03	2022-05-17 12:12:14.984+03	57
1157	0	0	\N	189	1	0	2022-05-17 12:12:14.985+03	2022-05-17 12:12:14.985+03	57
1158	0	0	\N	190	1	0	2022-05-17 12:12:14.987+03	2022-05-17 12:12:14.987+03	57
1159	0	0	\N	191	1	0	2022-05-17 12:12:14.989+03	2022-05-17 12:12:14.989+03	57
1160	0	0	\N	192	1	0	2022-05-17 12:12:14.991+03	2022-05-17 12:12:14.991+03	57
1161	0	0	\N	193	1	0	2022-05-17 12:12:14.992+03	2022-05-17 12:12:14.992+03	57
1162	0	0	\N	194	1	0	2022-05-17 12:12:14.994+03	2022-05-17 12:12:14.994+03	57
1163	0	0	\N	195	1	0	2022-05-17 12:12:14.996+03	2022-05-17 12:12:14.996+03	57
1164	0	0	\N	196	1	0	2022-05-17 12:12:14.997+03	2022-05-17 12:12:14.997+03	57
1165	0	0	\N	197	1	0	2022-05-17 12:12:14.999+03	2022-05-17 12:12:14.999+03	57
1166	0	0	\N	199	1	0	2022-05-17 12:12:15+03	2022-05-17 12:12:15+03	57
1167	0	0	\N	200	1	0	2022-05-17 12:12:15.001+03	2022-05-17 12:12:15.001+03	57
1168	0	0	\N	201	1	0	2022-05-17 12:12:15.003+03	2022-05-17 12:12:15.003+03	57
1169	0	0	\N	203	1	0	2022-05-17 12:12:15.004+03	2022-05-17 12:12:15.004+03	57
1170	0	0	\N	204	1	0	2022-05-17 12:12:15.006+03	2022-05-17 12:12:15.006+03	57
1171	0	0	\N	205	1	0	2022-05-17 12:12:15.008+03	2022-05-17 12:12:15.008+03	57
1172	0	0	\N	206	1	0	2022-05-17 12:12:15.009+03	2022-05-17 12:12:15.009+03	57
1173	0	0	\N	207	1	0	2022-05-17 12:12:15.011+03	2022-05-17 12:12:15.011+03	57
1174	0	0	\N	208	1	0	2022-05-17 12:12:15.012+03	2022-05-17 12:12:15.012+03	57
1175	0	40	\N	209	1	1	2022-05-17 12:12:15.013+03	2022-05-17 12:12:15.013+03	57
1176	0	0	\N	210	1	0	2022-05-17 12:12:15.014+03	2022-05-17 12:12:15.014+03	57
1177	0	0	\N	211	1	0	2022-05-17 12:12:15.015+03	2022-05-17 12:12:15.015+03	57
1178	0	0	\N	212	1	0	2022-05-17 12:12:15.016+03	2022-05-17 12:12:15.016+03	57
1179	0	0	\N	213	1	0	2022-05-17 12:12:15.017+03	2022-05-17 12:12:15.017+03	57
1180	0	0	\N	214	1	0	2022-05-17 12:12:15.019+03	2022-05-17 12:12:15.019+03	57
1181	0	0	\N	215	1	0	2022-05-17 12:12:15.021+03	2022-05-17 12:12:15.021+03	57
1182	0	0	\N	216	1	0	2022-05-17 12:12:15.022+03	2022-05-17 12:12:15.022+03	57
1183	0	0	\N	217	1	0	2022-05-17 12:12:15.023+03	2022-05-17 12:12:15.023+03	57
1184	0	0	\N	218	1	0	2022-05-17 12:12:15.025+03	2022-05-17 12:12:15.025+03	57
1185	0	0	\N	219	1	0	2022-05-17 12:12:15.026+03	2022-05-17 12:12:15.026+03	57
1186	0	0	\N	220	1	0	2022-05-17 12:12:15.029+03	2022-05-17 12:12:15.029+03	57
1187	0	0	\N	221	1	0	2022-05-17 12:12:15.031+03	2022-05-17 12:12:15.031+03	57
1188	0	0	\N	222	1	0	2022-05-17 12:12:15.033+03	2022-05-17 12:12:15.033+03	57
1189	4	40	\N	223	1	1	2022-05-17 12:12:15.034+03	2022-05-17 12:12:15.034+03	57
1190	0	0	\N	224	1	0	2022-05-17 12:12:15.035+03	2022-05-17 12:12:15.035+03	57
1191	0	0	\N	225	1	0	2022-05-17 12:12:15.036+03	2022-05-17 12:12:15.036+03	57
1192	0	0	\N	227	1	0	2022-05-17 12:12:15.037+03	2022-05-17 12:12:15.037+03	57
1193	0	0	\N	228	1	0	2022-05-17 12:12:15.039+03	2022-05-17 12:12:15.039+03	57
1194	0	0	\N	229	1	0	2022-05-17 12:12:15.04+03	2022-05-17 12:12:15.04+03	57
1195	0	0	\N	230	1	0	2022-05-17 12:12:15.041+03	2022-05-17 12:12:15.041+03	57
1196	0	0	\N	231	1	0	2022-05-17 12:12:15.042+03	2022-05-17 12:12:15.042+03	57
1197	0	0	\N	234	1	0	2022-05-17 12:12:15.042+03	2022-05-17 12:12:15.042+03	57
1198	0	0	\N	235	1	0	2022-05-17 12:12:15.044+03	2022-05-17 12:12:15.044+03	57
1199	0	0	\N	236	1	0	2022-05-17 12:12:15.045+03	2022-05-17 12:12:15.045+03	57
1200	0	0	\N	237	1	0	2022-05-17 12:12:15.046+03	2022-05-17 12:12:15.046+03	57
1201	0	0	\N	238	1	0	2022-05-17 12:12:15.047+03	2022-05-17 12:12:15.047+03	57
1202	0	0	\N	239	1	0	2022-05-17 12:12:15.048+03	2022-05-17 12:12:15.048+03	57
1203	0	0	\N	240	1	0	2022-05-17 12:12:15.049+03	2022-05-17 12:12:15.049+03	57
1204	0	0	\N	241	1	0	2022-05-17 12:12:15.05+03	2022-05-17 12:12:15.05+03	57
1205	0	0	\N	242	1	0	2022-05-17 12:12:15.05+03	2022-05-17 12:12:15.05+03	57
1206	0	0	\N	243	1	0	2022-05-17 12:12:15.051+03	2022-05-17 12:12:15.051+03	57
1207	0	0	\N	244	1	0	2022-05-17 12:12:15.052+03	2022-05-17 12:12:15.052+03	57
1208	0	0	\N	245	1	0	2022-05-17 12:12:15.053+03	2022-05-17 12:12:15.053+03	57
1209	0	0	\N	246	1	0	2022-05-17 12:12:15.056+03	2022-05-17 12:12:15.056+03	57
1210	0	0	\N	247	1	0	2022-05-17 12:12:15.057+03	2022-05-17 12:12:15.057+03	57
1211	0	0	\N	248	1	0	2022-05-17 12:12:15.058+03	2022-05-17 12:12:15.058+03	57
1212	0	0	\N	249	1	0	2022-05-17 12:12:15.059+03	2022-05-17 12:12:15.059+03	57
1213	0	0	\N	250	1	0	2022-05-17 12:12:15.062+03	2022-05-17 12:12:15.062+03	57
1214	0	0	\N	251	1	0	2022-05-17 12:12:15.063+03	2022-05-17 12:12:15.063+03	57
1215	0	0	\N	252	1	0	2022-05-17 12:12:15.064+03	2022-05-17 12:12:15.064+03	57
1216	0	0	\N	253	1	0	2022-05-17 12:12:15.065+03	2022-05-17 12:12:15.065+03	57
1217	0	0	\N	254	1	0	2022-05-17 12:12:15.066+03	2022-05-17 12:12:15.066+03	57
1218	0	0	\N	255	1	0	2022-05-17 12:12:15.067+03	2022-05-17 12:12:15.067+03	57
1219	0	0	\N	256	1	0	2022-05-17 12:12:15.068+03	2022-05-17 12:12:15.068+03	57
1220	0	0	\N	257	1	0	2022-05-17 12:12:15.07+03	2022-05-17 12:12:15.07+03	57
1221	0	0	\N	258	1	0	2022-05-17 12:12:15.071+03	2022-05-17 12:12:15.071+03	57
1222	0	0	\N	259	1	0	2022-05-17 12:12:15.072+03	2022-05-17 12:12:15.072+03	57
1223	0	0	\N	260	1	0	2022-05-17 12:12:15.074+03	2022-05-17 12:12:15.074+03	57
1224	0	0	\N	261	1	0	2022-05-17 12:12:15.075+03	2022-05-17 12:12:15.075+03	57
1225	0	0	\N	262	1	0	2022-05-17 12:12:15.076+03	2022-05-17 12:12:15.076+03	57
1226	0	0	\N	263	1	0	2022-05-17 12:12:15.078+03	2022-05-17 12:12:15.078+03	57
1227	0	0	\N	264	1	0	2022-05-17 12:12:15.08+03	2022-05-17 12:12:15.08+03	57
1228	0	0	\N	265	1	0	2022-05-17 12:12:15.081+03	2022-05-17 12:12:15.081+03	57
1229	0	0	\N	266	1	0	2022-05-17 12:12:15.082+03	2022-05-17 12:12:15.082+03	57
1230	0	0	\N	267	1	0	2022-05-17 12:12:15.083+03	2022-05-17 12:12:15.083+03	57
1231	0	0	\N	268	1	0	2022-05-17 12:12:15.084+03	2022-05-17 12:12:15.084+03	57
1232	0	0	\N	269	1	0	2022-05-17 12:12:15.085+03	2022-05-17 12:12:15.085+03	57
1233	0	0	\N	270	1	0	2022-05-17 12:12:15.086+03	2022-05-17 12:12:15.086+03	57
1234	0	0	\N	271	1	0	2022-05-17 12:12:15.087+03	2022-05-17 12:12:15.087+03	57
1235	0	0	\N	272	1	0	2022-05-17 12:12:15.088+03	2022-05-17 12:12:15.088+03	57
1236	0	0	\N	273	1	0	2022-05-17 12:12:15.089+03	2022-05-17 12:12:15.089+03	57
1237	0	0	\N	274	1	0	2022-05-17 12:12:15.09+03	2022-05-17 12:12:15.09+03	57
1238	0	0	\N	275	1	0	2022-05-17 12:12:15.091+03	2022-05-17 12:12:15.091+03	57
1239	0	0	\N	276	1	0	2022-05-17 12:12:15.091+03	2022-05-17 12:12:15.091+03	57
1240	0	0	\N	277	1	0	2022-05-17 12:12:15.093+03	2022-05-17 12:12:15.093+03	57
1241	0	0	\N	278	1	0	2022-05-17 12:12:15.094+03	2022-05-17 12:12:15.094+03	57
1242	0	0	\N	279	1	0	2022-05-17 12:12:15.094+03	2022-05-17 12:12:15.094+03	57
1243	0	0	\N	280	1	0	2022-05-17 12:12:15.095+03	2022-05-17 12:12:15.095+03	57
1244	0	0	\N	281	1	0	2022-05-17 12:12:15.096+03	2022-05-17 12:12:15.096+03	57
1245	0	0	\N	282	1	0	2022-05-17 12:12:15.097+03	2022-05-17 12:12:15.097+03	57
1246	0	0	\N	283	1	0	2022-05-17 12:12:15.098+03	2022-05-17 12:12:15.098+03	57
1247	0	0	\N	284	1	0	2022-05-17 12:12:15.099+03	2022-05-17 12:12:15.099+03	57
1248	0	0	\N	285	1	0	2022-05-17 12:12:15.1+03	2022-05-17 12:12:15.1+03	57
1249	0	0	\N	286	1	0	2022-05-17 12:12:15.101+03	2022-05-17 12:12:15.101+03	57
1250	0	0	\N	287	1	0	2022-05-17 12:12:15.101+03	2022-05-17 12:12:15.101+03	57
1251	0	0	\N	288	1	0	2022-05-17 12:12:15.102+03	2022-05-17 12:12:15.102+03	57
1252	0	0	\N	289	1	0	2022-05-17 12:12:15.103+03	2022-05-17 12:12:15.103+03	57
1253	0	0	\N	290	1	0	2022-05-17 12:12:15.104+03	2022-05-17 12:12:15.104+03	57
1254	0	0	\N	291	1	0	2022-05-17 12:12:15.105+03	2022-05-17 12:12:15.105+03	57
1255	0	0	\N	292	1	0	2022-05-17 12:12:15.106+03	2022-05-17 12:12:15.106+03	57
1256	0	0	\N	293	1	0	2022-05-17 12:12:15.107+03	2022-05-17 12:12:15.107+03	57
1257	0	0	\N	294	1	0	2022-05-17 12:12:15.108+03	2022-05-17 12:12:15.108+03	57
1258	0	0	\N	295	1	0	2022-05-17 12:12:15.108+03	2022-05-17 12:12:15.108+03	57
1259	0	0	\N	296	1	0	2022-05-17 12:12:15.109+03	2022-05-17 12:12:15.109+03	57
1260	0	0	\N	297	1	0	2022-05-17 12:12:15.11+03	2022-05-17 12:12:15.11+03	57
1261	0	0	\N	298	1	0	2022-05-17 12:12:15.111+03	2022-05-17 12:12:15.111+03	57
1262	0	0	\N	299	1	0	2022-05-17 12:12:15.112+03	2022-05-17 12:12:15.112+03	57
1263	0	0	\N	300	1	0	2022-05-17 12:12:15.112+03	2022-05-17 12:12:15.112+03	57
1264	0	0	\N	301	1	0	2022-05-17 12:12:15.113+03	2022-05-17 12:12:15.113+03	57
1265	0	0	\N	302	1	0	2022-05-17 12:12:15.114+03	2022-05-17 12:12:15.114+03	57
1266	0	0	\N	303	1	0	2022-05-17 12:12:15.115+03	2022-05-17 12:12:15.115+03	57
1267	0	0	\N	304	1	0	2022-05-17 12:12:15.116+03	2022-05-17 12:12:15.116+03	57
1268	0	0	\N	305	1	0	2022-05-17 12:12:15.117+03	2022-05-17 12:12:15.117+03	57
1269	0	0	\N	306	1	0	2022-05-17 12:12:15.117+03	2022-05-17 12:12:15.117+03	57
1270	0	0	\N	307	1	0	2022-05-17 12:12:15.118+03	2022-05-17 12:12:15.118+03	57
1271	0	0	\N	308	1	0	2022-05-17 12:12:15.119+03	2022-05-17 12:12:15.119+03	57
1272	0	0	\N	309	1	0	2022-05-17 12:12:15.12+03	2022-05-17 12:12:15.12+03	57
1273	0	0	\N	310	1	0	2022-05-17 12:12:15.121+03	2022-05-17 12:12:15.121+03	57
1274	0	0	\N	311	1	0	2022-05-17 12:12:15.122+03	2022-05-17 12:12:15.122+03	57
1275	0	0	\N	312	1	0	2022-05-17 12:12:15.122+03	2022-05-17 12:12:15.122+03	57
1276	0	0	\N	313	1	0	2022-05-17 12:12:15.123+03	2022-05-17 12:12:15.123+03	57
1277	0	0	\N	314	1	0	2022-05-17 12:12:15.124+03	2022-05-17 12:12:15.124+03	57
1278	0	0	\N	315	1	0	2022-05-17 12:12:15.125+03	2022-05-17 12:12:15.125+03	57
1279	0	28.33	\N	316	1	1	2022-05-17 12:12:15.126+03	2022-05-17 12:12:15.126+03	57
1280	0	0	\N	317	1	0	2022-05-17 12:12:15.127+03	2022-05-17 12:12:15.127+03	57
1281	0	0	\N	318	1	0	2022-05-17 12:12:15.127+03	2022-05-17 12:12:15.127+03	57
1282	0	28.33	\N	319	1	1	2022-05-17 12:12:15.128+03	2022-05-17 12:12:15.128+03	57
1283	0	0	\N	320	1	0	2022-05-17 12:12:15.129+03	2022-05-17 12:12:15.129+03	57
1284	0	0	\N	321	1	0	2022-05-17 12:12:15.13+03	2022-05-17 12:12:15.13+03	57
1285	0	0	\N	322	1	0	2022-05-17 12:12:15.131+03	2022-05-17 12:12:15.131+03	57
1286	0	0	\N	323	1	0	2022-05-17 12:12:15.132+03	2022-05-17 12:12:15.132+03	57
1287	0	0	\N	324	1	0	2022-05-17 12:12:15.133+03	2022-05-17 12:12:15.133+03	57
1288	0	0	\N	325	1	0	2022-05-17 12:12:15.134+03	2022-05-17 12:12:15.134+03	57
1289	6	6	\N	326	1	1	2022-05-17 12:12:15.134+03	2022-05-17 12:12:15.134+03	57
1290	4	4	\N	327	1	1	2022-05-17 12:12:15.135+03	2022-05-17 12:12:15.135+03	57
1291	5	5	\N	328	1	1	2022-05-17 12:12:15.136+03	2022-05-17 12:12:15.136+03	57
1292	6	6	\N	329	1	1	2022-05-17 12:12:15.138+03	2022-05-17 12:12:15.138+03	57
1293	0	3	\N	330	1	1	2022-05-17 12:12:15.139+03	2022-05-17 12:12:15.139+03	57
1294	0	0	\N	331	1	0	2022-05-17 12:12:15.141+03	2022-05-17 12:12:15.141+03	57
1295	3	3	\N	332	1	1	2022-05-17 12:12:15.142+03	2022-05-17 12:12:15.142+03	57
\.


--
-- TOC entry 3464 (class 0 OID 17346)
-- Dependencies: 232
-- Data for Name: cath_results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cath_results (id, result, "cathedraId", "createdAt", "updatedAt") FROM stdin;
53	1703	1	2022-05-12 16:49:05.584+03	2022-05-12 16:49:05.584+03
57	1507	1	2022-05-17 12:12:14.762+03	2022-05-17 12:12:14.762+03
\.


--
-- TOC entry 3462 (class 0 OID 17339)
-- Dependencies: 230
-- Data for Name: cath_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cath_types (id, name, "createdAt", "updatedAt") FROM stdin;
1	Отсутствует	2022-04-14 10:50:16.824+03	2022-04-14 10:50:16.824+03
2	Хирургический	2022-04-14 10:50:40.335+03	2022-04-14 10:50:40.335+03
3	Стоматологический	2022-04-14 10:50:57.681+03	2022-04-14 10:50:57.681+03
4	Терапевтический	2022-04-14 10:51:25.924+03	2022-04-14 10:51:25.924+03
5	Паталого-анатомический	2022-04-14 10:51:54.23+03	2022-04-14 10:51:54.23+03
\.


--
-- TOC entry 3442 (class 0 OID 17023)
-- Dependencies: 210
-- Data for Name: cathedras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cathedras (id, name, user_name, "createdAt", "updatedAt", faculty_id, clin_or_teor, cath_type_id, user_id) FROM stdin;
39	Микробиологии, вирусологии, иммунологии	\N	2022-05-16 16:44:50.843+03	2022-05-16 16:44:50.843+03	7	Теоритическая	1	\N
40	Морфологии человека	\N	2022-05-16 16:45:19.738+03	2022-05-16 16:45:19.738+03	3	Теоритическая	1	\N
41	Нервных и нейрохирургических болезней	\N	2022-05-16 16:45:58.769+03	2022-05-16 16:45:58.769+03	4	Клиническая	4	\N
42	Нормальной анатомии	\N	2022-05-16 16:46:25.49+03	2022-05-16 16:46:25.49+03	4	Теоритическая	1	\N
43	Нормальной физиологии	\N	2022-05-16 16:46:52.306+03	2022-05-16 16:46:52.306+03	4	Теоритическая	1	\N
44	Общая врачебная практика	\N	2022-05-16 16:47:22.79+03	2022-05-16 16:47:22.79+03	8	Клиническая	4	\N
3	1-я кафедра внутренних болезней	\N	2022-04-04 10:58:33.821+03	2022-04-14 12:32:28.342+03	2	Клиническая	4	\N
4	1-я кафедра детских болезней	\N	2022-04-04 10:58:49.995+03	2022-04-14 12:33:02.279+03	4	Клиническая	4	\N
5	1-я кафедра терапевтической стоматологии	\N	2022-04-04 10:59:08.529+03	2022-04-14 12:33:33.727+03	3	Клиническая	3	\N
6	1-я кафедра хирургических болезней	\N	2022-04-14 12:51:11.401+03	2022-04-14 12:51:11.401+03	2	Клиническая	2	\N
45	Общей гигиены	\N	2022-05-16 16:47:49.439+03	2022-05-16 16:47:49.439+03	7	Теоритическая	1	\N
46	Общей стоматологии	\N	2022-05-16 16:48:13.024+03	2022-05-16 16:48:13.024+03	3	Клиническая	3	\N
47	Общей химии	\N	2022-05-16 16:48:40.946+03	2022-05-16 16:48:40.946+03	5	Теоритическая	1	\N
2	Фармацевтической химии	\N	2022-04-04 10:58:20.151+03	2022-05-11 11:43:27.844+03	1	Теоритическая	1	\N
8	2-я кафедра внутренних болезней	\N	2022-05-16 16:28:10.507+03	2022-05-16 16:28:10.507+03	2	Клиническая	4	\N
9	2-я кафедра детских болезней	\N	2022-05-16 16:28:46.364+03	2022-05-16 16:28:46.364+03	4	Клиническая	2	\N
10	2-я кафедра терапевтической стоматологии	\N	2022-05-16 16:29:30.88+03	2022-05-16 16:29:30.88+03	3	Клиническая	3	\N
11	2-я кафедра хирургических болезней	\N	2022-05-16 16:29:58.482+03	2022-05-16 16:29:58.482+03	2	Клиническая	2	\N
12	3-я кафедра терапевтической стоматологии	\N	2022-05-16 16:30:42.202+03	2022-05-16 16:30:42.202+03	3	Клиническая	3	\N
13	Акушерства и гинекологии	\N	2022-05-16 16:31:12.642+03	2022-05-16 16:31:12.642+03	4	Клиническая	2	\N
14	Анестезиологии и реаниматологии	\N	2022-05-16 16:31:41.711+03	2022-05-16 16:31:41.711+03	2	Клиническая	2	\N
15	Белорусского и русского языков	\N	2022-05-16 16:32:11.235+03	2022-05-16 16:32:11.235+03	5	Теоритическая	1	\N
16	Биологии	\N	2022-05-16 16:32:45.458+03	2022-05-16 16:32:45.458+03	5	Теоритическая	1	\N
17	Биологической химии	\N	2022-05-16 16:33:17.858+03	2022-05-16 16:33:17.858+03	5	Теоритическая	1	\N
18	Биоорганической химии	\N	2022-05-16 16:33:44.241+03	2022-05-16 16:33:44.241+03	7	Теоритическая	1	\N
19	Болезней уха, горла, носа	\N	2022-05-16 16:34:10.339+03	2022-05-16 16:34:10.339+03	3	Клиническая	2	\N
20	Военно-полевой терапии	\N	2022-05-16 16:34:42.458+03	2022-05-16 16:34:42.458+03	6	Клиническая	4	\N
21	Военно-полевой хирургии	\N	2022-05-16 16:35:19.813+03	2022-05-16 16:35:19.813+03	6	Клиническая	2	\N
22	Военной эпидемиологии и военной гигиены	\N	2022-05-16 16:35:57.998+03	2022-05-16 16:35:57.998+03	6	Теоритическая	1	\N
23	Гигиены детей и подростков	\N	2022-05-16 16:36:40.149+03	2022-05-16 16:36:40.149+03	7	Теоритическая	1	\N
24	Гигиены труда	\N	2022-05-16 16:37:11.67+03	2022-05-16 16:37:11.67+03	7	Теоритическая	1	\N
25	Гистологии, цитологии и эмбриологии	\N	2022-05-16 16:37:35.079+03	2022-05-16 16:37:35.079+03	2	Теоритическая	1	\N
26	Глазных болезней	\N	2022-05-16 16:38:03.728+03	2022-05-16 16:38:03.728+03	4	Клиническая	2	\N
27	Детских инфекционных болезней	\N	2022-05-16 16:38:34.384+03	2022-05-16 16:38:34.384+03	4	Клиническая	4	\N
28	Детской хирургии	\N	2022-05-16 16:38:59.779+03	2022-05-16 16:38:59.779+03	4	Клиническая	2	\N
29	Иностранных языков	\N	2022-05-16 16:39:28.642+03	2022-05-16 16:39:28.642+03	5	Теоритическая	1	\N
30	Инфекционных болезней	\N	2022-05-16 16:40:04.528+03	2022-05-16 16:40:04.528+03	7	Клиническая	4	\N
31	Кардиологии и внутренних болезней	\N	2022-05-16 16:40:32.578+03	2022-05-16 16:40:32.578+03	2	Клиническая	4	\N
32	Клинической фармакологии	\N	2022-05-16 16:40:59.385+03	2022-05-16 16:40:59.385+03	2	Клиническая	4	\N
33	Кожных и венерических болезней	\N	2022-05-16 16:41:38.13+03	2022-05-16 16:41:38.13+03	7	Клиническая	4	\N
34	Лаборатория практического обучения	\N	2022-05-16 16:42:17.082+03	2022-05-16 16:42:17.082+03	4	Теоритическая	1	\N
35	Латинского языка	\N	2022-05-16 16:42:48.132+03	2022-05-16 16:42:48.132+03	5	Теоритическая	1	\N
36	Лучевой диагностики и лучевой терапии	\N	2022-05-16 16:43:17.121+03	2022-05-16 16:43:17.121+03	3	Клиническая	4	\N
37	Медицинской и биологической физики	\N	2022-05-16 16:43:43.137+03	2022-05-16 16:43:43.137+03	5	Теоритическая	1	\N
38	Медицинской реабилитации и физиотерапии	\N	2022-05-16 16:44:13.649+03	2022-05-16 16:44:13.649+03	2	Клиническая	4	\N
48	Общей хирургии	\N	2022-05-16 16:49:06.01+03	2022-05-16 16:49:06.01+03	2	Клиническая	2	\N
49	Общественного здоровья и здравоохранения	\N	2022-05-16 16:49:31.059+03	2022-05-16 16:49:31.059+03	2	Теоритическая	1	\N
50	Онкологии	\N	2022-05-16 16:50:01.016+03	2022-05-16 16:50:01.016+03	2	Клиническая	2	\N
51	Оперативной хирургии и топографической анатомии	\N	2022-05-16 16:50:41.898+03	2022-05-16 16:50:41.898+03	2	Теоритическая	1	\N
52	Организации медицинского обеспечения войск и экстремальной медицины	\N	2022-05-16 16:51:13.975+03	2022-05-16 16:51:13.975+03	6	Теоритическая	1	\N
53	Организации фармации	\N	2022-05-16 16:51:43.879+03	2022-05-16 16:51:43.879+03	1	Теоритическая	1	\N
54	Ортодонтии	\N	2022-05-16 16:52:10.359+03	2022-05-16 16:52:10.359+03	3	Клиническая	3	\N
55	Ортопедической стоматологии	\N	2022-05-16 16:52:34.3+03	2022-05-16 16:52:34.3+03	3	Клиническая	3	\N
56	Патологической анатомии	\N	2022-05-16 16:52:58.351+03	2022-05-16 16:52:58.351+03	4	Клиническая	5	\N
57	Патологической физиологии	\N	2022-05-16 16:53:27.565+03	2022-05-16 16:53:27.565+03	3	Теоритическая	1	\N
58	Поликлинической терапии	\N	2022-05-16 16:53:51.718+03	2022-05-16 16:53:51.718+03	2	Клиническая	4	\N
59	Пропедевтики внутренних болезней	\N	2022-05-16 16:54:15.508+03	2022-05-16 16:54:15.508+03	2	Клиническая	4	\N
60	Пропедевтики детских болезней	\N	2022-05-16 16:54:51.805+03	2022-05-16 16:54:51.805+03	4	Клиническая	4	\N
61	Психиатрии и медицинской психологии	\N	2022-05-17 09:16:56.063+03	2022-05-17 09:16:56.063+03	2	Клиническая	4	\N
62	Радиационной медицины и экологии	\N	2022-05-17 09:17:26.697+03	2022-05-17 09:17:26.697+03	7	Теоритическая	1	\N
63	Стоматологии детского возраста	\N	2022-05-17 09:17:51.424+03	2022-05-17 09:17:51.424+03	3	Клиническая	3	\N
64	Судебной медицины	\N	2022-05-17 09:18:25.834+03	2022-05-17 09:18:25.834+03	4	Клиническая	5	\N
65	Травматологии и ортопедии	\N	2022-05-17 09:19:00.799+03	2022-05-17 09:19:00.799+03	2	Клиническая	2	\N
66	Урологии	\N	2022-05-17 09:19:33.829+03	2022-05-17 09:19:33.829+03	2	Клиническая	2	\N
67	Фармакологии	\N	2022-05-17 09:20:04.854+03	2022-05-17 09:20:04.854+03	3	Теоритическая	1	\N
68	Физического воспитания и спорта	\N	2022-05-17 09:20:38.269+03	2022-05-17 09:20:38.269+03	4	Теоритическая	1	\N
69	Философии и политологии	\N	2022-05-17 09:21:06.393+03	2022-05-17 09:21:06.393+03	2	Теоритическая	1	\N
70	Фтизиопульмонологии	\N	2022-05-17 09:21:35.376+03	2022-05-17 09:21:35.376+03	7	Клиническая	4	\N
71	Хирургической стоматологии	\N	2022-05-17 09:22:00.981+03	2022-05-17 09:22:00.981+03	3	Клиническая	2	\N
72	Челюстно-лицевой хирургии	\N	2022-05-17 09:22:31.156+03	2022-05-17 09:22:31.156+03	3	Клиническая	2	\N
73	Эндокринологии	\N	2022-05-17 09:22:59.938+03	2022-05-17 09:22:59.938+03	2	Клиническая	4	\N
74	Эпидемиологии	\N	2022-05-17 09:23:37.092+03	2022-05-17 09:23:37.092+03	7	Теоритическая	1	\N
1	Фармацевтической технологии	\N	2022-04-04 10:57:55.155+03	2022-05-17 12:46:43.116+03	1	Теоритическая	1	\N
\.


--
-- TOC entry 3468 (class 0 OID 17376)
-- Dependencies: 236
-- Data for Name: colvo_selects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colvo_selects (id, colvo, "select_namesId", ball, "createdAt", "updatedAt", cathedra_id, cath_result_id) FROM stdin;
518	\N	33	\N	2022-05-17 12:12:15.15+03	2022-05-17 12:12:15.15+03	1	57
517	\N	5	\N	2022-05-17 12:12:15.149+03	2022-05-17 12:12:15.149+03	1	57
516	\N	2	\N	2022-05-17 12:12:15.149+03	2022-05-17 12:12:15.149+03	1	57
519	\N	9	\N	2022-05-17 12:12:15.151+03	2022-05-17 12:12:15.151+03	1	57
520	\N	15	\N	2022-05-17 12:12:15.152+03	2022-05-17 12:12:15.152+03	1	57
521	\N	19	\N	2022-05-17 12:12:15.153+03	2022-05-17 12:12:15.153+03	1	57
522	\N	16	\N	2022-05-17 12:12:15.154+03	2022-05-17 12:12:15.154+03	1	57
523	\N	22	\N	2022-05-17 12:12:15.155+03	2022-05-17 12:12:15.155+03	1	57
524	\N	15	\N	2022-05-17 12:12:15.156+03	2022-05-17 12:12:15.156+03	1	57
525	\N	21	\N	2022-05-17 12:12:15.157+03	2022-05-17 12:12:15.157+03	1	57
526	\N	23	\N	2022-05-17 12:12:15.159+03	2022-05-17 12:12:15.159+03	1	57
527	\N	24	\N	2022-05-17 12:12:15.16+03	2022-05-17 12:12:15.16+03	1	57
528	\N	28	\N	2022-05-17 12:12:15.162+03	2022-05-17 12:12:15.162+03	1	57
529	\N	28	\N	2022-05-17 12:12:15.163+03	2022-05-17 12:12:15.163+03	1	57
460	\N	5	\N	2022-05-12 16:49:05.632+03	2022-05-12 16:49:05.632+03	1	53
461	\N	2	\N	2022-05-12 16:49:05.633+03	2022-05-12 16:49:05.633+03	1	53
462	\N	36	\N	2022-05-12 16:49:05.634+03	2022-05-12 16:49:05.634+03	1	53
463	\N	34	\N	2022-05-12 16:49:05.635+03	2022-05-12 16:49:05.635+03	1	53
464	\N	14	\N	2022-05-12 16:49:05.636+03	2022-05-12 16:49:05.636+03	1	53
465	\N	17	\N	2022-05-12 16:49:05.638+03	2022-05-12 16:49:05.638+03	1	53
466	\N	16	\N	2022-05-12 16:49:05.638+03	2022-05-12 16:49:05.638+03	1	53
467	\N	21	\N	2022-05-12 16:49:05.639+03	2022-05-12 16:49:05.639+03	1	53
468	\N	14	\N	2022-05-12 16:49:05.639+03	2022-05-12 16:49:05.639+03	1	53
469	\N	21	\N	2022-05-12 16:49:05.64+03	2022-05-12 16:49:05.64+03	1	53
470	\N	23	\N	2022-05-12 16:49:05.641+03	2022-05-12 16:49:05.641+03	1	53
471	\N	24	\N	2022-05-12 16:49:05.642+03	2022-05-12 16:49:05.642+03	1	53
472	\N	28	\N	2022-05-12 16:49:05.644+03	2022-05-12 16:49:05.644+03	1	53
473	\N	26	\N	2022-05-12 16:49:05.645+03	2022-05-12 16:49:05.645+03	1	53
\.


--
-- TOC entry 3472 (class 0 OID 25548)
-- Dependencies: 240
-- Data for Name: dates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dates (id, "firstDate", "lastDate", "createdAt", "updatedAt") FROM stdin;
1	2022-05-13	2022-05-18	2022-05-05 09:53:48.163+03	2022-05-17 12:08:47.88+03
\.


--
-- TOC entry 3460 (class 0 OID 17325)
-- Dependencies: 228
-- Data for Name: faculties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faculties (id, name, "createdAt", "updatedAt") FROM stdin;
1	Фармацевтический	2022-04-14 10:29:22.952+03	2022-04-14 10:29:22.952+03
2	Лечебный	2022-04-14 10:30:38.608+03	2022-04-14 10:30:38.608+03
3	Стоматологический	2022-04-14 10:31:15.352+03	2022-04-14 10:31:15.352+03
4	Педиатрический	2022-04-14 10:31:51.977+03	2022-04-14 10:31:51.977+03
5	Иностранных учащихся	2022-04-14 10:32:21.959+03	2022-04-14 10:32:21.959+03
6	Военно-медицинский	2022-04-14 10:33:01.165+03	2022-04-14 10:33:01.165+03
7	Медико-профилактический	2022-04-14 10:33:51.874+03	2022-04-14 10:33:51.874+03
8	Повышения квалификации и переподготовки кадров	2022-04-14 10:34:39.393+03	2022-04-14 10:34:39.393+03
9	Профориентации и довузовой подготовки	2022-04-14 10:35:56.197+03	2022-04-14 10:35:56.197+03
\.


--
-- TOC entry 3446 (class 0 OID 17051)
-- Dependencies: 214
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, name, num, ball, help, formula, type, formula_comment, "parentId", "createdAt", "updatedAt", "userId") FROM stdin;
8	УЧЕБНАЯ РАБОТА	1	\N	\N	\N	Сумма	\N	\N	2022-03-31 10:51:37.456+03	2022-03-31 10:51:37.456+03	\N
9	Выполнение педагогической нагрузки, запланированной по кафедре на отчетный период	1.1	\N	\N	\N	Сумма	\N	8	2022-03-31 10:53:02.693+03	2022-03-31 10:53:02.693+03	\N
12	Наличие аттестации на право преподавания на английском языке	1.2	100	\N	\N	Да/Нет	\N	8	2022-03-31 11:01:18.12+03	2022-03-31 11:01:18.12+03	\N
13	УЧЕБНО-МЕТОДИЧЕСКАЯ РАБОТА	2	\N	При наличии более одного учебника, пособия  и т.п. информацию можно вводить в каждое новое поле (появившееся после ввода первоначального). 	\N	Сумма	\N	\N	2022-03-31 11:03:41.978+03	2022-03-31 11:03:41.978+03	\N
18	Возраст	0.1	\N	\N	\N	Список	\N	17	2022-04-01 10:19:25.363+03	2022-04-01 10:19:25.363+03	\N
17	КАДРОВЫЙ СТАТУС РАБОТНИКА	0	\N		\N	Сумма	\N	\N	2022-03-31 14:30:42.943+03	2022-04-07 14:56:17.177+03	\N
21	Врачебная категория	0.7	\N	Выберите категорию из выпадающего списка		Список	\N	17	2022-04-01 10:38:43.001+03	2022-04-07 14:56:41.602+03	\N
22	Исполнение функциональных обязанностей заместителя заведующего кафедрой по учебно-методической работе в учебном году	2.1	100			Да/Нет	\N	13	2022-04-08 10:59:12.757+03	2022-04-08 10:59:12.757+03	\N
15	Учебники, учебное пособие с грифом МО РБ на русском языке	2.2	550	Для каждого учебника, учебного пособия и т.д. в пунктах 2.1 - 2.15 введите количество авторов. (Например 5)	Балл/Ввод < 150 ? 150 : Балл/Ввод	Массив данных	\N	13	2022-03-31 11:09:15.129+03	2022-04-08 12:29:04.407+03	\N
16	Учебники, учебное пособие с грифом МО РБ на английском языке	2.3	1100	\N	Балл/Ввод < 300 ? 300 : Балл/Ввод	Массив данных	\N	13	2022-03-31 11:11:11.179+03	2022-04-08 12:29:46.438+03	\N
11	Суммарное количество учебных часов, выполненных на условиях почасовой оплаты	1.1.2	1	Введите количество часов	Балл*Ввод	Ввод данных	\N	9	2022-03-31 10:59:18.072+03	2022-04-08 12:32:19.708+03	\N
10	Процент выполнения учебной нагрузки согласно индивидуальному плану	1.1.1	1	Введите процент выполнения, количественный показатель без знака%	Балл*Ввод	Ввод данных	\N	9	2022-03-31 10:57:41.404+03	2022-04-08 12:32:41.836+03	\N
28	Ученое звание:	0.6	\N	\N	\N	Список	\N	17	2022-04-08 16:31:21.113+03	2022-04-08 16:31:21.113+03	\N
29	Учебно-методическое пособие с грифом МО РБ на русском языке	2.4	400	\N	Балл/Ввод<120 ? 120 : Балл/Ввод	Массив данных	\N	13	2022-04-13 09:48:17.44+03	2022-04-13 09:48:17.44+03	\N
34	Разработка методических материалов для проведения занятий в лаборатории практического обучения:	2.15	\N	\N	\N	Сумма	\N	13	2022-04-18 11:35:20.12+03	2022-04-18 11:35:20.12+03	\N
35	 на русском языке	2.15.1	50	\N	Балл/Ввод < 20 ?  20 : Балл/Ввод	Массив данных	\N	34	2022-04-18 11:37:34.627+03	2022-04-18 11:38:06.95+03	\N
19	Количество занимаемых ставок	0.2	\N	\N	\N	Список	\N	17	2022-04-01 10:29:45.013+03	2022-04-21 11:52:35.466+03	\N
25	Должность	0.4	\N	\N	\N	Список	\N	17	2022-04-08 11:22:25.32+03	2022-04-25 12:14:38.465+03	\N
20	Совместитель или сотрудник кафедры	0.3	\N	\N	\N	Список	\N	17	2022-04-01 10:33:53.009+03	2022-05-14 15:37:30.873+03	\N
27	Ученая степень:	0.5	\N	\N	\N	Список	\N	17	2022-04-08 15:02:41.125+03	2022-05-14 15:39:20.802+03	\N
38	Учебно-методическое пособие с грифом МО РБ на английском языке	2.5	800	\N	Балл/Ввод < 240 ? 240 : Балл/Ввод	Массив данных	\N	13	2022-05-14 16:00:54.89+03	2022-05-14 16:00:54.89+03	\N
39	Учебно-методическое пособие, учебное (учебно-методическое) издание с грифом УМО на русском языке	2.6	350	\N	Балл/Ввод < 100 ? 100 : Балл/Ввод	Массив данных	\N	13	2022-05-14 16:04:27.909+03	2022-05-14 16:04:27.909+03	\N
40	 Учебно-методическое пособие, учебное (учебно-методическое) издание с грифом УМО на английском языке	2.7	500	\N	Балл/Ввод<150 ? 150 : Балл/Ввод	Массив данных	\N	13	2022-05-14 16:05:48.257+03	2022-05-14 16:05:48.257+03	\N
41	Учебно-методические издания (пособия, практикумы, методические руководства и т.д.)	2.8	50	\N	Балл/Ввод<20 ? 20 : Балл/Ввод	Массив данных	\N	13	2022-05-14 16:10:00.839+03	2022-05-14 16:10:00.839+03	\N
42	Учебно-методические издания на английском языке (пособия, практикумы, методические руководства и т.д.)	2.9	100	\N	Балл/Ввод < 40 ? 40 : Балл/Ввод	Массив данных	\N	13	2022-05-14 16:11:05.548+03	2022-05-14 16:11:05.548+03	\N
43	Образовательный стандарт	2.10	300	\N	Балл/Ввод < 100 ? 100 : Балл/Ввод	Массив данных	\N	13	2022-05-14 16:12:08.417+03	2022-05-14 16:12:08.417+03	\N
44	Типовая учебная программа	2.11	150	\N	Балл/Ввод < 50 ? 50 : Балл/Ввод	Массив данных	\N	13	2022-05-14 16:13:32.129+03	2022-05-14 16:13:32.129+03	\N
47	Учебная программа на русском языке	2.12	100	\N	Балл/Ввод < 20 ? 20 : Балл/Ввод	Массив данных	\N	13	2022-05-14 16:25:23.48+03	2022-05-14 16:25:23.48+03	\N
48	Учебная программа на английском языке	2.13	150	\N	Балл/Ввод < 30 ? 30 : Балл/Ввод	Массив данных	\N	13	2022-05-14 16:41:22.849+03	2022-05-14 16:41:22.849+03	\N
49	Подготовка учебно-программной документации по курсу переподготовки	2.14	250	\N	 Балл/Ввод < 50 ? 50 : Балл/Ввод	Массив данных	\N	13	2022-05-14 16:42:31.287+03	2022-05-14 16:42:31.287+03	\N
50	на английском языке	2.15.2	70	\N	 Балл/Ввод < 30 ? 30 : Балл/Ввод	Массив данных	\N	34	2022-05-14 16:44:41.601+03	2022-05-14 16:44:41.601+03	\N
51	Организация и проведение студенческой олимпиады (в том числе интернет-олимпиады):	2.16	\N	Для пп. 2.16 введите количество в соответствующие строки	\N	Сумма	\N	13	2022-05-14 16:45:37.483+03	2022-05-14 16:45:37.483+03	\N
52	организатор / подготовка команд/ подготовка задач	2.16.1	100	\N	Балл*Ввод	Ввод данных	\N	51	2022-05-14 16:47:29.006+03	2022-05-14 16:47:29.006+03	\N
53	председатель судейской и аппеляционной комиссий	2.16.2	50	\N	Балл*Ввод	Ввод данных	\N	51	2022-05-14 16:48:38.47+03	2022-05-14 16:48:38.47+03	\N
54	член судейской и аппеляционной комиссий	2.16.3	25	\N	Балл*Ввод	Ввод данных	\N	51	2022-05-14 16:49:38.872+03	2022-05-14 16:49:38.872+03	\N
55	техническая поддержка	2.16.4	15	\N	Балл*Ввод	Ввод данных	\N	51	2022-05-14 16:50:34.251+03	2022-05-14 16:50:34.251+03	\N
56	Подготовка команды по видам спорта (для кафедры физического воспитания и спорта)	2.17	\N	\N	\N	Сумма	\N	13	2022-05-14 16:51:03.664+03	2022-05-14 16:51:03.664+03	\N
57	сотрудников	2.17.1	30	\N	Балл*Ввод	Ввод данных	\N	56	2022-05-14 16:51:45.839+03	2022-05-14 16:51:45.839+03	\N
58	студентов	2.17.2	50	\N	Балл*Ввод	Ввод данных	\N	56	2022-05-14 16:52:37.334+03	2022-05-14 16:52:37.334+03	\N
59	Судейство соревнований (для кафедры физического воспитания и спорта)	2.18	\N	\N	\N	Сумма	\N	13	2022-05-14 16:53:21.072+03	2022-05-14 16:53:21.072+03	\N
60	районные, городские	2.18.1	3	\N	Балл*Ввод	Ввод данных	\N	59	2022-05-14 16:54:07.935+03	2022-05-14 16:54:07.935+03	\N
61	республиканские, международные	2.18.2	5	\N	Балл*Ввод	Ввод данных	\N	59	2022-05-14 16:56:09.189+03	2022-05-14 16:56:09.189+03	\N
62	Электронный УМК по дисциплине	2.19	350	\N	 Балл/Ввод<100 ? 100 : Балл/Ввод	Массив данных	\N	13	2022-05-14 16:57:31.996+03	2022-05-14 16:57:31.996+03	\N
63	 Электронный УМК по дисциплине на английском языке	2.20	550	\N	 Балл/Ввод < 150 ? 150 : Балл/Ввод	Массив данных	\N	13	2022-05-16 09:16:46.911+03	2022-05-16 09:16:46.911+03	\N
64	Курс дистанционного обучения	2.21	150	\N	Балл/Ввод < 50 ? 50 : Балл/Ввод	Массив данных	\N	13	2022-05-16 09:18:23.681+03	2022-05-16 09:18:23.681+03	\N
65	 Курс дистанционного обучения на английском языке	2.22	350	\N	Балл/Ввод < 70 ? 70 : Балл/Ввод	Массив данных	\N	13	2022-05-16 09:20:02.4+03	2022-05-16 09:20:02.4+03	\N
66	Проведение вебинара	2.23	20	\N	Балл*Ввод	Ввод данных	\N	13	2022-05-16 09:21:31.585+03	2022-05-16 09:21:31.585+03	\N
67	Награды, звания, премии, поощрения, связанные с образовательной деятельностью и полученные в отчетный период от вышестоящих организаций:	2.24	\N	\N	\N	Сумма	\N	13	2022-05-16 09:22:05.843+03	2022-05-16 09:22:05.843+03	\N
68	ордена	2.24.1	500	\N	Балл*Ввод	Ввод данных	\N	67	2022-05-16 09:23:08.147+03	2022-05-16 09:23:08.147+03	\N
69	медали	2.24.2	300	\N	Балл*Ввод	Ввод данных	\N	67	2022-05-16 09:24:17.564+03	2022-05-16 09:24:17.564+03	\N
70	получение почетной грамоты	2.24.3	100	\N	Балл*Ввод	Ввод данных	\N	67	2022-05-16 09:25:03.5+03	2022-05-16 09:25:03.5+03	\N
71	получение Почетного, нагрудного знака	2.24.4	50	\N	Балл*Ввод	Ввод данных	\N	67	2022-05-16 09:26:02.968+03	2022-05-16 09:26:02.968+03	\N
72	получение Почётного звания	2.24.5	500	\N	Балл*Ввод	Ввод данных	\N	67	2022-05-16 09:33:05.59+03	2022-05-16 09:33:05.59+03	\N
73	присуждение звания Лауреата	2.24.6	300	\N	Балл*Ввод	Ввод данных	\N	67	2022-05-16 09:34:57.118+03	2022-05-16 09:34:57.118+03	\N
74	благодарность	2.24.7	50	\N	Балл*Ввод	Ввод данных	\N	67	2022-05-16 09:50:48.905+03	2022-05-16 09:50:48.905+03	\N
75	Награды, полученные в отчетный период на уровне университета:	2.25	\N	\N	\N	Сумма	\N	13	2022-05-16 09:51:35.026+03	2022-05-16 09:51:35.026+03	\N
76	почетная грамота	2.25.1	80	\N	Балл*Ввод	Ввод данных	\N	75	2022-05-16 09:52:26.63+03	2022-05-16 09:52:26.63+03	\N
78	Благодарность	2.25.2	30	\N	Балл*Ввод	Ввод данных	\N	75	2022-05-16 09:54:17.85+03	2022-05-16 09:54:17.85+03	\N
79	Участие в работе коллегиальных органов	2.26	\N	\N	\N	Сумма	\N	13	2022-05-16 09:55:09.754+03	2022-05-16 09:55:09.754+03	\N
80	председатель	2.26.1	15	\N	Балл*Ввод	Ввод данных	\N	79	2022-05-16 09:56:23.848+03	2022-05-16 09:56:23.848+03	\N
81	секретарь	2.26.2	10	\N	Балл*Ввод	Ввод данных	\N	79	2022-05-16 09:57:02.024+03	2022-05-16 09:57:02.024+03	\N
82	член	2.26.3	5	\N	Балл*Ввод	Ввод данных	\N	79	2022-05-16 09:57:41.179+03	2022-05-16 09:57:41.179+03	\N
83	НАУЧНО-ИССЛЕДОВАТЕЛЬСКАЯ РАБОТА	3	\N	\N	\N	Сумма	\N	\N	2022-05-16 09:58:19.272+03	2022-05-16 09:58:19.272+03	\N
84	Функциональные обязанности в учебном году - заместитель заведующего кафедрой по научной работе	3.1	70	Для пунктов 3.2-3.12 введите количество авторов.	\N	Да/Нет	\N	83	2022-05-16 09:59:24.798+03	2022-05-16 09:59:24.798+03	\N
85	Издание монографий	3.2	500	\N	Балл/Ввод < 100 ? 100 : Балл/Ввод	Массив данных	\N	83	2022-05-16 10:00:47.167+03	2022-05-16 10:00:47.167+03	\N
86	Издание научно-методических пособий, редактирование сборников трудов, размещенных на сайте университета	3.3	300	\N	Балл/Ввод < 50 ? 50 : Балл/Ввод	Массив данных	\N	83	2022-05-16 10:01:54.325+03	2022-05-16 10:01:54.325+03	\N
87	Тезисы, опубликованные в сборнике, который проиндексирован в РИНЦ	3.4	50	\N	Балл/Ввод < 10 ? 10 : Балл/Ввод	Массив данных	\N	83	2022-05-16 10:03:17.151+03	2022-05-16 10:03:17.151+03	\N
88	Статья в научном сборнике, проиндексированном в РИНЦ (международной базе цитирования)	3.5	100	\N	Балл/Ввод < 15 ? 15 : Балл/Ввод	Массив данных	\N	83	2022-05-16 10:04:07.169+03	2022-05-16 10:04:07.169+03	\N
89	Статья в научном сборнике в дальнем зарубежье	3.6	150	\N	Балл/Ввод < 20 ? 20 : Балл/Ввод	Массив данных	\N	83	2022-05-16 10:05:30.305+03	2022-05-16 10:05:30.305+03	\N
90	Статья в научном журнале, входящем в перечень научных изданий РБ, рекомендованных ВАК для опубликования результатов диссертационных исследований	3.7	150	\N	Балл/Ввод < 20 ? 20 : Балл/Ввод	Массив данных	\N	83	2022-05-16 10:07:12.076+03	2022-05-16 10:07:12.076+03	\N
91	Статья в научном журнале, проиндексированном в РИНЦ	3.8	250	\N	Балл/Ввод < 30 ? 30 : Балл/Ввод	Массив данных	\N	83	2022-05-16 10:08:15.779+03	2022-05-16 10:08:15.779+03	\N
92	Статья в научном журнале, проиндексированном международными базами данных SCOPUS и Web of Science	3.9	500	\N	Балл/Ввод < 150 ? 150 : Балл/Ввод	Массив данных	\N	83	2022-05-16 10:09:10.034+03	2022-05-16 10:09:10.034+03	\N
93	Получен патент на изобретение (полезную модель)	3.10	200	\N	Балл/Ввод < 40 ? 40 : Балл/Ввод	Массив данных	\N	83	2022-05-16 10:10:03.282+03	2022-05-16 10:10:03.282+03	\N
94	Рационализаторское предложение	3.11	20	\N	Балл/Ввод < 10 ? 10 : Балл/Ввод	Массив данных	\N	83	2022-05-16 10:11:13.672+03	2022-05-16 10:11:13.672+03	\N
95	Утверждены в отчетном периоде инструкция по применению, клинические протоколы , ССЭТ, ГН, МВИ по результатам выполнения НИОК(Т)Р	3.12	100	\N	Балл/Ввод < 25 ? 25 : Балл/Ввод	Массив данных	\N	83	2022-05-16 10:12:10.418+03	2022-05-16 10:12:10.418+03	\N
96	Участие в финансируемой НИОК(Т)Р:	3.13	\N	В п. 3.13 введите количество участников	\N	Сумма	\N	83	2022-05-16 10:13:10.564+03	2022-05-16 10:13:10.564+03	\N
97	международный научно-исследовательский проект (НИОК(Т)Р)	3.13.1	500	\N	Балл/Ввод < 50 ? 50 : Балл/Ввод	Массив данных	\N	96	2022-05-16 10:14:22.932+03	2022-05-16 10:14:22.932+03	\N
98	научно-исследовательский проект (НИОК(Т)Р) в рамках ГНТП, ОНТП, РНТП, ГПНИ, раздела научного обеспечения ГП, иных программ и проектов, финансируемых из республиканского/местного бюджета и/или инновационных фондов.	3.13.2	300	\N	Балл/Ввод < 30 ? 30 : Балл/Ввод	Массив данных	\N	96	2022-05-16 10:16:11.33+03	2022-05-16 10:16:11.33+03	\N
99	Организация и участие в научно-практических, научно-методических конференциях, семинарах, форумах:	3.14	\N	\N	\N	Сумма	\N	83	2022-05-16 10:16:39.915+03	2022-05-16 10:16:39.915+03	\N
100	председатель и члены оргкомитета	3.14.1	30	Введите количество конференций, семинаров, форумом.	Балл*Ввод	Ввод данных	\N	99	2022-05-16 10:17:42.038+03	2022-05-16 10:17:42.038+03	\N
101	устный доклад	3.14.2	15	В п.3.14.2 - 3.14.3 введите количество авторов	Балл/Ввод < 5 ? 5 : Балл/Ввод	Массив данных	\N	99	2022-05-16 10:18:57.797+03	2022-05-16 10:18:57.797+03	\N
102	стендовый доклад	3.14.3	10	\N	Балл/Ввод < 2 ? 2 : Балл/Ввод	Массив данных	\N	99	2022-05-16 10:19:57.464+03	2022-05-16 10:19:57.464+03	\N
103	Участие в работе коллегиальных органов (советы, комиссии и др. в области научной и научно-технической деятельности):	3.15	\N	Для п.п 3.15.1-3.15.3 введите количество советов  (комиссий), членом которых вы являетесь	\N	Сумма	\N	83	2022-05-16 10:20:48.813+03	2022-05-16 10:20:48.813+03	\N
104	председатель, заместитель председателя	3.15.1	15	\N	Балл*Ввод	Ввод данных	\N	103	2022-05-16 10:21:35.951+03	2022-05-16 10:21:35.951+03	\N
106	Секретарь	3.15.2	10	\N	Балл*Ввод	Ввод данных	\N	103	2022-05-16 10:23:06.01+03	2022-05-16 10:23:06.01+03	\N
107	Член	3.15.3	5	\N	Балл*Ввод	Ввод данных	\N	103	2022-05-16 10:24:01.193+03	2022-05-16 10:24:01.193+03	\N
108	Количество диссертационных работ, защищенных под руководством/ научном консультировании и утвержденных в ВАК в отчетный период:	3.16	\N	Введите количество	\N	Сумма	\N	83	2022-05-16 10:25:09.835+03	2022-05-16 10:25:09.835+03	\N
109	кандидатских	3.16.1	150	\N	Балл*Ввод	Ввод данных	\N	108	2022-05-16 10:25:48.245+03	2022-05-16 10:25:48.245+03	\N
110	докторских	3.16.2	350	\N	Балл*Ввод	Ввод данных	\N	108	2022-05-16 10:26:34.665+03	2022-05-16 10:26:34.665+03	\N
111	Предварительная экспертиза диссертации:	3.17	\N	В п. 3.17 в соответствующую строку введите кол. комиссий и т.д., в состав которых вы входили в качестве председателя, секретаря или члена.	\N	Сумма	\N	83	2022-05-16 10:27:17.284+03	2022-05-16 10:27:17.284+03	\N
112	председатель экспертной комиссии	3.17.1	30	\N	Балл*Ввод	Ввод данных	\N	111	2022-05-16 10:28:06.484+03	2022-05-16 10:28:06.484+03	\N
113	член экспертной комиссии	3.17.2	20	\N	Балл*Ввод	Ввод данных	\N	111	2022-05-16 10:29:01.235+03	2022-05-16 10:29:01.235+03	\N
114	председатель научного собрания	3.17.3	25	\N	Балл*Ввод	Ввод данных	\N	111	2022-05-16 10:29:51.192+03	2022-05-16 10:29:51.192+03	\N
115	секретарь научного собрания	3.17.4	10	\N	Балл*Ввод	Ввод данных	\N	111	2022-05-16 10:30:40.375+03	2022-05-16 10:30:40.375+03	\N
116	Экспертное заключение на диссертацию:	3.18	\N	В п 3.18 введите количество	\N	Сумма	\N	83	2022-05-16 10:31:22.448+03	2022-05-16 10:31:22.448+03	\N
117	докторскую	3.18.1	50	\N	Балл*Ввод	Ввод данных	\N	116	2022-05-16 10:32:07.474+03	2022-05-16 10:32:07.474+03	\N
118	кандидатскую	3.18.2	35	\N	Балл*Ввод	Ввод данных	\N	116	2022-05-16 10:32:57.243+03	2022-05-16 10:32:57.243+03	\N
119	магистерскую	3.18.3	20	\N	Балл*Ввод	Ввод данных	\N	116	2022-05-16 10:33:34.125+03	2022-05-16 10:33:34.125+03	\N
120	 Оппонирование диссертации (внешний отзыв):	3.19	\N	Введите кол.	\N	Сумма	\N	83	2022-05-16 10:34:16.541+03	2022-05-16 10:34:16.541+03	\N
121	докторской	3.19.1	100	\N	Балл*Ввод	Ввод данных	\N	120	2022-05-16 10:35:08.305+03	2022-05-16 10:35:08.305+03	\N
122	кандидатской	3.19.2	70	\N	Балл*Ввод	Ввод данных	\N	120	2022-05-16 10:35:53.357+03	2022-05-16 10:35:53.357+03	\N
123	Рецензирование:	3.20	\N	Введите кол.	\N	Сумма	\N	83	2022-05-16 10:36:58.384+03	2022-05-16 10:36:58.384+03	\N
124	монографии, учебники, учебные пособия, ЭУМК, сборники материалов конференций	3.20.1	50	\N	Балл*Ввод	Ввод данных	\N	123	2022-05-16 10:37:33.727+03	2022-05-16 10:37:33.727+03	\N
125	учебно-методические, научные материалы, научные статьи	3.20.2	40	\N	Балл*Ввод	Ввод данных	\N	123	2022-05-16 10:38:49.36+03	2022-05-16 10:38:49.36+03	\N
126	Руководство в отчетный период:	3.21	\N	Введите кол.	\N	Сумма	\N	83	2022-05-16 10:39:34.255+03	2022-05-16 10:39:34.255+03	\N
127	студенческой научной работой, представленной на Республиканский смотр-конкурс	3.21.1	20	\N	Балл*Ввод	Ввод данных	\N	126	2022-05-16 10:40:47.861+03	2022-05-16 10:40:47.861+03	\N
128	студенческой научной работой, получившей на Республиканском смотр-конкурсе:	3.21.2	\N	\N	\N	Сумма	\N	126	2022-05-16 10:41:18.178+03	2022-05-16 10:41:18.178+03	\N
129	лауреата	3.21.2.1	100	\N	Балл*Ввод	Ввод данных	\N	128	2022-05-16 10:42:35.525+03	2022-05-16 10:42:35.525+03	\N
130	 I категории	3.21.2.2	70	\N	Балл*Ввод	Ввод данных	\N	128	2022-05-16 10:43:35.229+03	2022-05-16 10:43:35.229+03	\N
131	II категории	3.21.2.3	50	\N	Балл*Ввод	Ввод данных	\N	128	2022-05-16 10:44:13.972+03	2022-05-16 10:44:13.972+03	\N
132	 III категории	3.21.2.4	30	\N	Балл*Ввод	Ввод данных	\N	128	2022-05-16 10:45:26.882+03	2022-05-16 10:45:26.882+03	\N
133	Руководство студенческим научным кружком	3.22	50	\N	Балл*Ввод	Ввод данных	\N	83	2022-05-16 11:18:03.329+03	2022-05-16 11:18:03.329+03	\N
134	 Количество совместных публикаций со студентами	3.23	20	\N	Балл*Ввод	Ввод данных	\N	83	2022-05-16 11:31:32.768+03	2022-05-16 11:31:32.768+03	\N
135	Защита диссертации:	3.24	\N	Введите кол.	\N	Сумма	\N	83	2022-05-16 11:32:14.011+03	2022-05-16 11:32:14.011+03	\N
136	 магистерской	3.24.1	25	\N	Балл*Ввод	Ввод данных	\N	135	2022-05-16 11:33:07.779+03	2022-05-16 11:33:07.779+03	\N
138	Кандидатской	3.24.2	150	\N	Балл*Ввод	Ввод данных	\N	135	2022-05-16 11:34:46.359+03	2022-05-16 11:34:46.359+03	\N
140	Докторской	3.24.3	350	\N	Балл*Ввод	Ввод данных	\N	135	2022-05-16 11:35:26.266+03	2022-05-16 11:35:26.266+03	\N
141	Получение ученого звания в отчетный период:	3.25	\N	\N	\N	Сумма	\N	83	2022-05-16 11:36:02.265+03	2022-05-16 11:36:02.265+03	\N
142	доцент	3.25.1	100	\N	Балл*Ввод	Ввод данных	\N	141	2022-05-16 11:36:41.806+03	2022-05-16 11:36:41.806+03	\N
143	 профессор	3.25.2	300	\N	Балл*Ввод	Ввод данных	\N	141	2022-05-16 11:37:11.229+03	2022-05-16 11:37:11.229+03	\N
144	чл.-корр.	3.25.3	400	\N	Балл*Ввод	Ввод данных	\N	141	2022-05-16 11:37:47.012+03	2022-05-16 11:37:47.012+03	\N
145	академик	3.25.4	500	\N	Балл*Ввод	Ввод данных	\N	141	2022-05-16 11:38:22.937+03	2022-05-16 11:38:22.937+03	\N
146	Награды, звания, премии, поощрения, связанные с научной деятельностью и полученные в отчетный период:	3.26	\N	\N	\N	Сумма	\N	83	2022-05-16 11:38:57.29+03	2022-05-16 11:38:57.29+03	\N
147	 орден	3.26.1	500	\N	Балл*Ввод	Ввод данных	\N	146	2022-05-16 11:39:28.414+03	2022-05-16 11:39:28.414+03	\N
149	Медали	3.26.2	300	\N	Балл*Ввод	Ввод данных	\N	146	2022-05-16 11:41:15.607+03	2022-05-16 11:41:15.607+03	\N
150	получение почетной грамоты, научной премии	3.26.3	100	\N	Балл*Ввод	Ввод данных	\N	146	2022-05-16 11:41:56.86+03	2022-05-16 11:41:56.86+03	\N
152	Получение Почетного, нагрудного знака	3.26.4	50	\N	Балл*Ввод	Ввод данных	\N	146	2022-05-16 11:42:58.19+03	2022-05-16 11:42:58.19+03	\N
155	 Благодарность	3.26.7	50	\N	Балл*Ввод	Ввод данных	\N	146	2022-05-16 11:44:41.963+03	2022-05-16 11:44:41.963+03	\N
157	Присуждение звания Лауреата	3.26.6	300	\N	Балл*Ввод	Ввод данных	\N	146	2022-05-16 11:47:05.802+03	2022-05-16 11:47:05.802+03	\N
158	получение Почетного звания (Заслуженный деятель науки и др.)	3.26.5	500	\N	Балл*Ввод	Ввод данных	\N	146	2022-05-16 11:47:51.411+03	2022-05-16 11:47:51.411+03	\N
159	ВОСПИТАТЕЛЬНАЯ, ИДЕОЛОГИЧЕСКАЯ, СПОРТИВНО-МАССОВАЯ И ПРОФОРИЕНТАЦИОННАЯ РАБОТА	4	\N	\N	\N	Сумма	\N	\N	2022-05-16 11:50:15.522+03	2022-05-16 11:50:15.522+03	\N
160	Куратор учебной группы (за 1 группу), с учетом проводимых мероприятий (кол-во семестров):	4.1	\N	Введите количество семестров.	\N	Сумма	\N	159	2022-05-16 11:51:05.027+03	2022-05-16 11:51:05.027+03	\N
161	отечественные студенты	4.1.1	40	\N	Балл*Ввод	Ввод данных	\N	160	2022-05-16 11:51:53.708+03	2022-05-16 11:51:53.708+03	\N
162	иностранные студенты, слушатели	4.1.2	60	Введите количество семестров	Балл*Ввод	Ввод данных	\N	160	2022-05-16 11:52:44.307+03	2022-05-16 11:52:44.307+03	\N
163	Кураторство в общежитии:	4.2	\N	Введите количество проведенных мероприятий	\N	Сумма	\N	159	2022-05-16 11:53:35.847+03	2022-05-16 11:53:35.847+03	\N
164	Отечественные студенты	4.2.1	\N	\N	\N	Сумма	\N	163	2022-05-16 11:54:32.823+03	2022-05-16 11:54:32.823+03	\N
165	количество посещений	4.2.1.1	5	\N	Балл*Ввод	Ввод данных	\N	164	2022-05-16 11:55:32.445+03	2022-05-16 11:55:32.445+03	\N
166	количество проведенных мероприятий	4.2.1.2	9	\N	Балл*Ввод	Ввод данных	\N	164	2022-05-16 11:56:09.268+03	2022-05-16 11:56:09.268+03	\N
168	Иностранные студенты, слушатели	4.2.2	\N	\N	\N	Сумма	\N	163	2022-05-16 11:56:53.727+03	2022-05-16 11:56:53.727+03	\N
170	Количество посещений	4.2.2.1	5	\N	Балл*Ввод	Ввод данных	\N	168	2022-05-16 11:57:44.712+03	2022-05-16 11:57:44.712+03	\N
172	Количество проведенных мероприятий	4.2.2.2	15	\N	Балл*Ввод	Ввод данных	\N	168	2022-05-16 11:58:20.734+03	2022-05-16 11:58:20.734+03	\N
173	Кураторство иностранных землячеств (количество семестров)	4.3	30	Введите количество курируемых землячеств	Балл*Ввод	Ввод данных	\N	159	2022-05-16 11:59:24.962+03	2022-05-16 11:59:24.962+03	\N
174	Работа в общественных организациях , объединениях, клубах, советах, комиссиях (количество семестров)	4.4	\N	В пп. 4.4.1-4.4.3 введите количество семестров	\N	Сумма	\N	159	2022-05-16 12:00:05.707+03	2022-05-16 12:00:05.707+03	\N
176	Председатель	4.4.1	30	\N	Балл*Ввод	Ввод данных	\N	174	2022-05-16 12:00:43.08+03	2022-05-16 12:00:43.08+03	\N
177	актив	4.4.2	15	\N	Балл*Ввод	Ввод данных	\N	174	2022-05-16 12:01:14.908+03	2022-05-16 12:01:14.908+03	\N
178	член (при участии в работе)	4.4.3	5	\N	Балл*Ввод	Ввод данных	\N	174	2022-05-16 12:01:45.738+03	2022-05-16 12:01:45.738+03	\N
179	Выступление в средствах массовой информации	4.5	\N	Введите количество выступлений, публикаций	\N	Сумма	\N	159	2022-05-16 12:02:24.036+03	2022-05-16 12:02:24.036+03	\N
180	выступление	4.5.1	20	\N	Балл*Ввод	Ввод данных	\N	179	2022-05-16 12:02:53.306+03	2022-05-16 12:02:53.306+03	\N
181	публикация	4.5.2	10	Введите количество	Балл*Ввод	Ввод данных	\N	179	2022-05-16 12:03:49.215+03	2022-05-16 12:03:49.215+03	\N
182	Акции, фестивали, мероприятия (за исключением кураторов учебных групп) по направлениям воспитания, проведенные преподавателем:	4.6	\N	Введите количество	\N	Сумма	\N	159	2022-05-16 12:04:34.014+03	2022-05-16 12:04:34.014+03	\N
183	внутривузовское	4.6.1	\N	Введите количество	\N	Сумма	\N	182	2022-05-16 12:05:09.735+03	2022-05-16 12:05:09.735+03	\N
184	до 30 участников	4.6.1.1	20	\N	Балл*Ввод	Ввод данных	\N	183	2022-05-16 12:05:42.441+03	2022-05-16 12:05:42.441+03	\N
185	30-50 участников	4.6.1.2	30	\N	Балл*Ввод	Ввод данных	\N	183	2022-05-16 12:06:17.712+03	2022-05-16 12:06:17.712+03	\N
186	более 50 участников	4.6.1.3	40	\N	Балл*Ввод	Ввод данных	\N	183	2022-05-16 12:06:51.017+03	2022-05-16 12:06:51.017+03	\N
187	 за пределами университета	4.6.2	50	Введите кол-во	Балл*Ввод	Ввод данных	\N	182	2022-05-16 12:07:40.648+03	2022-05-16 12:07:40.648+03	\N
188	Организация и личное участие в конкурсах	4.7	\N	Введите кол-во	\N	Сумма	\N	159	2022-05-16 12:08:19.794+03	2022-05-16 12:08:19.794+03	\N
189	районных	4.7.1	20	\N	Балл*Ввод	Ввод данных	\N	188	2022-05-16 12:08:55.875+03	2022-05-16 12:08:55.875+03	\N
190	городских	4.7.2	30	\N	Балл*Ввод	Ввод данных	\N	188	2022-05-16 12:09:27.921+03	2022-05-16 12:09:27.921+03	\N
191	республиканских	4.7.3	50	\N	Балл*Ввод	Ввод данных	\N	188	2022-05-16 12:10:01.407+03	2022-05-16 12:10:01.407+03	\N
192	Реализация собственных проектов	4.8	50	\N	Балл*Ввод	Ввод данных	\N	159	2022-05-16 12:10:47.601+03	2022-05-16 12:10:47.601+03	\N
193	Проведение конференций, встреч, диспутов, круглых столов	4.9	15	\N	Балл*Ввод	Ввод данных	\N	159	2022-05-16 12:11:19.267+03	2022-05-16 12:11:19.267+03	\N
194	Кураторство волонтерских групп	4.10	20	Введите кол-во семестров	Балл*Ввод	Ввод данных	\N	159	2022-05-16 12:12:16.076+03	2022-05-16 12:12:16.076+03	\N
195	Руководство объединениями по интересам, клубами	4.11	20	\N	Балл*Ввод	Ввод данных	\N	159	2022-05-16 12:12:52.718+03	2022-05-16 12:12:52.718+03	\N
196	Исполнение функциональных обязанностей заместителя заведующего кафедрой по воспитательной работе	4.12	70	\N	\N	Да/Нет	\N	159	2022-05-16 12:13:34.351+03	2022-05-16 12:13:34.351+03	\N
197	Награды, звания, премии, поощрения, связанные с воспитательной и идеологической деятельностью и полученные в отчетный период от вышестоящих организаций:	4.13	\N	Введите кол-во	\N	Сумма	\N	159	2022-05-16 12:14:24.347+03	2022-05-16 12:14:24.347+03	\N
199	Получение почетной грамоты	4.13.1	100	\N	Балл*Ввод	Ввод данных	\N	197	2022-05-16 12:15:16.598+03	2022-05-16 12:15:16.598+03	\N
200	 благодарность	4.13.2	50	\N	Балл*Ввод	Ввод данных	\N	197	2022-05-16 12:17:02.995+03	2022-05-16 12:17:02.995+03	\N
201	Награды, полученные в отчетный период от университета:	4.14	\N	\N	\N	Сумма	\N	159	2022-05-16 12:17:36.826+03	2022-05-16 12:17:36.826+03	\N
203	Почетная грамота	4.14.1	80	\N	Балл*Ввод	Ввод данных	\N	201	2022-05-16 12:18:42.75+03	2022-05-16 12:18:42.75+03	\N
204	благодарность 	4.14.2	40	\N	Балл*Ввод	Ввод данных	\N	201	2022-05-16 12:19:38.78+03	2022-05-16 12:19:38.78+03	\N
205	Работа по созданию музея истории университета:	4.15	\N	\N	\N	Сумма	\N	159	2022-05-16 12:20:12.599+03	2022-05-16 12:20:12.599+03	\N
206	Поиск и передача в фонд музея тематических материалов из профильных государственных учреждений (музеях, архивах, библиотеках) и семейных архивов бывших работников университета (института)	4.15.1	20	Введите количество материалов	Балл*Ввод	Ввод данных	\N	205	2022-05-16 12:21:16.611+03	2022-05-16 12:21:16.611+03	\N
207	Количество обработанных и подготовленных материалов музейного фонда к статистической и виртуальной демонстрации.	4.15.2	15	Введите количество единиц архивных материалов (дел), музейных предметов	Балл*Ввод	Ввод данных	\N	205	2022-05-16 12:22:34.415+03	2022-05-16 12:22:34.415+03	\N
208	Публикация в научной и периодической печати материалов об истории университета (института), кафедры, факультета	4.15.3	25	Введите количество авторов	Балл*Ввод	Ввод данных	\N	205	2022-05-16 12:24:04.414+03	2022-05-16 12:24:04.414+03	\N
209	ЛЕЧЕБНО-ДИАГНОСТИЧЕСКАЯ И КОНСУЛЬТАЦИОННАЯ РАБОТА	5	\N	Для пунктов 5.1 -5.13 введите количество.	\N	Сумма	\N	\N	2022-05-16 12:25:38.976+03	2022-05-16 12:25:38.976+03	\N
210	Лечебно-консультационные выезды:	5.1	\N	\N	\N	Сумма	\N	209	2022-05-16 12:26:41.303+03	2022-05-16 12:26:41.303+03	\N
211	УЗ г. Минска:	5.1.1	5	\N	Балл*Ввод	Ввод данных	\N	210	2022-05-16 12:27:12.557+03	2022-05-16 12:27:12.557+03	\N
212	УЗ областей РБ:	5.1.2	10	\N	Балл*Ввод	Ввод данных	\N	210	2022-05-16 12:27:41.088+03	2022-05-16 12:27:41.088+03	\N
213	Консультация пациента (за исключением консультаций во время клинических обходов):	5.2	\N	\N	\N	Сумма	\N	209	2022-05-16 12:28:15.354+03	2022-05-16 12:28:15.354+03	\N
214	на клинической базе кафедры:	5.2.1	\N	\N	\N	Сумма	\N	213	2022-05-16 12:28:43.975+03	2022-05-16 12:28:43.975+03	\N
215	стационарного пациента	5.2.1.1	1	\N	Балл*Ввод	Ввод данных	\N	214	2022-05-16 12:29:27.349+03	2022-05-16 12:29:27.349+03	\N
216	амбулаторного пациента	5.2.1.2	1	\N	Балл*Ввод	Ввод данных	\N	214	2022-05-16 12:30:21.519+03	2022-05-16 12:30:21.519+03	\N
217	в профессорско-консультационном центре	5.2.2	2	\N	Балл*Ввод	Ввод данных	\N	213	2022-05-16 12:31:04.468+03	2022-05-16 12:31:04.468+03	\N
218	Осмотр (для ППС без степени, для кафедр нестоматологического профиля):	5.3	\N	\N	\N	Сумма	\N	209	2022-05-16 12:31:37.51+03	2022-05-16 12:31:37.51+03	\N
219	Стационарного пациента	5.3.1	0.5	\N	Балл*Ввод	Ввод данных	\N	218	2022-05-16 12:37:14.592+03	2022-05-16 12:37:14.592+03	\N
220	Амбулаторного пациента	5.3.2	0.5	\N	Балл*Ввод	Ввод данных	\N	218	2022-05-16 12:40:05.995+03	2022-05-16 12:40:05.995+03	\N
221	Консилиум	5.4	2	\N	Балл*Ввод	Ввод данных	\N	209	2022-05-16 12:40:54.232+03	2022-05-16 12:40:54.232+03	\N
222	Клинический обход:	5.5	\N	\N	\N	Сумма	\N	209	2022-05-16 12:41:51.023+03	2022-05-16 12:41:51.023+03	\N
223	доцента	5.5.1	10	\N	Балл*Ввод	Ввод данных	\N	222	2022-05-16 12:42:27.338+03	2022-05-16 12:42:27.338+03	\N
224	профессора	5.5.2	15	\N	Балл*Ввод	Ввод данных	\N	222	2022-05-16 12:42:56.382+03	2022-05-16 12:42:56.382+03	\N
225	Лечебно-диагностическая манипуляция:	5.6	\N	\N	\N	Сумма	\N	209	2022-05-16 12:43:22.339+03	2022-05-16 12:43:22.339+03	\N
227	На клинической базе кафедры:	5.6.1	1	\N	Балл*Ввод	Ввод данных	\N	225	2022-05-16 12:44:12.389+03	2022-05-16 12:44:12.389+03	\N
228	в профессорско-консультационном центре:	5.6.2	4	\N	Балл*Ввод	Ввод данных	\N	225	2022-05-16 12:44:50.066+03	2022-05-16 12:44:50.066+03	\N
229	в УЗ г. Минска:	5.6.3	2	\N	Балл*Ввод	Ввод данных	\N	225	2022-05-16 12:45:21.815+03	2022-05-16 12:45:21.815+03	\N
230	в УЗ областей РБ:	5.6.4	2	\N	Балл*Ввод	Ввод данных	\N	225	2022-05-16 12:45:59.021+03	2022-05-16 12:45:59.021+03	\N
231	Хирургическая операция:	5.7	\N	\N	\N	Сумма	\N	209	2022-05-16 12:46:25.492+03	2022-05-16 12:46:25.492+03	\N
234	на клинической базе кафедры:	5.7.1	\N	\N	\N	Сумма	\N	231	2022-05-16 12:50:28.132+03	2022-05-16 12:50:28.132+03	\N
235	с коэффициентом 1,4	5.7.1.1	5	\N	Балл*Ввод	Ввод данных	\N	234	2022-05-16 12:52:13.357+03	2022-05-16 12:52:13.357+03	\N
236	сложная	5.7.1.2	10	\N	Балл*Ввод	Ввод данных	\N	234	2022-05-16 12:52:45.805+03	2022-05-16 12:52:45.805+03	\N
237	высокотехнологичная	5.7.1.3	15	\N	Балл*Ввод	Ввод данных	\N	234	2022-05-16 12:53:18.634+03	2022-05-16 12:53:18.634+03	\N
238	в УЗ г. Минска:	5.7.2	\N	\N	\N	Сумма	\N	231	2022-05-16 13:11:59.558+03	2022-05-16 13:11:59.558+03	\N
239	с коэффициентом 1,4	5.7.2.1	5	\N	Балл*Ввод	Ввод данных	\N	238	2022-05-16 13:12:45.305+03	2022-05-16 13:12:45.305+03	\N
240	сложная	5.7.2.2	10	\N	Балл*Ввод	Ввод данных	\N	238	2022-05-16 13:13:18.216+03	2022-05-16 13:13:18.216+03	\N
241	высокотехнологичная	5.7.2.3	15	\N	Балл*Ввод	Ввод данных	\N	238	2022-05-16 13:13:49.845+03	2022-05-16 13:13:49.845+03	\N
242	в УЗ областей РБ:	5.7.3	\N	\N	\N	Сумма	\N	231	2022-05-16 13:14:33.141+03	2022-05-16 13:14:33.141+03	\N
243	с коэффициентом 1,4	5.7.3.1	10	\N	Балл*Ввод	Ввод данных	\N	242	2022-05-16 13:15:05.182+03	2022-05-16 13:15:05.182+03	\N
244	сложная	5.7.3.2	15	\N	Балл*Ввод	Ввод данных	\N	242	2022-05-16 13:15:35.405+03	2022-05-16 13:15:35.405+03	\N
245	высокотехнологичная	5.7.3.3	20	\N	Балл*Ввод	Ввод данных	\N	242	2022-05-16 13:16:06.391+03	2022-05-16 13:16:06.391+03	\N
246	Экспертная деятельность:	5.8	\N	\N	\N	Сумма	\N	209	2022-05-16 13:16:37.141+03	2022-05-16 13:16:37.141+03	\N
247	экспертиза медицинской карты	5.8.1	\N	\N	\N	Сумма	\N	246	2022-05-16 13:17:05.758+03	2022-05-16 13:17:05.758+03	\N
248	стационарного пациента	5.8.1.1	3	\N	Балл*Ввод	Ввод данных	\N	247	2022-05-16 13:17:42.593+03	2022-05-16 13:17:42.593+03	\N
249	амбулаторного пациента	5.8.1.2	3	\N	Балл*Ввод	Ввод данных	\N	247	2022-05-16 13:18:12.176+03	2022-05-16 13:18:12.176+03	\N
250	заседание мультидисциплинарной бригады	5.8.2	10	\N	Балл*Ввод	Ввод данных	\N	246	2022-05-16 13:18:40.996+03	2022-05-16 13:18:40.996+03	\N
251	клинико-анатомическая конференция:	5.8.3	1	\N	Балл*Ввод	Ввод данных	\N	246	2022-05-16 13:19:11.966+03	2022-05-16 13:19:11.966+03	\N
252	патологоанатомическое исследование:	5.8.4	\N	\N	\N	Сумма	\N	246	2022-05-16 13:19:37.855+03	2022-05-16 13:19:37.855+03	\N
253	операционного и биопсийного материала	5.8.4.1	1	\N	Балл*Ввод	Ввод данных	\N	252	2022-05-16 13:20:08.257+03	2022-05-16 13:20:08.257+03	\N
254	аутопсии	5.8.4.2	3	\N	Балл*Ввод	Ввод данных	\N	252	2022-05-16 13:20:31.801+03	2022-05-16 13:20:31.801+03	\N
255	судебно-медицинская экспертиза:	5.8.5	\N	\N	\N	Сумма	\N	246	2022-05-16 13:20:55.912+03	2022-05-16 13:20:55.912+03	\N
256	трупа	5.8.5.1	5	\N	Балл*Ввод	Ввод данных	\N	255	2022-05-16 13:21:23.926+03	2022-05-16 13:21:23.926+03	\N
257	потерпевшего, подозреваемого, обвиняемого и др.	5.8.5.2	3	\N	Балл*Ввод	Ввод данных	\N	255	2022-05-16 13:21:52.1+03	2022-05-16 13:21:52.1+03	\N
258	материала уголовного и гражданского дела	5.8.5.3	3	\N	Балл*Ввод	Ввод данных	\N	255	2022-05-16 13:22:26.456+03	2022-05-16 13:22:26.456+03	\N
259	 другие виды	5.8.5.4	1	\N	Балл*Ввод	Ввод данных	\N	255	2022-05-16 13:22:53.118+03	2022-05-16 13:22:53.118+03	\N
260	Работа в коллегиальных органах:	5.9	\N	\N	\N	Сумма	\N	209	2022-05-16 13:23:23.466+03	2022-05-16 13:23:23.466+03	\N
261	комиссия по приказу МЗ РБ	5.9.1	10	\N	Балл*Ввод	Ввод данных	\N	260	2022-05-16 13:23:46.876+03	2022-05-16 13:23:46.876+03	\N
262	комиссия Комитета по здравоохранению Минского городского исполнительного комитета	5.9.2	10	\N	Балл*Ввод	Ввод данных	\N	260	2022-05-16 13:24:16.827+03	2022-05-16 13:24:16.827+03	\N
263	комиссия по аттестации врачей	5.9.3	5	\N	Балл*Ввод	Ввод данных	\N	260	2022-05-16 13:24:53.654+03	2022-05-16 13:24:53.654+03	\N
264	комиссия по итоговой аттестации врачей-интернов	5.9.4	5	\N	Балл*Ввод	Ввод данных	\N	260	2022-05-16 13:25:25.795+03	2022-05-16 13:25:25.795+03	\N
265	комиссия по итоговой аттестации клинических ординаторов	5.9.5	5	\N	Балл*Ввод	Ввод данных	\N	260	2022-05-16 13:26:03.975+03	2022-05-16 13:26:03.975+03	\N
266	член ЛКС КЗ Мингорисполкома	5.9.6	5	\N	Балл*Ввод	Ввод данных	\N	260	2022-05-16 13:26:49.401+03	2022-05-16 13:26:49.401+03	\N
267	член ЛКС МЗ РБ	5.9.7	7	\N	Балл*Ввод	Ввод данных	\N	260	2022-05-16 13:27:22.526+03	2022-05-16 13:27:22.526+03	\N
268	член КЗ Мингорисполкома	5.9.8	9	\N	Балл*Ввод	Ввод данных	\N	260	2022-05-16 13:27:53.936+03	2022-05-16 13:27:53.936+03	\N
269	член Коллегии МЗ РБ	5.9.9	11	\N	Балл*Ввод	Ввод данных	\N	260	2022-05-16 13:28:26.591+03	2022-05-16 13:28:26.591+03	\N
270	судебное заседание	5.9.10	5	\N	Балл*Ввод	Ввод данных	\N	260	2022-05-16 13:29:05.822+03	2022-05-16 13:29:05.822+03	\N
271	экспертно-квалификационная комиссия, Совет при Главном государственном судебно-медицинским эксперте РБ	5.9.11	5	\N	Балл*Ввод	Ввод данных	\N	260	2022-05-16 13:29:32.995+03	2022-05-16 13:29:32.995+03	\N
272	коллегия Государственной службы медицинских судебных экспертиз РБ	5.9.12	5	\N	Балл*Ввод	Ввод данных	\N	260	2022-05-16 13:30:07.763+03	2022-05-16 13:30:07.763+03	\N
273	главный внештатный специалист МЗ РБ	5.9.13	50	\N	Балл*Ввод	Ввод данных	\N	260	2022-05-16 13:30:42.541+03	2022-05-16 13:30:42.541+03	\N
274	главный внештатный специалист Комитета по здравоохранению Минского городского исполнительного комитета	5.9.14	25	\N	Балл*Ввод	Ввод данных	\N	260	2022-05-16 13:31:13.379+03	2022-05-16 13:31:13.379+03	\N
275	 куратор административного района г. Минска	5.9.15	50	\N	Балл*Ввод	Ввод данных	\N	260	2022-05-16 13:31:47.01+03	2022-05-16 13:31:47.01+03	\N
276	Пропаганда медицинских знаний:	5.10	\N	\N	\N	Сумма	\N	209	2022-05-16 13:32:21.692+03	2022-05-16 13:32:21.692+03	\N
277	выступление в печати	5.10.1	10	\N	Балл*Ввод	Ввод данных	\N	276	2022-05-16 13:32:54.717+03	2022-05-16 13:32:54.717+03	\N
278	выступления по радио	5.10.2	10	\N	Балл*Ввод	Ввод данных	\N	276	2022-05-16 13:33:50.674+03	2022-05-16 13:33:50.674+03	\N
279	выступления на телевидении	5.10.3	10	\N	Балл*Ввод	Ввод данных	\N	276	2022-05-16 13:34:25.182+03	2022-05-16 13:34:25.182+03	\N
280	лекция для врачей	5.10.4	10	\N	Балл*Ввод	Ввод данных	\N	276	2022-05-16 13:35:02.476+03	2022-05-16 13:35:02.476+03	\N
281	информационный бюллетень	5.10.5	10	\N	Балл*Ввод	Ввод данных	\N	276	2022-05-16 13:35:30.077+03	2022-05-16 13:35:30.077+03	\N
282	Ведение пациентов в стационаре (ведение палаты)	5.11	10	Усредненное ежедневное количество пациентов.	Балл*Ввод	Ввод данных	\N	209	2022-05-16 13:36:12.404+03	2022-05-16 13:36:12.404+03	\N
283	Прием пациентов:	5.12	\N	\N	\N	Сумма	\N	209	2022-05-16 14:44:48.007+03	2022-05-16 14:44:48.007+03	\N
284	всего посещений:	5.12.1	\N	\N	\N	Сумма	\N	283	2022-05-16 14:45:31.358+03	2022-05-16 14:45:31.358+03	\N
285	число первичных посещений	5.12.1.1	1.5	\N	Балл*Ввод	Ввод данных	\N	284	2022-05-16 14:46:32.78+03	2022-05-16 14:46:32.78+03	\N
286	число повторных посещений	5.12.1.2	1	\N	Балл*Ввод	Ввод данных	\N	284	2022-05-16 14:47:15.464+03	2022-05-16 14:47:15.464+03	\N
287	Лечебно-профилактические мероприятия (для кафедр стоматологического профиля):	5.13	\N	\N	\N	Сумма	\N	209	2022-05-16 14:48:03.955+03	2022-05-16 14:48:03.955+03	\N
288	мероприятие по восстановлению морфофункциональной целостности зуба: количество выполненных пломб (реставраций, вкладок, элементов композиционных шин) из расчета на 1 зуб	5.13.1	1.5	\N	Балл*Ввод	Ввод данных	\N	287	2022-05-16 14:50:26.614+03	2022-05-16 14:50:26.614+03	\N
289	законченное эндодонтическое лечение зуба	5.13.2	3	\N	Балл*Ввод	Ввод данных	\N	287	2022-05-16 14:55:50.876+03	2022-05-16 14:55:50.876+03	\N
290	профилактические лечебные мероприятия (в том числе удаление зубных отложений)	5.13.3	1	\N	Балл*Ввод	Ввод данных	\N	287	2022-05-16 14:57:45.585+03	2022-05-16 14:57:45.585+03	\N
291	лечение заболеваний тканей периодонта и слизистой оболочки полости рта	5.13.4	1	\N	Балл*Ввод	Ввод данных	\N	287	2022-05-16 14:58:48.968+03	2022-05-16 14:58:48.968+03	\N
292	ортопедическое лечение с применением несъемных зубных протезов:	5.13.5	\N	\N	\N	Сумма	\N	287	2022-05-16 15:10:23.935+03	2022-05-16 15:10:23.935+03	\N
293	всего единиц в изготовленных цельнокерамических и металлокерамических несъемных зубных протезах	5.13.5.1	5	\N	Балл*Ввод	Ввод данных	\N	292	2022-05-16 15:11:38.529+03	2022-05-16 15:11:38.529+03	\N
294	всего единиц в других несъемных зубных протезах	5.13.5.2	1	\N	Балл*Ввод	Ввод данных	\N	292	2022-05-16 15:12:24.382+03	2022-05-16 15:12:24.382+03	\N
295	ортопедическое лечение с применением съемных зубных протезов (из расчета за 1 изготовленный протез)	5.13.6	5	\N	Балл*Ввод	Ввод данных	\N	287	2022-05-16 15:13:29.798+03	2022-05-16 15:13:29.798+03	\N
296	ортодонтическое лечение с применением специальных лечебных средств/аппаратов	5.13.7	\N	\N	\N	Сумма	\N	287	2022-05-16 15:15:10.007+03	2022-05-16 15:15:10.007+03	\N
297	механических	5.13.7.1	3	\N	Балл*Ввод	Ввод данных	\N	296	2022-05-16 15:16:14.59+03	2022-05-16 15:16:14.59+03	\N
298	мультибондинг система	5.13.7.2	8	\N	Балл*Ввод	Ввод данных	\N	296	2022-05-16 15:17:20.32+03	2022-05-16 15:17:20.32+03	\N
299	функциональных (изготовленных в лабораторных условиях)	5.13.7.3	8	\N	Балл*Ввод	Ввод данных	\N	296	2022-05-16 15:18:10.843+03	2022-05-16 15:18:10.843+03	\N
300	других ортодонтических аппаратов	5.13.7.4	1	\N	Балл*Ввод	Ввод данных	\N	296	2022-05-16 15:21:17.988+03	2022-05-16 15:21:17.988+03	\N
301	удалено зубов	5.13.8	1	\N	Балл*Ввод	Ввод данных	\N	287	2022-05-16 15:23:16.242+03	2022-05-16 15:23:16.242+03	\N
302	проведено дополнительных методов диагностики	5.13.9	0.5	\N	Балл*Ввод	Ввод данных	\N	287	2022-05-16 15:25:58.034+03	2022-05-16 15:25:58.034+03	\N
303	Исполнение функциональных обязанностей заместителя заведующего кафедрой по лечебно-диагностической и консультативной работе	5.14	70	\N	\N	Да/Нет	\N	209	2022-05-16 15:28:19.897+03	2022-05-16 15:28:19.897+03	\N
304	Курация врачей-интернов	5.15	0.5	Введите количество курируемых интернов	Балл*Ввод	Ввод данных	\N	209	2022-05-16 15:30:09.24+03	2022-05-16 15:30:09.24+03	\N
306	ордена	5.16.1	500	\N	Балл*Ввод	Ввод данных	\N	305	2022-05-16 15:45:36.905+03	2022-05-16 15:45:36.905+03	\N
305	Награды, звания, премии, поощрения, связанные с медицинской деятельностью и полученные в отчетный период:	5.16	\N	Введите количество	\N	Сумма	\N	209	2022-05-16 15:44:03.388+03	2022-05-16 15:46:04.027+03	\N
307	медали	5.16.2	300	\N	Балл*Ввод	Ввод данных	\N	305	2022-05-16 15:46:53.042+03	2022-05-16 15:46:53.042+03	\N
308	получение почетной грамоты	5.16.3	100	\N	Балл*Ввод	Ввод данных	\N	305	2022-05-16 15:47:44.427+03	2022-05-16 15:47:44.427+03	\N
309	получение Почетного, нагрудного знака	5.16.4	50	\N	Балл*Ввод	Ввод данных	\N	305	2022-05-16 15:48:36.281+03	2022-05-16 15:48:36.281+03	\N
310	получение Почетного звания	5.16.5	500	\N	Балл*Ввод	Ввод данных	\N	305	2022-05-16 15:49:43.501+03	2022-05-16 15:49:43.501+03	\N
311	присуждение звания Лауреата	5.16.6	300	\N	Балл*Ввод	Ввод данных	\N	305	2022-05-16 15:50:20.5+03	2022-05-16 15:50:20.5+03	\N
312	благодарность	5.16.7	50	\N	Балл*Ввод	Ввод данных	\N	305	2022-05-16 15:51:08.031+03	2022-05-16 15:51:08.031+03	\N
313	Награды, полученные в отчетный период от университета:	5.17	\N	\N	\N	Сумма	\N	209	2022-05-16 15:51:54.947+03	2022-05-16 15:51:54.947+03	\N
314	благодарность	5.17.2	40	\N	Балл*Ввод	Ввод данных	\N	313	2022-05-16 15:53:11.672+03	2022-05-16 15:53:11.672+03	\N
315	почетная грамота	5.17.1	80	\N	Балл*Ввод	Ввод данных	\N	313	2022-05-16 15:53:51.599+03	2022-05-16 15:53:51.599+03	\N
316	Международная работа	6	\N	\N	\N	Сумма	\N	\N	2022-05-16 15:54:28.95+03	2022-05-16 15:54:28.95+03	\N
317	Выполнение совместного образовательного и/или научного проекта в рамках межуниверситетского договора об академическом и научном сотрудничестве	6.1	150	Введите количество проектов	Балл*Ввод	Ввод данных	\N	316	2022-05-16 15:55:46.16+03	2022-05-16 15:55:46.16+03	\N
318	Совместное руководство диссертационным исследованием в рамках межуниверситетского договора об академическом и научном сотрудничестве	6.2	150	\N	Балл*Ввод	Ввод данных	\N	316	2022-05-16 15:56:23.416+03	2022-05-16 15:56:23.416+03	\N
319	Совместная статья в научном журнале, сборнике в рамках межуниверситетского договора об академическом и научном сотрудничестве	6.3	170	В пп.6.3 - 6.4. введите количество авторов	Балл/Ввод < 25 ? 25 : Балл/Ввод	Массив данных	\N	316	2022-05-16 15:58:19.143+03	2022-05-16 15:58:19.143+03	\N
320	Совместные монография / учебник / учебное пособие в рамках межуниверситетского договора об академическом и научном сотрудничестве	6.4	500	\N	Балл/Ввод < 100 ? 100 : Балл/Ввод	Массив данных	\N	316	2022-05-16 15:59:30.053+03	2022-05-16 15:59:30.053+03	\N
321	Организация и проведение практики иностранных студентов на базе кафедры в рамках межуниверситетского договора об академическом и научном сотрудничестве	6.5	150	Введите количество практик	Балл*Ввод	Ввод данных	\N	316	2022-05-16 16:00:32.018+03	2022-05-16 16:00:32.018+03	\N
322	Организация лекционного семинара для профессорско-преподавательского состава, аспирантов, магистрантов, клинических ординаторов и студентов с привлечением иностранных специалистов в рамках межуниверситетского договора об академическом и научном	6.6	100	Введите количество семинаров	Балл*Ввод	Ввод данных	\N	316	2022-05-16 16:01:47.242+03	2022-05-16 16:01:47.242+03	\N
323	Зарубежная стажировка/повышение квалификации в рамках межуниверситетского договора об академическом и научном сотрудничестве	6.7	1	Введите сумарное количество часов	Балл*Ввод	Ввод данных	\N	316	2022-05-16 16:03:14.374+03	2022-05-16 16:03:14.374+03	\N
324	Участие с докладом в зарубежной конференции, семинаре	6.8	30	В пп. 6.8. - 6.9 введите количество	Балл*Ввод	Ввод данных	\N	316	2022-05-16 16:04:12.293+03	2022-05-16 16:04:12.293+03	\N
325	Организация визита иностранной делегации в рамках межуниверситетского договора об академическом и научном сотрудничестве	6.9	50	\N	Балл*Ввод	Ввод данных	\N	316	2022-05-16 16:04:57.818+03	2022-05-16 16:04:57.818+03	\N
326	Индекс Хирша в соответствии с российским индексом научного цитирования (расчет на сайте elibrary.ru)	7	1	\N	Балл*Ввод	Ввод данных	\N	\N	2022-05-16 16:05:45.147+03	2022-05-16 16:05:45.147+03	\N
327	Индекс Хирша в соответствии с наукометрической базой Scopus	8	1	\N	Балл*Ввод	Ввод данных	\N	\N	2022-05-16 16:06:28.548+03	2022-05-16 16:06:28.548+03	\N
328	Количество статей в научном журнале, проиндексированном международными базами данных SCOPUS, опубликованных за текущей отчетный период	9	1	\N	Балл*Ввод	Ввод данных	\N	\N	2022-05-16 16:07:24.075+03	2022-05-16 16:07:24.075+03	\N
329	Количество статей в научном журнале, проиндексированном международными базами данных Web of Science, опубликованных за текущей отчетный период	10	1	\N	Балл*Ввод	Ввод данных	\N	\N	2022-05-16 16:08:00.9+03	2022-05-16 16:08:00.9+03	\N
330	Работа по COVID-19	11	\N	\N	\N	Сумма	\N	\N	2022-05-16 16:08:38.556+03	2022-05-16 16:08:38.556+03	\N
331	Для медико-профилактических кафедр	11.2	1	Введите количество эпидемиологических расследований	Балл*Ввод	Ввод данных	\N	330	2022-05-16 16:10:48.067+03	2022-05-16 16:10:48.067+03	\N
332	Для клинических кафедр	11.1	1	Введите количество дней	Балл*Ввод	Ввод данных	\N	330	2022-05-16 16:13:21.055+03	2022-05-16 16:13:21.055+03	\N
\.


--
-- TOC entry 3458 (class 0 OID 17309)
-- Dependencies: 226
-- Data for Name: massivlocals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.massivlocals (id, value, "userId", "itemId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 3454 (class 0 OID 17255)
-- Dependencies: 222
-- Data for Name: massivs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.massivs (id, value, "userId", "itemId", "createdAt", "updatedAt", result_id) FROM stdin;
81	8	4	35	2022-05-12 16:33:01.479+03	2022-05-12 16:33:01.479+03	44
82	8	4	15	2022-05-12 16:33:01.486+03	2022-05-12 16:33:01.486+03	44
83	8	4	16	2022-05-12 16:33:01.487+03	2022-05-12 16:33:01.487+03	44
84	8	4	29	2022-05-12 16:33:01.489+03	2022-05-12 16:33:01.489+03	44
85	2	4	35	2022-05-12 16:43:38.135+03	2022-05-12 16:43:38.135+03	44
86	6	2	35	2022-05-12 16:49:05.493+03	2022-05-12 16:49:05.493+03	48
87	6	2	16	2022-05-12 16:49:05.495+03	2022-05-12 16:49:05.495+03	48
88	6	2	15	2022-05-12 16:49:05.497+03	2022-05-12 16:49:05.497+03	48
89	6	2	29	2022-05-12 16:49:05.499+03	2022-05-12 16:49:05.499+03	48
92	6	4	35	2022-05-13 12:04:32.127+03	2022-05-13 12:04:32.127+03	52
93	6	4	16	2022-05-13 12:04:32.132+03	2022-05-13 12:04:32.132+03	52
94	6	4	15	2022-05-13 12:04:32.134+03	2022-05-13 12:04:32.134+03	52
95	6	4	29	2022-05-13 12:04:32.137+03	2022-05-13 12:04:32.137+03	52
96	6	4	319	2022-05-17 12:12:14.686+03	2022-05-17 12:12:14.686+03	52
97	4	4	97	2022-05-17 12:12:14.689+03	2022-05-17 12:12:14.689+03	52
98	3	4	87	2022-05-17 12:12:14.692+03	2022-05-17 12:12:14.692+03	52
\.


--
-- TOC entry 3470 (class 0 OID 25538)
-- Dependencies: 238
-- Data for Name: rating_tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rating_tables (id, name, formula, active, "createdAt", "updatedAt") FROM stdin;
2	Фамилия	rat.fullname	t	2022-04-29 09:59:07.051+03	2022-04-29 09:59:07.051+03
3	Ставки	rat.stavka	t	2022-04-29 09:59:55.089+03	2022-04-29 09:59:55.089+03
4	Учебная деят.	rat.uchWork	t	2022-04-29 10:00:54.507+03	2022-04-29 10:00:54.507+03
5	Учебно-мет.деят	rat.uchMetWork	t	2022-04-29 10:01:33.294+03	2022-04-29 10:01:33.294+03
16	Степень	rat.stepen	t	2022-04-29 10:06:24.115+03	2022-04-29 10:06:24.115+03
1	№	rat.id ? rat.id : ''	t	2022-04-29 09:57:51.056+03	2022-05-04 10:13:22.553+03
17	Возраст	rat.age	t	2022-04-29 10:07:00.011+03	2022-05-04 10:14:22.624+03
15	Должность	rat.dolj	t	2022-04-29 10:05:39.916+03	2022-05-14 14:46:18.786+03
6	Науч.-исслед.	rat.nauchWork	t	2022-04-29 10:01:57.985+03	2022-04-29 10:01:57.985+03
7	Воспит. работа	rat.vospitWork	t	2022-04-29 10:02:17.785+03	2022-04-29 10:02:17.785+03
8	Лечебн-диагн.	rat.lechWork	t	2022-04-29 10:02:43.249+03	2022-04-29 10:02:43.249+03
9	Международная работа	rat.mejWork	t	2022-04-29 10:03:02.091+03	2022-04-29 10:03:02.091+03
11	Индекс Хирша (SCOPUS)	rat.indXirshScop	t	2022-04-29 10:03:55.206+03	2022-04-29 10:03:55.206+03
12	Кол-во статей (SCOPUS)	rat.colvoScop	t	2022-04-29 10:04:14.662+03	2022-04-29 10:04:14.662+03
13	Кол-во статей (Web of Science)	rat.colvoWoS	t	2022-04-29 10:04:35.694+03	2022-04-29 10:04:35.694+03
14	Работа по COVID-19	rat.covidWork	t	2022-04-29 10:04:53.729+03	2022-05-04 10:13:31.272+03
10	Индекс Хирша	rat.indXirsh	t	2022-04-29 10:03:24.425+03	2022-05-17 14:18:48.574+03
\.


--
-- TOC entry 3456 (class 0 OID 17297)
-- Dependencies: 224
-- Data for Name: reportlocals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reportlocals (id, value, ball_value, selectvalue, "itemId", "resultId", "createdAt", "updatedAt", "userId") FROM stdin;
\.


--
-- TOC entry 3450 (class 0 OID 17076)
-- Dependencies: 218
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reports (id, value, ball_value, "createdAt", "updatedAt", "userId", "itemId", "resultId", selectvalue, cathedra_id) FROM stdin;
684	\N	0	2022-05-12 16:33:01.313+03	2022-05-12 16:43:37.954+03	4	18	44	Более 60 лет	1
685	\N	25	2022-05-12 16:33:01.317+03	2022-05-12 16:43:37.957+03	4	17	44	\N	1
686	\N	25	2022-05-12 16:33:01.318+03	2022-05-12 16:43:37.961+03	4	21	44	первая	1
687	\N	0	2022-05-12 16:33:01.319+03	2022-05-12 16:43:37.963+03	4	19	44	1.25	1
688	\N	110	2022-05-12 16:33:01.32+03	2022-05-12 16:43:37.973+03	4	8	44	\N	1
689	\N	0	2022-05-12 16:33:01.321+03	2022-05-12 16:43:37.976+03	4	20	44	Внешний	1
691	\N	0	2022-05-12 16:33:01.347+03	2022-05-12 16:43:37.995+03	4	27	44	степень магистра	1
692	\N	\N	2022-05-12 16:33:01.347+03	2022-05-12 16:43:37.998+03	4	9	44	\N	1
690	\N	0	2022-05-12 16:33:01.344+03	2022-05-12 16:43:38+03	4	25	44	заведующий кафедрой	1
693	\N	0	2022-05-12 16:33:01.351+03	2022-05-12 16:43:38.001+03	4	28	44	академик	1
694	5	5	2022-05-12 16:33:01.352+03	2022-05-12 16:43:38.015+03	4	10	44	\N	1
695	5	5	2022-05-12 16:33:01.355+03	2022-05-12 16:43:38.046+03	4	11	44	\N	1
696	\N	715	2022-05-12 16:33:01.367+03	2022-05-12 16:43:38.048+03	4	13	44	\N	1
697	\N	100	2022-05-12 16:33:01.37+03	2022-05-12 16:43:38.049+03	4	12	44	\N	1
698	\N	100	2022-05-12 16:33:01.4+03	2022-05-12 16:43:38.05+03	4	22	44	\N	1
700	\N	45	2022-05-12 16:33:01.402+03	2022-05-12 16:43:38.051+03	4	35	44	\N	1
701	\N	150	2022-05-12 16:33:01.402+03	2022-05-12 16:43:38.052+03	4	15	44	\N	1
699	\N	\N	2022-05-12 16:33:01.401+03	2022-05-12 16:43:38.118+03	4	34	44	\N	1
702	\N	300	2022-05-12 16:33:01.403+03	2022-05-12 16:43:38.122+03	4	16	44	\N	1
703	\N	120	2022-05-12 16:33:01.403+03	2022-05-12 16:43:38.132+03	4	29	44	\N	1
704	\N	0	2022-05-12 16:49:05.315+03	2022-05-12 16:49:05.315+03	2	27	48	кандидат наук	1
705	\N	50	2022-05-12 16:49:05.318+03	2022-05-12 16:49:05.318+03	2	17	48	\N	1
706	\N	0	2022-05-12 16:49:05.32+03	2022-05-12 16:49:05.32+03	2	18	48	30-40 лет	1
707	\N	50	2022-05-12 16:49:05.321+03	2022-05-12 16:49:05.321+03	2	21	48	высшая	1
708	\N	0	2022-05-12 16:49:05.322+03	2022-05-12 16:49:05.322+03	2	28	48	профессор	1
709	\N	0	2022-05-12 16:49:05.323+03	2022-05-12 16:49:05.323+03	2	19	48	0.5	1
710	\N	113	2022-05-12 16:49:05.344+03	2022-05-12 16:49:05.344+03	2	8	48	\N	1
711	\N	0	2022-05-12 16:49:05.347+03	2022-05-12 16:49:05.347+03	2	20	48	Внешний	1
712	\N	\N	2022-05-12 16:49:05.353+03	2022-05-12 16:49:05.353+03	2	9	48	\N	1
713	7	7	2022-05-12 16:49:05.355+03	2022-05-12 16:49:05.355+03	2	10	48	\N	1
714	\N	0	2022-05-12 16:49:05.356+03	2022-05-12 16:49:05.356+03	2	25	48	заведующий кафедрой	1
715	6	6	2022-05-12 16:49:05.357+03	2022-05-12 16:49:05.357+03	2	11	48	\N	1
716	\N	100	2022-05-12 16:49:05.368+03	2022-05-12 16:49:05.368+03	2	12	48	\N	1
717	\N	690	2022-05-12 16:49:05.371+03	2022-05-12 16:49:05.371+03	2	13	48	\N	1
718	\N	100	2022-05-12 16:49:05.404+03	2022-05-12 16:49:05.404+03	2	22	48	\N	1
719	\N	\N	2022-05-12 16:49:05.405+03	2022-05-12 16:49:05.405+03	2	34	48	\N	1
720	\N	20	2022-05-12 16:49:05.406+03	2022-05-12 16:49:05.406+03	2	35	48	\N	1
721	\N	150	2022-05-12 16:49:05.406+03	2022-05-12 16:49:05.406+03	2	15	48	\N	1
722	\N	300	2022-05-12 16:49:05.407+03	2022-05-12 16:49:05.407+03	2	16	48	\N	1
723	\N	120	2022-05-12 16:49:05.407+03	2022-05-12 16:49:05.407+03	2	29	48	\N	1
724	\N	\N	2022-05-13 10:21:46.172+03	2022-05-13 10:21:46.172+03	2	11	49	\N	1
725	\N	0	2022-05-13 10:21:46.174+03	2022-05-13 10:21:46.174+03	2	17	49	\N	1
726	\N	100	2022-05-13 10:21:46.176+03	2022-05-13 10:21:46.176+03	2	12	49	\N	1
727	\N	0	2022-05-13 10:21:46.177+03	2022-05-13 10:21:46.177+03	2	19	49	0.25	1
728	\N	100	2022-05-13 10:21:46.179+03	2022-05-13 10:21:46.179+03	2	13	49	\N	1
729	\N	0	2022-05-13 10:21:46.18+03	2022-05-13 10:21:46.18+03	2	18	49	30-40 лет	1
730	\N	100	2022-05-13 10:21:46.203+03	2022-05-13 10:21:46.203+03	2	22	49	\N	1
731	\N	0	2022-05-13 10:21:46.208+03	2022-05-13 10:21:46.208+03	2	20	49	Сотрудник кафедры	1
732	\N	0	2022-05-13 10:21:46.215+03	2022-05-13 10:21:46.215+03	2	25	49	профессор	1
733	\N	0	2022-05-13 10:21:46.22+03	2022-05-13 10:21:46.22+03	2	27	49	степень магистра	1
734	\N	\N	2022-05-13 10:21:46.222+03	2022-05-13 10:21:46.222+03	2	34	49	\N	1
735	\N	\N	2022-05-13 10:21:46.232+03	2022-05-13 10:21:46.232+03	2	35	49	\N	1
736	\N	0	2022-05-13 10:21:46.239+03	2022-05-13 10:21:46.239+03	2	28	49	академик	1
737	\N	\N	2022-05-13 10:21:46.273+03	2022-05-13 10:21:46.273+03	2	15	49	\N	1
738	\N	\N	2022-05-13 10:21:46.277+03	2022-05-13 10:21:46.277+03	2	16	49	\N	1
739	\N	0	2022-05-13 10:21:46.28+03	2022-05-13 10:21:46.28+03	2	21	49	нет	1
740	\N	100	2022-05-13 10:21:46.281+03	2022-05-13 10:21:46.281+03	2	8	49	\N	1
741	\N	\N	2022-05-13 10:21:46.282+03	2022-05-13 10:21:46.282+03	2	29	49	\N	1
742	\N	\N	2022-05-13 10:21:46.352+03	2022-05-13 10:21:46.352+03	2	9	49	\N	1
743	\N	\N	2022-05-13 10:21:46.379+03	2022-05-13 10:21:46.379+03	2	10	49	\N	1
784	\N	\N	2022-05-17 12:12:13.073+03	2022-05-17 12:12:13.073+03	4	38	52	\N	1
785	\N	\N	2022-05-17 12:12:13.077+03	2022-05-17 12:12:13.077+03	4	51	52	\N	1
786	\N	\N	2022-05-17 12:12:13.079+03	2022-05-17 12:12:13.079+03	4	41	52	\N	1
787	\N	\N	2022-05-17 12:12:13.08+03	2022-05-17 12:12:13.08+03	4	39	52	\N	1
788	\N	\N	2022-05-17 12:12:13.082+03	2022-05-17 12:12:13.082+03	4	53	52	\N	1
789	\N	\N	2022-05-17 12:12:13.083+03	2022-05-17 12:12:13.083+03	4	52	52	\N	1
790	\N	\N	2022-05-17 12:12:13.108+03	2022-05-17 12:12:13.108+03	4	42	52	\N	1
791	\N	\N	2022-05-17 12:12:13.113+03	2022-05-17 12:12:13.113+03	4	40	52	\N	1
792	\N	\N	2022-05-17 12:12:13.118+03	2022-05-17 12:12:13.118+03	4	54	52	\N	1
793	\N	\N	2022-05-17 12:12:13.12+03	2022-05-17 12:12:13.12+03	4	43	52	\N	1
794	\N	\N	2022-05-17 12:12:13.128+03	2022-05-17 12:12:13.128+03	4	55	52	\N	1
795	\N	\N	2022-05-17 12:12:13.13+03	2022-05-17 12:12:13.13+03	4	56	52	\N	1
796	\N	\N	2022-05-17 12:12:13.137+03	2022-05-17 12:12:13.137+03	4	44	52	\N	1
797	\N	\N	2022-05-17 12:12:13.174+03	2022-05-17 12:12:13.174+03	4	57	52	\N	1
798	\N	\N	2022-05-17 12:12:13.176+03	2022-05-17 12:12:13.176+03	4	47	52	\N	1
799	\N	\N	2022-05-17 12:12:13.177+03	2022-05-17 12:12:13.177+03	4	48	52	\N	1
800	\N	\N	2022-05-17 12:12:13.178+03	2022-05-17 12:12:13.178+03	4	58	52	\N	1
801	\N	\N	2022-05-17 12:12:13.179+03	2022-05-17 12:12:13.179+03	4	49	52	\N	1
802	\N	\N	2022-05-17 12:12:13.18+03	2022-05-17 12:12:13.18+03	4	59	52	\N	1
803	\N	\N	2022-05-17 12:12:13.261+03	2022-05-17 12:12:13.261+03	4	50	52	\N	1
804	\N	\N	2022-05-17 12:12:13.265+03	2022-05-17 12:12:13.265+03	4	60	52	\N	1
805	\N	\N	2022-05-17 12:12:13.284+03	2022-05-17 12:12:13.284+03	4	61	52	\N	1
806	\N	\N	2022-05-17 12:12:13.289+03	2022-05-17 12:12:13.289+03	4	62	52	\N	1
807	\N	\N	2022-05-17 12:12:13.293+03	2022-05-17 12:12:13.293+03	4	64	52	\N	1
808	\N	\N	2022-05-17 12:12:13.295+03	2022-05-17 12:12:13.295+03	4	65	52	\N	1
809	\N	\N	2022-05-17 12:12:13.297+03	2022-05-17 12:12:13.297+03	4	63	52	\N	1
810	\N	\N	2022-05-17 12:12:13.299+03	2022-05-17 12:12:13.299+03	4	66	52	\N	1
811	\N	\N	2022-05-17 12:12:13.32+03	2022-05-17 12:12:13.32+03	4	69	52	\N	1
812	\N	\N	2022-05-17 12:12:13.323+03	2022-05-17 12:12:13.323+03	4	68	52	\N	1
813	\N	\N	2022-05-17 12:12:13.325+03	2022-05-17 12:12:13.325+03	4	67	52	\N	1
814	\N	\N	2022-05-17 12:12:13.328+03	2022-05-17 12:12:13.328+03	4	71	52	\N	1
815	\N	\N	2022-05-17 12:12:13.33+03	2022-05-17 12:12:13.33+03	4	72	52	\N	1
816	\N	\N	2022-05-17 12:12:13.332+03	2022-05-17 12:12:13.332+03	4	70	52	\N	1
817	\N	\N	2022-05-17 12:12:13.343+03	2022-05-17 12:12:13.343+03	4	73	52	\N	1
818	\N	\N	2022-05-17 12:12:13.354+03	2022-05-17 12:12:13.354+03	4	78	52	\N	1
819	\N	\N	2022-05-17 12:12:13.356+03	2022-05-17 12:12:13.356+03	4	74	52	\N	1
820	\N	\N	2022-05-17 12:12:13.359+03	2022-05-17 12:12:13.359+03	4	76	52	\N	1
821	\N	\N	2022-05-17 12:12:13.361+03	2022-05-17 12:12:13.361+03	4	79	52	\N	1
822	\N	\N	2022-05-17 12:12:13.363+03	2022-05-17 12:12:13.363+03	4	75	52	\N	1
823	\N	\N	2022-05-17 12:12:13.367+03	2022-05-17 12:12:13.367+03	4	80	52	\N	1
824	\N	\N	2022-05-17 12:12:13.383+03	2022-05-17 12:12:13.383+03	4	84	52	\N	1
825	\N	\N	2022-05-17 12:12:13.385+03	2022-05-17 12:12:13.385+03	4	81	52	\N	1
826	\N	\N	2022-05-17 12:12:13.387+03	2022-05-17 12:12:13.387+03	4	82	52	\N	1
827	\N	181.67	2022-05-17 12:12:13.389+03	2022-05-17 12:12:13.389+03	4	83	52	\N	1
828	\N	\N	2022-05-17 12:12:13.392+03	2022-05-17 12:12:13.392+03	4	86	52	\N	1
829	\N	\N	2022-05-17 12:12:13.394+03	2022-05-17 12:12:13.394+03	4	85	52	\N	1
830	\N	16.67	2022-05-17 12:12:13.406+03	2022-05-17 12:12:13.406+03	4	87	52	\N	1
831	\N	\N	2022-05-17 12:12:13.416+03	2022-05-17 12:12:13.416+03	4	88	52	\N	1
832	\N	\N	2022-05-17 12:12:13.418+03	2022-05-17 12:12:13.418+03	4	89	52	\N	1
833	\N	\N	2022-05-17 12:12:13.42+03	2022-05-17 12:12:13.42+03	4	91	52	\N	1
834	\N	\N	2022-05-17 12:12:13.423+03	2022-05-17 12:12:13.423+03	4	90	52	\N	1
835	\N	\N	2022-05-17 12:12:13.426+03	2022-05-17 12:12:13.426+03	4	92	52	\N	1
836	\N	\N	2022-05-17 12:12:13.43+03	2022-05-17 12:12:13.43+03	4	93	52	\N	1
837	\N	\N	2022-05-17 12:12:13.447+03	2022-05-17 12:12:13.447+03	4	94	52	\N	1
765	\N	0	2022-05-13 12:04:31.96+03	2022-05-17 12:12:14.621+03	4	28	52	академик	1
767	\N	0	2022-05-13 12:04:31.963+03	2022-05-17 12:12:14.623+03	4	18	52	Более 60 лет	1
764	\N	50	2022-05-13 12:04:31.957+03	2022-05-17 12:12:14.625+03	4	17	52	\N	1
766	\N	50	2022-05-13 12:04:31.962+03	2022-05-17 12:12:14.627+03	4	21	52	высшая	1
770	\N	\N	2022-05-13 12:04:31.984+03	2022-05-17 12:12:14.628+03	4	9	52	\N	1
768	\N	0	2022-05-13 12:04:31.963+03	2022-05-17 12:12:14.63+03	4	20	52	Сотрудник кафедры	1
771	\N	0	2022-05-13 12:04:31.987+03	2022-05-17 12:12:14.642+03	4	19	52	1	1
772	4	4	2022-05-13 12:04:31.99+03	2022-05-17 12:12:14.644+03	4	10	52	\N	1
769	\N	108	2022-05-13 12:04:31.964+03	2022-05-17 12:12:14.645+03	4	8	52	\N	1
773	\N	0	2022-05-13 12:04:31.993+03	2022-05-17 12:12:14.647+03	4	25	52	заведующий кафедрой	1
774	\N	0	2022-05-13 12:04:31.994+03	2022-05-17 12:12:14.648+03	4	27	52	кандидат наук	1
775	4	4	2022-05-13 12:04:31.995+03	2022-05-17 12:12:14.649+03	4	11	52	\N	1
776	\N	100	2022-05-13 12:04:32.008+03	2022-05-17 12:12:14.658+03	4	12	52	\N	1
778	\N	100	2022-05-13 12:04:32.041+03	2022-05-17 12:12:14.665+03	4	22	52	\N	1
781	\N	150	2022-05-13 12:04:32.046+03	2022-05-17 12:12:14.667+03	4	15	52	\N	1
779	\N	\N	2022-05-13 12:04:32.043+03	2022-05-17 12:12:14.668+03	4	34	52	\N	1
777	\N	690	2022-05-13 12:04:32.011+03	2022-05-17 12:12:14.67+03	4	13	52	\N	1
780	\N	20	2022-05-13 12:04:32.044+03	2022-05-17 12:12:14.671+03	4	35	52	\N	1
782	\N	300	2022-05-13 12:04:32.047+03	2022-05-17 12:12:14.673+03	4	16	52	\N	1
783	\N	120	2022-05-13 12:04:32.048+03	2022-05-17 12:12:14.688+03	4	29	52	\N	1
838	\N	\N	2022-05-17 12:12:13.449+03	2022-05-17 12:12:13.449+03	4	96	52	\N	1
839	\N	125	2022-05-17 12:12:13.453+03	2022-05-17 12:12:13.453+03	4	97	52	\N	1
848	\N	\N	2022-05-17 12:12:13.503+03	2022-05-17 12:12:13.503+03	4	106	52	\N	1
849	\N	\N	2022-05-17 12:12:13.512+03	2022-05-17 12:12:13.512+03	4	107	52	\N	1
850	\N	\N	2022-05-17 12:12:13.521+03	2022-05-17 12:12:13.521+03	4	108	52	\N	1
851	\N	\N	2022-05-17 12:12:13.533+03	2022-05-17 12:12:13.533+03	4	112	52	\N	1
926	\N	\N	2022-05-17 12:12:13.927+03	2022-05-17 12:12:13.927+03	4	194	52	\N	1
930	\N	\N	2022-05-17 12:12:13.958+03	2022-05-17 12:12:13.958+03	4	199	52	\N	1
932	\N	\N	2022-05-17 12:12:13.966+03	2022-05-17 12:12:13.966+03	4	204	52	\N	1
940	\N	\N	2022-05-17 12:12:14.005+03	2022-05-17 12:12:14.005+03	4	211	52	\N	1
941	\N	\N	2022-05-17 12:12:14.014+03	2022-05-17 12:12:14.014+03	4	212	52	\N	1
945	\N	\N	2022-05-17 12:12:14.037+03	2022-05-17 12:12:14.037+03	4	216	52	\N	1
948	\N	\N	2022-05-17 12:12:14.046+03	2022-05-17 12:12:14.046+03	4	219	52	\N	1
951	\N	\N	2022-05-17 12:12:14.064+03	2022-05-17 12:12:14.064+03	4	221	52	\N	1
953	\N	\N	2022-05-17 12:12:14.071+03	2022-05-17 12:12:14.071+03	4	224	52	\N	1
961	\N	\N	2022-05-17 12:12:14.106+03	2022-05-17 12:12:14.106+03	4	231	52	\N	1
962	\N	\N	2022-05-17 12:12:14.113+03	2022-05-17 12:12:14.113+03	4	236	52	\N	1
963	\N	\N	2022-05-17 12:12:14.116+03	2022-05-17 12:12:14.116+03	4	237	52	\N	1
966	\N	\N	2022-05-17 12:12:14.133+03	2022-05-17 12:12:14.133+03	4	239	52	\N	1
973	\N	\N	2022-05-17 12:12:14.163+03	2022-05-17 12:12:14.163+03	4	248	52	\N	1
975	\N	\N	2022-05-17 12:12:14.168+03	2022-05-17 12:12:14.168+03	4	250	52	\N	1
978	\N	\N	2022-05-17 12:12:14.187+03	2022-05-17 12:12:14.187+03	4	253	52	\N	1
981	\N	\N	2022-05-17 12:12:14.196+03	2022-05-17 12:12:14.196+03	4	255	52	\N	1
984	\N	\N	2022-05-17 12:12:14.212+03	2022-05-17 12:12:14.212+03	4	257	52	\N	1
987	\N	\N	2022-05-17 12:12:14.222+03	2022-05-17 12:12:14.222+03	4	262	52	\N	1
990	\N	\N	2022-05-17 12:12:14.238+03	2022-05-17 12:12:14.238+03	4	264	52	\N	1
993	\N	\N	2022-05-17 12:12:14.247+03	2022-05-17 12:12:14.247+03	4	266	52	\N	1
996	\N	\N	2022-05-17 12:12:14.264+03	2022-05-17 12:12:14.264+03	4	271	52	\N	1
999	\N	\N	2022-05-17 12:12:14.279+03	2022-05-17 12:12:14.279+03	4	273	52	\N	1
1002	\N	\N	2022-05-17 12:12:14.3+03	2022-05-17 12:12:14.3+03	4	277	52	\N	1
1004	\N	\N	2022-05-17 12:12:14.313+03	2022-05-17 12:12:14.313+03	4	279	52	\N	1
1012	\N	\N	2022-05-17 12:12:14.353+03	2022-05-17 12:12:14.353+03	4	285	52	\N	1
1013	\N	\N	2022-05-17 12:12:14.361+03	2022-05-17 12:12:14.361+03	4	287	52	\N	1
1015	\N	\N	2022-05-17 12:12:14.367+03	2022-05-17 12:12:14.367+03	4	289	52	\N	1
1016	\N	\N	2022-05-17 12:12:14.377+03	2022-05-17 12:12:14.377+03	4	290	52	\N	1
1021	\N	\N	2022-05-17 12:12:14.393+03	2022-05-17 12:12:14.393+03	4	293	52	\N	1
1022	\N	\N	2022-05-17 12:12:14.404+03	2022-05-17 12:12:14.404+03	4	298	52	\N	1
1027	\N	\N	2022-05-17 12:12:14.423+03	2022-05-17 12:12:14.423+03	4	300	52	\N	1
1028	\N	\N	2022-05-17 12:12:14.433+03	2022-05-17 12:12:14.433+03	4	303	52	\N	1
1033	\N	\N	2022-05-17 12:12:14.451+03	2022-05-17 12:12:14.451+03	4	305	52	\N	1
1034	\N	\N	2022-05-17 12:12:14.462+03	2022-05-17 12:12:14.462+03	4	308	52	\N	1
1039	\N	\N	2022-05-17 12:12:14.486+03	2022-05-17 12:12:14.486+03	4	311	52	\N	1
1040	\N	\N	2022-05-17 12:12:14.501+03	2022-05-17 12:12:14.501+03	4	315	52	\N	1
1045	\N	\N	2022-05-17 12:12:14.52+03	2022-05-17 12:12:14.52+03	4	318	52	\N	1
1046	\N	\N	2022-05-17 12:12:14.528+03	2022-05-17 12:12:14.528+03	4	321	52	\N	1
1051	\N	\N	2022-05-17 12:12:14.546+03	2022-05-17 12:12:14.546+03	4	324	52	\N	1
1052	6	6	2022-05-17 12:12:14.555+03	2022-05-17 12:12:14.555+03	4	326	52	\N	1
1057	3	3	2022-05-17 12:12:14.572+03	2022-05-17 12:12:14.572+03	4	332	52	\N	1
1058	\N	\N	2022-05-17 12:12:14.584+03	2022-05-17 12:12:14.584+03	4	331	52	\N	1
840	\N	\N	2022-05-17 12:12:13.455+03	2022-05-17 12:12:13.455+03	4	95	52	\N	1
847	\N	\N	2022-05-17 12:12:13.497+03	2022-05-17 12:12:13.497+03	4	103	52	\N	1
852	\N	\N	2022-05-17 12:12:13.535+03	2022-05-17 12:12:13.535+03	4	110	52	\N	1
855	\N	\N	2022-05-17 12:12:13.542+03	2022-05-17 12:12:13.542+03	4	113	52	\N	1
858	4	40	2022-05-17 12:12:13.561+03	2022-05-17 12:12:13.561+03	4	115	52	\N	1
861	\N	\N	2022-05-17 12:12:13.577+03	2022-05-17 12:12:13.577+03	4	120	52	\N	1
867	\N	\N	2022-05-17 12:12:13.615+03	2022-05-17 12:12:13.615+03	4	124	52	\N	1
870	\N	\N	2022-05-17 12:12:13.63+03	2022-05-17 12:12:13.63+03	4	128	52	\N	1
874	\N	\N	2022-05-17 12:12:13.649+03	2022-05-17 12:12:13.649+03	4	131	52	\N	1
875	\N	\N	2022-05-17 12:12:13.656+03	2022-05-17 12:12:13.656+03	4	133	52	\N	1
883	\N	\N	2022-05-17 12:12:13.693+03	2022-05-17 12:12:13.693+03	4	142	52	\N	1
886	\N	\N	2022-05-17 12:12:13.705+03	2022-05-17 12:12:13.705+03	4	145	52	\N	1
887	\N	\N	2022-05-17 12:12:13.715+03	2022-05-17 12:12:13.715+03	4	147	52	\N	1
888	\N	\N	2022-05-17 12:12:13.721+03	2022-05-17 12:12:13.721+03	4	150	52	\N	1
892	\N	\N	2022-05-17 12:12:13.732+03	2022-05-17 12:12:13.732+03	4	158	52	\N	1
893	\N	\N	2022-05-17 12:12:13.738+03	2022-05-17 12:12:13.738+03	4	155	52	\N	1
894	\N	185	2022-05-17 12:12:13.747+03	2022-05-17 12:12:13.747+03	4	159	52	\N	1
897	4	160	2022-05-17 12:12:13.761+03	2022-05-17 12:12:13.761+03	4	161	52	\N	1
899	\N	\N	2022-05-17 12:12:13.769+03	2022-05-17 12:12:13.769+03	4	164	52	\N	1
900	\N	\N	2022-05-17 12:12:13.78+03	2022-05-17 12:12:13.78+03	4	166	52	\N	1
903	\N	\N	2022-05-17 12:12:13.795+03	2022-05-17 12:12:13.795+03	4	170	52	\N	1
920	\N	\N	2022-05-17 12:12:13.884+03	2022-05-17 12:12:13.884+03	4	189	52	\N	1
921	\N	\N	2022-05-17 12:12:13.889+03	2022-05-17 12:12:13.889+03	4	190	52	\N	1
922	\N	\N	2022-05-17 12:12:13.907+03	2022-05-17 12:12:13.907+03	4	191	52	\N	1
923	\N	\N	2022-05-17 12:12:13.916+03	2022-05-17 12:12:13.916+03	4	192	52	\N	1
974	\N	\N	2022-05-17 12:12:14.165+03	2022-05-17 12:12:14.165+03	4	246	52	\N	1
979	\N	\N	2022-05-17 12:12:14.19+03	2022-05-17 12:12:14.19+03	4	251	52	\N	1
980	\N	\N	2022-05-17 12:12:14.194+03	2022-05-17 12:12:14.194+03	4	256	52	\N	1
985	\N	\N	2022-05-17 12:12:14.215+03	2022-05-17 12:12:14.215+03	4	258	52	\N	1
986	\N	\N	2022-05-17 12:12:14.22+03	2022-05-17 12:12:14.22+03	4	261	52	\N	1
991	\N	\N	2022-05-17 12:12:14.24+03	2022-05-17 12:12:14.24+03	4	265	52	\N	1
992	\N	\N	2022-05-17 12:12:14.245+03	2022-05-17 12:12:14.245+03	4	267	52	\N	1
997	\N	\N	2022-05-17 12:12:14.269+03	2022-05-17 12:12:14.269+03	4	269	52	\N	1
998	\N	\N	2022-05-17 12:12:14.277+03	2022-05-17 12:12:14.277+03	4	274	52	\N	1
1003	\N	\N	2022-05-17 12:12:14.306+03	2022-05-17 12:12:14.306+03	4	275	52	\N	1
1006	\N	\N	2022-05-17 12:12:14.32+03	2022-05-17 12:12:14.32+03	4	280	52	\N	1
1007	\N	\N	2022-05-17 12:12:14.333+03	2022-05-17 12:12:14.333+03	4	282	52	\N	1
1011	\N	\N	2022-05-17 12:12:14.35+03	2022-05-17 12:12:14.35+03	4	284	52	\N	1
1014	\N	\N	2022-05-17 12:12:14.364+03	2022-05-17 12:12:14.364+03	4	288	52	\N	1
1017	\N	\N	2022-05-17 12:12:14.38+03	2022-05-17 12:12:14.38+03	4	291	52	\N	1
1020	\N	\N	2022-05-17 12:12:14.39+03	2022-05-17 12:12:14.39+03	4	294	52	\N	1
1023	\N	\N	2022-05-17 12:12:14.407+03	2022-05-17 12:12:14.407+03	4	297	52	\N	1
1026	\N	\N	2022-05-17 12:12:14.42+03	2022-05-17 12:12:14.42+03	4	299	52	\N	1
1029	\N	\N	2022-05-17 12:12:14.436+03	2022-05-17 12:12:14.436+03	4	302	52	\N	1
1032	\N	\N	2022-05-17 12:12:14.449+03	2022-05-17 12:12:14.449+03	4	307	52	\N	1
1035	\N	\N	2022-05-17 12:12:14.464+03	2022-05-17 12:12:14.464+03	4	310	52	\N	1
1038	\N	\N	2022-05-17 12:12:14.483+03	2022-05-17 12:12:14.483+03	4	313	52	\N	1
1041	\N	28.33	2022-05-17 12:12:14.504+03	2022-05-17 12:12:14.504+03	4	316	52	\N	1
1044	\N	\N	2022-05-17 12:12:14.517+03	2022-05-17 12:12:14.517+03	4	317	52	\N	1
1047	\N	\N	2022-05-17 12:12:14.53+03	2022-05-17 12:12:14.53+03	4	322	52	\N	1
1050	\N	\N	2022-05-17 12:12:14.543+03	2022-05-17 12:12:14.543+03	4	323	52	\N	1
1053	4	4	2022-05-17 12:12:14.56+03	2022-05-17 12:12:14.56+03	4	327	52	\N	1
1056	\N	3	2022-05-17 12:12:14.571+03	2022-05-17 12:12:14.571+03	4	330	52	\N	1
841	\N	\N	2022-05-17 12:12:13.457+03	2022-05-17 12:12:13.457+03	4	99	52	\N	1
845	\N	\N	2022-05-17 12:12:13.492+03	2022-05-17 12:12:13.492+03	4	101	52	\N	1
854	\N	\N	2022-05-17 12:12:13.539+03	2022-05-17 12:12:13.539+03	4	111	52	\N	1
856	\N	\N	2022-05-17 12:12:13.551+03	2022-05-17 12:12:13.551+03	4	114	52	\N	1
857	\N	\N	2022-05-17 12:12:13.558+03	2022-05-17 12:12:13.558+03	4	116	52	\N	1
859	\N	\N	2022-05-17 12:12:13.566+03	2022-05-17 12:12:13.566+03	4	117	52	\N	1
860	\N	\N	2022-05-17 12:12:13.574+03	2022-05-17 12:12:13.574+03	4	118	52	\N	1
877	\N	\N	2022-05-17 12:12:13.662+03	2022-05-17 12:12:13.662+03	4	134	52	\N	1
878	\N	\N	2022-05-17 12:12:13.667+03	2022-05-17 12:12:13.667+03	4	136	52	\N	1
879	\N	\N	2022-05-17 12:12:13.673+03	2022-05-17 12:12:13.673+03	4	138	52	\N	1
882	\N	\N	2022-05-17 12:12:13.69+03	2022-05-17 12:12:13.69+03	4	143	52	\N	1
890	\N	\N	2022-05-17 12:12:13.726+03	2022-05-17 12:12:13.726+03	4	149	52	\N	1
905	\N	\N	2022-05-17 12:12:13.801+03	2022-05-17 12:12:13.801+03	4	172	52	\N	1
906	\N	\N	2022-05-17 12:12:13.811+03	2022-05-17 12:12:13.811+03	4	174	52	\N	1
911	\N	\N	2022-05-17 12:12:13.838+03	2022-05-17 12:12:13.838+03	4	180	52	\N	1
912	\N	\N	2022-05-17 12:12:13.845+03	2022-05-17 12:12:13.845+03	4	182	52	\N	1
917	\N	\N	2022-05-17 12:12:13.869+03	2022-05-17 12:12:13.869+03	4	186	52	\N	1
918	\N	\N	2022-05-17 12:12:13.876+03	2022-05-17 12:12:13.876+03	4	188	52	\N	1
925	\N	\N	2022-05-17 12:12:13.923+03	2022-05-17 12:12:13.923+03	4	195	52	\N	1
927	\N	\N	2022-05-17 12:12:13.935+03	2022-05-17 12:12:13.935+03	4	196	52	\N	1
928	\N	\N	2022-05-17 12:12:13.94+03	2022-05-17 12:12:13.94+03	4	197	52	\N	1
929	\N	\N	2022-05-17 12:12:13.954+03	2022-05-17 12:12:13.954+03	4	201	52	\N	1
931	\N	\N	2022-05-17 12:12:13.963+03	2022-05-17 12:12:13.963+03	4	200	52	\N	1
934	\N	\N	2022-05-17 12:12:13.973+03	2022-05-17 12:12:13.973+03	4	205	52	\N	1
935	\N	\N	2022-05-17 12:12:13.984+03	2022-05-17 12:12:13.984+03	4	206	52	\N	1
939	\N	\N	2022-05-17 12:12:14.002+03	2022-05-17 12:12:14.002+03	4	210	52	\N	1
942	\N	\N	2022-05-17 12:12:14.019+03	2022-05-17 12:12:14.019+03	4	213	52	\N	1
943	\N	\N	2022-05-17 12:12:14.027+03	2022-05-17 12:12:14.027+03	4	214	52	\N	1
944	\N	\N	2022-05-17 12:12:14.034+03	2022-05-17 12:12:14.034+03	4	215	52	\N	1
952	\N	\N	2022-05-17 12:12:14.067+03	2022-05-17 12:12:14.067+03	4	222	52	\N	1
954	\N	\N	2022-05-17 12:12:14.075+03	2022-05-17 12:12:14.075+03	4	225	52	\N	1
957	\N	\N	2022-05-17 12:12:14.09+03	2022-05-17 12:12:14.09+03	4	229	52	\N	1
960	\N	\N	2022-05-17 12:12:14.102+03	2022-05-17 12:12:14.102+03	4	235	52	\N	1
964	\N	\N	2022-05-17 12:12:14.119+03	2022-05-17 12:12:14.119+03	4	238	52	\N	1
965	\N	\N	2022-05-17 12:12:14.13+03	2022-05-17 12:12:14.13+03	4	240	52	\N	1
968	\N	\N	2022-05-17 12:12:14.138+03	2022-05-17 12:12:14.138+03	4	242	52	\N	1
969	\N	\N	2022-05-17 12:12:14.143+03	2022-05-17 12:12:14.143+03	4	244	52	\N	1
972	\N	\N	2022-05-17 12:12:14.161+03	2022-05-17 12:12:14.161+03	4	247	52	\N	1
976	\N	\N	2022-05-17 12:12:14.171+03	2022-05-17 12:12:14.171+03	4	249	52	\N	1
977	\N	\N	2022-05-17 12:12:14.185+03	2022-05-17 12:12:14.185+03	4	252	52	\N	1
982	\N	\N	2022-05-17 12:12:14.199+03	2022-05-17 12:12:14.199+03	4	254	52	\N	1
983	\N	\N	2022-05-17 12:12:14.21+03	2022-05-17 12:12:14.21+03	4	259	52	\N	1
988	\N	\N	2022-05-17 12:12:14.224+03	2022-05-17 12:12:14.224+03	4	260	52	\N	1
989	\N	\N	2022-05-17 12:12:14.236+03	2022-05-17 12:12:14.236+03	4	263	52	\N	1
994	\N	\N	2022-05-17 12:12:14.249+03	2022-05-17 12:12:14.249+03	4	268	52	\N	1
995	\N	\N	2022-05-17 12:12:14.262+03	2022-05-17 12:12:14.262+03	4	270	52	\N	1
1000	\N	\N	2022-05-17 12:12:14.283+03	2022-05-17 12:12:14.283+03	4	272	52	\N	1
1001	\N	\N	2022-05-17 12:12:14.293+03	2022-05-17 12:12:14.293+03	4	276	52	\N	1
1005	\N	\N	2022-05-17 12:12:14.316+03	2022-05-17 12:12:14.316+03	4	278	52	\N	1
1008	\N	\N	2022-05-17 12:12:14.337+03	2022-05-17 12:12:14.337+03	4	281	52	\N	1
1009	\N	\N	2022-05-17 12:12:14.344+03	2022-05-17 12:12:14.344+03	4	283	52	\N	1
1010	\N	\N	2022-05-17 12:12:14.348+03	2022-05-17 12:12:14.348+03	4	286	52	\N	1
1018	\N	\N	2022-05-17 12:12:14.382+03	2022-05-17 12:12:14.382+03	4	292	52	\N	1
1019	\N	\N	2022-05-17 12:12:14.388+03	2022-05-17 12:12:14.388+03	4	295	52	\N	1
1024	\N	\N	2022-05-17 12:12:14.41+03	2022-05-17 12:12:14.41+03	4	296	52	\N	1
1025	\N	\N	2022-05-17 12:12:14.418+03	2022-05-17 12:12:14.418+03	4	301	52	\N	1
1030	\N	\N	2022-05-17 12:12:14.438+03	2022-05-17 12:12:14.438+03	4	304	52	\N	1
1031	\N	\N	2022-05-17 12:12:14.446+03	2022-05-17 12:12:14.446+03	4	306	52	\N	1
1036	\N	\N	2022-05-17 12:12:14.472+03	2022-05-17 12:12:14.472+03	4	309	52	\N	1
1037	\N	\N	2022-05-17 12:12:14.479+03	2022-05-17 12:12:14.479+03	4	312	52	\N	1
1042	\N	\N	2022-05-17 12:12:14.506+03	2022-05-17 12:12:14.506+03	4	314	52	\N	1
1043	\N	28.33	2022-05-17 12:12:14.514+03	2022-05-17 12:12:14.514+03	4	319	52	\N	1
1048	\N	\N	2022-05-17 12:12:14.533+03	2022-05-17 12:12:14.533+03	4	320	52	\N	1
1049	\N	\N	2022-05-17 12:12:14.54+03	2022-05-17 12:12:14.54+03	4	325	52	\N	1
1054	5	5	2022-05-17 12:12:14.562+03	2022-05-17 12:12:14.562+03	4	328	52	\N	1
1055	6	6	2022-05-17 12:12:14.569+03	2022-05-17 12:12:14.569+03	4	329	52	\N	1
842	\N	\N	2022-05-17 12:12:13.46+03	2022-05-17 12:12:13.46+03	4	98	52	\N	1
843	\N	\N	2022-05-17 12:12:13.477+03	2022-05-17 12:12:13.477+03	4	100	52	\N	1
844	\N	\N	2022-05-17 12:12:13.489+03	2022-05-17 12:12:13.489+03	4	102	52	\N	1
846	\N	\N	2022-05-17 12:12:13.494+03	2022-05-17 12:12:13.494+03	4	104	52	\N	1
853	\N	\N	2022-05-17 12:12:13.537+03	2022-05-17 12:12:13.537+03	4	109	52	\N	1
862	\N	\N	2022-05-17 12:12:13.579+03	2022-05-17 12:12:13.579+03	4	119	52	\N	1
863	\N	\N	2022-05-17 12:12:13.595+03	2022-05-17 12:12:13.595+03	4	121	52	\N	1
864	\N	\N	2022-05-17 12:12:13.601+03	2022-05-17 12:12:13.601+03	4	123	52	\N	1
865	\N	\N	2022-05-17 12:12:13.606+03	2022-05-17 12:12:13.606+03	4	122	52	\N	1
866	\N	\N	2022-05-17 12:12:13.612+03	2022-05-17 12:12:13.612+03	4	125	52	\N	1
868	\N	\N	2022-05-17 12:12:13.618+03	2022-05-17 12:12:13.618+03	4	126	52	\N	1
869	\N	\N	2022-05-17 12:12:13.627+03	2022-05-17 12:12:13.627+03	4	127	52	\N	1
871	\N	\N	2022-05-17 12:12:13.633+03	2022-05-17 12:12:13.633+03	4	129	52	\N	1
872	\N	\N	2022-05-17 12:12:13.641+03	2022-05-17 12:12:13.641+03	4	130	52	\N	1
873	\N	\N	2022-05-17 12:12:13.645+03	2022-05-17 12:12:13.645+03	4	132	52	\N	1
876	\N	\N	2022-05-17 12:12:13.659+03	2022-05-17 12:12:13.659+03	4	135	52	\N	1
880	\N	\N	2022-05-17 12:12:13.676+03	2022-05-17 12:12:13.676+03	4	140	52	\N	1
881	\N	\N	2022-05-17 12:12:13.687+03	2022-05-17 12:12:13.687+03	4	141	52	\N	1
884	\N	\N	2022-05-17 12:12:13.697+03	2022-05-17 12:12:13.697+03	4	144	52	\N	1
885	\N	\N	2022-05-17 12:12:13.703+03	2022-05-17 12:12:13.703+03	4	146	52	\N	1
889	\N	\N	2022-05-17 12:12:13.724+03	2022-05-17 12:12:13.724+03	4	152	52	\N	1
891	\N	\N	2022-05-17 12:12:13.729+03	2022-05-17 12:12:13.729+03	4	157	52	\N	1
895	\N	\N	2022-05-17 12:12:13.75+03	2022-05-17 12:12:13.75+03	4	160	52	\N	1
896	\N	\N	2022-05-17 12:12:13.757+03	2022-05-17 12:12:13.757+03	4	162	52	\N	1
898	\N	\N	2022-05-17 12:12:13.764+03	2022-05-17 12:12:13.764+03	4	163	52	\N	1
901	5	25	2022-05-17 12:12:13.784+03	2022-05-17 12:12:13.784+03	4	165	52	\N	1
902	\N	\N	2022-05-17 12:12:13.792+03	2022-05-17 12:12:13.792+03	4	168	52	\N	1
904	\N	\N	2022-05-17 12:12:13.798+03	2022-05-17 12:12:13.798+03	4	173	52	\N	1
907	\N	\N	2022-05-17 12:12:13.815+03	2022-05-17 12:12:13.815+03	4	176	52	\N	1
908	\N	\N	2022-05-17 12:12:13.821+03	2022-05-17 12:12:13.821+03	4	177	52	\N	1
909	\N	\N	2022-05-17 12:12:13.83+03	2022-05-17 12:12:13.83+03	4	178	52	\N	1
910	\N	\N	2022-05-17 12:12:13.834+03	2022-05-17 12:12:13.834+03	4	179	52	\N	1
913	\N	\N	2022-05-17 12:12:13.848+03	2022-05-17 12:12:13.848+03	4	181	52	\N	1
914	\N	\N	2022-05-17 12:12:13.852+03	2022-05-17 12:12:13.852+03	4	183	52	\N	1
915	\N	\N	2022-05-17 12:12:13.86+03	2022-05-17 12:12:13.86+03	4	184	52	\N	1
916	\N	\N	2022-05-17 12:12:13.864+03	2022-05-17 12:12:13.864+03	4	185	52	\N	1
919	\N	\N	2022-05-17 12:12:13.881+03	2022-05-17 12:12:13.881+03	4	187	52	\N	1
924	\N	\N	2022-05-17 12:12:13.919+03	2022-05-17 12:12:13.919+03	4	193	52	\N	1
933	\N	\N	2022-05-17 12:12:13.969+03	2022-05-17 12:12:13.969+03	4	203	52	\N	1
936	\N	\N	2022-05-17 12:12:13.988+03	2022-05-17 12:12:13.988+03	4	207	52	\N	1
937	\N	\N	2022-05-17 12:12:13.995+03	2022-05-17 12:12:13.995+03	4	208	52	\N	1
938	\N	40	2022-05-17 12:12:13.999+03	2022-05-17 12:12:13.999+03	4	209	52	\N	1
946	\N	\N	2022-05-17 12:12:14.04+03	2022-05-17 12:12:14.04+03	4	217	52	\N	1
947	\N	\N	2022-05-17 12:12:14.044+03	2022-05-17 12:12:14.044+03	4	218	52	\N	1
949	\N	\N	2022-05-17 12:12:14.051+03	2022-05-17 12:12:14.051+03	4	220	52	\N	1
950	4	40	2022-05-17 12:12:14.062+03	2022-05-17 12:12:14.062+03	4	223	52	\N	1
955	\N	\N	2022-05-17 12:12:14.077+03	2022-05-17 12:12:14.077+03	4	227	52	\N	1
956	\N	\N	2022-05-17 12:12:14.088+03	2022-05-17 12:12:14.088+03	4	228	52	\N	1
958	\N	\N	2022-05-17 12:12:14.095+03	2022-05-17 12:12:14.095+03	4	230	52	\N	1
959	\N	\N	2022-05-17 12:12:14.1+03	2022-05-17 12:12:14.1+03	4	234	52	\N	1
967	\N	\N	2022-05-17 12:12:14.136+03	2022-05-17 12:12:14.136+03	4	241	52	\N	1
970	\N	\N	2022-05-17 12:12:14.145+03	2022-05-17 12:12:14.145+03	4	243	52	\N	1
971	\N	\N	2022-05-17 12:12:14.159+03	2022-05-17 12:12:14.159+03	4	245	52	\N	1
\.


--
-- TOC entry 3448 (class 0 OID 17069)
-- Dependencies: 216
-- Data for Name: results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.results (id, result, "userId", "createdAt", "updatedAt", cathedra_id, cath_result_id) FROM stdin;
44	850	4	2022-05-12 16:33:01.288+03	2022-05-12 16:43:37.859+03	1	\N
48	853.00	2	2022-05-12 16:49:05.285+03	2022-05-12 16:49:05.285+03	1	\N
49	200.00	2	2022-05-13 10:21:46.123+03	2022-05-17 12:12:14.766+03	1	57
52	1307	4	2022-05-13 12:04:31.931+03	2022-05-17 12:12:14.767+03	1	57
\.


--
-- TOC entry 3452 (class 0 OID 17098)
-- Dependencies: 220
-- Data for Name: select_names; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.select_names (id, name, select_help, ball, "createdAt", "updatedAt", "itemId") FROM stdin;
1	до 30 лет	\N	0	2022-04-01 10:24:53.371+03	2022-04-01 10:24:53.371+03	18
2	30-40 лет	\N	0	2022-04-01 10:25:21.242+03	2022-04-01 10:25:21.242+03	18
3	40-50 лет	\N	0	2022-04-01 10:25:38.919+03	2022-04-01 10:25:38.919+03	18
4	50-60 лет	\N	0	2022-04-01 10:25:53.731+03	2022-04-01 10:25:53.731+03	18
5	Более 60 лет	\N	0	2022-04-01 10:26:17.903+03	2022-04-01 10:26:17.903+03	18
9	1	\N	0	2022-04-01 10:31:03.268+03	2022-04-01 10:31:03.268+03	19
14	Внешний	\N	0	2022-04-01 10:35:53.895+03	2022-04-01 10:35:53.895+03	20
15	Сотрудник кафедры	\N	0	2022-04-01 10:36:23.581+03	2022-04-01 10:36:23.581+03	20
17	первая	\N	25	2022-04-01 10:40:03.695+03	2022-04-01 10:40:03.695+03	21
18	вторая	\N	5	2022-04-01 10:40:22.98+03	2022-04-01 10:40:22.98+03	21
19	нет	\N	0	2022-04-01 10:40:39.709+03	2022-04-01 10:40:39.709+03	21
16	высшая	\N	50	2022-04-01 10:39:42.649+03	2022-04-07 16:52:42.98+03	21
21	заведующий кафедрой	\N	0	2022-04-08 11:23:58.392+03	2022-04-08 11:23:58.392+03	25
22	профессор	\N	0	2022-04-08 11:24:17.262+03	2022-04-08 11:24:17.262+03	25
23	степень магистра	\N	0	2022-04-08 15:05:00.087+03	2022-04-08 15:05:00.087+03	27
25	доцент	\N	0	2022-04-08 16:32:27.467+03	2022-04-08 16:32:27.467+03	28
26	профессор	\N	0	2022-04-08 16:32:39.457+03	2022-04-08 16:32:39.457+03	28
27	чл.-корр.	\N	0	2022-04-08 16:32:54.113+03	2022-04-08 16:32:54.113+03	28
28	академик	\N	0	2022-04-08 16:33:15.834+03	2022-04-08 16:33:15.834+03	28
30	Нет	\N	0	2022-04-08 16:34:23.705+03	2022-04-08 16:34:23.705+03	28
13	1.75	\N	0	2022-04-01 10:31:53.87+03	2022-04-21 11:50:59.367+03	19
33	0.25	\N	0	2022-04-21 11:51:32.742+03	2022-04-21 11:51:32.742+03	19
34	0.5	\N	0	2022-04-21 11:51:43.508+03	2022-04-21 11:51:43.508+03	19
35	0.0	\N	0	2022-04-21 11:51:52.428+03	2022-04-21 11:51:52.428+03	19
36	1.25	\N	0	2022-04-21 11:52:10.58+03	2022-04-21 11:52:10.58+03	19
37	1.5	\N	0	2022-04-21 11:52:24.229+03	2022-04-21 11:52:24.229+03	19
24	кандидат наук	\N	0	2022-04-08 15:05:16.686+03	2022-04-21 12:31:18.288+03	27
39	0.75	\N	0	2022-04-21 12:32:34.479+03	2022-04-21 12:32:34.479+03	19
40	доцент	\N	0	2022-04-25 12:10:40.455+03	2022-04-25 12:10:40.455+03	25
41	старший преподаватель	\N	0	2022-04-25 12:11:01.425+03	2022-04-25 12:11:01.425+03	25
42	ассистент, преподаватель	\N	0	2022-04-25 12:14:12.519+03	2022-04-25 12:14:12.519+03	25
43	аспирант	\N	0	2022-04-25 12:14:31.212+03	2022-04-25 12:14:31.212+03	25
44	Не сотрудник кафедры	\N	0	2022-05-14 15:36:40.334+03	2022-05-14 15:36:40.334+03	20
45	Почасовик внешний	\N	0	2022-05-14 15:36:57.147+03	2022-05-14 15:36:57.147+03	20
46	Почасовик сотр.кафедры	\N	0	2022-05-14 15:37:11.462+03	2022-05-14 15:37:11.462+03	20
47	Нет	\N	0	2022-05-14 15:37:25.828+03	2022-05-14 15:37:25.828+03	20
48	доктор наук	\N	0	2022-05-14 15:38:51.692+03	2022-05-14 15:38:51.692+03	27
49	нет	\N	0	2022-05-14 15:39:05.583+03	2022-05-14 15:39:05.583+03	27
\.


--
-- TOC entry 3444 (class 0 OID 17032)
-- Dependencies: 212
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, login, fullname, role, "createdAt", "updatedAt", "cathedraId") FROM stdin;
2	TrushelMS@bsmu.by	Трушель Мария Сергеевна	ADMIN	2022-03-31 12:52:13.325+03	2022-05-13 10:21:46.384+03	1
4	KorshukPA@bsmu.by	Коршук Павел Андреевич	USER	2022-04-18 10:12:11.523+03	2022-05-17 12:12:14.693+03	1
\.


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 233
-- Name: cath_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cath_reports_id_seq', 1295, true);


--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 231
-- Name: cath_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cath_results_id_seq', 57, true);


--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 229
-- Name: cath_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cath_types_id_seq', 5, true);


--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 209
-- Name: cathedras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cathedras_id_seq', 74, true);


--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 235
-- Name: colvo_selects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.colvo_selects_id_seq', 529, true);


--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 239
-- Name: dates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dates_id_seq', 1, true);


--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 227
-- Name: faculties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faculties_id_seq', 9, true);


--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 213
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_seq', 332, true);


--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 225
-- Name: massivlocals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.massivlocals_id_seq', 33, true);


--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 221
-- Name: massivs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.massivs_id_seq', 98, true);


--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 237
-- Name: rating_tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rating_tables_id_seq', 17, true);


--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 223
-- Name: reportlocals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reportlocals_id_seq', 321, true);


--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 217
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reports_id_seq', 1058, true);


--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 215
-- Name: results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.results_id_seq', 52, true);


--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 219
-- Name: select_names_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.select_names_id_seq', 49, true);


--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- TOC entry 3288 (class 2606 OID 17366)
-- Name: cath_reports cath_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cath_reports
    ADD CONSTRAINT cath_reports_pkey PRIMARY KEY (id);


--
-- TOC entry 3286 (class 2606 OID 17351)
-- Name: cath_results cath_results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cath_results
    ADD CONSTRAINT cath_results_pkey PRIMARY KEY (id);


--
-- TOC entry 3284 (class 2606 OID 17344)
-- Name: cath_types cath_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cath_types
    ADD CONSTRAINT cath_types_pkey PRIMARY KEY (id);


--
-- TOC entry 3258 (class 2606 OID 17030)
-- Name: cathedras cathedras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cathedras
    ADD CONSTRAINT cathedras_pkey PRIMARY KEY (id);


--
-- TOC entry 3290 (class 2606 OID 17381)
-- Name: colvo_selects colvo_selects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colvo_selects
    ADD CONSTRAINT colvo_selects_pkey PRIMARY KEY (id);


--
-- TOC entry 3294 (class 2606 OID 25555)
-- Name: dates dates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dates
    ADD CONSTRAINT dates_pkey PRIMARY KEY (id);


--
-- TOC entry 3282 (class 2606 OID 17330)
-- Name: faculties faculties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculties
    ADD CONSTRAINT faculties_pkey PRIMARY KEY (id);


--
-- TOC entry 3266 (class 2606 OID 17062)
-- Name: items items_num_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_num_key UNIQUE (num);


--
-- TOC entry 3268 (class 2606 OID 17058)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 3280 (class 2606 OID 17314)
-- Name: massivlocals massivlocals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.massivlocals
    ADD CONSTRAINT massivlocals_pkey PRIMARY KEY (id);


--
-- TOC entry 3276 (class 2606 OID 17260)
-- Name: massivs massivs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.massivs
    ADD CONSTRAINT massivs_pkey PRIMARY KEY (id);


--
-- TOC entry 3292 (class 2606 OID 25546)
-- Name: rating_tables rating_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating_tables
    ADD CONSTRAINT rating_tables_pkey PRIMARY KEY (id);


--
-- TOC entry 3278 (class 2606 OID 17302)
-- Name: reportlocals reportlocals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reportlocals
    ADD CONSTRAINT reportlocals_pkey PRIMARY KEY (id);


--
-- TOC entry 3272 (class 2606 OID 17081)
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- TOC entry 3270 (class 2606 OID 17074)
-- Name: results results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_pkey PRIMARY KEY (id);


--
-- TOC entry 3274 (class 2606 OID 17105)
-- Name: select_names select_names_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.select_names
    ADD CONSTRAINT select_names_pkey PRIMARY KEY (id);


--
-- TOC entry 3260 (class 2606 OID 17044)
-- Name: users users_fullname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_fullname_key UNIQUE (fullname);


--
-- TOC entry 3262 (class 2606 OID 17042)
-- Name: users users_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_login_key UNIQUE (login);


--
-- TOC entry 3264 (class 2606 OID 17040)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3296 (class 2606 OID 17063)
-- Name: items items_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT "items_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3301 (class 2606 OID 17303)
-- Name: reportlocals reportlocals_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reportlocals
    ADD CONSTRAINT "reportlocals_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3298 (class 2606 OID 17087)
-- Name: reports reports_itemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "reports_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES public.items(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3299 (class 2606 OID 17092)
-- Name: reports reports_resultId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "reports_resultId_fkey" FOREIGN KEY ("resultId") REFERENCES public.results(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3297 (class 2606 OID 17082)
-- Name: reports reports_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT "reports_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3300 (class 2606 OID 17106)
-- Name: select_names select_names_itemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.select_names
    ADD CONSTRAINT "select_names_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES public.items(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3295 (class 2606 OID 17045)
-- Name: users users_cathedraId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_cathedraId_fkey" FOREIGN KEY ("cathedraId") REFERENCES public.cathedras(id) ON UPDATE CASCADE ON DELETE SET NULL;


-- Completed on 2022-05-17 14:50:24

--
-- PostgreSQL database dump complete
--

