--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Ubuntu 12.4-1.pgdg20.04+1)
-- Dumped by pg_dump version 12.4 (Ubuntu 12.4-1.pgdg20.04+1)

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
-- Name: archive; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.archive (
    id character varying NOT NULL,
    "createdAt" bigint,
    "fromModel" text,
    "originalRecord" json,
    "originalRecordId" json
);


ALTER TABLE public.archive OWNER TO postgres;

--
-- Name: auth; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth (
    "createdAt" bigint,
    "updatedAt" bigint,
    id integer NOT NULL
);


ALTER TABLE public.auth OWNER TO postgres;

--
-- Name: auth_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_id_seq OWNER TO postgres;

--
-- Name: auth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_id_seq OWNED BY public.auth.id;


--
-- Name: batch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.batch (
    "createdAt" bigint,
    "updatedAt" bigint,
    id character varying NOT NULL,
    name text,
    class_id text,
    institute_id text,
    fees_id text
);


ALTER TABLE public.batch OWNER TO postgres;

--
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    "createdAt" bigint,
    "updatedAt" bigint,
    id integer NOT NULL,
    state text,
    city text
);


ALTER TABLE public.city OWNER TO postgres;

--
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_id_seq OWNER TO postgres;

--
-- Name: city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_id_seq OWNED BY public.city.id;


--
-- Name: class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.class (
    "createdAt" bigint,
    "updatedAt" bigint,
    id integer NOT NULL,
    section text,
    "numberStudents" real,
    "className" text,
    "classTeacher" text
);


ALTER TABLE public.class OWNER TO postgres;

--
-- Name: class_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.class_id_seq OWNER TO postgres;

--
-- Name: class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.class_id_seq OWNED BY public.class.id;


--
-- Name: fees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fees (
    "createdAt" bigint,
    "updatedAt" bigint,
    id character varying NOT NULL,
    institute_id text,
    "tuitionFee" real,
    "registrationFee" real,
    "labFee" real,
    "examFee" real,
    "sportsFee" real,
    title text,
    totalfees real
);


ALTER TABLE public.fees OWNER TO postgres;

--
-- Name: institute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institute (
    "createdAt" bigint,
    "updatedAt" bigint,
    id character varying NOT NULL,
    name text,
    board text,
    contactno text,
    address text,
    city text,
    state text,
    pincode real,
    website text,
    email text
);


ALTER TABLE public.institute OWNER TO postgres;

--
-- Name: jwtauth; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jwtauth (
    "createdAt" bigint,
    "updatedAt" bigint,
    id integer NOT NULL
);


ALTER TABLE public.jwtauth OWNER TO postgres;

--
-- Name: jwtauth_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jwtauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jwtauth_id_seq OWNER TO postgres;

--
-- Name: jwtauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jwtauth_id_seq OWNED BY public.jwtauth.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    "createdAt" bigint,
    "updatedAt" bigint,
    id character varying NOT NULL,
    student_id text,
    razorpay_payment_id text,
    razorpay_order_id text,
    razorpay_signature text,
    amount real,
    "transactionStatus" text
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.state (
    "createdAt" bigint,
    "updatedAt" bigint,
    id integer NOT NULL,
    name text,
    country_id real
);


ALTER TABLE public.state OWNER TO postgres;

--
-- Name: state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.state_id_seq OWNER TO postgres;

--
-- Name: state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.state_id_seq OWNED BY public.state.id;


--
-- Name: stream; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stream (
    "createdAt" bigint,
    "updatedAt" bigint,
    id character varying NOT NULL,
    name text,
    institute_id text,
    "startDate" text,
    "endDate" text,
    batch real
);


ALTER TABLE public.stream OWNER TO postgres;

--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    "createdAt" bigint,
    "updatedAt" bigint,
    id character varying NOT NULL,
    "firstName" text,
    "lastName" text,
    "rollNo" text,
    dob text,
    "phoneNumber" text,
    gender text,
    address text,
    batch_id text,
    fees json,
    "lastPayment" text
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    "createdAt" bigint,
    "updatedAt" bigint,
    id character varying NOT NULL,
    email text,
    password text
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    "createdAt" bigint,
    "updatedAt" bigint,
    id integer NOT NULL,
    email text,
    password text
);


ALTER TABLE public.users OWNER TO postgres;

--
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
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: auth id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth ALTER COLUMN id SET DEFAULT nextval('public.auth_id_seq'::regclass);


--
-- Name: city id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city ALTER COLUMN id SET DEFAULT nextval('public.city_id_seq'::regclass);


--
-- Name: class id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class ALTER COLUMN id SET DEFAULT nextval('public.class_id_seq'::regclass);


--
-- Name: jwtauth id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jwtauth ALTER COLUMN id SET DEFAULT nextval('public.jwtauth_id_seq'::regclass);


--
-- Name: state id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.state ALTER COLUMN id SET DEFAULT nextval('public.state_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: archive; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.archive (id, "createdAt", "fromModel", "originalRecord", "originalRecordId") FROM stdin;
\.


--
-- Data for Name: auth; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth ("createdAt", "updatedAt", id) FROM stdin;
\.


--
-- Data for Name: batch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.batch ("createdAt", "updatedAt", id, name, class_id, institute_id, fees_id) FROM stdin;
1599627624984	1599627624984	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	Class 4 B	a63f5a7d-5093-4c80-8996-40b9849ec3cd	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	7d151c75-cb04-4912-a8ea-22762281aa71
1599627228240	1599627228240	3e73d470-d330-43b7-b147-21fbef076d20	Class 1 A	61d22aff-fdd7-4277-b95f-171de11d4930	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	65cdf9ad-94ce-4453-97ca-55115ae7af9a
1599627669494	1599627669494	3f3028d4-14d5-4564-b917-607f21579cfa	Class 5 A	679f8e33-01ff-48ea-871b-d00ed41a5e34	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	f2a78852-76a6-4b59-97eb-76c8d04edb98
1599627289256	1599627289256	60c26093-8f9c-4a95-a343-e383ab824820	Class 1 C	61d22aff-fdd7-4277-b95f-171de11d4930	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	65cdf9ad-94ce-4453-97ca-55115ae7af9a
1599627476818	1599627476818	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	Class 3 C	5983dc92-2e7d-4dd3-9bc8-d40df201695c	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	452a63b6-1680-4159-ade1-84a6cb1c8a22
1599627343622	1599627343622	a50f6bd4-daef-4362-b411-c0e91c50cd31	Class 2 C	75af1d19-71c4-40e6-a865-7ee2a0850b06	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	cc6417c8-eeb5-41a9-840e-c1525c80abaf
1599627460175	1599627460175	cb052722-1d02-44bf-887c-77818a3bf7d5	Class 3 A	5983dc92-2e7d-4dd3-9bc8-d40df201695c	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	452a63b6-1680-4159-ade1-84a6cb1c8a22
1599627339587	1599627339587	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	Class 2 B	75af1d19-71c4-40e6-a865-7ee2a0850b06	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	cc6417c8-eeb5-41a9-840e-c1525c80abaf
1599627471127	1599627471127	dddb344d-00ce-4d6f-bea6-2b1238e562f4	Class 3 B	5983dc92-2e7d-4dd3-9bc8-d40df201695c	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	452a63b6-1680-4159-ade1-84a6cb1c8a22
1599627678500	1599627678500	e81b026d-341e-4ca7-98c2-fe85193adb07	Class 5 C	679f8e33-01ff-48ea-871b-d00ed41a5e34	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	f2a78852-76a6-4b59-97eb-76c8d04edb98
1599627673972	1599627673972	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	Class 5 B	679f8e33-01ff-48ea-871b-d00ed41a5e34	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	f2a78852-76a6-4b59-97eb-76c8d04edb98
1599627335499	1599627335499	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	Class 2 A	75af1d19-71c4-40e6-a865-7ee2a0850b06	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	cc6417c8-eeb5-41a9-840e-c1525c80abaf
1599627620670	1599627620670	f6781746-6a57-4120-b0c5-1d8f3ebde775	Class 4 A	a63f5a7d-5093-4c80-8996-40b9849ec3cd	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	7d151c75-cb04-4912-a8ea-22762281aa71
1599627284327	1599627284327	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	Class 1 B	61d22aff-fdd7-4277-b95f-171de11d4930	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	65cdf9ad-94ce-4453-97ca-55115ae7af9a
1599627631608	1599627631608	f9906a19-5835-4c07-93ea-c1f3228c8fc5	Class 4 C	a63f5a7d-5093-4c80-8996-40b9849ec3cd	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	7d151c75-cb04-4912-a8ea-22762281aa71
\.


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city ("createdAt", "updatedAt", id, state, city) FROM stdin;
\.


--
-- Data for Name: class; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.class ("createdAt", "updatedAt", id, section, "numberStudents", "className", "classTeacher") FROM stdin;
\.


--
-- Data for Name: fees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fees ("createdAt", "updatedAt", id, institute_id, "tuitionFee", "registrationFee", "labFee", "examFee", "sportsFee", title, totalfees) FROM stdin;
1599617691271	1599617691271	452a63b6-1680-4159-ade1-84a6cb1c8a22	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	13000	500	2500	1500	1800	Class 3	19300
1599617559923	1599617559923	65cdf9ad-94ce-4453-97ca-55115ae7af9a	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	10000	500	2000	1200	1500	Class 1	15200
1599617784687	1599617784687	7d151c75-cb04-4912-a8ea-22762281aa71	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	15000	500	2750	1500	2000	Class 4	21750
1599617634029	1599617634029	cc6417c8-eeb5-41a9-840e-c1525c80abaf	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	12000	500	2200	1300	1600	Class 2	17600
1599617843656	1599617843656	f2a78852-76a6-4b59-97eb-76c8d04edb98	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	17000	500	2900	1500	2300	Class 5	24200
\.


--
-- Data for Name: institute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.institute ("createdAt", "updatedAt", id, name, board, contactno, address, city, state, pincode, website, email) FROM stdin;
1599616630105	1599616630105	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	Don Bosco High School	CBSE	1287455923	MG Road, Dwarka Puri, New Delhi	New Delhi	Delhi	1.234567e+06	donboscodelhi.com	enquiry@donboscodelhi.com
\.


--
-- Data for Name: jwtauth; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jwtauth ("createdAt", "updatedAt", id) FROM stdin;
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments ("createdAt", "updatedAt", id, student_id, razorpay_payment_id, razorpay_order_id, razorpay_signature, amount, "transactionStatus") FROM stdin;
\.


--
-- Data for Name: state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.state ("createdAt", "updatedAt", id, name, country_id) FROM stdin;
\.


--
-- Data for Name: stream; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stream ("createdAt", "updatedAt", id, name, institute_id, "startDate", "endDate", batch) FROM stdin;
1599618939588	1599618939588	5983dc92-2e7d-4dd3-9bc8-d40df201695c	Class 3	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	2019-08-01	2020-03-31	2027
1599618919153	1599618919153	61d22aff-fdd7-4277-b95f-171de11d4930	Class 1	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	2019-08-01	2020-03-31	2029
1599618955117	1599618955117	679f8e33-01ff-48ea-871b-d00ed41a5e34	Class 5	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	2019-08-01	2020-03-31	2025
1599618928568	1599618928568	75af1d19-71c4-40e6-a865-7ee2a0850b06	Class 2	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	2019-08-01	2020-03-31	2028
1599618946405	1599618946405	a63f5a7d-5093-4c80-8996-40b9849ec3cd	Class 4	c2ebbc4c-72a5-4f06-b12c-60a2f19818be	2019-08-01	2020-03-31	2026
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students ("createdAt", "updatedAt", id, "firstName", "lastName", "rollNo", dob, "phoneNumber", gender, address, batch_id, fees, "lastPayment") FROM stdin;
1599639944269	1599639944269	0f417e8a-f29e-4246-b973-eb05fe32a149	Trikaya	Mahajan	11	2015-10-13	9031622399	Female	Ap #771-4352 Quam. St.	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640103595	1599640103595	1011d6a8-8a69-4e07-8541-c38a897a5a3e	Sabrang	Joshi	23	2015-03-31	5626256392	Male	P.O. Box 721, 9097 Quisque St.	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599639082396	1599639082396	13edf94c-ce3b-4bea-bf0d-5faff73943e4	Eshwar	Varma	3	2016-01-23	4099345862	Male	P.O. Box 543, 9282 Sapien, Avenue	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640013436	1599640013436	18df7226-5edd-4116-a7b9-d5f66f98cf99	Toshale	Parekh	16	2015-04-14	9905136868	Female	669 Fermentum Street	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599639711687	1599639711687	1a342faa-4c41-493b-ae5f-a24fb517c35b	Ekta	Dhawan	6	2015-05-08	5112520214	Female	8939 Nec Ave	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599639930647	1599639930647	2d51094c-b1bd-430c-a69e-54f276f7294b	Divya	Mangal	10	2015-08-02	6788423043	Female	P.O. Box 121, 7505 Non Ave	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599639914672	1599639914672	3bb90f91-6e81-4f65-a56f-3b808dfb794b	Amba	Iyer	9	2015-02-22	6167376207	Female	Ap #810-632 Quisque Rd.	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599638847954	1599638847954	3ec7938c-3550-472c-b7f7-3b99283c33e8	Abhijit	Grover	1	2015-02-18	5903475490	Male	Ap #261-5494 Id Street	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640000660	1599640000660	3f0657e6-b96c-4d04-b370-d07d879abdd6	Nidhi	Gill	15	2015-03-13	3387602245	Female	P.O. Box 197, 8960 Proin St.	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640172331	1599640172331	4c96340a-57bc-474f-9de6-dd44c45731da	Shashishekhar	Chandra	29	2015-07-23	3095855416	Male	P.O. Box 979, 7227 Blandit Street	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599639631031	1599639631031	570a97cf-340a-4498-bbcd-1d616b0d2609	Mihirkiran	Ghosh	4	2015-06-05	6443065638	Male	Ap #495-9630 Aliquam Rd.	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599639989522	1599639989522	68a1c01d-3099-45ec-8e93-660038f53ae3	Payal	Modi	14	2015-09-20	5585124775	Female	Ap #812-1194 Elit, Road	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640155322	1599640155322	6b3cedf8-1593-4592-a291-4a35fb6ae2c9	Abhirami	Mangal	27	2015-02-17	6827123193	Female	269-6648 Nec Rd.	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640114920	1599640114920	70e864a4-3095-4292-90da-4716c5c6942d	Talin	Dayal	24	2015-11-20	9907469732	Male	239-8079 Proin Ave	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599639667812	1599639667812	80759061-a8d8-48c2-bcd4-ec5aff31bfff	Revant	Khatri	5	2016-01-04	1974173348	Male	506-7209 Lectus Rd.	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640085061	1599640085061	82b267fb-dafe-4e01-94f0-33b382b4ff6c	Shivika	Das	21	2015-05-19	6209166532	Female	P.O. Box 570, 1401 Eget Rd.	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640064448	1599640064448	859225d5-f62e-4088-af6c-6947f3839871	Manprasad	Basu	19	2016-01-09	1834910682	Male	P.O. Box 593, 3215 Sed Street	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640710703	1599640710703	8acfefa4-082f-4d42-9c4c-65e43292e16b	Shaligram	Ranganathan	1	2015-04-25	6093005342	Male	703-7253 Et, Rd.	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640145013	1599640145013	9a4d3100-8bb2-40b6-b3a1-58bff4aaa898	Jamuna	Mehta	26	2015-05-23	1531899927	Female	279-4047 Non, Rd.	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599639904879	1599639904879	b1876466-f5ad-45bd-aaa9-7e1228bee7c7	Anurupika	Arya	8	2015-04-05	3425069983	Female	P.O. Box 529, 6348 Lectus St.	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640038655	1599640038655	b3569225-50cf-431f-b1e5-a1b568193f3f	Nipun	Chadha	17	2015-02-14	4352649856	Male	Ap #538-9948 Elit, Ave	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599639732649	1599639732649	b3d980fd-a13a-4231-94a5-a75055f6c848	Kiara	Chakrabarti	7	2015-10-15	6884471983	Female	P.O. Box 263, 1946 Proin Av.	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640163577	1599640163577	b3eaca0d-7a8b-4d59-be2d-c0c6a992919e	Sarvad	Kashyap	28	2015-06-10	2502912547	Male	789-9374 Mollis. Street	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599639972432	1599639972432	b4c2ef52-6841-4f25-b379-d4dd83e2d0a9	Ritika	Reddy	12	2015-03-14	2664162279	Female	P.O. Box 899, 4550 Aliquam St.	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640182753	1599640182753	b6b4fdff-b75d-4f2c-a849-51d9004cb18b	Samarajit	Khatri	30	2015-12-08	5819225805	Male	P.O. Box 704, 4893 Nisi Rd.	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599639981219	1599639981219	c06bf7ab-3dd2-40aa-a08d-6d8f87bc4397	Saloni	Singh	13	2015-08-29	5551750705	Female	P.O. Box 530, 8683 Pellentesque Road	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640075564	1599640075564	c2f814ba-dde1-4ffa-8e5d-d6de7ad37518	Kelsy	Joshi	20	2015-12-23	3742689099	Female	Ap #117-4134 Morbi Rd.	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640053062	1599640053062	cbd70119-c336-4ad4-8fb9-4140752716cf	Madhukant	Garg	18	2015-09-29	3695289975	Male	134-2915 Lacinia St.	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640092628	1599640092628	d14b25b4-07f0-4f8c-9d42-b3d85c26da31	Nirav	Datta	22	2015-03-07	5326519841	Male	674-9194 Dolor Rd.	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640134195	1599640134195	d1660c44-830e-45d1-9f37-6e88a63ea531	Ranjiv	Rao	25	2015-04-27	2327676240	Male	P.O. Box 684, 2858 At, Rd.	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599638988278	1599638988278	d3412a29-b5c0-48f5-b1b3-cfb92eb5be00	Ratinderpal	Balakrishna	2	2015-05-30	1460427862	Male	Ap #865-4470 Ornare, Ave	3e73d470-d330-43b7-b147-21fbef076d20	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640851849	1599640851849	3c4884d5-ae21-48af-8449-4e1fdd8742a1	Ujjala	Kaur	2	2015-12-17	6587552203	Female	235-4160 Eleifend Avenue	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640867133	1599640867133	d9ce9100-d214-426a-b4d8-68834f307641	Palash	Chowdhury	3	2015-07-28	5093676081	Male	Ap #216-7809 Orci, Ave	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640876415	1599640876415	9b022108-0bde-4632-be43-6a2eaebd002f	Srinish	Ghosh	4	2015-02-23	2812310293	Male	4290 Proin Av.	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640898313	1599640898313	4e4c54de-f43f-4499-a234-3768b24fa7fa	Aaarti	Madan	5	2015-09-01	2803540120	Female	535-1939 Velit. Avenue	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640907832	1599640907832	f97cac31-f7d1-4e7a-af03-24d2a929cba3	Yajnesh	Zacharia	6	2015-12-05	9923080602	Male	P.O. Box 465, 691 Dictum. Rd.	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640915600	1599640915600	a82136b2-0f8b-4110-94a9-d318b2c95ebd	Khush	Kashyap	7	2015-10-06	6047810602	Male	477-3140 Nunc Street	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640924954	1599640924954	a012c3af-b52b-438a-bbb8-01b278eb6b6d	Shalin	Ghosh	8	2015-07-16	4614706310	Female	Ap #966-1909 Ipsum St.	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640933296	1599640933296	7e79ce31-c41c-4d4c-b787-744f305ad2bb	Kunal	Das	9	2015-04-08	8007460168	Male	4931 Fringilla Street	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640943227	1599640943227	a057922f-6f1e-40e3-8275-56b1a5b84fab	Rakesh	Ganguly	10	2016-01-24	2960839895	Male	3644 Dictum. Rd.	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640955883	1599640955883	a493807e-d320-4772-a1ce-184059228e3d	Pranay	Chowdhury	11	2015-04-10	2015652820	Male	Ap #585-3179 Feugiat St.	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599640985216	1599640985216	ea2dbdb5-952c-4c39-9b5c-dcf61f5044c8	Chaturved	Grover	12	2015-08-12	5124327186	Male	201-1102 Sed Street	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641002155	1599641002155	b9cc0bee-b47d-430a-be95-9fe39cf84c0a	Dikshil	Datta	13	2015-05-11	9932272810	Male	Ap #489-3159 Elementum Street	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641014196	1599641014196	7bcec5b1-9e88-453d-806f-b83213bf0a82	Tulasi	Goswami	14	2015-03-11	4770375073	Female	Ap #298-3700 Magnis Road	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641022311	1599641022311	6ed8cf35-4de6-4ab4-8172-8846147db36e	Pratik	Ranganathan	15	2015-09-18	7928139313	Male	304-7972 Aliquam Ave	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641030798	1599641030798	119ab04a-cf5a-4081-b37b-e7f32a9f79d0	Rajisha	Pandey	16	2016-01-10	2762903176	Female	928-4189 Euismod Road	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641047550	1599641047550	28242d0d-362a-494d-a672-e045b5b54991	Jaldev	Agarwal	17	2015-05-03	7284502899	Male	Ap #258-8910 Dictum Rd.	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641059073	1599641059073	5eb841f1-0874-420a-a75b-f26fcca3facc	Padmesh	Mani	18	2016-01-10	4061330434	Male	4851 Turpis. Ave	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641083451	1599641083451	9244044d-c834-46cb-b1d0-cfcb0d3f667f	Kareena	Apte	19	2015-02-28	1671768049	Female	P.O. Box 980, 378 Mollis St.	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641090535	1599641090535	2cd69087-4d12-4b00-9cc9-81e5e7614778	Inrani	Varma	20	2015-06-28	2489543243	Female	Ap #965-2630 Ac Ave	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641098763	1599641098763	31756765-1ee3-4a1a-b6b5-ed73997fa306	Sarasa	Kumar	21	2015-07-30	1206424856	Female	294-4585 Scelerisque Av.	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641107059	1599641107059	d546d538-d05a-45ff-aeee-402971bcfe21	Raja	Ahluwalia	22	2015-08-14	7622302766	Male	P.O. Box 709, 2542 Suspendisse Av.	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641117292	1599641117292	c2dac9b4-237f-4dd7-b3ec-59a053f1151a	Jishnu	Saxena	23	2015-03-24	5845745547	Male	P.O. Box 637, 5256 Mauris Av.	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641136609	1599641136609	f1cfbf49-9bbc-4be2-b507-2e7107bf1a0f	Mrityunjay	Mehta	24	2015-04-27	6883123560	Male	497-3290 Vel Rd.	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641144434	1599641144434	ffda6f5b-7867-4101-a6dc-55c4d9b0c38f	Susadh	Joshi	25	2016-01-25	5460606773	Male	3894 Et Rd.	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641161949	1599641161949	ce89fcf9-410e-485e-a4dd-500951f64d3c	Hridayesh	Ahluwalia	26	2015-05-01	8242583076	Male	8568 Donec Road	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641176560	1599641176560	ad464eb7-5b45-460f-8ab6-033699c21825	Dikshil	Anand	27	2015-09-09	3404975228	Male	P.O. Box 316, 118 Luctus St.	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641190346	1599641190346	db546a58-a2f5-499c-bf1d-14f667174fc8	Amrusha	Sharma	28	2016-01-01	5459713646	Female	Ap #426-3945 Donec Avenue	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641199640	1599641199640	e613be7b-b957-4951-8f0d-58d57c2e9882	Hemali	Khatri	29	2015-07-22	8065272815	Female	P.O. Box 316, 8142 Bibendum Avenue	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641212367	1599641212367	f73d0269-9137-4426-836d-91e8ee9f20c7	Indradutt	Chandra	30	2015-03-10	7976456731	Male	230-2759 Lectus St.	f801d8e1-bd08-4f71-a5e0-f64cf7c1e43f	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641467449	1599641467449	b3b6324e-fa2b-4ff4-b399-57ee7097e23a	Taru	Datta	1	2015-12-25	8548640362	Female	8791 Tortor Rd.	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641476968	1599641476968	ed38b954-ce1d-4f3f-a4d3-bb12275a38bc	Siddanth	Dayal	2	2015-05-31	2907225342	Male	P.O. Box 603, 9114 Molestie Street	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641488804	1599641488804	9d4cdf01-5ec0-42f1-b3b5-ab7bf5acc85c	Hanuman	Chadha	3	2015-08-12	8272872694	Male	934-5436 Nascetur Av.	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641496895	1599641496895	c02a715a-db85-4fa5-99b3-c3c030b63d01	Vishodhan	Acharya	4	2015-11-11	4392870082	Male	P.O. Box 212, 5104 Quis Avenue	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641505032	1599641505032	70856a20-4fc4-435a-bdbf-387c50e30ca1	Sahasan	Banerjee	5	2015-04-04	3220540602	Male	5932 Amet Rd.	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641519232	1599641519232	a3cbaa2e-a990-4781-ae4c-27caa4fed5e2	Sneha	Kulkarni	6	2016-01-14	4713545928	Female	P.O. Box 966, 2952 Eu Rd.	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641529367	1599641529367	27fa39f2-b4dc-403b-a729-e1397f853c95	Balraj	Kaur	7	2015-04-07	9818503715	Male	5381 Sem St.	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641540176	1599641540176	a1a9a0ee-5669-4896-81ec-eb669c1610be	Sanskriti	Jain	8	2015-07-26	1447095985	Female	Ap #864-5799 Lacinia. Street	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641549571	1599641549571	2b7ff487-7ef6-4bb7-8ce6-bee853e474aa	Nilay	Ganguly	9	2015-02-21	3661534612	Male	3282 Aenean Ave	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641558679	1599641558679	acd89b1a-a631-4cde-9aa8-2245dcf8f13b	Shrida	Chawla	10	2015-09-23	8597811340	Male	Ap #702-6998 Quis Av.	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641568925	1599641568925	e211a80e-9af2-481b-ab81-c2ca00dd8782	Nageshwaran	Joshi	11	2015-07-21	6457829475	Male	P.O. Box 999, 5935 Proin St.	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641590338	1599641590338	ee6cb997-85b8-4a8f-828e-b62b056d5ed0	Visala	Kapadia	12	2015-08-10	7229390477	Female	728-8244 Vel Road	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641600341	1599641600341	65f67b9a-0804-4a8e-a299-4e73a54a7729	Naveen	Bedi	13	2015-04-21	4558583393	Male	383-7529 Ultrices Road	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641609052	1599641609052	b99c7a47-33ee-4947-b324-e629cb78c18f	Vimalmani	Parekh	14	2015-05-27	8834025412	Male	7293 Nulla Avenue	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641617563	1599641617563	0279fa7e-daf7-434c-b616-db4c52ca3274	Athervan	Ranganathan	15	2015-07-08	7160925918	Male	178 Per St.	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641625880	1599641625880	3b6f52ac-7a37-4976-91be-ded02040d209	Hiranmay	Ranganathan	16	2015-09-27	5714485280	Male	513-6060 Montes, St.	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641635153	1599641635153	e719fae3-bed7-4383-88fd-0e976cc75458	Saumil	Ray	17	2015-05-22	6647504735	Male	3099 Nec Avenue	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641643277	1599641643277	fe763d40-9c69-4a1a-a3af-5e8f6b2115f8	Siya	Dalal	18	2015-08-06	1613613162	Female	P.O. Box 304, 502 Augue Rd.	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641650833	1599641650833	9604ba2e-6d7b-40d1-9174-a4a6f4477d77	Rishi	Haldar	19	2015-08-25	1063914049	Male	264-9117 Consectetuer Rd.	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641658320	1599641658320	b79fa8d0-4ef4-410f-a7dd-046dfaf2ba65	Rimjhim	Pandey	20	2015-10-15	9680887780	Female	4523 Ornare, Road	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641677127	1599641677127	2745fdb1-ed97-4f0b-9d73-b3f17318bf21	Anjana	Acharya	21	2015-04-21	8835043858	Female	P.O. Box 524, 3499 Ipsum Rd.	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641685837	1599641685837	30887e36-ae05-4f44-8b59-e9668015a076	Neelkant	Deol	22	2015-10-01	8466516806	Male	7573 Egestas Av.	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641702636	1599641702636	6a2c8c90-236e-450f-9d0e-09ff2e32cdf3	Anu	Garg	23	2016-01-08	1696641510	Female	Ap #783-3597 Risus St.	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641712198	1599641712198	25793e32-de3c-4ee0-b573-84e29e31c2c9	Shakuntala	Bajwa	24	2015-05-21	4018045831	Female	2030 Faucibus Av.	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641720020	1599641720020	f163b464-371b-4b0b-9f65-92bc11f5f002	Shaik	Kumar	25	2015-05-31	1555080712	Male	477-9694 Vel, Rd.	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641728952	1599641728952	480cb3e6-4984-4d39-886a-4201bcb7588c	Gehna	Chandra	26	2015-10-17	9167772247	Female	Ap #919-2394 Eu Avenue	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641736922	1599641736922	e11f3cc3-e414-4e83-a5ae-e018a24dc1ed	Chetna	Bhatt	27	2015-05-14	3727722863	Female	110-4260 Id, St.	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641747052	1599641747052	22861d6c-fe49-4639-838b-4460beadb481	Rasraj	Dayal	28	2016-01-19	4996439892	Male	6661 Nisl Ave	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641758882	1599641758882	cdef917f-bfc6-4c05-aee2-93575d98a98e	Trilokchand	Dhillon	29	2015-04-07	1349572953	Male	P.O. Box 360, 280 Hendrerit. Avenue	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599641770899	1599641770899	bcbe53b0-1bb4-4b2d-a13f-a64fcaca6370	Jivanta	Ahuja	30	2015-04-12	9140069514	Female	741-7619 Orci Ave	60c26093-8f9c-4a95-a343-e383ab824820	{"createdAt":1599617559923,"updatedAt":1599617559923,"id":"65cdf9ad-94ce-4453-97ca-55115ae7af9a","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":10000,"registrationFee":500,"labFee":2000,"examFee":1200,"sportsFee":1500,"title":"Class 1","totalfees":15200}	1947-08-15
1599642626560	1599642626560	e8482373-4ead-4738-9495-8002a01a3360	Banhi	Kaur	1	2015-01-18	4174239713	Female	Ap #572-4668 Sed Ave	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642635879	1599642635879	3f8e20f9-58f8-4601-a4f9-062c04947bb5	Bhagesh	Sachdev	2	2014-12-19	1743910765	Male	342-377 Nec Road	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642644639	1599642644639	29ac6af9-9c8d-4817-aab0-dd2c5389d2ec	Kanishka	Dalal	3	2014-02-04	2747267913	Female	763-4053 Magnis Ave	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642652544	1599642652544	37cbd609-5258-4e6d-919a-79552b0a79d1	Bhakti	Deol	4	2014-09-14	8354873311	Female	683-9452 Ipsum Av.	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642661433	1599642661433	1f1e3d02-18d6-44d0-b30f-2949b738b102	Manimala	Chopra	5	2014-08-03	2861787603	Female	4149 Euismod Av.	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642669533	1599642669533	b843c1f3-b424-410b-9434-0f05c96ac09e	Vasupati	Arya	6	2014-07-19	8949659936	Male	Ap #900-8068 Odio. Ave	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642678192	1599642678192	164b2e89-e93a-4c45-9a7b-ecf0a02f70df	Achalraj	Kashyap	7	2014-03-22	6362667483	Male	P.O. Box 805, 7196 Eleifend Road	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642685764	1599642685764	c1b12d90-f0a1-47c4-97bb-560e217212e0	Yashaswini	Purohit	8	2014-02-15	2859745703	Female	Ap #202-3551 Cras Rd.	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642693236	1599642693236	3446b112-2fc4-4f97-b4b4-aa7d81badbbf	Mythili	Madan	9	2014-05-08	9523270592	Female	344-3454 Non, Av.	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642702764	1599642702764	8813b7ca-7f75-49f8-8c1c-cfc69edd8d18	Prem	Das	10	2015-01-04	1575727294	Female	P.O. Box 111, 3174 Congue St.	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642714840	1599642714840	a77d182b-8476-45ce-84bf-2117faf556a6	Cheshta	Basu	11	2014-04-26	2838840476	Female	P.O. Box 436, 1740 Luctus Rd.	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642730683	1599642730683	648d8190-3913-4121-9082-3e1b1acc7aa2	Prakruth	Sachdev	12	2014-04-17	2840703499	Male	510-7106 Vel Ave	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642737922	1599642737922	5d4cd812-889a-4c95-836a-a5fa89f1f00b	Vipula	Bedi	13	2014-02-15	8365090788	Female	9312 Praesent St.	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642746234	1599642746234	6df5fbb5-628f-48d5-9bc4-4104ac8e6eb9	Nina	Kapoor	14	2014-12-12	5280678566	Female	P.O. Box 717, 8099 Tellus St.	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642758901	1599642758901	9426b561-c281-41e8-bfba-a5d18ba10436	Avkash	Amin	15	2014-06-03	5094807496	Male	893 Ante. Ave	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642771051	1599642771051	c66e3d61-490a-4879-8ebc-5e8a70ab3f9d	Preeti	Garg	16	2014-12-26	2286027724	Female	Ap #292-9348 Nascetur Rd.	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642779071	1599642779071	c28f8760-0e3a-4214-83de-fe9793c1ddec	Vrajkishore	Chawla	17	2014-04-12	9334469500	Male	5523 Ullamcorper. Avenue	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642787101	1599642787101	ca87ab59-b5bd-46c1-9ee4-83c1254025a9	Ashcharya	Varma	18	2014-06-22	9332804103	Female	9079 Lacus. Ave	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642795800	1599642795800	46890828-0f3c-4582-afca-c5b90d081163	Samay	Purohit	19	2014-12-11	5248472163	Male	691-6516 Enim. St.	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642803687	1599642803687	e6075416-f754-4330-a1ad-c251607e8acc	Nandita	Goel	20	2014-08-07	4248582756	Female	363-2176 Vitae Ave	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642811372	1599642811372	e86bc412-25a8-4f3d-a1ed-aeadf30126d6	Ajmil	Deshpande	21	2014-12-09	6364555738	Male	9644 Nullam Av.	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642826867	1599642826867	ff54c49b-73cd-455a-b62c-9b0c4bb581ec	Maulik	Patel	22	2014-03-21	1405481093	Male	P.O. Box 163, 4535 Dui, Rd.	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642833968	1599642833968	74e8dac3-c1bc-4de3-a1e5-f7e40aafd753	Shuchi	Batra	23	2014-08-30	8558625911	Female	7070 In Road	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642840413	1599642840413	6f5681fa-b615-4095-a253-b24e1cd8c91f	Sammad	Kashyap	24	2014-02-17	9489728291	Male	Ap #655-5822 Nibh Av.	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642849940	1599642849940	4ed0f696-6208-4778-bf17-d2c1a216110b	Nageshwaran	Madan	25	2015-01-18	3859236760	Male	1567 Vitae, Road	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642861628	1599642861628	383a42f5-3429-4dca-9dd1-d9c611a724a9	Sonya	Ray	26	2014-12-31	6752307563	Female	9376 Ultrices Rd.	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642873314	1599642873314	bcda4236-4747-414c-a3d6-e54e1265a583	Akaash	Bhatt	27	2014-04-30	1410883971	Male	Ap #113-2760 Risus. Rd.	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642882375	1599642882375	9ed15cd6-7841-400c-b9b3-09b91cac3b18	Suditi	Deshmukh	28	2014-04-30	1085341538	Female	Ap #114-8260 Gravida Av.	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642890829	1599642890829	f13f949d-d644-468d-aa93-4cbe3a854f06	Hansini	Ghosh	29	2014-06-12	7848939719	Female	P.O. Box 270, 2961 Accumsan Ave	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599642903403	1599642903403	4b6d5679-1e42-4b97-8d99-2a1207edb8d9	Tuhina	Reddy	30	2014-03-14	6360835915	Female	319-2103 Vivamus Ave	f1ab9af4-8f73-4653-a8a3-d22f2ae3bd61	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643258698	1599643258698	1a4c7648-9936-4290-ac44-dae6f73ee46c	Anupama	Arya	1	2014-12-22	3730146690	Female	385-483 Elit Rd.	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643276425	1599643276425	a3ba6226-0e45-4377-bda0-538ef9566c81	Somadev	Dewan	2	2014-04-06	4170865680	Male	706-9242 Phasellus Avenue	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643287179	1599643287179	0f507e78-5b32-41ed-a1a5-f94ac96d6bfb	Vijay	Bajwa	3	2014-07-08	8658936101	Male	7500 Est Avenue	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643295884	1599643295884	969a0dd3-55e1-4925-adf1-7b66c300f6a2	Manasi	Arya	4	2014-07-19	4324685337	Female	182-7782 Blandit St.	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643303164	1599643303164	030cac32-6979-4382-bef0-60cd98d07777	Shree	Basu	5	2014-04-16	2148192080	Male	Ap #348-3392 Cursus St.	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643312004	1599643312004	a2ae7016-8c4b-4483-aef7-e5ccbc78b040	Ugresh	Goel	6	2014-09-20	3734757422	Male	3552 Aliquet Road	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643320811	1599643320811	a81801ad-7bb0-4130-b923-1f99e063d294	Astha	Sharma	7	2014-08-06	6220448493	Female	P.O. Box 283, 7519 Gravida. St.	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643329486	1599643329486	91da5dbc-3b88-41ec-b9ed-53f18872af67	Udarchis	Naidu	8	2014-08-07	6687114358	Male	Ap #316-7211 Etiam Rd.	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643336168	1599643336168	006e8d02-1f3c-4c7c-a61f-0b0b46f062c0	Srinish	Malhotra	9	2014-11-02	8090454166	Male	P.O. Box 872, 2689 Est. Avenue	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643343622	1599643343622	fec43f01-ca92-4c74-a772-460bb1801f21	Uttam	Kulkarni	10	2014-12-12	2667621369	Male	816-7067 Ornare. Ave	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643352325	1599643352325	934108b5-d238-42be-b8dc-67b7b100b8f9	Kamya	Ahuja	11	2014-11-04	4574121906	Female	P.O. Box 923, 2204 Nulla. Avenue	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643366837	1599643366837	e04b3f65-35db-49dd-9f2c-675b52a1eaed	Pratap	Kashyap	12	2014-05-27	2587760792	Male	1426 Ligula. Rd.	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643374539	1599643374539	e8dd8c92-7dcf-40d3-befc-078f1ffb35e2	Babala	Dhawan	13	2014-11-30	8269540637	Male	403-3249 Egestas. Street	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643381696	1599643381696	c8fe9732-5067-402c-b268-3a8b52687a5d	Tusti	Bawa	14	2014-06-23	9198310148	Female	Ap #954-1363 Pede St.	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643390875	1599643390875	b9136afe-b949-4a7e-9f33-18a5fa1e3489	Dakshata	Gill	15	2014-09-20	9501928883	Female	P.O. Box 258, 4338 Turpis Ave	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643400347	1599643400347	013fea0b-9153-44df-8ccf-ad0893ab6cb1	Maitri	Chakrabarti	16	2014-12-04	3626106444	Female	2160 Leo Road	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643409282	1599643409282	96f08de6-7628-4a7a-8d9a-b22c123630e6	Ketana	Haldar	17	2014-11-01	4950228648	Female	P.O. Box 552, 1832 Donec Rd.	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643417233	1599643417233	ec6d93e3-0dfd-4579-bb5e-b108dcc8d4dc	Omkareshwari	Gupta	18	2014-06-26	7026350995	Female	1279 Tincidunt St.	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643425485	1599643425485	8291bed9-e03c-4938-91f4-cc0376d4899e	Udbal	Dixit	19	2014-07-22	3827190734	Male	8101 Fermentum Av.	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643434842	1599643434842	847a41bc-3812-48d7-aa5f-e90e425be348	Vidvan	Reddy	20	2014-11-26	7883144685	Male	Ap #955-2347 Pharetra, Road	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643442460	1599643442460	4b0f0723-0917-4d4b-8ffa-cb51b634a58b	Kavita	Madan	21	2014-08-22	8986397649	Female	Ap #327-3461 Lorem Rd.	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643452262	1599643452262	ffd8cfda-12ae-4652-816f-9ff69746edf4	Kushan	Sachdev	22	2014-09-19	4152690488	Male	P.O. Box 774, 7026 Auctor Ave	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643459854	1599643459854	a44c3a0d-0778-4c33-b323-93dae3b962d0	Kamalkant	Ray	23	2014-10-20	6027659602	Male	3205 Sed St.	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643467618	1599643467618	95a446a3-3431-4ad6-a161-24bb927f6b16	Manendra	Mangal	24	2014-02-05	2997044086	Male	P.O. Box 786, 7031 Nec Road	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643475389	1599643475389	78323b94-85bf-43f4-82cd-bc4c2d9edc6f	Sathindar	Dhawan	25	2014-07-30	9611173393	Male	7772 Cursus Ave	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643484575	1599643484575	4fcdbbf9-e1b2-4ab4-befc-4cee75beb276	Uddiran	Mangal	26	2014-08-20	7837988452	Male	662-8012 Purus St.	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643491684	1599643491684	8393759b-118d-4b9d-93e6-c06a21e93f11	Vanya	Babu	27	2014-02-18	2179147799	Female	8433 Aliquam St.	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643498250	1599643498250	2fdb989a-f757-4af3-bc73-ffafa1e03204	Angee	Ranganathan	28	2015-01-28	8871906415	Female	Ap #469-1139 Nam Road	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643506896	1599643506896	170b43a0-e560-4265-9a9c-817a8e747ff9	Kapaali	Dixit	29	2014-02-06	5196928290	Male	Ap #811-8433 Facilisi. Ave	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599643514946	1599643514946	ceb5c6c8-c59d-4495-81bb-0d97db15b1f7	Shinjan	Lal	30	2014-08-25	5164437142	Male	2397 Sagittis. Rd.	da9c7050-32ff-4dd4-9e60-a6e0bc5bbfae	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644009430	1599644009430	5062dccf-d1e8-4109-903c-43127e837fe7	Jharna	Agarwal	1	2014-07-29	2956019154	Female	9404 Viverra. St.	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644016560	1599644016560	a36e5d0f-3410-4981-9516-37146e92f315	Lana	Gill	2	2014-03-09	5561584360	Female	Ap #973-5567 Penatibus Avenue	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644024468	1599644024468	fbac26cb-a441-4515-a65d-21b4e7cd9daf	Vijval	Chawla	3	2014-05-07	5698753774	Male	Ap #744-9849 Dis Ave	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644031673	1599644031673	6e4363c8-f4fe-4b1b-845c-132dff64e8e3	Ninaad	Kapadia	4	2014-03-16	3769550004	Male	P.O. Box 980, 2068 Orci. Ave	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644039239	1599644039239	5d7d1874-0634-4c94-a654-6c5d09374042	Chhavi	Deol	5	2014-05-02	5171272718	Female	P.O. Box 351, 3450 Ac Street	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644050289	1599644050289	9480dae3-2780-4f20-8868-dd23e83d2b80	Mrigesh	Ganguly	6	2014-07-24	1515196180	Male	Ap #898-9776 Rutrum. Street	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644059032	1599644059032	ab57daac-b5ff-4e5b-ac6b-7d8e9f5e14dd	Mahima	Haldar	7	2014-11-11	1437995293	Female	P.O. Box 542, 7418 Tristique Rd.	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644068071	1599644068071	4ebacdcd-fe86-40c8-bf69-973590e1a711	Nishikar	Khurana	8	2014-11-02	3242570474	Male	Ap #908-8367 Auctor St.	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644076112	1599644076112	1bbabb29-f207-4182-9e04-b57ff6cc04cb	Marudeva	Mannan	9	2014-03-22	1651702774	Male	9164 Pellentesque Rd.	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644083503	1599644083503	8c0660f6-aa80-452d-b468-3b232ba5303e	Vrisag	Rao	10	2014-07-12	5850340100	Male	P.O. Box 893, 8330 Convallis Road	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644093574	1599644093574	41b6e629-0e65-4714-a80e-ddf38bafdc9c	Saravana	Purohit	11	2014-10-01	5660061228	Male	P.O. Box 890, 3040 Lobortis. St.	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644101253	1599644101253	ab3bd401-be46-4ac7-9962-91cd0da12ff6	Chintan	Dixit	12	2014-05-18	3597775751	Male	P.O. Box 556, 9643 Magna. Road	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644109345	1599644109345	f13ab196-9408-4d1f-ae1a-37b07a876011	Pravin	Goswami	13	2014-11-13	3094782353	Male	P.O. Box 569, 2645 Elementum Ave	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644124174	1599644124174	ef6bc093-9035-4e9b-be7d-431ff41fa0f0	Komal	Ahluwalia	14	2014-03-11	8165754863	Female	P.O. Box 305, 4151 Dictum. Rd.	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644132512	1599644132512	d0e01fed-143e-40fd-9352-f35a266a8db3	Paran	Bajwa	15	2014-08-05	2313445187	Male	9040 Turpis Av.	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644150608	1599644150608	2c8a896c-4839-459c-b4e7-1e2b98aecd30	Avantika	Dara	16	2014-02-11	9485223303	Female	P.O. Box 647, 7851 Sed Rd.	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644171704	1599644171704	c5ba6aa6-88cd-4448-b978-df44dd885cc2	Shriniketan	Anand	17	2014-07-15	6395710163	Male	870-6015 Molestie Rd.	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644179258	1599644179258	647fe169-5a07-468a-9ec9-1e19b6edd9d7	Vishnudev	Datta	18	2014-12-04	5802034995	Male	Ap #995-5665 Felis, St.	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644186725	1599644186725	241c82e0-27a7-4934-8022-98cdfbabbc21	Visham	Ganguly	19	2014-05-19	9936623116	Male	128-9034 Sed Rd.	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644194520	1599644194520	4b265b46-6df5-4227-b0ee-abc177c08d99	Nitesh	Parekh	20	2014-03-15	4443498900	Male	Ap #270-4189 Proin St.	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644204405	1599644204405	1fb5410b-6c2a-4235-9874-d4606b9dc429	Keshini	Ahuja	21	2014-11-19	8139312381	Female	1475 Ut, Street	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644214837	1599644214837	7087427c-1b9f-4d85-bbf5-dd8beeea74c5	Chirayu	Madan	22	2014-08-03	8915319833	Male	113-5021 Dignissim Rd.	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644223378	1599644223378	7ee665a4-1407-4e9d-a5ad-704ac521433e	Astha	Datta	23	2014-09-28	7357503983	Female	Ap #148-856 Augue Rd.	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644230444	1599644230444	55255440-a132-4479-8f6b-f812c9f8475b	Neeru	Rao	24	2014-05-20	7683734843	Female	354-9004 Massa Rd.	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644237578	1599644237578	e4b0aeec-2fb8-40f9-829c-92f547eaf536	Banhi	Joshi	25	2015-01-17	5644526605	Female	255-3964 Maecenas St.	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644246883	1599644246883	ddc95fb7-40b4-40a3-a82c-f0991a368a79	Sharmistha	Datta	26	2014-12-24	8248816700	Female	4522 Dis Av.	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644257295	1599644257295	33608810-b69c-4665-b239-7df40b1a945d	Vandita	Grover	27	2014-07-09	4332900898	Female	636-5570 Ligula. St.	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644265660	1599644265660	2de72d21-1e4d-4f7b-9a4a-0232c38858a0	Vrishank	Anand	28	2014-08-25	7119719424	Male	331-6420 Suspendisse Street	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644274192	1599644274192	fffa4518-3e6d-4ffb-9041-7be186388946	Lalchand,	Dixit	29	2014-02-21	6822038683	Male	180-6376 Quisque Road	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644285968	1599644285968	bd97d863-a8ac-4c29-9dc6-d2c9bf28f084	Vrishabh	Mannan	30	2014-06-15	2926430885	Male	Ap #758-5744 Felis Street	a50f6bd4-daef-4362-b411-c0e91c50cd31	{"createdAt":1599617634029,"updatedAt":1599617634029,"id":"cc6417c8-eeb5-41a9-840e-c1525c80abaf","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":12000,"registrationFee":500,"labFee":2200,"examFee":1300,"sportsFee":1600,"title":"Class 2","totalfees":17600}	1947-08-15
1599644714489	1599644714489	66ba41e7-02f6-4d7b-9bdb-c188965abc73	Neelam	Biswas	1	2013-07-26	8286826702	Male	P.O. Box 386, 4362 Fusce Road	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644722701	1599644722701	9a6f2aef-94e4-4df0-bab5-a8b90a1d9cce	Uddunath	Grover	2	2013-09-10	6305307205	Male	Ap #268-9202 Phasellus Street	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644730186	1599644730186	17d23e4e-eab5-40ff-a822-df31d8fadd4f	Vajra	Chabra	3	2014-01-06	9471483784	Female	Ap #847-3688 Amet, Rd.	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644738788	1599644738788	904c5d95-dd27-45dd-89bc-e1c19e455398	Aaruthira	Bajwa	4	2013-06-03	8636413064	Female	Ap #725-6123 In St.	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644747828	1599644747828	3467b286-370a-4246-a79d-20b78156b541	Madhushri	Anthony	5	2013-05-15	2787207083	Female	6074 Facilisis Road	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644758655	1599644758655	1463121d-8ff8-4096-9f8c-7df5f28e32ba	Sachchit	Bawa	6	2013-12-30	2793951579	Male	P.O. Box 176, 4009 Dui. Street	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644767178	1599644767178	6a66def8-ded9-4f8e-b611-87c4d38e3f6f	Baldev	Kumar	7	2013-09-22	6106215954	Male	400-7562 Luctus Rd.	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644775355	1599644775355	806d5889-00bc-47f7-bfbb-7f518b0fa70a	Raashi	Kumar	8	2013-02-20	2328412619	Female	810-9267 Tincidunt Rd.	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644784999	1599644784999	7f8fdc4e-3820-46c5-9d29-f9057051e08c	Sanay	Thakur	9	2013-09-26	3832001605	Male	646-1255 Nullam St.	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644793455	1599644793455	3c4aeb65-fe54-4bf2-a94a-6a30326e0259	Neelotpal	Grover	10	2013-05-09	3272746005	Male	P.O. Box 140, 4367 Nec Street	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644801148	1599644801148	545a1122-4a83-4859-9d20-b577b5be9963	Rushil	Kapadia	11	2013-06-24	8452115873	Male	3444 Eu, Rd.	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644810707	1599644810707	b4774f0a-3bad-4aac-8e18-d0040b38ca58	Alok	Bakshi	12	2013-12-03	8907401282	Male	P.O. Box 575, 7970 Dolor. Road	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644818515	1599644818515	d1583f5d-e15c-4ea9-acb9-28a3734d6deb	Meghraj	Deshmukh	13	2013-06-10	1982089933	Male	Ap #393-6073 Ornare Ave	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644826671	1599644826671	da7bf6e5-c746-497b-ac43-9d10ba1bd249	Shonima	Dewan	14	2013-05-07	6102679799	Female	602-3419 Dolor. Rd.	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644832923	1599644832923	e05409df-3550-4527-98ff-81302c404b38	Sanjivani	Dhawan	15	2013-08-06	7690689014	Female	Ap #540-4125 Ullamcorper St.	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644839800	1599644839800	ff2a0872-aa61-43a4-884b-1319c2f73bbb	Ratul	Reddy	16	2013-03-04	3872428079	Male	4904 Penatibus Rd.	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644846809	1599644846809	3f711f0e-0343-4c63-9750-465a64b4aaac	Harteij	Chabra	17	2013-05-14	5014212522	Male	P.O. Box 455, 9592 Est Rd.	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644856652	1599644856652	aa8c3229-aa3e-4711-ba95-3bc9e64d2fa3	Bhadrakapil	Arya	18	2013-07-03	2420255201	Male	Ap #946-2784 Ut Rd.	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644864492	1599644864492	4c87aa90-7c08-42b2-a267-f9542e4b50c4	Maitreya	Dixit	19	2013-04-27	3012853422	Male	Ap #558-324 Arcu Road	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644870042	1599644870042	d39ac458-50ea-4ff7-9fb1-94433308b04d	Devi	Mangal	20	2013-06-15	3515616652	Female	390-2277 Adipiscing Av.	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644876802	1599644876802	7fc02964-7406-4f42-a42c-d8f3bee64df6	Sanjukta	Grover	21	2013-04-07	9574828831	Female	P.O. Box 191, 7743 Consectetuer, Avenue	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644883206	1599644883206	3c896a69-64cd-4a40-8dfd-f38d71ed85e6	Namrata	Bedi	22	2013-03-26	1815292709	Female	651-8528 Augue Ave	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644890743	1599644890743	47026f3a-9378-4a27-8531-73ce18ac2f4b	Shaligram	Modi	23	2013-11-29	2909553287	Male	7138 Semper Avenue	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644900181	1599644900181	dd9ba363-5d74-4cb5-90fb-df4dededa703	Phalguni	Pandey	24	2013-03-13	7401459970	Female	P.O. Box 242, 6456 Erat Road	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644907091	1599644907091	fcdae143-66d0-420f-8b38-61189125f32a	Gyanda	Ahluwalia	25	2013-02-28	9399177999	Female	P.O. Box 724, 8803 Ridiculus St.	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644914429	1599644914429	e53191cd-027e-4319-9e30-707b424ca339	Tapasi	Kumar	26	2013-08-30	6959798818	Female	P.O. Box 439, 5769 Dui. Avenue	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644924740	1599644924740	f1a3cc15-53b1-4a70-aeb8-e1db951c7dad	Ishir	Kulkarni	27	2013-05-29	4074320286	Male	5157 Diam. Ave	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644932376	1599644932376	1a6ec705-47b2-4087-a920-6c6df513301f	Ekanthika	Banerjee	28	2013-04-27	5962821096	Female	547-3084 Nulla Street	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644939769	1599644939769	7c548e4e-cee4-4ef4-8f42-541d304a6a2e	Irit	Mallick	29	2013-08-02	3482979515	Female	790-7074 Pharetra, St.	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599644950836	1599644950836	316a7a61-07e1-48b5-aeca-f8576d6db04b	Dhigana	Kapadia	30	2013-11-07	7642125962	Male	4488 Dolor Rd.	cb052722-1d02-44bf-887c-77818a3bf7d5	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645188578	1599645188578	f4598fa9-e98c-4191-8b20-734e2c688b08	Shibhi	Mehta	1	2013-12-05	5155427066	Male	P.O. Box 142, 6157 Sit Road	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645195922	1599645195922	65260257-10a7-4724-9327-0c46f795ccc0	Brave	Chauhan	2	2013-04-30	5793455916	Male	852-7532 Scelerisque Road	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645203784	1599645203784	6470ee75-d842-47b0-829c-1a1d954af8fa	Roma	Kulkarni	3	2013-06-05	5876776102	Female	P.O. Box 164, 8366 Vestibulum Rd.	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645212521	1599645212521	9bbe1e25-e316-4fca-86cf-d75d8ea7f539	Vishalaksh	Deshmukh	4	2013-11-02	5295634008	Male	9477 Lorem, Street	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645222374	1599645222374	11dfec4f-039f-412a-88e0-1d67d081fa55	Sarojini	Mani	5	2013-07-15	4875766077	Female	5845 Orci. Street	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645232235	1599645232235	ddd30dab-6a09-4495-9832-3a1db5aad24c	Naomi	Bedi	6	2014-01-14	1626428957	Female	P.O. Box 246, 1365 Aliquam Road	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645240406	1599645240406	6a626b3b-c491-45ac-84d8-210f6ff8fd48	Mallika	Banerjee	7	2013-04-20	3108971562	Female	P.O. Box 904, 3779 Pharetra. Rd.	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645248769	1599645248769	5d2c9d74-75a4-4140-81c3-6888e8555ee4	Elakshi	Laghari	8	2013-07-04	6456318172	Female	Ap #222-9928 Ornare, Av.	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645258499	1599645258499	cc788d4f-3ab6-45fe-aacb-767220d0cb54	Varshitha	Bedi	9	2013-08-31	9187561676	Female	5256 Eu, St.	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645266460	1599645266460	f971a850-964b-4128-b0ef-6d3ef1701996	Sachit	Deol	10	2013-06-14	1638657102	Male	640-4636 Sodales Av.	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645278010	1599645278010	e7bdbead-f84d-470d-8bef-3a7d75ea121c	Darpita	Seth	11	2013-04-24	3802326729	Female	453-7548 Vitae, Ave	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645288666	1599645288666	7fef1718-27a9-4b82-a67d-464eb83287a6	Udbhav	Bhasin	12	2013-08-15	3804589437	Male	P.O. Box 298, 6319 Lacinia Av.	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645299838	1599645299838	06f13418-28fb-402f-8342-e88bf00a22db	Vikarnan	Deshmukh	13	2013-11-21	8348367708	Male	7394 Orci Rd.	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645310507	1599645310507	27d937ef-e717-4a2f-85e2-e37fa2658362	Shashishekhar	Dhillon	14	2013-08-14	7553204648	Male	286-6938 Feugiat Rd.	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645319885	1599645319885	0c312bbb-1c97-494a-a076-48c8576e4867	Vitaharya	Rao	15	2013-07-13	7485125338	Male	Ap #941-865 Enim. Avenue	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645329057	1599645329057	dc8e1b9a-0efd-4ea9-bf86-6242beee716d	Dwijesh	Joshi	16	2013-10-09	9407157676	Male	P.O. Box 661, 1624 Facilisis St.	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645336073	1599645336073	1928c054-867e-4de9-9319-17967e901a2b	Naina	Bhasin	17	2013-08-02	8941528352	Female	4106 Mollis Street	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645346114	1599645346114	a90ad505-af40-49e7-a3f4-10d42afa1695	Gunavati	Ahuja	18	2013-08-10	8104635747	Female	Ap #861-1922 Non Ave	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645354058	1599645354058	6474dc65-34be-4394-ba86-bde61e067109	Amolika	Chopra	19	2013-08-15	6909270754	Female	P.O. Box 221, 7078 Pede Rd.	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645363270	1599645363270	e7981f1d-9da5-4596-8d7e-a940a19a7450	Dristi	Anand	20	2013-12-16	3641851190	Female	8383 Rhoncus. Avenue	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645371249	1599645371249	38080471-d586-43e2-b3e1-420b31f9356a	Sachi	Chakrabarti	21	2013-06-23	8638031946	Female	465-1387 Ligula St.	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645389854	1599645389854	73006a99-601f-4431-939d-e703e463cda3	Kushali	Bawa	22	2013-04-23	2414493606	Female	327-4895 Urna. St.	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645398815	1599645398815	435e935b-adaf-42ca-88db-e2cca93aa31b	Satyayu	Banerjee	23	2014-01-07	9758042954	Male	8579 Hendrerit Rd.	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645410748	1599645410748	bd589546-dce5-4c9e-a5ea-f4c171b17d32	Arun	Ghosh	24	2013-02-09	2310665825	Male	288-5591 Enim Rd.	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645420191	1599645420191	29218f81-801f-4e22-8e8d-af161246763e	Rushabh	Garg	25	2013-05-31	9410902656	Male	Ap #348-4089 Amet, St.	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645430551	1599645430551	4bd31505-0caa-40ad-9382-0541804b5c51	Naayantara	Bhasin	26	2013-10-20	1347517371	Female	P.O. Box 488, 7729 Bibendum Street	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645440376	1599645440376	f434c497-0d84-4cdc-a0a1-d4c2038b6b51	Chintanika	Bajwa	27	2013-04-07	7877843007	Female	Ap #889-742 Fermentum Road	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645450497	1599645450497	e8109afa-0b15-48b0-b454-2253b71d745c	Salil	Basu	28	2013-04-01	3296311272	Male	P.O. Box 331, 8661 Lorem Ave	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645459658	1599645459658	a846c28d-17e7-4089-8b55-d28acfd1415f	Suryansh	Rao	29	2013-09-11	6722733577	Male	1899 Tristique Rd.	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645467671	1599645467671	aaba06b0-4c6e-4080-bc7a-ebff342634e4	Ajitabh	Acharya	30	2014-01-20	1405047741	Male	P.O. Box 243, 979 Orci, Rd.	dddb344d-00ce-4d6f-bea6-2b1238e562f4	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645914762	1599645914762	8b15969e-8940-4bd7-b137-a3306682d0bc	Godavari	Kaur	1	2013-09-12	6330938529	Female	Ap #918-2272 Nisi Rd.	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645922198	1599645922198	fc2b00b8-77ba-42ea-8158-d68e3f26bbb1	Pran	Seth	2	2013-07-29	8121330994	Male	6530 Magna Rd.	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645929628	1599645929628	e7d157dd-b4ad-4afb-b5da-f7c3adc00b75	Narinder	Malhotra	3	2013-02-09	5358572498	Male	Ap #623-9044 Elementum, St.	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645937553	1599645937553	e8085eeb-a65f-4ad2-a02b-0cdaa04caf6d	Rashmika	Apte	4	2013-08-03	7485879547	Female	Ap #223-9954 Proin Av.	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645945427	1599645945427	0b074217-5abb-4d63-a037-ba45debd6a8a	Vrajalal	Goswami	5	2013-06-21	9556291891	Male	843-4860 Per Road	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645954354	1599645954354	d97894dc-6d79-42e6-a4f2-480a9d4b0e82	Prithu	Goel	6	2013-02-14	5378621093	Male	6661 Blandit Avenue	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645962303	1599645962303	5bfef41e-b533-406a-bd5e-2cdf0b856d24	Vedant	Dewan	7	2013-05-30	5069034713	Male	P.O. Box 352, 231 Sed Rd.	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645970623	1599645970623	f04b914a-2dda-4887-a611-4345582fae4b	Tanuja	Ganguly	8	2013-07-16	8991212941	Female	9810 A Road	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599645978041	1599645978041	b98f1c08-19a1-40f5-8d94-c333146b1682	Saatatya	Batra	9	2013-07-17	9805928841	Male	P.O. Box 976, 5745 Eros Rd.	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646002330	1599646002330	27745a3c-05fa-4e90-93f5-157be63cac9e	Sapna	Jha	10	2013-07-11	7713561694	Female	P.O. Box 652, 3586 Orci. St.	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646009906	1599646009906	68502d9e-f13c-49da-93d7-3bbeaa586ac3	Samrath	Bawa	11	2013-07-08	2606320665	Male	115-8413 Sapien, Road	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646018608	1599646018608	05352319-2f1a-4af1-a63a-b3d86d4543a1	Bindhu	Kohli	12	2013-05-10	3848733440	Female	Ap #256-5519 Vel, Av.	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646028226	1599646028226	e10017aa-f312-4dee-a591-393e8d2150c2	Banita	Singh	13	2013-06-12	6440133426	Female	P.O. Box 989, 3395 Pulvinar Street	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646037279	1599646037279	c63303f1-b4ae-4bc6-996f-3c0a4e5297b9	Darshini	Ahluwalia	14	2013-05-17	3092981140	Female	184-7404 Orci Ave	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646045552	1599646045552	49f6b053-343b-4c8d-8c91-3018ef61471f	Sukanya	Mallick	15	2013-04-23	3934618468	Female	649-8802 Convallis Road	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646056783	1599646056783	efc7d750-b41a-41eb-91b1-3dba1f66de1b	Trisha	Purohit	16	2014-01-21	2490847292	Female	Ap #810-6648 Lobortis, St.	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646065288	1599646065288	4d1889fe-432a-4a01-bd29-605325660fe6	Hiral	Chauhan	17	2013-05-16	2900780407	Female	3697 Proin Rd.	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646075101	1599646075101	68406330-bdf7-42ea-84a6-a31dfb7f3bd7	Shivapriya	Bhasin	18	2013-06-06	4914288640	Female	Ap #599-7873 Neque Ave	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646083642	1599646083642	4e38f383-bc04-4be6-bff8-639a548f3109	Krithi	Amin	19	2013-04-15	2786913297	Female	510-6733 Lacinia Street	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646092190	1599646092190	70cf4185-1dcb-43da-8bd1-04ee4880ee59	Sharat	Singh	20	2013-07-31	2895348065	Male	Ap #842-2075 Ridiculus Ave	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646099911	1599646099911	a84845f8-3776-463b-8306-6ff10665629f	Bali	Kumar	21	2013-05-09	8176534585	Male	Ap #242-5774 At, Avenue	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646108391	1599646108391	1e13a62b-5cf8-44b6-9a5d-019489e484ec	Umesh	Chowdhury	22	2014-01-15	3272740390	Male	7403 Et Street	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646115999	1599646115999	7d0c24a1-dbb8-41a6-84b1-0d4772de6e29	Shiksha	Gokhale	23	2013-05-25	4347141316	Female	6824 Eu St.	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646123318	1599646123318	5c56656e-ccbc-4807-8cd6-cec4c5efa01f	Shraddha	Kapoor	24	2013-05-20	3723291368	Female	Ap #509-7974 Est Avenue	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646130711	1599646130711	99128921-5ca0-4d65-90aa-f61b3dd295dd	Rasbihari	Pandey	25	2013-05-05	5745762891	Male	268-8370 Libero. Av.	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646140505	1599646140505	1361fa89-cbb8-4607-b0c2-7120929dd992	Saramay	Deol	26	2013-12-28	3470241522	Male	P.O. Box 320, 4528 Purus St.	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646148202	1599646148202	7f25a19b-e891-4fb7-bd3f-f04cabacd653	Hanita	Balakrishna	27	2013-10-16	9651638368	Female	6627 At Ave	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646156185	1599646156185	7d886a77-1819-4d78-88c8-c8b96600e75e	Santatey	Gandhi	28	2013-11-15	3119421102	Male	7910 Purus. Rd.	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646169600	1599646169600	d2d6b5ac-95a3-41ac-96d7-6f495858622f	Sarin	Bhatt	29	2013-12-26	5464436198	Male	P.O. Box 766, 4974 Mattis. Street	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646177105	1599646177105	f8fad8f4-e040-4537-9290-4f7a600d73b8	Heer	Chabra	30	2013-10-11	7945144157	Female	P.O. Box 536, 4581 Facilisis Road	8df3d7ad-4ee5-4d86-a034-b60b2d2c7c0a	{"createdAt":1599617691271,"updatedAt":1599617691271,"id":"452a63b6-1680-4159-ade1-84a6cb1c8a22","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":13000,"registrationFee":500,"labFee":2500,"examFee":1500,"sportsFee":1800,"title":"Class 3","totalfees":19300}	1947-08-15
1599646578846	1599646578846	61de2182-2569-4fd4-8378-ce734d55ca71	Prithu	Thakur	1	2012-08-09	3642057539	Male	4275 Lorem St.	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646588179	1599646588179	b02cc4f6-309a-429d-8eb0-17a722474a9b	Dhanya	Patel	2	2012-05-11	9197299344	Female	Ap #754-4889 Aliquam Rd.	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646595134	1599646595134	c76f934a-741e-4ad4-a661-b75c7cafdb2c	Bhavika	Ganguly	3	2012-04-29	9459212725	Female	9460 Eu Av.	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646604173	1599646604173	02fa67cd-2c7b-4223-8ee7-f19cac04e469	Indukanta	Garg	4	2012-04-05	2711113383	Female	100-1273 Dui. St.	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646613603	1599646613603	0b3de77d-f8c9-492d-a022-9db7d4b7ddd8	Uchadev	Khurana	5	2012-05-30	2686873744	Male	957-6988 Facilisis St.	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646621838	1599646621838	b1ead367-3649-4e40-9339-fb6cf5c4e176	Shinjan	Ghosh	6	2012-03-19	8387840303	Male	Ap #467-6102 Enim. Street	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646629252	1599646629252	a639a4d9-84cd-4d5a-a812-0eab16a7f35e	Aaral	Deol	7	2012-09-30	1600252732	Female	Ap #346-8205 Purus. Av.	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646637852	1599646637852	7e283f5d-99c2-45ed-b7c9-7123e20db7ee	Pramit	Chakrabarti	8	2013-01-01	3245090221	Male	Ap #152-3897 A Road	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646645471	1599646645471	2bcad311-2445-4f98-9af8-fb89972673e6	Mukta	Bhatt	9	2012-07-23	5864492121	Male	P.O. Box 805, 4642 Felis Rd.	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646653642	1599646653642	f86db885-303f-4fe9-a9ed-3fd17a09d80f	Ayush	Malhotra	10	2012-04-01	1058557609	Male	929-2517 Leo. Rd.	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646661392	1599646661392	4502c491-654f-488e-a75f-6ea89f987e29	Subhas	Ganguly	11	2013-01-14	5249709123	Male	Ap #177-5845 Interdum. Street	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646669809	1599646669809	09a98f6b-c0b4-41d7-8f7d-ee1e9f26ec26	Suneeti	Joshi	12	2012-12-13	3734453597	Female	2950 Semper Road	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646677961	1599646677961	51e733bd-34b5-44d1-a5fe-be6489fb9a95	Romir	Parekh	13	2012-05-26	3934247670	Male	P.O. Box 353, 8138 Aliquam Rd.	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646688549	1599646688549	32dd8735-fe48-4ee3-8861-bf5db59e0f81	Vaibhav	Garg	14	2012-12-02	2410987235	Male	P.O. Box 926, 6533 Dolor Av.	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646700546	1599646700546	d6460890-8d5d-4c5a-a975-c6c8f723db52	Sanjog	Kapoor	15	2013-01-20	3198651775	Male	Ap #166-4120 Erat Avenue	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646709130	1599646709130	eb9281f6-a2f8-4258-b2fe-165fd0cc12fc	Kashmira	Babu	16	2012-06-14	2664275841	Female	6516 Dictum Road	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646716970	1599646716970	3c1821af-67e7-4603-aa1d-4928e4e26a38	Saubhag	Madan	17	2012-06-11	7400051038	Male	2955 Aliquam St.	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646726029	1599646726029	51cf7031-9dba-48ae-b094-dcc90932473e	Kanishka	Mani	18	2012-04-12	8304902976	Female	Ap #502-9253 Eros. Avenue	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646733877	1599646733877	a6209227-4d19-4e24-a667-96248f8595fa	Thavanesh	Garg	19	2012-02-24	9527431804	Male	518-1719 Adipiscing Road	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646743006	1599646743006	5d679272-f86e-423d-8241-84d2f7cf5163	Mahavir	Ahuja	20	2012-06-22	2364893417	Male	Ap #580-7315 Quisque Rd.	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646749963	1599646749963	3e598139-b0ec-4cfd-ac42-af9871824681	Sanjivini	Dubey	21	2012-05-08	9029540929	Female	Ap #404-2221 Enim, Avenue	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646757302	1599646757302	77d6b31d-1b7f-46bd-a1ac-daf1fa0e0dfe	Varija	Varma	22	2012-04-05	2993316152	Female	P.O. Box 419, 8384 Ac Av.	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646765277	1599646765277	4b06ad8c-4c2d-4064-8ee1-4f617c5eedbb	Anandmoorti	Chandra	23	2012-07-31	2601953531	Male	2616 Non, Rd.	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646773607	1599646773607	eed2378b-0ee1-4185-b487-90cab0988848	Ranjana	Kohli	24	2012-11-04	6141367726	Female	634-6540 Id Rd.	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646782539	1599646782539	c27f277f-0d45-43df-938c-8cbed4f5ec14	Sathya	Dewan	25	2012-02-27	2836717801	Female	341-624 Amet St.	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646791159	1599646791159	111215bc-293c-43b1-b1a3-b853e9e81375	Sucheta	Jain	26	2012-08-13	2013456996	Female	P.O. Box 576, 9846 Vel Av.	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646799381	1599646799381	358e5430-6716-4975-8a90-28511e8a5874	Gowshik	Varma	27	2012-08-21	9542123258	Male	610 Dolor. Ave	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646807102	1599646807102	06b637b7-6aad-427d-92e8-381c5768fe2d	Lukesh	Chopra	28	2012-03-01	8990588809	Male	P.O. Box 158, 7546 Elit Rd.	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646814420	1599646814420	0944022d-31c0-495d-9222-96817c95c7c4	Misri	Varma	29	2012-05-28	5299692231	Male	P.O. Box 370, 605 Facilisis St.	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646823507	1599646823507	3d09c59d-568e-48e8-9758-eb1ff1af4c03	Anura	Dhillon	30	2012-06-29	1855961575	Female	7482 Felis, Av.	f6781746-6a57-4120-b0c5-1d8f3ebde775	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646978004	1599646978004	b3aee2c4-a08d-4d59-b43b-1b8844db2f42	Shivangi	Kulkarni	1	2012-06-27	9759965945	Female	532-5478 Ac Avenue	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646987066	1599646987066	42f19e77-4354-4baa-bc5c-3253e7745e17	Vishvas	Goel	2	2012-08-21	4730179559	Male	P.O. Box 365, 5800 At St.	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599646993256	1599646993256	50bf6e74-ea06-4f67-bd29-bf6d125b3308	Renjith	Parekh	3	2012-05-28	8176439537	Male	6500 Faucibus Rd.	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647001325	1599647001325	6d2e1a2b-cb45-4375-a5f6-4560bebc6dc2	Samiha	Sharma	4	2012-02-03	4018058383	Female	Ap #590-4243 Morbi Av.	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647010873	1599647010873	96d74643-c5f2-4ac1-b3c6-700f776fbb34	Hemendu	Arya	5	2012-05-08	7634938317	Male	7579 Mauris Av.	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647020600	1599647020600	86c53eee-d70c-4b49-941c-8addca8a3a94	Chakradhar	Thakur	6	2012-10-30	3040999438	Male	131-2959 Odio Ave	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647028800	1599647028800	5cfdf088-9a54-4bf5-95c7-6379cc66ca1b	Veronika	Bhatt	7	2012-02-23	3326415118	Female	3814 Consectetuer, Street	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647035898	1599647035898	08af775a-f91d-438f-bb35-69fb68ae13a9	Rashmika	Khurana	8	2012-11-28	1175058051	Female	520-3512 Nullam Road	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647044399	1599647044399	e230f4b0-a6cb-4eab-98f2-dc170add0314	Toral	Shah	9	2012-05-11	4665550454	Female	970-7588 Elit. Rd.	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647052203	1599647052203	370066e8-8828-4478-992f-a028be8d7f7d	Dipu	Dixit	10	2012-10-05	5402009722	Female	P.O. Box 640, 8366 Orci Av.	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647059378	1599647059378	02bdd495-037a-4310-ac77-cbf8b7938fd7	Vivek	Patel	11	2012-09-20	5926533649	Male	7288 Consectetuer Avenue	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647069191	1599647069191	7cf0c2ed-c546-46ed-9298-6cc206728341	Vrajesh	Mani	12	2012-03-05	6777622943	Male	298-4620 Vehicula Avenue	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647075648	1599647075648	ae181050-d3de-4933-b058-8e63b038b06c	Pratap	Chawla	13	2012-05-22	6279909693	Male	8731 Enim St.	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647082393	1599647082393	2e603b30-9adb-444a-b1df-99da5441cd24	Punya	Ahuja	14	2012-07-20	9599108005	Female	P.O. Box 828, 5936 Semper Avenue	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647089966	1599647089966	8aebab59-8ef6-42e4-a152-af023f62a3c7	Prachet	Madan	15	2012-05-23	7479355654	Male	9272 Porttitor Street	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647097004	1599647097004	b3b2ed04-6874-4ded-a58e-cd7f605c8f76	Rashi	Zacharia	16	2012-07-09	4299250679	Female	P.O. Box 583, 799 Gravida Av.	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647104795	1599647104795	87830991-cd0d-435a-979c-53f5655d7c4a	Pushpa	Puri	17	2012-11-10	6215639634	Female	986-6864 Molestie Av.	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647114043	1599647114043	ad09c482-1e0c-40f2-8399-be012fd67db2	Chandini	Dubey	18	2012-12-28	7534875520	Female	8977 Lacinia Street	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647122170	1599647122170	a31149d3-8b35-41cb-a380-3c9b4b203370	Jilesh	Chauhan	19	2012-12-24	1902857207	Male	P.O. Box 547, 7741 Eget St.	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647129850	1599647129850	11cd300e-5d70-4a9e-8996-4ffbc50f89cc	Sadhana	Ahuja	20	2012-03-24	7049398290	Female	7174 Blandit Avenue	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647138100	1599647138100	cc85b555-d5b7-4781-951e-92d6a1425709	Ishver	Varma	21	2012-02-06	9591150166	Male	646-3837 Sit Ave	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647144559	1599647144559	b0ea5abf-7b33-46e0-9480-0efd93b345ad	Saniya	Acharya	22	2012-06-22	7508825683	Female	P.O. Box 222, 5520 Semper Street	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647151363	1599647151363	3c44ca13-222a-4489-bef0-65ddb18b7e4b	Ashni	Goel	23	2013-01-06	1743702226	Female	P.O. Box 682, 2077 Ante. Street	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647158836	1599647158836	fd8665b9-5adb-4159-8ab5-dc07ac06efa7	Srishti	Chadha	24	2012-03-18	2149481956	Female	565-303 Magna. St.	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647165837	1599647165837	eba4af37-16b2-4349-bd9b-140907d33809	Prathmesh	Mani	25	2012-09-17	6341305791	Male	Ap #909-1445 Purus St.	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647174165	1599647174165	b7117528-b894-4399-8302-f0ada1d6eb8f	Hansika	Ahuja	26	2012-07-15	4523262125	Female	Ap #720-7913 Eros. Rd.	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647182881	1599647182881	982ac9d8-800b-40b8-a8b8-d8fe7760e3a1	Shuchi	Apte	27	2012-08-04	5959811591	Female	P.O. Box 281, 4292 Euismod Rd.	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647190347	1599647190347	6a390612-5bed-4e34-9f11-1b22f17149e9	Makshi	Dewan	28	2012-02-25	1082392440	Female	4498 Convallis St.	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647198370	1599647198370	07171aba-0955-481b-be88-f4234a7cbb78	Nand	Chowdhury	29	2012-11-27	1517438949	Male	P.O. Box 227, 4526 Proin Avenue	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647204634	1599647204634	ace7ec94-3f64-4810-8af5-b1e27d21e861	Krishnaveni	Saxena	30	2012-12-15	2668371219	Female	400-3742 Parturient Rd.	2a1f1532-1b3b-40eb-b27e-9f93fdf5d4d0	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647374087	1599647374087	46154eea-ebcf-4c80-be4d-9c0577798d07	Sanas	Anthony	1	2012-09-04	8182702164	Male	Ap #221-1400 Nulla Avenue	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647381107	1599647381107	7a4e3ce4-608f-427c-9080-804815cc258b	Chintan	Dhawan	2	2013-01-17	1992180970	Male	886-8162 Donec Rd.	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647387971	1599647387971	6db3b3c3-dad7-4755-aec7-4cc211212989	Hemangi	Banerjee	3	2012-05-24	3956864261	Female	566-4153 Tellus, Road	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647399701	1599647399701	805e59ab-0433-4ec2-a967-067a2f1fb4dc	Vireshvar	Sachdev	4	2012-08-25	6319796014	Male	P.O. Box 401, 710 Fusce Rd.	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647406440	1599647406440	23647c39-eda3-432a-9f5f-4c7805d76e51	Chandramouli	Chadha	5	2012-12-23	1165275250	Male	Ap #541-3662 Nullam Ave	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647413257	1599647413257	bda64e13-ac24-4c73-b6fe-659d0ec67cbc	Yajnesh	Batra	6	2013-01-04	9490815219	Male	Ap #777-9914 Pede. Ave	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647421017	1599647421017	033cb11a-eda9-43f0-a826-b5bd2fae15a1	Nirmay	Ganguly	7	2012-07-09	2677116561	Male	Ap #987-4827 Sed Road	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647429347	1599647429347	e41925b7-d7b7-472e-99b4-e9d00e589f7d	Raja	Dhar	8	2012-02-07	3304878919	Male	Ap #805-4675 Nulla Street	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647437858	1599647437858	1c166126-f18d-499c-b96c-7e605b344950	Pandya	Saxena	9	2012-05-31	9673956016	Male	2919 Tortor Avenue	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647447876	1599647447876	853907f3-fe23-4c04-82b6-a6af54ec88e2	Chandraswaroopa	Kulkarni	10	2012-11-09	9350304263	Female	726-5854 Purus, St.	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647454539	1599647454539	f5caa161-7ac9-4f4a-95a8-88da3930aeb6	Padmini	Bawa	11	2012-11-18	5907353372	Female	Ap #161-1100 Arcu. Rd.	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647462097	1599647462097	1a2ac328-fbeb-463b-a3a0-ab397aa91fa0	Savitri	Seth	12	2012-02-22	7490484742	Female	9184 Nulla. Rd.	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647470572	1599647470572	c7a20bc6-8c58-4046-8ed1-8e895db2dc53	Roshana	Dhar	13	2012-09-26	4147457643	Female	Ap #732-7517 Lectus Road	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647478387	1599647478387	2535ebb0-a697-4d8c-882e-a349f0052122	Prasata	Das	14	2013-01-30	4745623079	Male	Ap #631-297 Montes, Avenue	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647486299	1599647486299	14e81cd8-a332-4da8-a7de-fb0faa4bf9c2	Pavitra	Ray	15	2013-01-23	5404653765	Female	Ap #594-4181 Orci St.	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647495386	1599647495386	86fe43c6-0534-4ee6-91c5-4a4e445dd264	Vihang	Dhar	16	2012-12-31	8226120903	Male	4128 In Avenue	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647506911	1599647506911	1d446d3b-2db8-4e28-b1be-8ae0f7716286	Ranjita	Dixit	17	2012-12-29	7203424621	Female	P.O. Box 952, 1216 Tortor Street	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647514664	1599647514664	d0ce663f-b426-4d76-b091-91df74061f22	Padmalochan	Patel	18	2013-01-02	6931655438	Male	6638 Sed Rd.	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647521412	1599647521412	5945f39c-8813-4920-8cd6-a8f9f9c2bf52	Ramit	Ranganathan	19	2012-02-27	8332443388	Male	9611 Parturient Street	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647528186	1599647528186	cb80ef45-1984-432a-9025-3ed3fb5f1bdf	Mrityunjay	Chadha	20	2012-09-22	1451018217	Female	692-495 Neque. Road	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647535970	1599647535970	0e5bb751-35c4-46e6-a3a3-3600f14a6935	Omprakash	Kapoor	21	2012-04-06	4267177118	Male	937-3562 Sem St.	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647544093	1599647544093	07056659-9f51-4cb8-90e7-a284a447b358	Rajisha	Sharma	22	2013-01-10	4412578630	Female	Ap #602-6031 Cum Avenue	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647550577	1599647550577	d27987cb-af9f-4a83-a500-b4468381f451	Maya	Sharma	23	2012-04-19	5723798327	Female	P.O. Box 594, 3389 Duis Road	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647559005	1599647559005	5e90166b-3d82-43a1-92a0-3c7ede303aa6	Puskar	Reddy	24	2012-05-11	7965876435	Male	P.O. Box 752, 4417 Nonummy Road	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647566527	1599647566527	2bd2a4cc-1e43-41f7-b72f-ffe1d8705547	Rakhi	Batra	25	2012-05-04	2859834356	Female	8735 Blandit Road	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647575492	1599647575492	60e1b0ca-e1ab-48a4-b9be-12bd875d6fd3	Kallola	Ganguly	26	2012-05-17	9975495381	Female	Ap #434-5759 Egestas. Ave	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647586815	1599647586815	a5146f13-5870-4f43-9643-8eb4faad48d9	Shivasunu	Bhasin	27	2012-09-20	4844194651	Male	Ap #282-5984 Vehicula Ave	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647596067	1599647596067	9f382c7f-5a61-4286-8343-dcf54cde9ea2	Shivasunu	Sharma	28	2013-01-26	3604692311	Male	903-5907 Placerat St.	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647604429	1599647604429	56b8a0ee-8b02-43f1-a5f4-d13e9fc197cb	Sourabhi	Modi	29	2012-03-29	5534448009	Female	991 Malesuada. Avenue	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599647612695	1599647612695	909050f5-af4d-4dbb-8ab8-5b0a86168bdc	Gursharan	Bedi	30	2013-01-03	2576194001	Male	P.O. Box 380, 8417 Proin Ave	f9906a19-5835-4c07-93ea-c1f3228c8fc5	{"createdAt":1599617784687,"updatedAt":1599617784687,"id":"7d151c75-cb04-4912-a8ea-22762281aa71","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":15000,"registrationFee":500,"labFee":2750,"examFee":1500,"sportsFee":2000,"title":"Class 4","totalfees":21750}	1947-08-15
1599648221260	1599648221260	e60efc06-e567-48d2-aad9-0087aa35fa31	Aryan	Pandey	1	2011-07-31	5008958452	Male	623-4392 Et, Road	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648228766	1599648228766	c47c9552-49dd-4218-b7ee-c20c51ed2a75	Taran	Bedi	2	2011-02-09	5175139456	Male	Ap #748-4156 Ante, Rd.	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648236047	1599648236047	6382f35d-0246-4dd4-9774-dfb7af90c19a	Vayu	Apte	3	2011-08-02	4639810271	Male	576-8883 Aliquam Av.	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648243265	1599648243265	8a188a47-05d9-4aea-b864-6894517ec4df	Jagadeesh	Agarwal	4	2011-09-13	4486994887	Male	708-2289 Erat St.	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648250750	1599648250750	767014d8-f8f2-4c71-81a4-50eb1514013c	Varushka	Khurana	5	2011-06-01	9237914320	Female	410-465 Est, St.	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648260837	1599648260837	4a514568-bcb9-4d61-8490-b41e979f3263	Kalindi	Bhasin	6	2011-06-01	9417701608	Female	Ap #250-7953 Sagittis Rd.	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648267584	1599648267584	362a4255-8d55-48ff-b442-5d9b08784aa7	Nartan	Lal	7	2011-04-19	5007516067	Male	7729 Nisl. Ave	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648276247	1599648276247	cc7ebfdb-db66-422a-bd16-971afd2f072d	Amal	Goswami	8	2011-08-05	1142288473	Male	391-2827 Pharetra. Road	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648295893	1599648295893	6c32e0c1-96e3-43ec-9b6b-02df5e528446	Devkinandan	Saxena	9	2011-12-18	4481088025	Male	9463 Fusce Avenue	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648303949	1599648303949	3fb601c1-50bd-4a49-83bc-993637aa927e	Sarasa	Iyer	10	2011-07-22	5849165469	Female	P.O. Box 664, 8531 In Av.	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648313716	1599648313716	f3c08968-19c5-4da6-8d51-14b31bc44ada	Vithika	Dixit	11	2011-11-21	7813979324	Female	P.O. Box 273, 9868 Vitae Ave	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648333447	1599648333447	2a76899a-bb9b-4724-aaa0-15a2e384bd09	Saransh	Iyer	12	2012-01-09	4055535194	Male	575-6863 Sed Street	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648341953	1599648341953	69988c51-6051-44bf-8204-a2e465bf8646	Pramod	Kumar	13	2011-06-05	9223508963	Male	Ap #314-9676 Volutpat. Road	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648348503	1599648348503	2662a71d-75d6-4e97-af2e-411870cdbd8f	Lokprakash	Chandra	14	2011-09-15	1546424834	Male	747 Aliquet St.	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648355698	1599648355698	f361ad75-19a9-4fc7-9fa3-2bf67deaa555	Manasa	Khatri	15	2011-07-12	4289658193	Female	258-8969 Aliquet, Rd.	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648362613	1599648362613	082b0fa4-32b4-44a6-82d5-c23f094fb80c	Sridhar	Saxena	16	2011-10-22	8786123068	Male	587 Quisque Ave	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648374528	1599648374528	c8ef7098-307b-484e-a129-eea9b832e251	Kalka	Parekh	17	2011-08-25	4915619911	Female	P.O. Box 205, 8472 Lectus. Street	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648381547	1599648381547	65acd604-8ca8-401c-81d9-720d3a3593ec	Saguna	Amin	18	2011-06-21	8442042363	Female	160-7752 Morbi Ave	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648389694	1599648389694	6e72155d-7e75-4496-8715-2c802798dd70	Shri	Bajwa	19	2011-07-12	4520885932	Female	7897 Metus. Street	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648397549	1599648397549	2693789a-8f16-4980-a2a6-647f909cf9d1	Lalitha	Dara	20	2011-05-22	7503134489	Female	822-4894 Pede Rd.	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648410670	1599648410670	7f4c196c-a04d-4b26-976a-d8469262a50c	Ujesh	Dhar	21	2011-10-31	2382669776	Male	5747 At Ave	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648416904	1599648416904	2d68d0a3-e3f2-4b54-be7c-13177b83a3e8	Vanad	Biswas	22	2011-08-22	5387699914	Male	Ap #388-6339 Metus Av.	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648425170	1599648425170	d0d83363-4cb0-43db-a99a-b6a15fa244ff	Manish	Banerjee	23	2011-11-02	2106681523	Male	Ap #242-3417 Eget Rd.	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648431633	1599648431633	fdbc9986-ef93-4786-bc05-587dcdc49e84	Siddhi	Bhatt	24	2011-05-08	4931068516	Female	Ap #595-7072 Et, Ave	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648439979	1599648439979	2fe22c66-0f33-4f53-84bc-7f0bdbbb4d5a	Variya	Mukherjee	25	2011-12-17	6551760438	Male	Ap #519-2212 Nunc Rd.	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648454649	1599648454649	72174282-1bd4-4c3c-a3d8-ed386f374f24	Disha	Iyer	26	2011-08-10	1874456189	Female	Ap #354-711 Sed Ave	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648460978	1599648460978	157d8acf-05b4-4091-8752-60177db18fc5	Jagriti	Bhasin	27	2011-09-02	9754976095	Female	3917 Commodo Street	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648473254	1599648473254	9c28f3e3-1b02-4f4e-bb9a-0e552f77b6dc	Santatey	Kapadia	28	2011-04-04	2111342668	Male	P.O. Box 351, 2780 Varius Ave	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648482955	1599648482955	c4917f79-06c3-42c4-80aa-59fb98b35b5c	Shyamsundar	Basu	29	2012-01-04	5092834156	Male	Ap #675-7648 Eu, Road	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648496358	1599648496358	9275cbfd-1a88-47ab-a960-3fec8e296443	Sahas	Apte	30	2011-08-23	6788171992	Male	Ap #817-8426 Integer Street	3f3028d4-14d5-4564-b917-607f21579cfa	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648817341	1599648817341	2fecd3d5-5290-490c-b9c4-6cd45b527eb3	Shirish	Gokhale	1	2011-03-19	9070281603	Male	310-507 Vulputate, St.	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648824784	1599648824784	48629fbb-fe09-4b15-9066-2240b8997b3b	Vimal	Chakrabarti	2	2011-09-11	9809827521	Male	Ap #774-6820 Dictum Road	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648831292	1599648831292	fd421e6f-100a-4f05-8cd7-020130a8726d	Harsha	Ray	3	2011-06-17	4754107605	Female	716-9959 Semper Av.	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648838076	1599648838076	29b396cc-682f-4a5c-87d1-8da1df4dea91	Ramanuj	Mani	4	2011-04-02	3151285195	Male	P.O. Box 698, 7077 Arcu. St.	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648847509	1599648847509	84762733-d28b-4f23-bd1b-b3e4c245a83e	Ishana	Goswami	5	2011-11-27	9770108594	Female	P.O. Box 174, 650 Montes, Ave	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648853636	1599648853636	dcedc68e-9155-443a-8b64-ba71c518f091	Pushpita	Joshi	6	2011-09-10	5215281839	Female	Ap #438-1502 Tempor, Street	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648860077	1599648860077	021c5178-abaf-4310-bbcf-b82d4360cc7c	Satamanyu	Purohit	7	2011-06-29	5650364825	Male	920-4967 Cras Road	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648868864	1599648868864	89555fc6-7822-4e8e-afb8-ea2159759c0b	Neelam	Laghari	8	2011-04-20	2149743834	Male	709-7000 Sed St.	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648875909	1599648875909	c7326c18-e63f-4cdb-99fa-1c8b1e90584c	Aryahi	Gokhale	9	2011-10-09	4232621677	Female	742 Fames Street	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648889570	1599648889570	a73755c6-5e40-45c1-91af-7f8a08ad560f	Mandira	Kumar	10	2011-07-11	3220572327	Female	659-5047 Sagittis Road	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648896297	1599648896297	60c20f26-e3ec-4b35-bdf4-37b450c7b5da	Vandana	Ahuja	11	2011-04-29	6417207584	Female	Ap #241-6534 Eleifend, Road	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648901918	1599648901918	30963f14-2e4f-44ae-becd-c377dd6beed4	Sulakshana	Naidu	12	2011-03-04	8795032643	Female	P.O. Box 126, 1310 Dolor. St.	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648908764	1599648908764	48a17730-3034-483b-ac0b-d1b660dfd233	Dhanesh	Ahuja	13	2011-05-26	8650149329	Male	P.O. Box 627, 964 Quis, Street	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648915687	1599648915687	f6674278-2788-4dbc-b9be-e5070cbb334c	Dayaswarup	Jha	14	2011-05-07	2255935671	Male	Ap #346-3471 Phasellus St.	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648923003	1599648923003	a29aef6b-82d9-46d0-b6ac-d004c89e992b	Suraksha	Lal	15	2011-11-11	7235873241	Female	165-3431 Sollicitudin St.	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648929645	1599648929645	1b06d169-ee7c-46e1-9f64-01fe3fb5a255	Gaurish	Kumar	16	2011-11-22	8863923977	Male	981-2583 Metus St.	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648939958	1599648939958	03fa66b9-333a-4302-84f6-51799603dac9	Sudhanshu	Mani	17	2011-11-03	5641280267	Male	P.O. Box 849, 5841 Ligula. Road	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648947142	1599648947142	5fabb687-83d8-41a5-9ca6-d2c05420e3ca	Shailendra	Ray	18	2011-11-30	6466553548	Male	2117 Ipsum Av.	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648957985	1599648957985	153501fd-30d3-4b5d-91c8-e0ad20999edc	Inaaya	Chowdhury	19	2011-12-28	5046307670	Female	2988 Risus. Street	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648964824	1599648964824	8121a42e-450d-41e2-80d9-0914544b5e0e	Vaishali	Pandey	20	2011-03-11	1580048546	Female	5771 Et St.	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648973036	1599648973036	4d6d88ac-8016-4395-ad12-699dd52ab4b7	Ishta	Apte	21	2011-02-22	7683229064	Female	Ap #103-4467 Nec Street	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648978776	1599648978776	03b1c1ea-c482-45d1-9a9e-64426b10890d	Dinkar	Kumar	22	2011-06-16	6083364843	Male	9479 Pretium Rd.	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648986798	1599648986798	a67c4e79-531d-487e-9a1a-aea1e8bc9ec2	Shalini	Ahuja	23	2011-04-03	3921321321	Female	222-9797 Lacinia. Rd.	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648993130	1599648993130	4164bdc8-c95e-4bfd-8a4d-a08d1f2c2d3c	Jyotika	Dubey	24	2011-11-04	2540376135	Female	Ap #452-6738 Integer Avenue	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599648999776	1599648999776	0cd5681e-b66c-4f03-baa2-43d382e8431f	Anchal	Mangal	25	2011-07-18	3151257207	Female	1386 Convallis Rd.	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649008236	1599649008236	3acb23d6-8295-477e-8e1d-5e8f2397b8ca	Sandeep	Saxena	26	2011-12-26	7590711286	Male	568-5461 Sit Street	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649018087	1599649018087	1fd79211-e2d8-4575-8dd2-67dc4bbcf5bc	Vitabhay	Babu	27	2011-04-10	1487450169	Male	P.O. Box 279, 5892 Molestie Av.	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649025697	1599649025697	1bb30601-bf08-4d22-af4d-242c44bb2353	Anasuya	Khatri	28	2011-11-09	4897742162	Female	765-1946 Lorem St.	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649036650	1599649036650	6a7c64c8-017d-4600-9c6f-7f231a32ddda	Bhavya	Sachdev	29	2011-09-27	8048707679	Female	1551 Nulla Av.	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649045486	1599649045486	a6aeaaea-5804-4bb7-8a07-46a5dc315f0e	Anamika	Amin	30	2011-08-01	4745132635	Female	9823 Parturient Avenue	ef2ece86-42e1-4c6e-ab6c-15a16c4fe4f3	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649329965	1599649329965	2237dd63-6443-498d-b0b4-f9cb857779b9	Saddhan	Gill	1	2011-04-08	9441473499	Male	Ap #424-1547 Ac Ave	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649338372	1599649338372	36fc43d2-4806-44fe-a19b-f52f4247e3d5	Lalita	Dixit	2	2011-12-18	4729453569	Female	P.O. Box 526, 1593 Nam Avenue	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649344609	1599649344609	b4057008-54a3-4989-b48c-665fc39c377b	Tiya	Bhatt	3	2011-11-19	9446325546	Female	Ap #727-9871 Interdum. Rd.	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649352749	1599649352749	8658c066-5550-4f4c-9fcb-85a56c4125e7	Kshitija	Iyer	4	2011-02-28	2022455773	Female	944-1304 Parturient St.	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649360616	1599649360616	bd67e477-92a5-4aa8-bd6e-c7a4772c597b	Sudeep	Dubey	5	2011-06-06	4804637655	Male	Ap #568-3264 Tellus Ave	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649368857	1599649368857	96054b9e-8e93-471e-9878-b0530f396195	Chandani	Kaur	6	2011-06-26	3522040205	Female	318-3938 Vulputate, Avenue	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649376257	1599649376257	53ca4267-bf32-4274-9924-938dd1bda027	Neelabh	Rao	7	2011-07-15	6097791826	Male	896-8320 Commodo Road	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649384067	1599649384067	7d961718-b6b3-4aca-8f16-ac45214c2f7d	Tarosh	Ahluwalia	8	2011-07-06	6979458947	Male	P.O. Box 373, 5382 Dignissim Ave	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649390770	1599649390770	ff86d8ab-e113-43a5-9718-228f251fecc5	blessings	Jain	9	2011-09-21	6302747943	Male	P.O. Box 244, 4989 Donec Street	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649397659	1599649397659	4a37a349-8340-4567-892d-545ea37649e1	Subali	Ganguly	10	2011-03-08	4037477216	Male	P.O. Box 339, 1203 Phasellus St.	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649405536	1599649405536	056668d9-12fd-4283-9462-7e4aa23a9999	Lakshminarayan	Khurana	11	2011-03-20	5300039422	Male	P.O. Box 312, 9059 Varius Rd.	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649412680	1599649412680	43e19934-f423-425c-95a5-e33318cd3e6f	Jivana	Bajwa	12	2011-11-06	5978106083	Male	Ap #147-5967 Morbi Ave	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649422688	1599649422688	d819e57e-bbc7-4238-a034-7103d8e78c2b	Mahika	Zacharia	13	2011-03-04	9939356079	Female	Ap #729-1892 Interdum St.	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649429698	1599649429698	2b434d12-6d0f-4670-86b2-8548e17697c5	Inrani	Gandhi	14	2011-10-06	9621174123	Female	1805 Ac Road	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649436461	1599649436461	82a5c1f0-311c-498e-82bf-f05f1a04b8df	Kumari	Chopra	15	2011-02-21	6718199437	Female	P.O. Box 174, 8404 Luctus Av.	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649442370	1599649442370	5d631cc7-d50f-4b43-9c34-ac05e06ba18a	Laxmi	Sachdev	16	2012-01-21	9556653870	Female	Ap #309-3248 Mauris. Ave	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649449583	1599649449583	81484b38-7027-4173-a2de-d2a32af733a8	Nandan	Haldar	17	2011-07-29	4487930898	Male	P.O. Box 281, 3759 Arcu Rd.	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649457313	1599649457313	057ab134-9566-4295-94ef-c51558560c43	Shorashi	Ghosh	18	2011-03-07	1463630702	Female	Ap #513-3109 Consectetuer Rd.	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649471021	1599649471021	4d8d260c-3157-4c9a-8afd-d476653a81a8	Shachi	Khurana	19	2011-12-17	2638867696	Female	284-4434 Id Road	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649479159	1599649479159	a1206b99-dd48-46cc-8538-b20bc0045e94	Udyam	Arya	20	2011-02-18	9057989489	Male	957-2294 Commodo Av.	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649487163	1599649487163	c6548aae-debd-4969-bcc6-5b1db507399f	Sridatta	Deshpande	21	2012-01-20	2469871819	Male	P.O. Box 847, 3587 Luctus. St.	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649496356	1599649496356	1b260267-5342-424a-a6b0-000f0597cc6e	Indra	Mehta	22	2011-03-28	7067985741	Male	9195 Sapien, Rd.	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649502828	1599649502828	887325b2-3e92-4056-8d0c-03ad4b299f44	Kapila	Sachdev	23	2011-12-10	7904994707	Female	P.O. Box 778, 8416 Magna. Ave	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649508945	1599649508945	297dbe0d-66bc-4933-8d13-e92d85132145	Kiash	Dewan	24	2011-05-01	3578929479	Male	Ap #773-4662 Quis, Ave	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649517029	1599649517029	84b19485-2943-406e-a241-24b3ccf03a25	Virat	Seth	25	2011-10-22	2906704462	Male	547-6289 Ullamcorper. Avenue	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649524361	1599649524361	b9bd2a8e-fc57-4219-bcb9-b3683c8e2dfa	Gogula	Kapadia	26	2011-07-28	1737361493	Male	Ap #269-8531 Eu, St.	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649532020	1599649532020	f877e93d-b600-45e7-8de8-046a57b44a9f	Baani	Datta	27	2011-12-07	2776111376	Female	3867 A Ave	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649538662	1599649538662	fc1dbca5-8f61-459c-ac62-0368e35971ec	Amraj	Gill	28	2012-01-13	3127318323	Male	519-7560 Nunc St.	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649544997	1599649544997	6760ef52-171b-41aa-b4e7-bd9ed8a6e7b0	Juily	Khatri	29	2011-07-01	6001619495	Female	Ap #393-1031 Aenean St.	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
1599649552226	1599649552226	6b2d7f2c-afba-4b3f-8cfc-a8513fa7c1a9	Sadhana	Ganguly	30	2011-03-24	6579439127	Female	564 Arcu. St.	e81b026d-341e-4ca7-98c2-fe85193adb07	{"createdAt":1599617843656,"updatedAt":1599617843656,"id":"f2a78852-76a6-4b59-97eb-76c8d04edb98","institute_id":"c2ebbc4c-72a5-4f06-b12c-60a2f19818be","tuitionFee":17000,"registrationFee":500,"labFee":2900,"examFee":1500,"sportsFee":2300,"title":"Class 5","totalfees":24200}	1947-08-15
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" ("createdAt", "updatedAt", id, email, password) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users ("createdAt", "updatedAt", id, email, password) FROM stdin;
1599227498084	1599227498084	1	abc@gmail.com	$2a$10$PQT0DMlo3Q7gi6vnbzOoA.5jaeyvjt9OqCeF7XG6oQ/CT194vLcVC
1599227583510	1599227583510	3	abcd@gmail.com	$2a$10$3hn/yyC6bwwmhqVuu9GAk.I5NNefmwNRYy6O34XfkNU5xF0ThqMxu
1599227678327	1599227678327	5	abcerd@gmail.com	$2a$10$VudNeTBSQoTZePghHdbg/e/KbsijWVhlazuI2j73dHbublixbiR4y
1599227745803	1599227745803	6	abce345rd@gmail.com	$2a$10$JJHOnQ8f63uSeFjHB/8qu.YjDMw6o7F/kycyjHf0upkBa0oJCtts6
1599227930482	1599227930482	8	abce345krd@gmail.com	$2a$10$pclEkDgONaRdthZMebnGzOnydVjWzxlsHen2TX5Hj9MopY29fhVa6
1599227980234	1599227980234	10	abce3w45krd@gmail.com	$2a$10$W2eA4JRJiz6QvRLDvnNJ9eWVMdDDfSkLtzLztGplKgIGLFcKLhBw2
\.


--
-- Name: auth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_id_seq', 1, false);


--
-- Name: city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_id_seq', 1, false);


--
-- Name: class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.class_id_seq', 1, false);


--
-- Name: jwtauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jwtauth_id_seq', 1, false);


--
-- Name: state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.state_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: archive archive_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive
    ADD CONSTRAINT archive_pkey PRIMARY KEY (id);


--
-- Name: auth auth_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth
    ADD CONSTRAINT auth_pkey PRIMARY KEY (id);


--
-- Name: batch batch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.batch
    ADD CONSTRAINT batch_pkey PRIMARY KEY (id);


--
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- Name: class class_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pkey PRIMARY KEY (id);


--
-- Name: fees fees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fees
    ADD CONSTRAINT fees_pkey PRIMARY KEY (id);


--
-- Name: institute institute_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institute
    ADD CONSTRAINT institute_email_key UNIQUE (email);


--
-- Name: institute institute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institute
    ADD CONSTRAINT institute_pkey PRIMARY KEY (id);


--
-- Name: jwtauth jwtauth_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jwtauth
    ADD CONSTRAINT jwtauth_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: state state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_pkey PRIMARY KEY (id);


--
-- Name: stream stream_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stream
    ADD CONSTRAINT stream_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

