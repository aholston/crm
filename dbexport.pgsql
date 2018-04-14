--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: add_name_field_to_attractions; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE add_name_field_to_attractions (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.add_name_field_to_attractions OWNER TO vagrant;

--
-- Name: add_name_field_to_attractions_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE add_name_field_to_attractions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.add_name_field_to_attractions_id_seq OWNER TO vagrant;

--
-- Name: add_name_field_to_attractions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE add_name_field_to_attractions_id_seq OWNED BY add_name_field_to_attractions.id;


--
-- Name: agents; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE agents (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    phone character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    contact_id bigint
);


ALTER TABLE public.agents OWNER TO vagrant;

--
-- Name: agents_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE agents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agents_id_seq OWNER TO vagrant;

--
-- Name: agents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE agents_id_seq OWNED BY agents.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO vagrant;

--
-- Name: attractions; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE attractions (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    house_id bigint,
    name character varying
);


ALTER TABLE public.attractions OWNER TO vagrant;

--
-- Name: attractions_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE attractions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attractions_id_seq OWNER TO vagrant;

--
-- Name: attractions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE attractions_id_seq OWNED BY attractions.id;


--
-- Name: buyers; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE buyers (
    id bigint NOT NULL,
    financer character varying,
    cash double precision,
    purchase_type character varying,
    cio character varying,
    client_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.buyers OWNER TO vagrant;

--
-- Name: buyers_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE buyers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.buyers_id_seq OWNER TO vagrant;

--
-- Name: buyers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE buyers_id_seq OWNED BY buyers.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE clients (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    phone character varying,
    birthday date,
    listing character varying,
    cio character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    level character varying
);


ALTER TABLE public.clients OWNER TO vagrant;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO vagrant;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE clients_id_seq OWNED BY clients.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE comments (
    id bigint NOT NULL,
    house_id bigint,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    topic integer
);


ALTER TABLE public.comments OWNER TO vagrant;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO vagrant;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE contacts (
    id bigint NOT NULL,
    description character varying,
    method character varying,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    client_id bigint,
    agent_id bigint
);


ALTER TABLE public.contacts OWNER TO vagrant;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO vagrant;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE contacts_id_seq OWNED BY contacts.id;


--
-- Name: contracts; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE contracts (
    id bigint NOT NULL,
    name character varying,
    attachment character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    house_id bigint
);


ALTER TABLE public.contracts OWNER TO vagrant;

--
-- Name: contracts_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE contracts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contracts_id_seq OWNER TO vagrant;

--
-- Name: contracts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE contracts_id_seq OWNED BY contracts.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE events (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.events OWNER TO vagrant;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO vagrant;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: houses; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE houses (
    id bigint NOT NULL,
    address character varying,
    rooms integer,
    bathrooms integer,
    sqft double precision,
    status character varying,
    description text,
    price double precision,
    client_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    commission double precision,
    info character varying,
    phase integer,
    agent_id bigint
);


ALTER TABLE public.houses OWNER TO vagrant;

--
-- Name: houses_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE houses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.houses_id_seq OWNER TO vagrant;

--
-- Name: houses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE houses_id_seq OWNED BY houses.id;


--
-- Name: infolists; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE infolists (
    id bigint NOT NULL,
    house_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.infolists OWNER TO vagrant;

--
-- Name: infolists_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE infolists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.infolists_id_seq OWNER TO vagrant;

--
-- Name: infolists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE infolists_id_seq OWNED BY infolists.id;


--
-- Name: infos; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE infos (
    id bigint NOT NULL,
    infolist_id bigint,
    name character varying,
    year integer,
    kind character varying,
    primary_school character varying,
    high_school character varying,
    businesses character varying,
    photographer date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    key character varying,
    prepa character varying
);


ALTER TABLE public.infos OWNER TO vagrant;

--
-- Name: infos_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.infos_id_seq OWNER TO vagrant;

--
-- Name: infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE infos_id_seq OWNED BY infos.id;


--
-- Name: investors; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE investors (
    id bigint NOT NULL,
    profit_margin character varying,
    sales_price character varying,
    client_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.investors OWNER TO vagrant;

--
-- Name: investors_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE investors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.investors_id_seq OWNER TO vagrant;

--
-- Name: investors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE investors_id_seq OWNED BY investors.id;


--
-- Name: reccomendations; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE reccomendations (
    id bigint NOT NULL,
    vendor_id bigint,
    client_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.reccomendations OWNER TO vagrant;

--
-- Name: reccomendations_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE reccomendations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reccomendations_id_seq OWNER TO vagrant;

--
-- Name: reccomendations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE reccomendations_id_seq OWNED BY reccomendations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO vagrant;

--
-- Name: showings; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE showings (
    id bigint NOT NULL,
    house_id bigint,
    day date,
    "when" time without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.showings OWNER TO vagrant;

--
-- Name: showings_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE showings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.showings_id_seq OWNER TO vagrant;

--
-- Name: showings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE showings_id_seq OWNED BY showings.id;


--
-- Name: tasklists; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE tasklists (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    house_id bigint
);


ALTER TABLE public.tasklists OWNER TO vagrant;

--
-- Name: tasklists_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE tasklists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasklists_id_seq OWNER TO vagrant;

--
-- Name: tasklists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE tasklists_id_seq OWNED BY tasklists.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE tasks (
    id bigint NOT NULL,
    tasklist_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    task character varying,
    step integer
);


ALTER TABLE public.tasks OWNER TO vagrant;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO vagrant;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE tasks_id_seq OWNED BY tasks.id;


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE tokens (
    id bigint NOT NULL,
    access_token character varying,
    expires_in integer,
    refresh_token character varying,
    token_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tokens OWNER TO vagrant;

--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tokens_id_seq OWNER TO vagrant;

--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE tokens_id_seq OWNED BY tokens.id;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE transactions (
    id bigint NOT NULL,
    house_id bigint,
    client_id bigint,
    sale double precision,
    commission double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.transactions OWNER TO vagrant;

--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_id_seq OWNER TO vagrant;

--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE transactions_id_seq OWNED BY transactions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE users (
    id bigint NOT NULL,
    username character varying,
    password_digest character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    password_reset_token character varying,
    password_reset_sent_at timestamp without time zone,
    auth_token character varying,
    total_made double precision DEFAULT 0.0,
    refresh_token character varying
);


ALTER TABLE public.users OWNER TO vagrant;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO vagrant;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: vendors; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE vendors (
    id bigint NOT NULL,
    company character varying,
    service character varying,
    phone character varying,
    source character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image character varying,
    website character varying,
    rating integer DEFAULT 1,
    notes character varying
);


ALTER TABLE public.vendors OWNER TO vagrant;

--
-- Name: vendors_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE vendors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendors_id_seq OWNER TO vagrant;

--
-- Name: vendors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE vendors_id_seq OWNED BY vendors.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY add_name_field_to_attractions ALTER COLUMN id SET DEFAULT nextval('add_name_field_to_attractions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY agents ALTER COLUMN id SET DEFAULT nextval('agents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY attractions ALTER COLUMN id SET DEFAULT nextval('attractions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY buyers ALTER COLUMN id SET DEFAULT nextval('buyers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY clients ALTER COLUMN id SET DEFAULT nextval('clients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY contacts ALTER COLUMN id SET DEFAULT nextval('contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY contracts ALTER COLUMN id SET DEFAULT nextval('contracts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY houses ALTER COLUMN id SET DEFAULT nextval('houses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY infolists ALTER COLUMN id SET DEFAULT nextval('infolists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY infos ALTER COLUMN id SET DEFAULT nextval('infos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY investors ALTER COLUMN id SET DEFAULT nextval('investors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY reccomendations ALTER COLUMN id SET DEFAULT nextval('reccomendations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY showings ALTER COLUMN id SET DEFAULT nextval('showings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY tasklists ALTER COLUMN id SET DEFAULT nextval('tasklists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY tasks ALTER COLUMN id SET DEFAULT nextval('tasks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY tokens ALTER COLUMN id SET DEFAULT nextval('tokens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY transactions ALTER COLUMN id SET DEFAULT nextval('transactions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY vendors ALTER COLUMN id SET DEFAULT nextval('vendors_id_seq'::regclass);


--
-- Data for Name: add_name_field_to_attractions; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY add_name_field_to_attractions (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: add_name_field_to_attractions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('add_name_field_to_attractions_id_seq', 1, false);


--
-- Data for Name: agents; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY agents (id, first_name, last_name, email, phone, created_at, updated_at, contact_id) FROM stdin;
12	Catherine KW	Martin	martingreat1214@gmail.com	214 878 3157	2018-04-14 15:10:51.097309	2018-04-14 15:10:51.097309	\N
13	Holly KW	Alturk		817 917 5991	2018-04-14 15:56:42.359858	2018-04-14 15:56:42.359858	\N
14	LeAntra			972 672 0241	2018-04-14 15:57:08.429912	2018-04-14 15:57:08.429912	\N
15	Gene 	Sousa		903 474 4745	2018-04-14 15:57:38.773872	2018-04-14 15:57:38.773872	\N
16	Calina KW			318 780 3206	2018-04-14 15:58:01.9472	2018-04-14 15:58:01.9472	\N
17	Maybe Roger			682 777 5745	2018-04-14 15:58:24.724472	2018-04-14 15:58:24.724472	\N
18	Hank 	Smetak	hanksmetak@judgefite.com	817 368 5308	2018-04-14 15:58:58.371786	2018-04-14 15:58:58.371786	\N
19	LInda	Munoz		817 760 6627	2018-04-14 15:59:28.10153	2018-04-14 15:59:28.10153	\N
20	Miguel 	Picart		817 637 6078	2018-04-14 15:59:59.723272	2018-04-14 15:59:59.723272	\N
21	Rachel 	Rowan		682-554 3953	2018-04-14 16:00:41.329192	2018-04-14 16:00:41.329192	\N
22	Destanie KW			214 597 4740	2018-04-14 16:01:08.318153	2018-04-14 16:01:08.318153	\N
23	Wayne	Barnes		214 682 9045	2018-04-14 16:02:00.529139	2018-04-14 16:02:00.529139	\N
24	Fanny			817-363-0287	2018-04-14 16:02:26.610419	2018-04-14 16:02:26.610419	\N
25	Levi exp Realty			817 900 3599	2018-04-14 16:02:49.694124	2018-04-14 16:02:49.694124	\N
26	Jimmy 	Henderson		817 851 8787	2018-04-14 16:03:52.195996	2018-04-14 16:03:52.195996	\N
27	Roberta 	Torres		817 676 6472	2018-04-14 16:04:22.460574	2018-04-14 16:04:22.460574	\N
28	Georgette	Jones		817 298 9619	2018-04-14 16:05:05.852866	2018-04-14 16:05:05.852866	\N
29	Valeria 	Godinez 		214 478 9443	2018-04-14 16:06:48.813569	2018-04-14 16:06:48.813569	\N
30	Amy 	Zirbel		682 500 9582	2018-04-14 16:07:50.414025	2018-04-14 16:07:50.414025	\N
31	Wendy	Barton		972 342 8043	2018-04-14 16:08:21.590743	2018-04-14 16:08:21.590743	\N
32	Ridha			972 383 9109	2018-04-14 16:08:47.762018	2018-04-14 16:08:47.762018	\N
33	Rochelle 	Adams		972 841 3954	2018-04-14 16:09:14.911701	2018-04-14 16:09:14.911701	\N
34	Jeff 	Jennsen		682 410 2728	2018-04-14 16:09:46.059483	2018-04-14 16:09:46.059483	\N
35	Carlos 	Velazquez		817 676 1223	2018-04-14 16:10:36.954663	2018-04-14 16:10:36.954663	\N
36	Kelsi	Bannahan		940 391 9852	2018-04-14 16:11:08.507826	2018-04-14 16:11:08.507826	\N
37	Crystal			817 301 2842	2018-04-14 16:12:52.260623	2018-04-14 16:12:52.260623	\N
38	Rachel 	Bradshaw		615 305 6556	2018-04-14 16:13:25.209271	2018-04-14 16:13:25.209271	\N
39	John 	Ligon		469 328 1940	2018-04-14 16:13:59.202603	2018-04-14 16:13:59.202603	\N
40	Maritza			817 368 4073	2018-04-14 16:14:18.370184	2018-04-14 16:14:18.370184	\N
41	Melissa 	Gaspari		972 800 8738	2018-04-14 16:15:40.760533	2018-04-14 16:15:40.760533	\N
42	Monique 	Austin		682 552 9954	2018-04-14 16:16:18.940412	2018-04-14 16:16:18.940412	\N
43	Kim			469 404 6970	2018-04-14 16:16:43.599247	2018-04-14 16:16:43.599247	\N
44	Tracey			325 280 3120	2018-04-14 16:17:04.399729	2018-04-14 16:17:04.399729	\N
45	Genie 	Hermann		817 846 7446	2018-04-14 16:17:36.588774	2018-04-14 16:17:36.588774	\N
46	Nancy 			817 773 3123	2018-04-14 16:17:56.006381	2018-04-14 16:17:56.006381	\N
47	Hal 	Ripple		972 658 8931	2018-04-14 16:18:22.641797	2018-04-14 16:18:22.641797	\N
48	Michelle 	Coach		469 438 2466	2018-04-14 16:18:51.310391	2018-04-14 16:18:51.310391	\N
49	Lou			214 854 1767	2018-04-14 16:19:14.744504	2018-04-14 16:19:14.744504	\N
50	Claudia 	Mendoza		817 368 4073	2018-04-14 16:19:48.139982	2018-04-14 16:19:48.139982	\N
51	Melissa 	Gaspari		972 800 8738	2018-04-14 16:20:16.927212	2018-04-14 16:20:16.927212	\N
52	Monique KW	Austin		682 552 9954	2018-04-14 16:21:38.346894	2018-04-14 16:21:38.346894	\N
53	Kim			469 404 6970	2018-04-14 16:22:02.877531	2018-04-14 16:22:02.877531	\N
54	Tracey			325 280 3120	2018-04-14 16:23:59.77343	2018-04-14 16:23:59.77343	\N
55	Hal 	Ripple		972 658 8931	2018-04-14 16:24:42.219608	2018-04-14 16:24:42.219608	\N
57	Lou			214 854 1767	2018-04-14 16:25:31.08519	2018-04-14 16:25:31.08519	\N
58	Claudia 	Mendoza		214 325 9565	2018-04-14 16:26:11.971294	2018-04-14 16:26:11.971294	\N
59	Emonya 	White		817-691-1294	2018-04-14 16:26:39.465124	2018-04-14 16:26:39.465124	\N
60	Maria 	Otterbine		817 239 8272	2018-04-14 16:27:06.34054	2018-04-14 16:27:06.34054	\N
61	Ana 	Valdez		817-881-4022	2018-04-14 16:27:34.072313	2018-04-14 16:27:34.072313	\N
62	Alex	Mauricio		972 363 5720	2018-04-14 16:28:02.680698	2018-04-14 16:28:02.680698	\N
63	Jami 	Shelton		817 517 9355	2018-04-14 16:28:33.48259	2018-04-14 16:28:33.48259	\N
64	Clark	Wickliffe		972 765 7765	2018-04-14 16:29:19.121534	2018-04-14 16:29:19.121534	\N
65	April 	Clark		214 914 3655	2018-04-14 16:29:47.252613	2018-04-14 16:29:47.252613	\N
66	Leslie 	Turner		817 308 3266	2018-04-14 16:30:16.655787	2018-04-14 16:30:16.655787	\N
67	Carlos			512 289 5312	2018-04-14 16:30:36.781271	2018-04-14 16:30:36.781271	\N
68	Jose	Fuentes		817 862 3242	2018-04-14 16:45:42.641559	2018-04-14 16:45:42.641559	\N
69	Allan 	Rourke		469 867 5390	2018-04-14 16:46:27.937223	2018-04-14 16:46:27.937223	\N
70	Randall 	Garrett		817 475 4644	2018-04-14 16:47:10.911485	2018-04-14 16:47:10.911485	\N
71	Margarita	Graham		817 798 2358	2018-04-14 16:47:46.1329	2018-04-14 16:47:46.1329	\N
72	Stephanie 	Cole		972 567 7308	2018-04-14 16:48:18.12277	2018-04-14 16:48:18.12277	\N
\.


--
-- Name: agents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('agents_id_seq', 72, true);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2018-03-01 17:03:27.702702	2018-03-01 17:03:27.702702
\.


--
-- Data for Name: attractions; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY attractions (id, created_at, updated_at, house_id, name) FROM stdin;
\.


--
-- Name: attractions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('attractions_id_seq', 5, true);


--
-- Data for Name: buyers; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY buyers (id, financer, cash, purchase_type, cio, client_id, created_at, updated_at) FROM stdin;
6		\N		\N	44	2018-04-14 14:33:25.67679	2018-04-14 14:33:25.67679
7		\N		\N	45	2018-04-14 14:34:19.077167	2018-04-14 14:34:19.077167
8		\N		\N	46	2018-04-14 14:37:29.120987	2018-04-14 14:37:29.120987
10		\N		\N	48	2018-04-14 14:41:00.779682	2018-04-14 14:41:11.935779
11	Cash	\N		\N	49	2018-04-14 14:42:32.223115	2018-04-14 14:42:32.223115
13		\N		\N	51	2018-04-14 14:44:38.510819	2018-04-14 14:44:38.510819
14		\N		\N	52	2018-04-14 14:45:59.616683	2018-04-14 14:45:59.616683
15		\N		\N	53	2018-04-14 14:47:31.540743	2018-04-14 14:47:31.540743
16		\N		\N	54	2018-04-14 14:52:06.039264	2018-04-14 14:52:06.039264
17		\N		\N	55	2018-04-14 14:53:35.034427	2018-04-14 14:53:35.034427
18		\N		\N	56	2018-04-14 14:54:49.854884	2018-04-14 14:54:49.854884
19		\N		\N	57	2018-04-14 14:58:11.450713	2018-04-14 14:58:11.450713
20		\N		\N	58	2018-04-14 14:59:16.991978	2018-04-14 14:59:16.991978
21		\N		\N	59	2018-04-14 15:00:01.32269	2018-04-14 15:00:01.32269
22		\N		\N	60	2018-04-14 15:00:41.957444	2018-04-14 15:00:41.957444
23		\N		\N	61	2018-04-14 15:01:22.323354	2018-04-14 15:01:22.323354
9		\N		\N	47	2018-04-14 14:38:46.135238	2018-04-14 17:55:41.503377
12		\N		\N	50	2018-04-14 14:43:43.39087	2018-04-14 17:56:17.149831
\.


--
-- Name: buyers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('buyers_id_seq', 23, true);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY clients (id, first_name, last_name, email, phone, birthday, listing, cio, created_at, updated_at, level) FROM stdin;
54	A. 	Menez		817-793 9527	\N	Active		2018-04-14 14:52:03.406728	2018-04-14 18:01:10.660722	A
49	Celida	 Delgado		817-965 3766	\N	active		2018-04-14 14:42:21.853829	2018-04-14 14:42:21.853829	A
51	Rosa 	Juarez		817-637 4992	\N	active		2018-04-14 14:44:35.85899	2018-04-14 14:44:35.85899	A
53	E. 	Sanchez		613-710 0878	\N	active		2018-04-14 14:47:24.195032	2018-04-14 14:47:24.195032	A
55	Alicia	Lopez		817-271 8309	\N	active		2018-04-14 14:53:30.977323	2018-04-14 14:53:30.977323	A
56	Casey 	Ramos		817-528 4849	\N	active		2018-04-14 14:54:46.550811	2018-04-14 14:54:46.550811	A
57	Sofia 	Valdez		469-464 6785	\N	active		2018-04-14 14:58:08.723286	2018-04-14 14:58:08.723286	A
58	Luis 	Rodriguez 		817-454 2523	\N	active		2018-04-14 14:59:10.353754	2018-04-14 14:59:10.353754	A
59	Claudia 	Giron		323-774 7090	\N	active		2018-04-14 14:59:58.327421	2018-04-14 14:59:58.327421	A
60	Cunado 	de Polin		979-583 6605	\N	active		2018-04-14 15:00:38.950425	2018-04-14 15:00:38.950425	A
61	Lupita 	Pena		972-290 0170	\N	active		2018-04-14 15:01:19.095871	2018-04-14 15:01:19.095871	A
63	Maria	 Lopez		817 495 5876	\N	active		2018-04-14 16:55:10.155783	2018-04-14 16:55:10.155783	A
64	Abundio 	Rodriguez		 682 558 9262	\N	active		2018-04-14 16:56:15.500796	2018-04-14 16:56:15.500796	A
65	Mabel 	Arias		832 794 7509	\N	active		2018-04-14 16:56:49.472281	2018-04-14 16:56:49.472281	A
66	Jose			479 420 1757	\N	active		2018-04-14 16:58:19.147643	2018-04-14 16:58:19.147643	A
67	Mario 	Murillo		817 800 4070	\N	active		2018-04-14 16:59:00.746903	2018-04-14 16:59:00.746903	A
69	Arturo 	Covarrubias		512 584 5725	\N	active		2018-04-14 16:59:55.229999	2018-04-14 16:59:55.229999	A
70	Ramiro 	Soto		956 570 8828	\N	active		2018-04-14 17:00:21.690778	2018-04-14 17:00:21.690778	A
71	Cipriano 	Beltran		940 594 5700	\N	active		2018-04-14 17:01:11.739886	2018-04-14 17:01:11.739886	A
72	J. Luis 	Medina			\N	active		2018-04-14 17:01:39.251792	2018-04-14 17:01:39.251792	A
73	Nilton 	Lavota		972 999 6939	\N	active		2018-04-14 17:02:11.742877	2018-04-14 17:02:11.742877	A
74	Francisco 	Rojas		817-361-3726	\N	active		2018-04-14 17:02:33.137198	2018-04-14 17:02:33.137198	A
75	J.Luis 	Medina		817 899 7332	\N	active		2018-04-14 17:03:15.182802	2018-04-14 17:03:15.182802	A
76	Evangelina 			682 320 6154	\N	active		2018-04-14 17:03:38.027634	2018-04-14 17:03:38.027634	A
77	Francisco Sanchez			613 805 1726	\N	active		2018-04-14 17:04:06.29317	2018-04-14 17:04:06.29317	A
78	Rosa 	Juarez		817 637 4992	\N	active		2018-04-14 17:04:33.348314	2018-04-14 17:04:33.348314	A
79	Victor 	Blanco		817 966 0063	\N	active		2018-04-14 17:05:01.242803	2018-04-14 17:05:01.242803	A
80	Mario 	Cardiel		214 293 7979	\N	active		2018-04-14 17:05:25.560905	2018-04-14 17:05:25.560905	A
81	Liliane 	Alvarado		817 319 7079	\N	active		2018-04-14 17:05:51.899768	2018-04-14 17:05:51.899768	A
82	Fco	Soria		682 256 3665	\N	active		2018-04-14 17:06:26.719605	2018-04-14 17:06:26.719605	A
83	Luis	Escatel			\N	active		2018-04-14 17:06:46.786011	2018-04-14 17:06:46.786011	A
84	Jose 	D la Garza		1(404)587 1599	\N	active		2018-04-14 17:07:21.574564	2018-04-14 17:07:21.574564	A
85	Gilberto 	A Nava		817 915 5471	\N	active		2018-04-14 17:07:52.486986	2018-04-14 17:07:52.486986	A
86	Oscar 	Reyes		817 721 2521 	\N	active		2018-04-14 17:08:23.574808	2018-04-14 17:08:23.574808	A
87	Maria 	Gonzalez			\N	active		2018-04-14 17:08:43.589995	2018-04-14 17:08:43.589995	A
88	Joel 	Loya		817 401 1673	\N	active		2018-04-14 17:09:08.756912	2018-04-14 17:09:08.756912	A
89	Sergio 	Gasca		817 658 2072	\N	active		2018-04-14 17:09:31.889288	2018-04-14 17:09:31.889288	A
90	Susan	Lozano		817 224 2899	\N	active		2018-04-14 17:10:04.418641	2018-04-14 17:10:04.418641	A
91	Maricela 	Garcia		817 812 1816	\N	active		2018-04-14 17:10:28.839338	2018-04-14 17:10:28.839338	A
92	David 	Mendez		817 808 1479	\N	active		2018-04-14 17:11:01.147606	2018-04-14 17:11:01.147606	A
93	Maria 	Sanabria		469 279 3258	\N	active		2018-04-14 17:11:23.661482	2018-04-14 17:11:23.661482	A
94	Casey 	Ramos		817 515 4238	\N	active		2018-04-14 17:11:52.061974	2018-04-14 17:11:52.061974	A
95	Vivian 	Soto		817 521 4849	\N	active		2018-04-14 17:12:30.633824	2018-04-14 17:12:30.633824	A
96	Luz 	Aceves		817 448 3637	\N	active		2018-04-14 17:12:56.992055	2018-04-14 17:12:56.992055	A
97	Hector 	Galazo		817 779 2219	\N	active		2018-04-14 17:13:23.026151	2018-04-14 17:13:23.026151	A
98	Jaime 	Vqz			\N	active		2018-04-14 17:13:42.397523	2018-04-14 17:13:42.397523	A
99	Francisco	Rico		717 239 5150	\N	active		2018-04-14 17:14:05.259417	2018-04-14 17:14:05.259417	A
100	Jose Hdz./ Maria				\N	active		2018-04-14 17:21:19.633525	2018-04-14 17:21:19.633525	A
101	Jose M. 	Valdez			\N	active		2018-04-14 17:26:56.026269	2018-04-14 17:26:56.026269	A
102	None	None	\N	\N	\N	\N	\N	2018-04-14 17:34:33.63029	2018-04-14 17:34:33.63029	\N
52	Ana			682-561 0989	\N	active		2018-04-14 14:45:48.221145	2018-04-14 17:55:11.952916	A
46	Carmen			682-554-9713	\N	active		2018-04-14 14:37:26.171256	2018-04-14 17:55:26.857592	A
47	Cipriano			940-594 5700	\N	active		2018-04-14 14:38:42.955907	2018-04-14 17:55:41.433193	A
48	Michael			760-403 1272	\N	active		2018-04-14 14:40:54.299308	2018-04-14 17:56:01.486584	A
50	Nilton			972-999 6939	\N	active		2018-04-14 14:43:32.635635	2018-04-14 17:56:17.085548	A
45	Susana			682-352 8307	\N	active		2018-04-14 14:34:16.167091	2018-04-14 17:56:31.786912	A
44	Enid	Toro		817-503 5839	\N	Dead		2018-04-14 14:33:22.520458	2018-04-14 18:04:12.197544	A
\.


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('clients_id_seq', 102, true);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY comments (id, house_id, description, created_at, updated_at, topic) FROM stdin;
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('comments_id_seq', 4, true);


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY contacts (id, description, method, notes, created_at, updated_at, client_id, agent_id) FROM stdin;
17		phone	she has app. w/ Jacob Loan officer on Sat.4-7-18	2018-04-14 14:36:27.033865	2018-04-14 14:36:27.033865	45	\N
18		phone	Her daughter moved to live w/ her and wants to buy house.	2018-04-14 14:37:47.404568	2018-04-14 14:37:47.404568	46	\N
19		phone	Wants to buy a property	2018-04-14 14:39:06.373142	2018-04-14 14:39:06.373142	47	\N
20		phone	Pangburn/seller /Monisco Wants to buy Lots/Bad. GP> FT. WT>	2018-04-14 14:41:28.380218	2018-04-14 14:41:28.380218	48	\N
21	Wants to Buy house once she sell her house. wants to SUBMIT OFFER on 2433 Red Oak Burleson.	phone		2018-04-14 14:42:54.859985	2018-04-14 14:42:54.859985	49	\N
22		phone	Buyer send some properties to Natasha that he is interested in.	2018-04-14 14:43:57.42284	2018-04-14 14:43:57.42284	50	\N
23		phone	wants to see hms. She ask if Natasha sent addresses to Fco.	2018-04-14 14:44:55.334601	2018-04-14 14:44:55.334601	51	\N
24		phone	Lady wants Natasha to call her back.	2018-04-14 14:46:44.394825	2018-04-14 14:46:44.394825	52	\N
25		phone	Francisco/was working w him.	2018-04-14 14:52:28.557269	2018-04-14 14:52:28.557269	54	\N
26		phone	buyer Biggs Terrace	2018-04-14 14:53:53.55825	2018-04-14 14:53:53.55825	55	\N
27		phone	Had a meeting w Natasha but had to cancel it.	2018-04-14 14:55:14.600633	2018-04-14 14:55:14.600633	56	\N
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('contacts_id_seq', 27, true);


--
-- Data for Name: contracts; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY contracts (id, name, attachment, created_at, updated_at, house_id) FROM stdin;
2	\N	Summary.pdf	2018-03-02 21:40:03.96571	2018-03-02 21:40:03.96571	\N
\.


--
-- Name: contracts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('contracts_id_seq', 2, true);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY events (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('events_id_seq', 1, false);


--
-- Data for Name: houses; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY houses (id, address, rooms, bathrooms, sqft, status, description, price, client_id, created_at, updated_at, commission, info, phase, agent_id) FROM stdin;
136	619 Brookfield Dr. Hurst 76040 	1	1	\N	\N		130500	84	2018-04-14 17:32:53.221607	2018-04-14 17:32:53.225867	2911.07999999999993		0	\N
113	607  Susan Dr. Arl. 76010	1	1	\N	\N		143900	63	2018-04-14 17:15:28.155222	2018-04-14 17:15:28.1611	3213.38000000000011		0	\N
114	2320 Yale Dr. Arl.76015	1	1	\N	\N		169900	64	2018-04-14 17:16:37.637651	2018-04-14 17:16:37.642345	3799.94000000000005		0	\N
115	5519 White Dove 	1	1	\N	\N		195000	65	2018-04-14 17:17:21.55513	2018-04-14 17:17:21.560454	4366.19999999999982		0	\N
116	3213 Roddy Dr. Ft. Wt. 76123 	1	1	\N	\N		194900	67	2018-04-14 17:18:09.772938	2018-04-14 17:18:09.777743	4363.9399999999996		0	\N
117	3217 Brenda St. Burleson Tx. 76028	1	1	\N	\N		129900	49	2018-04-14 17:19:00.801339	2018-04-14 17:19:00.8053	2897.53999999999996		0	\N
118	6424 Brookhaven Trail Arl. 76001	1	1	\N	\N		145000	69	2018-04-14 17:19:39.245744	2018-04-14 17:19:39.249636	3238.19999999999982		0	\N
119	1317 E. Lovers Ln. Arl. 76010	1	1	\N	\N		126900	70	2018-04-14 17:20:21.086251	2018-04-14 17:20:21.090689	2829.86000000000013		0	\N
120	2010 Monaco Dr Arl 76010	1	1	\N	\N		141000	100	2018-04-14 17:21:19.637514	2018-04-14 17:21:19.637514	3147.96000000000004		0	\N
122	 4857 Sam Bass Sanger 76266	1	1	\N	\N		290000	47	2018-04-14 17:22:03.355429	2018-04-14 17:22:03.361528	6509.39999999999964		0	\N
123	303 Arnold St. Ennis 75019	1	1	\N	\N		189700	72	2018-04-14 17:22:37.178426	2018-04-14 17:22:37.181652	4246.63000000000011		0	\N
124	303 Arnold St. Ennis 75019	1	1	\N	\N		189700	72	2018-04-14 17:23:08.48562	2018-04-14 17:23:08.488751	4246.63000000000011		0	\N
137	Gilberto A Nava	1	1	\N	\N		74000	85	2018-04-14 17:33:45.000267	2018-04-14 17:33:45.005053	1636.44000000000005		0	\N
125	1206 W. Northgate Dr. Irving 75062	1	1	\N	\N		202900	73	2018-04-14 17:23:53.07728	2018-04-14 17:23:53.082035	4544.42000000000007		0	\N
126	4140 Mansfield, Forrest Hill 	1	1	\N	\N		195000	74	2018-04-14 17:24:49.892727	2018-04-14 17:24:49.897324	4366.19999999999982		0	\N
127	405 Jefferson en Palmer Tx.	1	1	\N	\N		127700	72	2018-04-14 17:25:28.989693	2018-04-14 17:25:28.994041	2847.90999999999985		0	\N
128	1818 Guinevere	1	1	\N	\N		137000	101	2018-04-14 17:26:56.030725	2018-04-14 17:26:56.030725	3057.7199999999998		0	\N
129	711 Biggs Arl. 76010	1	1	\N	\N		103500	77	2018-04-14 17:27:45.417483	2018-04-14 17:27:45.421483	2301.96000000000004		0	\N
130	6137 County Road Alvarado 76009	1	1	\N	\N		195000	51	2018-04-14 17:28:17.412032	2018-04-14 17:28:17.415105	4366.19999999999982		0	\N
131	1606 Arbor Arl. 66010	1	1	\N	\N		113900	79	2018-04-14 17:28:59.386317	2018-04-14 17:28:59.39156	2536.57999999999993		0	\N
132	407 Stonecreek Dr. Arl 76014	1	1	\N	\N		118500	80	2018-04-14 17:30:03.726539	2018-04-14 17:30:03.731284	2640.36000000000013		0	\N
133	312 Dee Ln. Arl. 76011	1	1	\N	\N		135000	81	2018-04-14 17:31:04.625786	2018-04-14 17:31:04.631836	3012.59999999999991		0	\N
134	1041 Angela Ct. Everman 75140	1	1	\N	\N		132625	82	2018-04-14 17:31:39.106241	2018-04-14 17:31:39.111367	2959.01999999999998		0	\N
135	2820 County Rd.607 Alvarado 76009	1	1	\N	\N		98000	83	2018-04-14 17:32:18.442839	2018-04-14 17:32:18.447625	2177.88000000000011		0	\N
138	1309  E. Tucker Blvd. arl 76010. 	1	1	\N	\N		128900	86	2018-04-14 17:34:17.579769	2018-04-14 17:34:17.583027	2874.98000000000002		0	\N
139	6937 Stephens Hill rd.	1	1	\N	\N		0	102	2018-04-14 17:34:33.634651	2018-04-14 17:34:33.634651	-33		0	\N
140	1611 Rockdale  Arl.	1	1	\N	\N		183000	87	2018-04-14 17:35:11.584366	2018-04-14 17:35:11.590146	4095.48000000000002		0	\N
141	1420 Main St. Mansfield 	1	1	\N	\N		585000	88	2018-04-14 17:35:45.45961	2018-04-14 17:35:45.465133	13164.6000000000004		0	\N
142	8105 Mc. Gregor Dr. Arl. 7600	1	1	\N	\N		249900	89	2018-04-14 17:36:32.191038	2018-04-14 17:36:32.197282	5604.73999999999978		0	\N
143	407 Stonecreek Arl.Dr. 76014.	1	1	\N	\N		156990	91	2018-04-14 17:37:14.61586	2018-04-14 17:37:14.620087	3508.69000000000005		0	\N
144	1826 Wynn Terrace Arl. 76010	1	1	\N	\N		140000	92	2018-04-14 17:39:02.090352	2018-04-14 17:39:02.094507	3125.40000000000009		0	\N
145	4808 Glenn Valley Arl. 76018	1	1	\N	\N		185000	93	2018-04-14 17:40:21.2243	2018-04-14 17:40:21.228128	4140.60000000000036		0	\N
146	5402 Spring Willow Dr. 76018 &...	1	1	\N	\N		0	95	2018-04-14 17:40:58.583497	2018-04-14 17:40:58.59067	-33		0	\N
147	909 E. Mesquite....76010	1	1	\N	\N		0	96	2018-04-14 17:41:34.643128	2018-04-14 17:41:34.648708	-33		0	\N
148	1034 Pangburn  G.P.	1	1	\N	\N		220000	98	2018-04-14 17:42:13.016365	2018-04-14 17:42:13.019808	4930.19999999999982		0	\N
149	2209 San Jose Dr. Ft. Wt.	1	1	\N	\N		102000	99	2018-04-14 17:43:12.599436	2018-04-14 17:43:12.604324	2268.11999999999989		0	\N
150	506 Old Waxahachie	1	1	\N	\N		115000	72	2018-04-14 17:43:55.361221	2018-04-14 17:43:55.366819	2561.40000000000009		0	\N
151	1412 Green Hill Dr.	1	1	\N	\N		249900	72	2018-04-14 17:44:23.555603	2018-04-14 17:44:23.558362	5604.73999999999978		0	\N
\.


--
-- Name: houses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('houses_id_seq', 152, true);


--
-- Data for Name: infolists; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY infolists (id, house_id, created_at, updated_at) FROM stdin;
89	138	2018-04-14 17:34:17.647188	2018-04-14 17:34:17.647188
90	139	2018-04-14 17:34:33.681665	2018-04-14 17:34:33.681665
91	140	2018-04-14 17:35:11.652782	2018-04-14 17:35:11.652782
92	141	2018-04-14 17:35:45.527488	2018-04-14 17:35:45.527488
93	142	2018-04-14 17:36:32.258859	2018-04-14 17:36:32.258859
94	143	2018-04-14 17:37:14.664048	2018-04-14 17:37:14.664048
95	144	2018-04-14 17:39:02.142778	2018-04-14 17:39:02.142778
96	145	2018-04-14 17:40:21.294481	2018-04-14 17:40:21.294481
97	146	2018-04-14 17:40:58.637436	2018-04-14 17:40:58.637436
98	147	2018-04-14 17:41:34.711338	2018-04-14 17:41:34.711338
99	148	2018-04-14 17:42:13.083818	2018-04-14 17:42:13.083818
100	149	2018-04-14 17:43:12.662962	2018-04-14 17:43:12.662962
101	150	2018-04-14 17:43:55.425125	2018-04-14 17:43:55.425125
102	151	2018-04-14 17:44:23.603512	2018-04-14 17:44:23.603512
65	113	2018-04-14 17:15:28.206906	2018-04-14 17:15:28.206906
66	114	2018-04-14 17:16:37.687359	2018-04-14 17:16:37.687359
67	115	2018-04-14 17:17:21.615472	2018-04-14 17:17:21.615472
68	116	2018-04-14 17:18:09.823962	2018-04-14 17:18:09.823962
69	117	2018-04-14 17:19:00.854036	2018-04-14 17:19:00.854036
70	118	2018-04-14 17:19:39.296179	2018-04-14 17:19:39.296179
71	119	2018-04-14 17:20:21.138438	2018-04-14 17:20:21.138438
72	120	2018-04-14 17:21:19.679984	2018-04-14 17:21:19.679984
73	122	2018-04-14 17:22:03.41301	2018-04-14 17:22:03.41301
74	123	2018-04-14 17:22:37.226933	2018-04-14 17:22:37.226933
75	124	2018-04-14 17:23:08.544135	2018-04-14 17:23:08.544135
76	125	2018-04-14 17:23:53.129159	2018-04-14 17:23:53.129159
77	126	2018-04-14 17:24:49.94343	2018-04-14 17:24:49.94343
78	127	2018-04-14 17:25:29.047886	2018-04-14 17:25:29.047886
79	128	2018-04-14 17:26:56.07796	2018-04-14 17:26:56.07796
80	129	2018-04-14 17:27:45.483228	2018-04-14 17:27:45.483228
81	130	2018-04-14 17:28:17.480555	2018-04-14 17:28:17.480555
82	131	2018-04-14 17:28:59.445621	2018-04-14 17:28:59.445621
83	132	2018-04-14 17:30:03.791807	2018-04-14 17:30:03.791807
84	133	2018-04-14 17:31:04.685216	2018-04-14 17:31:04.685216
85	134	2018-04-14 17:31:39.164617	2018-04-14 17:31:39.164617
86	135	2018-04-14 17:32:18.49624	2018-04-14 17:32:18.49624
87	136	2018-04-14 17:32:53.278032	2018-04-14 17:32:53.278032
88	137	2018-04-14 17:33:45.070087	2018-04-14 17:33:45.070087
\.


--
-- Name: infolists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('infolists_id_seq', 103, true);


--
-- Data for Name: infos; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY infos (id, infolist_id, name, year, kind, primary_school, high_school, businesses, photographer, created_at, updated_at, key, prepa) FROM stdin;
681	65	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:15:28.255112	2018-04-14 17:15:28.255112	\N	\N
682	65	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:15:28.25806	2018-04-14 17:15:28.25806	\N	\N
683	65	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:15:28.260844	2018-04-14 17:15:28.260844	\N	\N
684	65	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:15:28.26306	2018-04-14 17:15:28.26306	\N	\N
685	65	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:15:28.265814	2018-04-14 17:15:28.265814	\N	\N
686	65	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:15:28.268652	2018-04-14 17:15:28.268652	\N	\N
687	65	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:15:28.272174	2018-04-14 17:15:28.272174	\N	\N
688	65	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:15:28.274936	2018-04-14 17:15:28.274936	\N	\N
689	65	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:15:28.277363	2018-04-14 17:15:28.277363	\N	\N
690	65	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:15:28.279779	2018-04-14 17:15:28.279779	\N	\N
691	65	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:15:28.282563	2018-04-14 17:15:28.282563	\N	\N
692	66	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:16:37.734413	2018-04-14 17:16:37.734413	\N	\N
693	66	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:16:37.738086	2018-04-14 17:16:37.738086	\N	\N
694	66	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:16:37.740896	2018-04-14 17:16:37.740896	\N	\N
695	66	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:16:37.743654	2018-04-14 17:16:37.743654	\N	\N
696	66	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:16:37.746476	2018-04-14 17:16:37.746476	\N	\N
697	66	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:16:37.749209	2018-04-14 17:16:37.749209	\N	\N
698	66	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:16:37.760636	2018-04-14 17:16:37.760636	\N	\N
699	66	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:16:37.763362	2018-04-14 17:16:37.763362	\N	\N
700	66	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:16:37.766781	2018-04-14 17:16:37.766781	\N	\N
701	66	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:16:37.76953	2018-04-14 17:16:37.76953	\N	\N
702	66	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:16:37.771988	2018-04-14 17:16:37.771988	\N	\N
703	67	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:17:21.679654	2018-04-14 17:17:21.679654	\N	\N
704	67	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:17:21.682207	2018-04-14 17:17:21.682207	\N	\N
705	67	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:17:21.68636	2018-04-14 17:17:21.68636	\N	\N
706	67	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:17:21.689109	2018-04-14 17:17:21.689109	\N	\N
707	67	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:17:21.691792	2018-04-14 17:17:21.691792	\N	\N
708	67	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:17:21.693812	2018-04-14 17:17:21.693812	\N	\N
709	67	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:17:21.696285	2018-04-14 17:17:21.696285	\N	\N
710	67	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:17:21.699289	2018-04-14 17:17:21.699289	\N	\N
711	67	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:17:21.70318	2018-04-14 17:17:21.70318	\N	\N
712	67	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:17:21.705932	2018-04-14 17:17:21.705932	\N	\N
713	67	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:17:21.708814	2018-04-14 17:17:21.708814	\N	\N
714	68	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:18:09.87225	2018-04-14 17:18:09.87225	\N	\N
715	68	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:18:09.875374	2018-04-14 17:18:09.875374	\N	\N
716	68	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:18:09.878006	2018-04-14 17:18:09.878006	\N	\N
717	68	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:18:09.880871	2018-04-14 17:18:09.880871	\N	\N
718	68	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:18:09.88388	2018-04-14 17:18:09.88388	\N	\N
719	68	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:18:09.886659	2018-04-14 17:18:09.886659	\N	\N
720	68	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:18:09.890025	2018-04-14 17:18:09.890025	\N	\N
721	68	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:18:09.89281	2018-04-14 17:18:09.89281	\N	\N
722	68	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:18:09.895679	2018-04-14 17:18:09.895679	\N	\N
723	68	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:18:09.89826	2018-04-14 17:18:09.89826	\N	\N
724	68	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:18:09.901055	2018-04-14 17:18:09.901055	\N	\N
725	69	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:00.904701	2018-04-14 17:19:00.904701	\N	\N
726	69	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:00.907374	2018-04-14 17:19:00.907374	\N	\N
727	69	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:00.910468	2018-04-14 17:19:00.910468	\N	\N
728	69	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:00.913146	2018-04-14 17:19:00.913146	\N	\N
729	69	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:00.91609	2018-04-14 17:19:00.91609	\N	\N
730	69	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:00.918924	2018-04-14 17:19:00.918924	\N	\N
731	69	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:00.921886	2018-04-14 17:19:00.921886	\N	\N
732	69	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:00.924574	2018-04-14 17:19:00.924574	\N	\N
733	69	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:00.927611	2018-04-14 17:19:00.927611	\N	\N
734	69	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:00.929943	2018-04-14 17:19:00.929943	\N	\N
735	69	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:00.93226	2018-04-14 17:19:00.93226	\N	\N
736	70	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:39.343667	2018-04-14 17:19:39.343667	\N	\N
737	70	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:39.346854	2018-04-14 17:19:39.346854	\N	\N
738	70	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:39.350324	2018-04-14 17:19:39.350324	\N	\N
739	70	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:39.353173	2018-04-14 17:19:39.353173	\N	\N
740	70	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:39.355857	2018-04-14 17:19:39.355857	\N	\N
741	70	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:39.358551	2018-04-14 17:19:39.358551	\N	\N
742	70	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:39.361199	2018-04-14 17:19:39.361199	\N	\N
743	70	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:39.364026	2018-04-14 17:19:39.364026	\N	\N
744	70	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:39.366691	2018-04-14 17:19:39.366691	\N	\N
745	70	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:39.369252	2018-04-14 17:19:39.369252	\N	\N
746	70	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:19:39.371615	2018-04-14 17:19:39.371615	\N	\N
747	71	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:20:21.187925	2018-04-14 17:20:21.187925	\N	\N
748	71	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:20:21.190813	2018-04-14 17:20:21.190813	\N	\N
749	71	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:20:21.193891	2018-04-14 17:20:21.193891	\N	\N
750	71	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:20:21.196624	2018-04-14 17:20:21.196624	\N	\N
751	71	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:20:21.199786	2018-04-14 17:20:21.199786	\N	\N
752	71	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:20:21.202681	2018-04-14 17:20:21.202681	\N	\N
753	71	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:20:21.205165	2018-04-14 17:20:21.205165	\N	\N
754	71	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:20:21.208174	2018-04-14 17:20:21.208174	\N	\N
755	71	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:20:21.211054	2018-04-14 17:20:21.211054	\N	\N
756	71	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:20:21.213857	2018-04-14 17:20:21.213857	\N	\N
757	71	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:20:21.216763	2018-04-14 17:20:21.216763	\N	\N
758	72	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:21:19.728424	2018-04-14 17:21:19.728424	\N	\N
759	72	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:21:19.731964	2018-04-14 17:21:19.731964	\N	\N
760	72	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:21:19.735623	2018-04-14 17:21:19.735623	\N	\N
761	72	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:21:19.738421	2018-04-14 17:21:19.738421	\N	\N
762	72	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:21:19.741094	2018-04-14 17:21:19.741094	\N	\N
763	72	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:21:19.743844	2018-04-14 17:21:19.743844	\N	\N
764	72	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:21:19.74701	2018-04-14 17:21:19.74701	\N	\N
765	72	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:21:19.74951	2018-04-14 17:21:19.74951	\N	\N
766	72	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:21:19.752163	2018-04-14 17:21:19.752163	\N	\N
767	72	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:21:19.755146	2018-04-14 17:21:19.755146	\N	\N
768	72	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:21:19.75823	2018-04-14 17:21:19.75823	\N	\N
769	73	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:03.466302	2018-04-14 17:22:03.466302	\N	\N
770	73	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:03.470767	2018-04-14 17:22:03.470767	\N	\N
771	73	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:03.476375	2018-04-14 17:22:03.476375	\N	\N
772	73	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:03.478876	2018-04-14 17:22:03.478876	\N	\N
773	73	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:03.48282	2018-04-14 17:22:03.48282	\N	\N
774	73	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:03.48553	2018-04-14 17:22:03.48553	\N	\N
775	73	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:03.488685	2018-04-14 17:22:03.488685	\N	\N
776	73	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:03.491107	2018-04-14 17:22:03.491107	\N	\N
777	73	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:03.493969	2018-04-14 17:22:03.493969	\N	\N
778	73	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:03.49698	2018-04-14 17:22:03.49698	\N	\N
779	73	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:03.49992	2018-04-14 17:22:03.49992	\N	\N
780	74	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:37.278693	2018-04-14 17:22:37.278693	\N	\N
781	74	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:37.282417	2018-04-14 17:22:37.282417	\N	\N
782	74	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:37.285858	2018-04-14 17:22:37.285858	\N	\N
783	74	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:37.288606	2018-04-14 17:22:37.288606	\N	\N
784	74	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:37.291308	2018-04-14 17:22:37.291308	\N	\N
785	74	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:37.293804	2018-04-14 17:22:37.293804	\N	\N
786	74	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:37.296512	2018-04-14 17:22:37.296512	\N	\N
787	74	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:37.299404	2018-04-14 17:22:37.299404	\N	\N
788	74	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:37.303088	2018-04-14 17:22:37.303088	\N	\N
789	74	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:37.305411	2018-04-14 17:22:37.305411	\N	\N
790	74	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:22:37.307692	2018-04-14 17:22:37.307692	\N	\N
791	75	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:08.598993	2018-04-14 17:23:08.598993	\N	\N
792	75	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:08.601481	2018-04-14 17:23:08.601481	\N	\N
793	75	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:08.604201	2018-04-14 17:23:08.604201	\N	\N
794	75	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:08.606611	2018-04-14 17:23:08.606611	\N	\N
795	75	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:08.609596	2018-04-14 17:23:08.609596	\N	\N
796	75	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:08.61227	2018-04-14 17:23:08.61227	\N	\N
797	75	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:08.614929	2018-04-14 17:23:08.614929	\N	\N
798	75	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:08.617816	2018-04-14 17:23:08.617816	\N	\N
799	75	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:08.620855	2018-04-14 17:23:08.620855	\N	\N
800	75	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:08.623713	2018-04-14 17:23:08.623713	\N	\N
801	75	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:08.626509	2018-04-14 17:23:08.626509	\N	\N
802	76	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:53.17882	2018-04-14 17:23:53.17882	\N	\N
803	76	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:53.182908	2018-04-14 17:23:53.182908	\N	\N
804	76	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:53.185876	2018-04-14 17:23:53.185876	\N	\N
805	76	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:53.188937	2018-04-14 17:23:53.188937	\N	\N
806	76	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:53.191688	2018-04-14 17:23:53.191688	\N	\N
807	76	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:53.19415	2018-04-14 17:23:53.19415	\N	\N
808	76	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:53.197437	2018-04-14 17:23:53.197437	\N	\N
809	76	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:53.200321	2018-04-14 17:23:53.200321	\N	\N
810	76	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:53.203448	2018-04-14 17:23:53.203448	\N	\N
811	76	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:53.206891	2018-04-14 17:23:53.206891	\N	\N
812	76	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:23:53.210922	2018-04-14 17:23:53.210922	\N	\N
813	77	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:24:49.989415	2018-04-14 17:24:49.989415	\N	\N
814	77	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:24:49.992287	2018-04-14 17:24:49.992287	\N	\N
815	77	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:24:49.995145	2018-04-14 17:24:49.995145	\N	\N
816	77	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:24:49.997475	2018-04-14 17:24:49.997475	\N	\N
817	77	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:24:49.999738	2018-04-14 17:24:49.999738	\N	\N
818	77	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:24:50.003084	2018-04-14 17:24:50.003084	\N	\N
819	77	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:24:50.00631	2018-04-14 17:24:50.00631	\N	\N
820	77	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:24:50.008936	2018-04-14 17:24:50.008936	\N	\N
821	77	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:24:50.011598	2018-04-14 17:24:50.011598	\N	\N
822	77	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:24:50.014313	2018-04-14 17:24:50.014313	\N	\N
823	77	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:24:50.017105	2018-04-14 17:24:50.017105	\N	\N
824	78	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:25:29.105668	2018-04-14 17:25:29.105668	\N	\N
825	78	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:25:29.108841	2018-04-14 17:25:29.108841	\N	\N
826	78	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:25:29.111677	2018-04-14 17:25:29.111677	\N	\N
827	78	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:25:29.115503	2018-04-14 17:25:29.115503	\N	\N
828	78	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:25:29.118832	2018-04-14 17:25:29.118832	\N	\N
829	78	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:25:29.120832	2018-04-14 17:25:29.120832	\N	\N
830	78	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:25:29.122821	2018-04-14 17:25:29.122821	\N	\N
831	78	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:25:29.12598	2018-04-14 17:25:29.12598	\N	\N
832	78	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:25:29.128511	2018-04-14 17:25:29.128511	\N	\N
833	78	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:25:29.130708	2018-04-14 17:25:29.130708	\N	\N
834	78	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:25:29.134063	2018-04-14 17:25:29.134063	\N	\N
835	79	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:26:56.139831	2018-04-14 17:26:56.139831	\N	\N
836	79	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:26:56.143076	2018-04-14 17:26:56.143076	\N	\N
837	79	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:26:56.146276	2018-04-14 17:26:56.146276	\N	\N
838	79	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:26:56.149104	2018-04-14 17:26:56.149104	\N	\N
839	79	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:26:56.151835	2018-04-14 17:26:56.151835	\N	\N
840	79	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:26:56.154675	2018-04-14 17:26:56.154675	\N	\N
841	79	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:26:56.15753	2018-04-14 17:26:56.15753	\N	\N
842	79	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:26:56.16039	2018-04-14 17:26:56.16039	\N	\N
843	79	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:26:56.16303	2018-04-14 17:26:56.16303	\N	\N
844	79	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:26:56.166388	2018-04-14 17:26:56.166388	\N	\N
845	79	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:26:56.168745	2018-04-14 17:26:56.168745	\N	\N
846	80	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:27:45.547191	2018-04-14 17:27:45.547191	\N	\N
847	80	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:27:45.551551	2018-04-14 17:27:45.551551	\N	\N
848	80	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:27:45.553481	2018-04-14 17:27:45.553481	\N	\N
849	80	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:27:45.555618	2018-04-14 17:27:45.555618	\N	\N
850	80	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:27:45.558349	2018-04-14 17:27:45.558349	\N	\N
851	80	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:27:45.56072	2018-04-14 17:27:45.56072	\N	\N
852	80	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:27:45.563184	2018-04-14 17:27:45.563184	\N	\N
853	80	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:27:45.566699	2018-04-14 17:27:45.566699	\N	\N
854	80	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:27:45.568863	2018-04-14 17:27:45.568863	\N	\N
855	80	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:27:45.57156	2018-04-14 17:27:45.57156	\N	\N
856	80	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:27:45.574134	2018-04-14 17:27:45.574134	\N	\N
857	81	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:17.535596	2018-04-14 17:28:17.535596	\N	\N
858	81	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:17.538173	2018-04-14 17:28:17.538173	\N	\N
859	81	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:17.540083	2018-04-14 17:28:17.540083	\N	\N
860	81	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:17.542073	2018-04-14 17:28:17.542073	\N	\N
861	81	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:17.54436	2018-04-14 17:28:17.54436	\N	\N
862	81	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:17.547104	2018-04-14 17:28:17.547104	\N	\N
863	81	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:17.549347	2018-04-14 17:28:17.549347	\N	\N
864	81	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:17.551515	2018-04-14 17:28:17.551515	\N	\N
865	81	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:17.55351	2018-04-14 17:28:17.55351	\N	\N
866	81	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:17.55554	2018-04-14 17:28:17.55554	\N	\N
867	81	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:17.557951	2018-04-14 17:28:17.557951	\N	\N
868	82	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:59.515605	2018-04-14 17:28:59.515605	\N	\N
869	82	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:59.518312	2018-04-14 17:28:59.518312	\N	\N
870	82	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:59.521	2018-04-14 17:28:59.521	\N	\N
871	82	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:59.523433	2018-04-14 17:28:59.523433	\N	\N
872	82	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:59.527067	2018-04-14 17:28:59.527067	\N	\N
873	82	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:59.529526	2018-04-14 17:28:59.529526	\N	\N
874	82	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:59.531771	2018-04-14 17:28:59.531771	\N	\N
875	82	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:59.534336	2018-04-14 17:28:59.534336	\N	\N
876	82	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:59.536918	2018-04-14 17:28:59.536918	\N	\N
877	82	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:59.540155	2018-04-14 17:28:59.540155	\N	\N
878	82	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:28:59.544642	2018-04-14 17:28:59.544642	\N	\N
879	83	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:30:03.859327	2018-04-14 17:30:03.859327	\N	\N
880	83	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:30:03.863744	2018-04-14 17:30:03.863744	\N	\N
881	83	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:30:03.866521	2018-04-14 17:30:03.866521	\N	\N
882	83	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:30:03.868674	2018-04-14 17:30:03.868674	\N	\N
883	83	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:30:03.872055	2018-04-14 17:30:03.872055	\N	\N
884	83	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:30:03.875274	2018-04-14 17:30:03.875274	\N	\N
885	83	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:30:03.878006	2018-04-14 17:30:03.878006	\N	\N
886	83	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:30:03.880461	2018-04-14 17:30:03.880461	\N	\N
887	83	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:30:03.882879	2018-04-14 17:30:03.882879	\N	\N
888	83	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:30:03.885905	2018-04-14 17:30:03.885905	\N	\N
889	83	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:30:03.888851	2018-04-14 17:30:03.888851	\N	\N
890	84	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:04.744654	2018-04-14 17:31:04.744654	\N	\N
891	84	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:04.748698	2018-04-14 17:31:04.748698	\N	\N
892	84	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:04.751097	2018-04-14 17:31:04.751097	\N	\N
893	84	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:04.754547	2018-04-14 17:31:04.754547	\N	\N
894	84	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:04.759131	2018-04-14 17:31:04.759131	\N	\N
895	84	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:04.761833	2018-04-14 17:31:04.761833	\N	\N
896	84	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:04.764799	2018-04-14 17:31:04.764799	\N	\N
897	84	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:04.767136	2018-04-14 17:31:04.767136	\N	\N
898	84	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:04.769904	2018-04-14 17:31:04.769904	\N	\N
899	84	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:04.773189	2018-04-14 17:31:04.773189	\N	\N
900	84	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:04.776239	2018-04-14 17:31:04.776239	\N	\N
901	85	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:39.220881	2018-04-14 17:31:39.220881	\N	\N
902	85	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:39.223541	2018-04-14 17:31:39.223541	\N	\N
903	85	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:39.226628	2018-04-14 17:31:39.226628	\N	\N
904	85	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:39.229513	2018-04-14 17:31:39.229513	\N	\N
905	85	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:39.232968	2018-04-14 17:31:39.232968	\N	\N
906	85	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:39.236581	2018-04-14 17:31:39.236581	\N	\N
907	85	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:39.239399	2018-04-14 17:31:39.239399	\N	\N
908	85	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:39.242504	2018-04-14 17:31:39.242504	\N	\N
909	85	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:39.245415	2018-04-14 17:31:39.245415	\N	\N
910	85	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:39.248501	2018-04-14 17:31:39.248501	\N	\N
911	85	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:31:39.251066	2018-04-14 17:31:39.251066	\N	\N
912	86	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:18.551938	2018-04-14 17:32:18.551938	\N	\N
913	86	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:18.555134	2018-04-14 17:32:18.555134	\N	\N
914	86	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:18.55786	2018-04-14 17:32:18.55786	\N	\N
915	86	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:18.560548	2018-04-14 17:32:18.560548	\N	\N
916	86	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:18.563237	2018-04-14 17:32:18.563237	\N	\N
917	86	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:18.56551	2018-04-14 17:32:18.56551	\N	\N
918	86	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:18.568149	2018-04-14 17:32:18.568149	\N	\N
919	86	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:18.571063	2018-04-14 17:32:18.571063	\N	\N
920	86	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:18.5748	2018-04-14 17:32:18.5748	\N	\N
921	86	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:18.577522	2018-04-14 17:32:18.577522	\N	\N
922	86	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:18.579823	2018-04-14 17:32:18.579823	\N	\N
923	87	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:53.331653	2018-04-14 17:32:53.331653	\N	\N
924	87	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:53.333853	2018-04-14 17:32:53.333853	\N	\N
925	87	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:53.337013	2018-04-14 17:32:53.337013	\N	\N
926	87	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:53.340025	2018-04-14 17:32:53.340025	\N	\N
927	87	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:53.342729	2018-04-14 17:32:53.342729	\N	\N
928	87	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:53.345299	2018-04-14 17:32:53.345299	\N	\N
929	87	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:53.34777	2018-04-14 17:32:53.34777	\N	\N
930	87	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:53.350449	2018-04-14 17:32:53.350449	\N	\N
931	87	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:53.353317	2018-04-14 17:32:53.353317	\N	\N
932	87	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:53.355862	2018-04-14 17:32:53.355862	\N	\N
933	87	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:32:53.358526	2018-04-14 17:32:53.358526	\N	\N
934	88	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:33:45.135459	2018-04-14 17:33:45.135459	\N	\N
935	88	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:33:45.138669	2018-04-14 17:33:45.138669	\N	\N
936	88	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:33:45.142339	2018-04-14 17:33:45.142339	\N	\N
937	88	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:33:45.145117	2018-04-14 17:33:45.145117	\N	\N
938	88	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:33:45.148244	2018-04-14 17:33:45.148244	\N	\N
939	88	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:33:45.150539	2018-04-14 17:33:45.150539	\N	\N
940	88	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:33:45.152926	2018-04-14 17:33:45.152926	\N	\N
941	88	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:33:45.157517	2018-04-14 17:33:45.157517	\N	\N
942	88	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:33:45.160893	2018-04-14 17:33:45.160893	\N	\N
943	88	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:33:45.163568	2018-04-14 17:33:45.163568	\N	\N
944	88	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:33:45.165842	2018-04-14 17:33:45.165842	\N	\N
945	89	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:17.709965	2018-04-14 17:34:17.709965	\N	\N
946	89	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:17.712481	2018-04-14 17:34:17.712481	\N	\N
947	89	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:17.715339	2018-04-14 17:34:17.715339	\N	\N
948	89	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:17.717481	2018-04-14 17:34:17.717481	\N	\N
949	89	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:17.720195	2018-04-14 17:34:17.720195	\N	\N
950	89	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:17.724792	2018-04-14 17:34:17.724792	\N	\N
951	89	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:17.727413	2018-04-14 17:34:17.727413	\N	\N
952	89	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:17.73036	2018-04-14 17:34:17.73036	\N	\N
953	89	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:17.732705	2018-04-14 17:34:17.732705	\N	\N
954	89	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:17.734796	2018-04-14 17:34:17.734796	\N	\N
955	89	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:17.737337	2018-04-14 17:34:17.737337	\N	\N
956	90	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:33.738053	2018-04-14 17:34:33.738053	\N	\N
957	90	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:33.740613	2018-04-14 17:34:33.740613	\N	\N
958	90	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:33.743006	2018-04-14 17:34:33.743006	\N	\N
959	90	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:33.745406	2018-04-14 17:34:33.745406	\N	\N
960	90	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:33.748142	2018-04-14 17:34:33.748142	\N	\N
961	90	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:33.750574	2018-04-14 17:34:33.750574	\N	\N
962	90	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:33.753568	2018-04-14 17:34:33.753568	\N	\N
963	90	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:33.75597	2018-04-14 17:34:33.75597	\N	\N
964	90	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:33.758239	2018-04-14 17:34:33.758239	\N	\N
965	90	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:33.760744	2018-04-14 17:34:33.760744	\N	\N
966	90	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:34:33.764106	2018-04-14 17:34:33.764106	\N	\N
967	91	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:11.712823	2018-04-14 17:35:11.712823	\N	\N
968	91	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:11.715615	2018-04-14 17:35:11.715615	\N	\N
969	91	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:11.717953	2018-04-14 17:35:11.717953	\N	\N
970	91	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:11.72033	2018-04-14 17:35:11.72033	\N	\N
971	91	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:11.724229	2018-04-14 17:35:11.724229	\N	\N
972	91	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:11.726727	2018-04-14 17:35:11.726727	\N	\N
973	91	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:11.72878	2018-04-14 17:35:11.72878	\N	\N
974	91	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:11.73112	2018-04-14 17:35:11.73112	\N	\N
975	91	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:11.733525	2018-04-14 17:35:11.733525	\N	\N
976	91	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:11.736372	2018-04-14 17:35:11.736372	\N	\N
977	91	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:11.73995	2018-04-14 17:35:11.73995	\N	\N
978	92	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:45.590181	2018-04-14 17:35:45.590181	\N	\N
979	92	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:45.593415	2018-04-14 17:35:45.593415	\N	\N
980	92	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:45.596279	2018-04-14 17:35:45.596279	\N	\N
981	92	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:45.598742	2018-04-14 17:35:45.598742	\N	\N
982	92	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:45.601538	2018-04-14 17:35:45.601538	\N	\N
983	92	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:45.603914	2018-04-14 17:35:45.603914	\N	\N
984	92	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:45.606717	2018-04-14 17:35:45.606717	\N	\N
985	92	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:45.609564	2018-04-14 17:35:45.609564	\N	\N
986	92	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:45.611995	2018-04-14 17:35:45.611995	\N	\N
987	92	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:45.614587	2018-04-14 17:35:45.614587	\N	\N
988	92	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:35:45.617247	2018-04-14 17:35:45.617247	\N	\N
989	93	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:36:32.322346	2018-04-14 17:36:32.322346	\N	\N
990	93	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:36:32.325365	2018-04-14 17:36:32.325365	\N	\N
991	93	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:36:32.328075	2018-04-14 17:36:32.328075	\N	\N
992	93	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:36:32.330189	2018-04-14 17:36:32.330189	\N	\N
993	93	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:36:32.332981	2018-04-14 17:36:32.332981	\N	\N
994	93	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:36:32.335319	2018-04-14 17:36:32.335319	\N	\N
995	93	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:36:32.337812	2018-04-14 17:36:32.337812	\N	\N
996	93	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:36:32.339987	2018-04-14 17:36:32.339987	\N	\N
997	93	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:36:32.34183	2018-04-14 17:36:32.34183	\N	\N
998	93	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:36:32.344048	2018-04-14 17:36:32.344048	\N	\N
999	93	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:36:32.346051	2018-04-14 17:36:32.346051	\N	\N
1000	94	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:37:14.713118	2018-04-14 17:37:14.713118	\N	\N
1001	94	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:37:14.715689	2018-04-14 17:37:14.715689	\N	\N
1002	94	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:37:14.717947	2018-04-14 17:37:14.717947	\N	\N
1003	94	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:37:14.720697	2018-04-14 17:37:14.720697	\N	\N
1004	94	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:37:14.724232	2018-04-14 17:37:14.724232	\N	\N
1005	94	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:37:14.726665	2018-04-14 17:37:14.726665	\N	\N
1006	94	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:37:14.729449	2018-04-14 17:37:14.729449	\N	\N
1007	94	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:37:14.731806	2018-04-14 17:37:14.731806	\N	\N
1008	94	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:37:14.734162	2018-04-14 17:37:14.734162	\N	\N
1009	94	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:37:14.736857	2018-04-14 17:37:14.736857	\N	\N
1010	94	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:37:14.739206	2018-04-14 17:37:14.739206	\N	\N
1011	95	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:39:02.193923	2018-04-14 17:39:02.193923	\N	\N
1012	95	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:39:02.196448	2018-04-14 17:39:02.196448	\N	\N
1013	95	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:39:02.199146	2018-04-14 17:39:02.199146	\N	\N
1014	95	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:39:02.202122	2018-04-14 17:39:02.202122	\N	\N
1015	95	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:39:02.204856	2018-04-14 17:39:02.204856	\N	\N
1016	95	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:39:02.207569	2018-04-14 17:39:02.207569	\N	\N
1017	95	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:39:02.210194	2018-04-14 17:39:02.210194	\N	\N
1018	95	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:39:02.212928	2018-04-14 17:39:02.212928	\N	\N
1019	95	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:39:02.215948	2018-04-14 17:39:02.215948	\N	\N
1020	95	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:39:02.218702	2018-04-14 17:39:02.218702	\N	\N
1021	95	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:39:02.221068	2018-04-14 17:39:02.221068	\N	\N
1022	96	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:21.357425	2018-04-14 17:40:21.357425	\N	\N
1023	96	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:21.361369	2018-04-14 17:40:21.361369	\N	\N
1024	96	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:21.364623	2018-04-14 17:40:21.364623	\N	\N
1025	96	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:21.367118	2018-04-14 17:40:21.367118	\N	\N
1026	96	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:21.37017	2018-04-14 17:40:21.37017	\N	\N
1027	96	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:21.372718	2018-04-14 17:40:21.372718	\N	\N
1028	96	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:21.375359	2018-04-14 17:40:21.375359	\N	\N
1029	96	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:21.378707	2018-04-14 17:40:21.378707	\N	\N
1030	96	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:21.381324	2018-04-14 17:40:21.381324	\N	\N
1031	96	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:21.383791	2018-04-14 17:40:21.383791	\N	\N
1032	96	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:21.385954	2018-04-14 17:40:21.385954	\N	\N
1033	97	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:58.697404	2018-04-14 17:40:58.697404	\N	\N
1034	97	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:58.700851	2018-04-14 17:40:58.700851	\N	\N
1035	97	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:58.703392	2018-04-14 17:40:58.703392	\N	\N
1036	97	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:58.706643	2018-04-14 17:40:58.706643	\N	\N
1037	97	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:58.709481	2018-04-14 17:40:58.709481	\N	\N
1038	97	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:58.715529	2018-04-14 17:40:58.715529	\N	\N
1039	97	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:58.718399	2018-04-14 17:40:58.718399	\N	\N
1040	97	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:58.721524	2018-04-14 17:40:58.721524	\N	\N
1041	97	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:58.724266	2018-04-14 17:40:58.724266	\N	\N
1042	97	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:58.72738	2018-04-14 17:40:58.72738	\N	\N
1043	97	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:40:58.731948	2018-04-14 17:40:58.731948	\N	\N
1044	98	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:41:34.786556	2018-04-14 17:41:34.786556	\N	\N
1045	98	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:41:34.790254	2018-04-14 17:41:34.790254	\N	\N
1046	98	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:41:34.794219	2018-04-14 17:41:34.794219	\N	\N
1047	98	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:41:34.798741	2018-04-14 17:41:34.798741	\N	\N
1048	98	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:41:34.803054	2018-04-14 17:41:34.803054	\N	\N
1049	98	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:41:34.810169	2018-04-14 17:41:34.810169	\N	\N
1050	98	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:41:34.813515	2018-04-14 17:41:34.813515	\N	\N
1051	98	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:41:34.817391	2018-04-14 17:41:34.817391	\N	\N
1052	98	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:41:34.82104	2018-04-14 17:41:34.82104	\N	\N
1053	98	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:41:34.823921	2018-04-14 17:41:34.823921	\N	\N
1054	98	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:41:34.826737	2018-04-14 17:41:34.826737	\N	\N
1055	99	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:42:13.152082	2018-04-14 17:42:13.152082	\N	\N
1056	99	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:42:13.155041	2018-04-14 17:42:13.155041	\N	\N
1057	99	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:42:13.157121	2018-04-14 17:42:13.157121	\N	\N
1058	99	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:42:13.159131	2018-04-14 17:42:13.159131	\N	\N
1059	99	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:42:13.161927	2018-04-14 17:42:13.161927	\N	\N
1060	99	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:42:13.165481	2018-04-14 17:42:13.165481	\N	\N
1061	99	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:42:13.168108	2018-04-14 17:42:13.168108	\N	\N
1062	99	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:42:13.170952	2018-04-14 17:42:13.170952	\N	\N
1063	99	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:42:13.173046	2018-04-14 17:42:13.173046	\N	\N
1064	99	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:42:13.175383	2018-04-14 17:42:13.175383	\N	\N
1065	99	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:42:13.178132	2018-04-14 17:42:13.178132	\N	\N
1066	100	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:12.719878	2018-04-14 17:43:12.719878	\N	\N
1067	100	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:12.722649	2018-04-14 17:43:12.722649	\N	\N
1068	100	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:12.727081	2018-04-14 17:43:12.727081	\N	\N
1069	100	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:12.729468	2018-04-14 17:43:12.729468	\N	\N
1070	100	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:12.731731	2018-04-14 17:43:12.731731	\N	\N
1071	100	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:12.734629	2018-04-14 17:43:12.734629	\N	\N
1072	100	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:12.736788	2018-04-14 17:43:12.736788	\N	\N
1073	100	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:12.739984	2018-04-14 17:43:12.739984	\N	\N
1074	100	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:12.743129	2018-04-14 17:43:12.743129	\N	\N
1075	100	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:12.745469	2018-04-14 17:43:12.745469	\N	\N
1076	100	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:12.74826	2018-04-14 17:43:12.74826	\N	\N
1077	101	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:55.488462	2018-04-14 17:43:55.488462	\N	\N
1078	101	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:55.491584	2018-04-14 17:43:55.491584	\N	\N
1079	101	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:55.494159	2018-04-14 17:43:55.494159	\N	\N
1080	101	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:55.496736	2018-04-14 17:43:55.496736	\N	\N
1081	101	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:55.499524	2018-04-14 17:43:55.499524	\N	\N
1082	101	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:55.501711	2018-04-14 17:43:55.501711	\N	\N
1083	101	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:55.504069	2018-04-14 17:43:55.504069	\N	\N
1084	101	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:55.507102	2018-04-14 17:43:55.507102	\N	\N
1085	101	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:55.509141	2018-04-14 17:43:55.509141	\N	\N
1086	101	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:55.511425	2018-04-14 17:43:55.511425	\N	\N
1087	101	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:43:55.514016	2018-04-14 17:43:55.514016	\N	\N
1088	102	Roofing	\N	\N	\N	\N	\N	\N	2018-04-14 17:44:23.655061	2018-04-14 17:44:23.655061	\N	\N
1089	102	Foundation	\N	\N	\N	\N	\N	\N	2018-04-14 17:44:23.657834	2018-04-14 17:44:23.657834	\N	\N
1090	102	Stove	\N	\N	\N	\N	\N	\N	2018-04-14 17:44:23.660722	2018-04-14 17:44:23.660722	\N	\N
1091	102	HVAC	\N	\N	\N	\N	\N	\N	2018-04-14 17:44:23.66288	2018-04-14 17:44:23.66288	\N	\N
1092	102	Remodeling	\N	\N	\N	\N	\N	\N	2018-04-14 17:44:23.665292	2018-04-14 17:44:23.665292	\N	\N
1093	102	Fireplace	\N	\N	\N	\N	\N	\N	2018-04-14 17:44:23.667759	2018-04-14 17:44:23.667759	\N	\N
1094	102	Key	\N	\N	\N	\N	\N	\N	2018-04-14 17:44:23.67041	2018-04-14 17:44:23.67041	\N	\N
1095	102	Septic	\N	\N	\N	\N	\N	\N	2018-04-14 17:44:23.673128	2018-04-14 17:44:23.673128	\N	\N
1096	102	Utilities	\N	\N	\N	\N	\N	\N	2018-04-14 17:44:23.675703	2018-04-14 17:44:23.675703	\N	\N
1097	102	Schools	\N	\N	\N	\N	\N	\N	2018-04-14 17:44:23.678382	2018-04-14 17:44:23.678382	\N	\N
1098	102	Photographer	\N	\N	\N	\N	\N	\N	2018-04-14 17:44:23.680853	2018-04-14 17:44:23.680853	\N	\N
\.


--
-- Name: infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('infos_id_seq', 1109, true);


--
-- Data for Name: investors; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY investors (id, profit_margin, sales_price, client_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: investors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('investors_id_seq', 1, true);


--
-- Data for Name: reccomendations; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY reccomendations (id, vendor_id, client_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: reccomendations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('reccomendations_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY schema_migrations (version) FROM stdin;
20180301163610
20180301163808
20180301164040
20180301164138
20180301164156
20180301164225
20180301164327
20180301164353
20180301164445
20180301164511
20180301164535
20180301170156
20180301170208
20180301170215
20180301170232
20180301170242
20180301170250
20180301172654
20180301172709
20180301172720
20180301175550
20180301181100
20180301184059
20180301190223
20180301190252
20180301190316
20180301191910
20180301192014
20180301201520
20180302165247
20180302195115
20180302223656
20180302223757
20180302225137
20180303025925
20180303033745
20180303033757
20180303033841
20180303034552
20180303034804
20180303035754
20180303222300
20180303223812
20180304011948
20180304204210
20180304204602
20180304205026
20180304205107
20180304214805
20180304220609
20180304220906
20180304221326
20180304221644
20180304222814
20180304231016
20180304231240
20180306022101
20180310191027
20180312200027
20180331195801
20180331195911
20180402184652
20180404162005
20180404191437
20180409162052
20180412183854
20180412183936
20180412192437
20180412202541
20180414141014
\.


--
-- Data for Name: showings; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY showings (id, house_id, day, "when", created_at, updated_at) FROM stdin;
\.


--
-- Name: showings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('showings_id_seq', 4, true);


--
-- Data for Name: tasklists; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY tasklists (id, created_at, updated_at, house_id) FROM stdin;
83	2018-04-14 17:15:28.708176	2018-04-14 17:15:28.708176	113
84	2018-04-14 17:16:38.182107	2018-04-14 17:16:38.182107	114
85	2018-04-14 17:17:22.163058	2018-04-14 17:17:22.163058	115
86	2018-04-14 17:18:10.330204	2018-04-14 17:18:10.330204	116
87	2018-04-14 17:19:01.351259	2018-04-14 17:19:01.351259	117
88	2018-04-14 17:19:39.794427	2018-04-14 17:19:39.794427	118
89	2018-04-14 17:20:21.65586	2018-04-14 17:20:21.65586	119
90	2018-04-14 17:21:20.207273	2018-04-14 17:21:20.207273	120
91	2018-04-14 17:22:03.94552	2018-04-14 17:22:03.94552	122
92	2018-04-14 17:22:37.787604	2018-04-14 17:22:37.787604	123
93	2018-04-14 17:23:09.061926	2018-04-14 17:23:09.061926	124
94	2018-04-14 17:23:53.6783	2018-04-14 17:23:53.6783	125
95	2018-04-14 17:24:50.441094	2018-04-14 17:24:50.441094	126
96	2018-04-14 17:25:29.64963	2018-04-14 17:25:29.64963	127
97	2018-04-14 17:26:56.595052	2018-04-14 17:26:56.595052	128
98	2018-04-14 17:27:46.021095	2018-04-14 17:27:46.021095	129
99	2018-04-14 17:28:17.991408	2018-04-14 17:28:17.991408	130
100	2018-04-14 17:29:00.079038	2018-04-14 17:29:00.079038	131
101	2018-04-14 17:30:04.344682	2018-04-14 17:30:04.344682	132
102	2018-04-14 17:31:05.224107	2018-04-14 17:31:05.224107	133
103	2018-04-14 17:31:39.724904	2018-04-14 17:31:39.724904	134
104	2018-04-14 17:32:18.993658	2018-04-14 17:32:18.993658	135
105	2018-04-14 17:32:53.900093	2018-04-14 17:32:53.900093	136
106	2018-04-14 17:33:45.592344	2018-04-14 17:33:45.592344	137
107	2018-04-14 17:34:18.223137	2018-04-14 17:34:18.223137	138
108	2018-04-14 17:34:34.206153	2018-04-14 17:34:34.206153	139
109	2018-04-14 17:35:12.210295	2018-04-14 17:35:12.210295	140
110	2018-04-14 17:35:46.06128	2018-04-14 17:35:46.06128	141
111	2018-04-14 17:36:32.785419	2018-04-14 17:36:32.785419	142
112	2018-04-14 17:37:15.15221	2018-04-14 17:37:15.15221	143
113	2018-04-14 17:39:02.656809	2018-04-14 17:39:02.656809	144
114	2018-04-14 17:40:21.828939	2018-04-14 17:40:21.828939	145
115	2018-04-14 17:40:59.180751	2018-04-14 17:40:59.180751	146
116	2018-04-14 17:41:35.341522	2018-04-14 17:41:35.341522	147
117	2018-04-14 17:42:13.64437	2018-04-14 17:42:13.64437	148
118	2018-04-14 17:43:13.239239	2018-04-14 17:43:13.239239	149
119	2018-04-14 17:43:55.97616	2018-04-14 17:43:55.97616	150
120	2018-04-14 17:44:24.102323	2018-04-14 17:44:24.102323	151
\.


--
-- Name: tasklists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('tasklists_id_seq', 121, true);


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY tasks (id, tasklist_id, created_at, updated_at, task, step) FROM stdin;
1152	83	2018-04-14 17:15:28.750973	2018-04-14 17:15:28.750973	Add Listing Documents to Listing Package Presentation	\N
1153	83	2018-04-14 17:15:28.754979	2018-04-14 17:15:28.754979	Prepare Market Analysis	\N
1154	83	2018-04-14 17:15:28.757994	2018-04-14 17:15:28.757994	Prepare Marketing Plan	\N
1155	83	2018-04-14 17:15:28.760368	2018-04-14 17:15:28.760368	Prepare "About Me" 	\N
1156	83	2018-04-14 17:15:28.763041	2018-04-14 17:15:28.763041	Prepare "Why That Price?"	\N
1157	83	2018-04-14 17:15:28.76584	2018-04-14 17:15:28.76584	Prepare "Time Frame Idea"	\N
1158	83	2018-04-14 17:15:28.768461	2018-04-14 17:15:28.768461	Follow up	\N
1159	84	2018-04-14 17:16:38.22883	2018-04-14 17:16:38.22883	Add Listing Documents to Listing Package Presentation	\N
1160	84	2018-04-14 17:16:38.232298	2018-04-14 17:16:38.232298	Prepare Market Analysis	\N
1161	84	2018-04-14 17:16:38.234579	2018-04-14 17:16:38.234579	Prepare Marketing Plan	\N
1162	84	2018-04-14 17:16:38.236794	2018-04-14 17:16:38.236794	Prepare "About Me" 	\N
1163	84	2018-04-14 17:16:38.239109	2018-04-14 17:16:38.239109	Prepare "Why That Price?"	\N
1164	84	2018-04-14 17:16:38.241481	2018-04-14 17:16:38.241481	Prepare "Time Frame Idea"	\N
1165	84	2018-04-14 17:16:38.244727	2018-04-14 17:16:38.244727	Follow up	\N
1166	85	2018-04-14 17:17:22.213205	2018-04-14 17:17:22.213205	Add Listing Documents to Listing Package Presentation	\N
1167	85	2018-04-14 17:17:22.216585	2018-04-14 17:17:22.216585	Prepare Market Analysis	\N
1168	85	2018-04-14 17:17:22.220289	2018-04-14 17:17:22.220289	Prepare Marketing Plan	\N
1169	85	2018-04-14 17:17:22.223246	2018-04-14 17:17:22.223246	Prepare "About Me" 	\N
1170	85	2018-04-14 17:17:22.226002	2018-04-14 17:17:22.226002	Prepare "Why That Price?"	\N
1171	85	2018-04-14 17:17:22.229015	2018-04-14 17:17:22.229015	Prepare "Time Frame Idea"	\N
1172	85	2018-04-14 17:17:22.231513	2018-04-14 17:17:22.231513	Follow up	\N
1173	86	2018-04-14 17:18:10.378082	2018-04-14 17:18:10.378082	Add Listing Documents to Listing Package Presentation	\N
1174	86	2018-04-14 17:18:10.380871	2018-04-14 17:18:10.380871	Prepare Market Analysis	\N
1175	86	2018-04-14 17:18:10.383587	2018-04-14 17:18:10.383587	Prepare Marketing Plan	\N
1176	86	2018-04-14 17:18:10.386378	2018-04-14 17:18:10.386378	Prepare "About Me" 	\N
1177	86	2018-04-14 17:18:10.389136	2018-04-14 17:18:10.389136	Prepare "Why That Price?"	\N
1178	86	2018-04-14 17:18:10.39203	2018-04-14 17:18:10.39203	Prepare "Time Frame Idea"	\N
1179	86	2018-04-14 17:18:10.395782	2018-04-14 17:18:10.395782	Follow up	\N
1180	87	2018-04-14 17:19:01.395689	2018-04-14 17:19:01.395689	Add Listing Documents to Listing Package Presentation	\N
1181	87	2018-04-14 17:19:01.398405	2018-04-14 17:19:01.398405	Prepare Market Analysis	\N
1182	87	2018-04-14 17:19:01.401162	2018-04-14 17:19:01.401162	Prepare Marketing Plan	\N
1183	87	2018-04-14 17:19:01.403858	2018-04-14 17:19:01.403858	Prepare "About Me" 	\N
1184	87	2018-04-14 17:19:01.406617	2018-04-14 17:19:01.406617	Prepare "Why That Price?"	\N
1185	87	2018-04-14 17:19:01.408925	2018-04-14 17:19:01.408925	Prepare "Time Frame Idea"	\N
1186	87	2018-04-14 17:19:01.412056	2018-04-14 17:19:01.412056	Follow up	\N
1187	88	2018-04-14 17:19:39.853516	2018-04-14 17:19:39.853516	Add Listing Documents to Listing Package Presentation	\N
1188	88	2018-04-14 17:19:39.856257	2018-04-14 17:19:39.856257	Prepare Market Analysis	\N
1189	88	2018-04-14 17:19:39.859031	2018-04-14 17:19:39.859031	Prepare Marketing Plan	\N
1190	88	2018-04-14 17:19:39.861322	2018-04-14 17:19:39.861322	Prepare "About Me" 	\N
1191	88	2018-04-14 17:19:39.863748	2018-04-14 17:19:39.863748	Prepare "Why That Price?"	\N
1192	88	2018-04-14 17:19:39.866213	2018-04-14 17:19:39.866213	Prepare "Time Frame Idea"	\N
1193	88	2018-04-14 17:19:39.868827	2018-04-14 17:19:39.868827	Follow up	\N
1194	89	2018-04-14 17:20:21.703226	2018-04-14 17:20:21.703226	Add Listing Documents to Listing Package Presentation	\N
1195	89	2018-04-14 17:20:21.706131	2018-04-14 17:20:21.706131	Prepare Market Analysis	\N
1196	89	2018-04-14 17:20:21.709023	2018-04-14 17:20:21.709023	Prepare Marketing Plan	\N
1197	89	2018-04-14 17:20:21.711955	2018-04-14 17:20:21.711955	Prepare "About Me" 	\N
1198	89	2018-04-14 17:20:21.714893	2018-04-14 17:20:21.714893	Prepare "Why That Price?"	\N
1199	89	2018-04-14 17:20:21.717512	2018-04-14 17:20:21.717512	Prepare "Time Frame Idea"	\N
1200	89	2018-04-14 17:20:21.720221	2018-04-14 17:20:21.720221	Follow up	\N
1201	90	2018-04-14 17:21:20.257481	2018-04-14 17:21:20.257481	Add Listing Documents to Listing Package Presentation	\N
1202	90	2018-04-14 17:21:20.260844	2018-04-14 17:21:20.260844	Prepare Market Analysis	\N
1203	90	2018-04-14 17:21:20.263837	2018-04-14 17:21:20.263837	Prepare Marketing Plan	\N
1204	90	2018-04-14 17:21:20.266582	2018-04-14 17:21:20.266582	Prepare "About Me" 	\N
1205	90	2018-04-14 17:21:20.269482	2018-04-14 17:21:20.269482	Prepare "Why That Price?"	\N
1206	90	2018-04-14 17:21:20.271824	2018-04-14 17:21:20.271824	Prepare "Time Frame Idea"	\N
1207	90	2018-04-14 17:21:20.274352	2018-04-14 17:21:20.274352	Follow up	\N
1208	91	2018-04-14 17:22:03.989559	2018-04-14 17:22:03.989559	Add Listing Documents to Listing Package Presentation	\N
1209	91	2018-04-14 17:22:03.992543	2018-04-14 17:22:03.992543	Prepare Market Analysis	\N
1210	91	2018-04-14 17:22:03.995663	2018-04-14 17:22:03.995663	Prepare Marketing Plan	\N
1211	91	2018-04-14 17:22:03.998678	2018-04-14 17:22:03.998678	Prepare "About Me" 	\N
1212	91	2018-04-14 17:22:04.001514	2018-04-14 17:22:04.001514	Prepare "Why That Price?"	\N
1213	91	2018-04-14 17:22:04.004177	2018-04-14 17:22:04.004177	Prepare "Time Frame Idea"	\N
1214	91	2018-04-14 17:22:04.006701	2018-04-14 17:22:04.006701	Follow up	\N
1215	92	2018-04-14 17:22:37.83262	2018-04-14 17:22:37.83262	Add Listing Documents to Listing Package Presentation	\N
1216	92	2018-04-14 17:22:37.835934	2018-04-14 17:22:37.835934	Prepare Market Analysis	\N
1217	92	2018-04-14 17:22:37.838645	2018-04-14 17:22:37.838645	Prepare Marketing Plan	\N
1218	92	2018-04-14 17:22:37.841302	2018-04-14 17:22:37.841302	Prepare "About Me" 	\N
1219	92	2018-04-14 17:22:37.843801	2018-04-14 17:22:37.843801	Prepare "Why That Price?"	\N
1220	92	2018-04-14 17:22:37.846283	2018-04-14 17:22:37.846283	Prepare "Time Frame Idea"	\N
1221	92	2018-04-14 17:22:37.848619	2018-04-14 17:22:37.848619	Follow up	\N
1222	93	2018-04-14 17:23:09.109956	2018-04-14 17:23:09.109956	Add Listing Documents to Listing Package Presentation	\N
1223	93	2018-04-14 17:23:09.112651	2018-04-14 17:23:09.112651	Prepare Market Analysis	\N
1224	93	2018-04-14 17:23:09.11492	2018-04-14 17:23:09.11492	Prepare Marketing Plan	\N
1225	93	2018-04-14 17:23:09.117482	2018-04-14 17:23:09.117482	Prepare "About Me" 	\N
1226	93	2018-04-14 17:23:09.11987	2018-04-14 17:23:09.11987	Prepare "Why That Price?"	\N
1227	93	2018-04-14 17:23:09.122805	2018-04-14 17:23:09.122805	Prepare "Time Frame Idea"	\N
1228	93	2018-04-14 17:23:09.125549	2018-04-14 17:23:09.125549	Follow up	\N
1229	94	2018-04-14 17:23:53.727157	2018-04-14 17:23:53.727157	Add Listing Documents to Listing Package Presentation	\N
1230	94	2018-04-14 17:23:53.729733	2018-04-14 17:23:53.729733	Prepare Market Analysis	\N
1231	94	2018-04-14 17:23:53.732319	2018-04-14 17:23:53.732319	Prepare Marketing Plan	\N
1232	94	2018-04-14 17:23:53.734931	2018-04-14 17:23:53.734931	Prepare "About Me" 	\N
1233	94	2018-04-14 17:23:53.737442	2018-04-14 17:23:53.737442	Prepare "Why That Price?"	\N
1234	94	2018-04-14 17:23:53.739853	2018-04-14 17:23:53.739853	Prepare "Time Frame Idea"	\N
1235	94	2018-04-14 17:23:53.742644	2018-04-14 17:23:53.742644	Follow up	\N
1236	95	2018-04-14 17:24:50.488118	2018-04-14 17:24:50.488118	Add Listing Documents to Listing Package Presentation	\N
1237	95	2018-04-14 17:24:50.490865	2018-04-14 17:24:50.490865	Prepare Market Analysis	\N
1238	95	2018-04-14 17:24:50.493534	2018-04-14 17:24:50.493534	Prepare Marketing Plan	\N
1239	95	2018-04-14 17:24:50.496146	2018-04-14 17:24:50.496146	Prepare "About Me" 	\N
1240	95	2018-04-14 17:24:50.499006	2018-04-14 17:24:50.499006	Prepare "Why That Price?"	\N
1241	95	2018-04-14 17:24:50.5021	2018-04-14 17:24:50.5021	Prepare "Time Frame Idea"	\N
1242	95	2018-04-14 17:24:50.504984	2018-04-14 17:24:50.504984	Follow up	\N
1243	96	2018-04-14 17:25:29.704716	2018-04-14 17:25:29.704716	Add Listing Documents to Listing Package Presentation	\N
1244	96	2018-04-14 17:25:29.707499	2018-04-14 17:25:29.707499	Prepare Market Analysis	\N
1245	96	2018-04-14 17:25:29.710676	2018-04-14 17:25:29.710676	Prepare Marketing Plan	\N
1246	96	2018-04-14 17:25:29.713428	2018-04-14 17:25:29.713428	Prepare "About Me" 	\N
1247	96	2018-04-14 17:25:29.716636	2018-04-14 17:25:29.716636	Prepare "Why That Price?"	\N
1248	96	2018-04-14 17:25:29.719609	2018-04-14 17:25:29.719609	Prepare "Time Frame Idea"	\N
1249	96	2018-04-14 17:25:29.721995	2018-04-14 17:25:29.721995	Follow up	\N
1250	97	2018-04-14 17:26:56.643582	2018-04-14 17:26:56.643582	Add Listing Documents to Listing Package Presentation	\N
1251	97	2018-04-14 17:26:56.646887	2018-04-14 17:26:56.646887	Prepare Market Analysis	\N
1252	97	2018-04-14 17:26:56.649278	2018-04-14 17:26:56.649278	Prepare Marketing Plan	\N
1253	97	2018-04-14 17:26:56.652576	2018-04-14 17:26:56.652576	Prepare "About Me" 	\N
1254	97	2018-04-14 17:26:56.655905	2018-04-14 17:26:56.655905	Prepare "Why That Price?"	\N
1255	97	2018-04-14 17:26:56.659888	2018-04-14 17:26:56.659888	Prepare "Time Frame Idea"	\N
1256	97	2018-04-14 17:26:56.66273	2018-04-14 17:26:56.66273	Follow up	\N
1257	98	2018-04-14 17:27:46.072316	2018-04-14 17:27:46.072316	Add Listing Documents to Listing Package Presentation	\N
1258	98	2018-04-14 17:27:46.075541	2018-04-14 17:27:46.075541	Prepare Market Analysis	\N
1259	98	2018-04-14 17:27:46.078708	2018-04-14 17:27:46.078708	Prepare Marketing Plan	\N
1260	98	2018-04-14 17:27:46.081751	2018-04-14 17:27:46.081751	Prepare "About Me" 	\N
1261	98	2018-04-14 17:27:46.084168	2018-04-14 17:27:46.084168	Prepare "Why That Price?"	\N
1262	98	2018-04-14 17:27:46.087531	2018-04-14 17:27:46.087531	Prepare "Time Frame Idea"	\N
1263	98	2018-04-14 17:27:46.090305	2018-04-14 17:27:46.090305	Follow up	\N
1264	99	2018-04-14 17:28:18.040931	2018-04-14 17:28:18.040931	Add Listing Documents to Listing Package Presentation	\N
1265	99	2018-04-14 17:28:18.043459	2018-04-14 17:28:18.043459	Prepare Market Analysis	\N
1266	99	2018-04-14 17:28:18.046108	2018-04-14 17:28:18.046108	Prepare Marketing Plan	\N
1267	99	2018-04-14 17:28:18.04848	2018-04-14 17:28:18.04848	Prepare "About Me" 	\N
1268	99	2018-04-14 17:28:18.051818	2018-04-14 17:28:18.051818	Prepare "Why That Price?"	\N
1269	99	2018-04-14 17:28:18.054369	2018-04-14 17:28:18.054369	Prepare "Time Frame Idea"	\N
1270	99	2018-04-14 17:28:18.057199	2018-04-14 17:28:18.057199	Follow up	\N
1271	100	2018-04-14 17:29:00.128498	2018-04-14 17:29:00.128498	Add Listing Documents to Listing Package Presentation	\N
1272	100	2018-04-14 17:29:00.131921	2018-04-14 17:29:00.131921	Prepare Market Analysis	\N
1273	100	2018-04-14 17:29:00.134607	2018-04-14 17:29:00.134607	Prepare Marketing Plan	\N
1274	100	2018-04-14 17:29:00.137892	2018-04-14 17:29:00.137892	Prepare "About Me" 	\N
1275	100	2018-04-14 17:29:00.141334	2018-04-14 17:29:00.141334	Prepare "Why That Price?"	\N
1276	100	2018-04-14 17:29:00.145186	2018-04-14 17:29:00.145186	Prepare "Time Frame Idea"	\N
1277	100	2018-04-14 17:29:00.148188	2018-04-14 17:29:00.148188	Follow up	\N
1278	101	2018-04-14 17:30:04.39067	2018-04-14 17:30:04.39067	Add Listing Documents to Listing Package Presentation	\N
1279	101	2018-04-14 17:30:04.394004	2018-04-14 17:30:04.394004	Prepare Market Analysis	\N
1280	101	2018-04-14 17:30:04.396287	2018-04-14 17:30:04.396287	Prepare Marketing Plan	\N
1281	101	2018-04-14 17:30:04.398479	2018-04-14 17:30:04.398479	Prepare "About Me" 	\N
1282	101	2018-04-14 17:30:04.401017	2018-04-14 17:30:04.401017	Prepare "Why That Price?"	\N
1283	101	2018-04-14 17:30:04.403853	2018-04-14 17:30:04.403853	Prepare "Time Frame Idea"	\N
1284	101	2018-04-14 17:30:04.40618	2018-04-14 17:30:04.40618	Follow up	\N
1285	102	2018-04-14 17:31:05.288877	2018-04-14 17:31:05.288877	Add Listing Documents to Listing Package Presentation	\N
1286	102	2018-04-14 17:31:05.292942	2018-04-14 17:31:05.292942	Prepare Market Analysis	\N
1287	102	2018-04-14 17:31:05.295871	2018-04-14 17:31:05.295871	Prepare Marketing Plan	\N
1288	102	2018-04-14 17:31:05.298621	2018-04-14 17:31:05.298621	Prepare "About Me" 	\N
1289	102	2018-04-14 17:31:05.30139	2018-04-14 17:31:05.30139	Prepare "Why That Price?"	\N
1290	102	2018-04-14 17:31:05.303879	2018-04-14 17:31:05.303879	Prepare "Time Frame Idea"	\N
1291	102	2018-04-14 17:31:05.307091	2018-04-14 17:31:05.307091	Follow up	\N
1292	103	2018-04-14 17:31:39.788095	2018-04-14 17:31:39.788095	Add Listing Documents to Listing Package Presentation	\N
1293	103	2018-04-14 17:31:39.793459	2018-04-14 17:31:39.793459	Prepare Market Analysis	\N
1294	103	2018-04-14 17:31:39.8001	2018-04-14 17:31:39.8001	Prepare Marketing Plan	\N
1295	103	2018-04-14 17:31:39.803622	2018-04-14 17:31:39.803622	Prepare "About Me" 	\N
1296	103	2018-04-14 17:31:39.805987	2018-04-14 17:31:39.805987	Prepare "Why That Price?"	\N
1297	103	2018-04-14 17:31:39.810115	2018-04-14 17:31:39.810115	Prepare "Time Frame Idea"	\N
1298	103	2018-04-14 17:31:39.813866	2018-04-14 17:31:39.813866	Follow up	\N
1299	104	2018-04-14 17:32:19.041947	2018-04-14 17:32:19.041947	Add Listing Documents to Listing Package Presentation	\N
1300	104	2018-04-14 17:32:19.04515	2018-04-14 17:32:19.04515	Prepare Market Analysis	\N
1301	104	2018-04-14 17:32:19.047911	2018-04-14 17:32:19.047911	Prepare Marketing Plan	\N
1302	104	2018-04-14 17:32:19.059244	2018-04-14 17:32:19.059244	Prepare "About Me" 	\N
1303	104	2018-04-14 17:32:19.061994	2018-04-14 17:32:19.061994	Prepare "Why That Price?"	\N
1304	104	2018-04-14 17:32:19.0644	2018-04-14 17:32:19.0644	Prepare "Time Frame Idea"	\N
1305	104	2018-04-14 17:32:19.066595	2018-04-14 17:32:19.066595	Follow up	\N
1306	105	2018-04-14 17:32:53.952166	2018-04-14 17:32:53.952166	Add Listing Documents to Listing Package Presentation	\N
1307	105	2018-04-14 17:32:53.95517	2018-04-14 17:32:53.95517	Prepare Market Analysis	\N
1308	105	2018-04-14 17:32:53.960136	2018-04-14 17:32:53.960136	Prepare Marketing Plan	\N
1309	105	2018-04-14 17:32:53.962595	2018-04-14 17:32:53.962595	Prepare "About Me" 	\N
1310	105	2018-04-14 17:32:53.965887	2018-04-14 17:32:53.965887	Prepare "Why That Price?"	\N
1311	105	2018-04-14 17:32:53.968829	2018-04-14 17:32:53.968829	Prepare "Time Frame Idea"	\N
1312	105	2018-04-14 17:32:53.971991	2018-04-14 17:32:53.971991	Follow up	\N
1313	106	2018-04-14 17:33:45.638033	2018-04-14 17:33:45.638033	Add Listing Documents to Listing Package Presentation	\N
1314	106	2018-04-14 17:33:45.640804	2018-04-14 17:33:45.640804	Prepare Market Analysis	\N
1315	106	2018-04-14 17:33:45.643975	2018-04-14 17:33:45.643975	Prepare Marketing Plan	\N
1316	106	2018-04-14 17:33:45.646565	2018-04-14 17:33:45.646565	Prepare "About Me" 	\N
1317	106	2018-04-14 17:33:45.648935	2018-04-14 17:33:45.648935	Prepare "Why That Price?"	\N
1318	106	2018-04-14 17:33:45.652271	2018-04-14 17:33:45.652271	Prepare "Time Frame Idea"	\N
1319	106	2018-04-14 17:33:45.654761	2018-04-14 17:33:45.654761	Follow up	\N
1320	107	2018-04-14 17:34:18.277758	2018-04-14 17:34:18.277758	Add Listing Documents to Listing Package Presentation	\N
1321	107	2018-04-14 17:34:18.280481	2018-04-14 17:34:18.280481	Prepare Market Analysis	\N
1322	107	2018-04-14 17:34:18.282997	2018-04-14 17:34:18.282997	Prepare Marketing Plan	\N
1323	107	2018-04-14 17:34:18.285476	2018-04-14 17:34:18.285476	Prepare "About Me" 	\N
1324	107	2018-04-14 17:34:18.287952	2018-04-14 17:34:18.287952	Prepare "Why That Price?"	\N
1325	107	2018-04-14 17:34:18.290399	2018-04-14 17:34:18.290399	Prepare "Time Frame Idea"	\N
1326	107	2018-04-14 17:34:18.293087	2018-04-14 17:34:18.293087	Follow up	\N
1327	108	2018-04-14 17:34:34.255692	2018-04-14 17:34:34.255692	Add Listing Documents to Listing Package Presentation	\N
1328	108	2018-04-14 17:34:34.258246	2018-04-14 17:34:34.258246	Prepare Market Analysis	\N
1329	108	2018-04-14 17:34:34.261164	2018-04-14 17:34:34.261164	Prepare Marketing Plan	\N
1330	108	2018-04-14 17:34:34.263674	2018-04-14 17:34:34.263674	Prepare "About Me" 	\N
1331	108	2018-04-14 17:34:34.266655	2018-04-14 17:34:34.266655	Prepare "Why That Price?"	\N
1332	108	2018-04-14 17:34:34.269529	2018-04-14 17:34:34.269529	Prepare "Time Frame Idea"	\N
1333	108	2018-04-14 17:34:34.271974	2018-04-14 17:34:34.271974	Follow up	\N
1334	109	2018-04-14 17:35:12.262143	2018-04-14 17:35:12.262143	Add Listing Documents to Listing Package Presentation	\N
1335	109	2018-04-14 17:35:12.264876	2018-04-14 17:35:12.264876	Prepare Market Analysis	\N
1336	109	2018-04-14 17:35:12.267568	2018-04-14 17:35:12.267568	Prepare Marketing Plan	\N
1337	109	2018-04-14 17:35:12.271327	2018-04-14 17:35:12.271327	Prepare "About Me" 	\N
1338	109	2018-04-14 17:35:12.274141	2018-04-14 17:35:12.274141	Prepare "Why That Price?"	\N
1339	109	2018-04-14 17:35:12.277979	2018-04-14 17:35:12.277979	Prepare "Time Frame Idea"	\N
1340	109	2018-04-14 17:35:12.280765	2018-04-14 17:35:12.280765	Follow up	\N
1341	110	2018-04-14 17:35:46.11526	2018-04-14 17:35:46.11526	Add Listing Documents to Listing Package Presentation	\N
1342	110	2018-04-14 17:35:46.118756	2018-04-14 17:35:46.118756	Prepare Market Analysis	\N
1343	110	2018-04-14 17:35:46.121481	2018-04-14 17:35:46.121481	Prepare Marketing Plan	\N
1344	110	2018-04-14 17:35:46.124788	2018-04-14 17:35:46.124788	Prepare "About Me" 	\N
1345	110	2018-04-14 17:35:46.127307	2018-04-14 17:35:46.127307	Prepare "Why That Price?"	\N
1346	110	2018-04-14 17:35:46.130363	2018-04-14 17:35:46.130363	Prepare "Time Frame Idea"	\N
1347	110	2018-04-14 17:35:46.13342	2018-04-14 17:35:46.13342	Follow up	\N
1348	111	2018-04-14 17:36:32.834094	2018-04-14 17:36:32.834094	Add Listing Documents to Listing Package Presentation	\N
1349	111	2018-04-14 17:36:32.836688	2018-04-14 17:36:32.836688	Prepare Market Analysis	\N
1350	111	2018-04-14 17:36:32.839461	2018-04-14 17:36:32.839461	Prepare Marketing Plan	\N
1351	111	2018-04-14 17:36:32.842088	2018-04-14 17:36:32.842088	Prepare "About Me" 	\N
1352	111	2018-04-14 17:36:32.844745	2018-04-14 17:36:32.844745	Prepare "Why That Price?"	\N
1353	111	2018-04-14 17:36:32.847572	2018-04-14 17:36:32.847572	Prepare "Time Frame Idea"	\N
1354	111	2018-04-14 17:36:32.849843	2018-04-14 17:36:32.849843	Follow up	\N
1355	112	2018-04-14 17:37:15.19803	2018-04-14 17:37:15.19803	Add Listing Documents to Listing Package Presentation	\N
1356	112	2018-04-14 17:37:15.201535	2018-04-14 17:37:15.201535	Prepare Market Analysis	\N
1357	112	2018-04-14 17:37:15.203996	2018-04-14 17:37:15.203996	Prepare Marketing Plan	\N
1358	112	2018-04-14 17:37:15.20625	2018-04-14 17:37:15.20625	Prepare "About Me" 	\N
1359	112	2018-04-14 17:37:15.208817	2018-04-14 17:37:15.208817	Prepare "Why That Price?"	\N
1360	112	2018-04-14 17:37:15.211397	2018-04-14 17:37:15.211397	Prepare "Time Frame Idea"	\N
1361	112	2018-04-14 17:37:15.214012	2018-04-14 17:37:15.214012	Follow up	\N
1362	113	2018-04-14 17:39:02.719446	2018-04-14 17:39:02.719446	Add Listing Documents to Listing Package Presentation	\N
1363	113	2018-04-14 17:39:02.722495	2018-04-14 17:39:02.722495	Prepare Market Analysis	\N
1364	113	2018-04-14 17:39:02.724713	2018-04-14 17:39:02.724713	Prepare Marketing Plan	\N
1365	113	2018-04-14 17:39:02.728992	2018-04-14 17:39:02.728992	Prepare "About Me" 	\N
1366	113	2018-04-14 17:39:02.731855	2018-04-14 17:39:02.731855	Prepare "Why That Price?"	\N
1367	113	2018-04-14 17:39:02.734456	2018-04-14 17:39:02.734456	Prepare "Time Frame Idea"	\N
1368	113	2018-04-14 17:39:02.737141	2018-04-14 17:39:02.737141	Follow up	\N
1369	114	2018-04-14 17:40:21.877102	2018-04-14 17:40:21.877102	Add Listing Documents to Listing Package Presentation	\N
1370	114	2018-04-14 17:40:21.88117	2018-04-14 17:40:21.88117	Prepare Market Analysis	\N
1371	114	2018-04-14 17:40:21.883876	2018-04-14 17:40:21.883876	Prepare Marketing Plan	\N
1372	114	2018-04-14 17:40:21.886774	2018-04-14 17:40:21.886774	Prepare "About Me" 	\N
1373	114	2018-04-14 17:40:21.889244	2018-04-14 17:40:21.889244	Prepare "Why That Price?"	\N
1374	114	2018-04-14 17:40:21.89155	2018-04-14 17:40:21.89155	Prepare "Time Frame Idea"	\N
1375	114	2018-04-14 17:40:21.894387	2018-04-14 17:40:21.894387	Follow up	\N
1376	115	2018-04-14 17:40:59.232738	2018-04-14 17:40:59.232738	Add Listing Documents to Listing Package Presentation	\N
1377	115	2018-04-14 17:40:59.236004	2018-04-14 17:40:59.236004	Prepare Market Analysis	\N
1378	115	2018-04-14 17:40:59.238741	2018-04-14 17:40:59.238741	Prepare Marketing Plan	\N
1379	115	2018-04-14 17:40:59.241455	2018-04-14 17:40:59.241455	Prepare "About Me" 	\N
1380	115	2018-04-14 17:40:59.245296	2018-04-14 17:40:59.245296	Prepare "Why That Price?"	\N
1381	115	2018-04-14 17:40:59.247935	2018-04-14 17:40:59.247935	Prepare "Time Frame Idea"	\N
1382	115	2018-04-14 17:40:59.251274	2018-04-14 17:40:59.251274	Follow up	\N
1383	116	2018-04-14 17:41:35.393725	2018-04-14 17:41:35.393725	Add Listing Documents to Listing Package Presentation	\N
1384	116	2018-04-14 17:41:35.397977	2018-04-14 17:41:35.397977	Prepare Market Analysis	\N
1385	116	2018-04-14 17:41:35.400918	2018-04-14 17:41:35.400918	Prepare Marketing Plan	\N
1386	116	2018-04-14 17:41:35.404555	2018-04-14 17:41:35.404555	Prepare "About Me" 	\N
1387	116	2018-04-14 17:41:35.4072	2018-04-14 17:41:35.4072	Prepare "Why That Price?"	\N
1388	116	2018-04-14 17:41:35.410186	2018-04-14 17:41:35.410186	Prepare "Time Frame Idea"	\N
1389	116	2018-04-14 17:41:35.413509	2018-04-14 17:41:35.413509	Follow up	\N
1390	117	2018-04-14 17:42:13.692912	2018-04-14 17:42:13.692912	Add Listing Documents to Listing Package Presentation	\N
1391	117	2018-04-14 17:42:13.69558	2018-04-14 17:42:13.69558	Prepare Market Analysis	\N
1392	117	2018-04-14 17:42:13.698043	2018-04-14 17:42:13.698043	Prepare Marketing Plan	\N
1393	117	2018-04-14 17:42:13.70089	2018-04-14 17:42:13.70089	Prepare "About Me" 	\N
1394	117	2018-04-14 17:42:13.703346	2018-04-14 17:42:13.703346	Prepare "Why That Price?"	\N
1395	117	2018-04-14 17:42:13.706658	2018-04-14 17:42:13.706658	Prepare "Time Frame Idea"	\N
1396	117	2018-04-14 17:42:13.709525	2018-04-14 17:42:13.709525	Follow up	\N
1397	118	2018-04-14 17:43:13.29193	2018-04-14 17:43:13.29193	Add Listing Documents to Listing Package Presentation	\N
1398	118	2018-04-14 17:43:13.296271	2018-04-14 17:43:13.296271	Prepare Market Analysis	\N
1399	118	2018-04-14 17:43:13.299136	2018-04-14 17:43:13.299136	Prepare Marketing Plan	\N
1400	118	2018-04-14 17:43:13.301883	2018-04-14 17:43:13.301883	Prepare "About Me" 	\N
1401	118	2018-04-14 17:43:13.304204	2018-04-14 17:43:13.304204	Prepare "Why That Price?"	\N
1402	118	2018-04-14 17:43:13.306741	2018-04-14 17:43:13.306741	Prepare "Time Frame Idea"	\N
1403	118	2018-04-14 17:43:13.310294	2018-04-14 17:43:13.310294	Follow up	\N
1404	119	2018-04-14 17:43:56.030425	2018-04-14 17:43:56.030425	Add Listing Documents to Listing Package Presentation	\N
1405	119	2018-04-14 17:43:56.033187	2018-04-14 17:43:56.033187	Prepare Market Analysis	\N
1406	119	2018-04-14 17:43:56.036047	2018-04-14 17:43:56.036047	Prepare Marketing Plan	\N
1407	119	2018-04-14 17:43:56.03901	2018-04-14 17:43:56.03901	Prepare "About Me" 	\N
1408	119	2018-04-14 17:43:56.041533	2018-04-14 17:43:56.041533	Prepare "Why That Price?"	\N
1409	119	2018-04-14 17:43:56.04501	2018-04-14 17:43:56.04501	Prepare "Time Frame Idea"	\N
1410	119	2018-04-14 17:43:56.047979	2018-04-14 17:43:56.047979	Follow up	\N
1411	120	2018-04-14 17:44:24.1471	2018-04-14 17:44:24.1471	Add Listing Documents to Listing Package Presentation	\N
1412	120	2018-04-14 17:44:24.149787	2018-04-14 17:44:24.149787	Prepare Market Analysis	\N
1413	120	2018-04-14 17:44:24.152413	2018-04-14 17:44:24.152413	Prepare Marketing Plan	\N
1414	120	2018-04-14 17:44:24.154736	2018-04-14 17:44:24.154736	Prepare "About Me" 	\N
1415	120	2018-04-14 17:44:24.157351	2018-04-14 17:44:24.157351	Prepare "Why That Price?"	\N
1416	120	2018-04-14 17:44:24.160942	2018-04-14 17:44:24.160942	Prepare "Time Frame Idea"	\N
1417	120	2018-04-14 17:44:24.163581	2018-04-14 17:44:24.163581	Follow up	\N
\.


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('tasks_id_seq', 1424, true);


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY tokens (id, access_token, expires_in, refresh_token, token_type, created_at, updated_at) FROM stdin;
1	ya29.GluYBVka-V2ezJdkygWhdFu4tUno2H_fTc6be9fM2g7i58NudKJdsmBdly6MVgBTEqBWz1YMwMmf5I-ZcnlisiQxsoGwv4yVU68dQkWDBHD3_AY3_bUbMbNjU81p	3600	1/BVdaH1POf7Ww8PzwIL-Pq90DrA_xWfinO2sLyJpkPXk	Bearer	2018-04-09 16:22:28.332829	2018-04-09 16:22:28.332829
2	ya29.GluYBT1pXWR1w5T2Dy8wPLbZdG1lavp0boMZ4AyOnEwDfQ-0hlRApOkYFDQPwuftMFdBpZFkHbBoLioREah0CeXHILyUxeJJ79JpIMj8p7MxHYPwRlQsK74vDXYg	3599	\N	Bearer	2018-04-09 17:39:03.831009	2018-04-09 17:39:03.831009
3	ya29.GluYBZW65wh7GzB1xi56RS2txPEeBF9kUzMcrZLh9qjkmy666JQlvqEEbm1KU9UiXAxU79Xr1iAUNFaVVyof2wt8sOA5DYgqtxxoTn0xnY96yOkhIXu2ODbGFTpx	3599	\N	Bearer	2018-04-09 17:41:36.511512	2018-04-09 17:41:36.511512
4	ya29.GlybBZRHQPvnzBz2DvN62DkJqLq1ets6kOyULr9-CLxBhwAgkpCKVEkD-xz_DlbpuYXwLlRH1B-9FMOD-18CLTrjYIsb0deooXgkkIM0Qvlvv7SrckjirnNlZQH1SQ	3599	\N	Bearer	2018-04-12 18:35:22.915132	2018-04-12 18:35:22.915132
5	ya29.GlybBffeMsC5kZS76qrTX2Q073jqePH6T_gGrBflLa856jadP1yJ8w0Dk3hTf5ols4hbfIBqB8D5YHGblivEbVTB7OUHm1hXJfNZbo5x_IJDIp2ub0M7lqXjPXHSoQ	3599	\N	Bearer	2018-04-12 21:13:32.0663	2018-04-12 21:13:32.0663
6	ya29.GlycBUo7LBHw7FYZZ3kiG5XaAm-FJQpKBpovmY2Ts0HKv6jweclJIu5VAGlLSa0vsPWGu_VtADJmMZNiBoYNDhx683uXQtZd0cdpusftOSInUjd5zLZtsrlTdddqMQ	3600	\N	Bearer	2018-04-13 17:39:59.86842	2018-04-13 17:39:59.86842
7	ya29.GlycBYXhNrMG3KGLuiy6sR1Cx4lSQChyx2v0S7GH-PnMh90Pep3WotYOzVrWe1asdXp1LxtdkCprw1cJvN6mPT51VcR2A1Tl-npU8K3t-4oMSBcr-Eezc80ZuFJHyg	3599	\N	Bearer	2018-04-13 18:33:08.395388	2018-04-13 18:33:08.395388
8	ya29.GlycBXpsZznKlpCMYQYMrWg-1SEc6QiZ080lTL76AEtH34jGM5lyBivhjUDxVsZLwiwchMwSidQ2rhz3Xg28DYFjLPoPVcvLGwHmS0S9uoKnbBdpb1FZpNj3C33Jng	3600	\N	Bearer	2018-04-13 19:03:27.117948	2018-04-13 19:03:27.117948
9	ya29.GlydBXwTs_9fXqV9bb31dKr6d2J5yyCpCCxocgbu46Wkqy-nLHmpklcrCWECgaq_f0IuMLpQ-0mYPDwv87VolzU7oXQldUUs7_4mmeUnTxwI9dj-Rb1HkfblcO4MUw	3599	\N	Bearer	2018-04-14 14:04:02.097898	2018-04-14 14:04:02.097898
\.


--
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('tokens_id_seq', 9, true);


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY transactions (id, house_id, client_id, sale, commission, created_at, updated_at) FROM stdin;
\.


--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('transactions_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY users (id, username, password_digest, created_at, updated_at, first_name, last_name, email, password_reset_token, password_reset_sent_at, auth_token, total_made, refresh_token) FROM stdin;
2	administrator	$2a$10$/74XX4bO02x95t6g1SM5C.bh9pPx7JGb4oHZ7geJUgmE4aM/rn2ui	2018-04-06 14:10:30.388567	2018-04-14 17:54:43.42028	Natasha	Rico	nrico1719@gmail.com	G8zp6UP3emnSooWbwjpH9A	2018-04-06 16:49:39.773213	\N	0	{"access_token"=>"ya29.GluVBaupn35x1sQN3N21uqvekolthYjm_yaXqZ2QpHzGZzTl_qIFwhK3yYmubVu8tBwB2NilzH7MyxaFfgCfqQ-ej3vwvQaBRD3ppgYk9TV5coYokHIbV0KShfWK", "expires_in"=>3600, "token_type"=>"Bearer"}
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- Data for Name: vendors; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY vendors (id, company, service, phone, source, created_at, updated_at, image, website, rating, notes) FROM stdin;
41	YEIMAR	Foundation	469-650-5191	506 Slaughter Ln. Euless	2018-04-13 19:19:35.385996	2018-04-14 14:20:59.386238	\N		5	install 24 concrete Pillars.  /469)650 5192/// nice person.
42	College Hunks Moving	Movers	817-948-1246		2018-04-13 19:20:16.694946	2018-04-14 14:21:35.363826	\N		5	Maybe help Natasha to move her furniture.
20	Maria	Fotografo	469-279-3258		2018-04-13 19:04:21.021345	2018-04-13 19:04:21.021345	\N		5	\N
23	Maria Salas	Loan O.	682-365-5686	Providence	2018-04-13 19:06:22.31253	2018-04-13 19:06:22.31253	\N		5	\N
25	Sally	Staging Furniture	480-771-7999		2018-04-13 19:07:26.684496	2018-04-13 19:07:26.684496	\N		5	\N
32	Movers	Movers	682-234-6913	Sam Bass	2018-04-13 19:12:06.844548	2018-04-13 19:12:06.844548	\N		1	\N
33	Storage	Storage	940-458-5356	Denton	2018-04-13 19:12:40.593846	2018-04-13 19:12:40.593846	\N		5	\N
36	Joe Hernandez	Photographer	469-744-3961		2018-04-13 19:16:06.007675	2018-04-13 19:16:06.007675	\N		5	\N
37	John Salazar	Septic Inspector	817-896-2696		2018-04-13 19:16:43.927134	2018-04-13 19:16:43.927134	\N		5	\N
39	Appraiser		214-850-8114		2018-04-13 19:18:18.113313	2018-04-13 19:18:18.113313	\N		5	\N
43	CHHJ		1-866-290-3990		2018-04-13 19:20:41.589309	2018-04-13 19:20:41.589309	\N		5	\N
54	Alpha & Omega	Termites	817-538-2843		2018-04-13 19:29:01.437194	2018-04-13 19:29:01.437194	\N		5	\N
57	Christie Bray	Century 21 Judge Fite	817-372-9957		2018-04-13 19:30:33.537323	2018-04-13 19:30:33.537323	\N		5	\N
21	Ken	Loan O.	972-805-7766	Wells Fargo	2018-04-13 19:04:55.827218	2018-04-14 14:13:43.161231	\N		5	He needs contract with seller's names 
22	Jacob	Loan O.	817-271-4136		2018-04-13 19:05:32.133302	2018-04-14 14:14:25.948026	\N		5	Jacob meeting w Susana Sat.March 31
24	Dale Miller	Home Inspection	817-988-2721		2018-04-13 19:06:54.726723	2018-04-14 14:14:55.846533	\N		5	Did inspection on Brenda.
26	EZ Home Inspection	Septic Inspections	817-896-8906		2018-04-13 19:07:58.948001	2018-04-14 14:15:26.058168	\N		5	did Septic insp on Brenda.
27	Luc	Lender	817-846-8220	White Dove	2018-04-13 19:08:32.849195	2018-04-14 14:15:53.481718	\N		5	He said it's Funded
28	Repairs White Dove		817-968-6177	White Dove	2018-04-13 19:09:19.606842	2018-04-14 14:16:20.980853	\N		5	He did repais on whte Dove!
29	David Montoya	Electrician	817-719-5202	6137 CR, 319	2018-04-13 19:10:07.041274	2018-04-14 14:17:01.434489	\N		5	He did REPAIRS  on 6137 CR. 319 /// LICENSE:117107 Exp. 11-08-18.
30	First Look	Home Inspection	682-365-9916	6113 CR, 319	2018-04-13 19:10:48.882905	2018-04-14 14:17:34.143798	\N		5	Inspections in this property.
31	Meghan	Eubanks Appraisal	817-692-6260	Brenda	2018-04-13 19:11:31.435345	2018-04-14 14:18:06.649036	\N		5	To do th eAppraisal on Brenda? (DUPLEX) on Monday 3-12 Between 12-2.
34	Mike Statler	Inspector	214-529-5058		2018-04-13 19:13:16.110569	2018-04-14 14:18:44.08563	\N		5	He . did the inspection on Susan (607). Has Licence 6551.
35	Jose Galvan	Russo Plumbing	832-659-4696		2018-04-13 19:14:14.738182	2018-04-14 14:19:13.052838	\N		5	maybe he fix something on 1605 Arbor, Arlington
38	Mr. Foundation Wife	Foundation	817-344-8497	6137 County rd.319	2018-04-13 19:17:38.835219	2018-04-14 14:19:46.581832	\N		5	Natasha was talking to the wife of the person that did the repairs.
40	Mike Harris	Home Inspection	214-546-9180		2018-04-13 19:18:51.465307	2018-04-14 14:20:20.11946	\N		5	PART of the Connections NETWORK w Century21.
44	Inspection	Superior Inspection	469-583-9280	511 John Vernon Ln.	2018-04-13 19:21:25.424833	2018-04-14 14:22:20.337834	\N		5	they did the inspection on this property.
45	Gerardo Mendoza	Loan Officer	817-879-4178		2018-04-13 19:22:00.279464	2018-04-14 14:22:56.987254	\N		5	working on Docs. to close.
46	Appraiser		214-995-3093	Dee Ln.	2018-04-13 19:22:48.372242	2018-04-14 14:23:31.602549	\N		1	did the appraisal on this property
47	Alarm ADT		210-328-6490	103 ithaca court	2018-04-13 19:23:37.167346	2018-04-14 14:24:03.56792	\N		5	Destiny requesting name and number of Buyer to give u referral.(200)
48	Steve	Appraiser	469-733-4142	2820 CR 607	2018-04-13 19:24:29.118407	2018-04-14 14:24:32.733082	\N		5	Appraiser who did it at Francisco's Property!
49	All Metro	Inspections	817-371-7727	607 Susan	2018-04-13 19:25:02.194295	2018-04-14 14:24:59.000713	\N		5	they did insp. on this property.
50	Leif Nelson	Photographer	469-249-0707	1041 Angela Ct.	2018-04-13 19:25:45.816961	2018-04-14 14:25:31.385857	\N		5	maybe took pics. on this property.
51	Blake	Virtual Tour Pics	806-681-9293	2117 Harrison Ave. Ft. Wt. Tx.76110	2018-04-13 19:26:52.995883	2018-04-14 14:25:58.438714	\N		5	had app. for pics.
52	Luis	Air Conditioning	817-964-0693	Biggs Terrace	2018-04-13 19:27:35.137324	2018-04-14 14:26:42.221615	\N		1	He did some repairs?
53	Hector	Inspector	214-325-14-20		2018-04-13 19:28:21.241313	2018-04-14 14:27:07.640896	\N		5	Not sure of contact #
55	Frank Arango	Loan Officer	214-682-5747		2018-04-13 19:29:32.203219	2018-04-14 14:27:40.714315	\N		5	405 W. Jefferson in Palmer
56	Diane	Loan Officer	817-933-7420		2018-04-13 19:30:00.077304	2018-04-14 14:28:16.594264	\N		5	the Report is done
58	Clayton Bayley	Inspections	1-888-276-2731		2018-04-13 19:30:58.4291	2018-04-14 14:28:48.719656	\N		5	he offered his services at CENTURY.
\.


--
-- Name: vendors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('vendors_id_seq', 58, true);


--
-- Name: add_name_field_to_attractions_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY add_name_field_to_attractions
    ADD CONSTRAINT add_name_field_to_attractions_pkey PRIMARY KEY (id);


--
-- Name: agents_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY agents
    ADD CONSTRAINT agents_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attractions_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY attractions
    ADD CONSTRAINT attractions_pkey PRIMARY KEY (id);


--
-- Name: buyers_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY buyers
    ADD CONSTRAINT buyers_pkey PRIMARY KEY (id);


--
-- Name: clients_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: contracts_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: houses_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY houses
    ADD CONSTRAINT houses_pkey PRIMARY KEY (id);


--
-- Name: infolists_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY infolists
    ADD CONSTRAINT infolists_pkey PRIMARY KEY (id);


--
-- Name: infos_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY infos
    ADD CONSTRAINT infos_pkey PRIMARY KEY (id);


--
-- Name: investors_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY investors
    ADD CONSTRAINT investors_pkey PRIMARY KEY (id);


--
-- Name: reccomendations_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY reccomendations
    ADD CONSTRAINT reccomendations_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: showings_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY showings
    ADD CONSTRAINT showings_pkey PRIMARY KEY (id);


--
-- Name: tasklists_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY tasklists
    ADD CONSTRAINT tasklists_pkey PRIMARY KEY (id);


--
-- Name: tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY vendors
    ADD CONSTRAINT vendors_pkey PRIMARY KEY (id);


--
-- Name: index_agents_on_contact_id; Type: INDEX; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE INDEX index_agents_on_contact_id ON agents USING btree (contact_id);


--
-- Name: index_attractions_on_house_id; Type: INDEX; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE INDEX index_attractions_on_house_id ON attractions USING btree (house_id);


--
-- Name: index_buyers_on_client_id; Type: INDEX; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE INDEX index_buyers_on_client_id ON buyers USING btree (client_id);


--
-- Name: index_comments_on_house_id; Type: INDEX; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE INDEX index_comments_on_house_id ON comments USING btree (house_id);


--
-- Name: index_contacts_on_agent_id; Type: INDEX; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE INDEX index_contacts_on_agent_id ON contacts USING btree (agent_id);


--
-- Name: index_contacts_on_client_id; Type: INDEX; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE INDEX index_contacts_on_client_id ON contacts USING btree (client_id);


--
-- Name: index_contracts_on_house_id; Type: INDEX; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE INDEX index_contracts_on_house_id ON contracts USING btree (house_id);


--
-- Name: index_houses_on_agent_id; Type: INDEX; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE INDEX index_houses_on_agent_id ON houses USING btree (agent_id);


--
-- Name: index_houses_on_client_id; Type: INDEX; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE INDEX index_houses_on_client_id ON houses USING btree (client_id);


--
-- Name: index_infolists_on_house_id; Type: INDEX; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE INDEX index_infolists_on_house_id ON infolists USING btree (house_id);


--
-- Name: index_infos_on_infolist_id; Type: INDEX; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE INDEX index_infos_on_infolist_id ON infos USING btree (infolist_id);


--
-- Name: index_investors_on_client_id; Type: INDEX; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE INDEX index_investors_on_client_id ON investors USING btree (client_id);


--
-- Name: index_reccomendations_on_client_id; Type: INDEX; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE INDEX index_reccomendations_on_client_id ON reccomendations USING btree (client_id);


--
-- Name: index_reccomendations_on_vendor_id; Type: INDEX; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE INDEX index_reccomendations_on_vendor_id ON reccomendations USING btree (vendor_id);


--
-- Name: index_showings_on_house_id; Type: INDEX; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE INDEX index_showings_on_house_id ON showings USING btree (house_id);


--
-- Name: index_tasklists_on_house_id; Type: INDEX; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE INDEX index_tasklists_on_house_id ON tasklists USING btree (house_id);


--
-- Name: index_tasks_on_tasklist_id; Type: INDEX; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE INDEX index_tasks_on_tasklist_id ON tasks USING btree (tasklist_id);


--
-- Name: index_transactions_on_client_id; Type: INDEX; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE INDEX index_transactions_on_client_id ON transactions USING btree (client_id);


--
-- Name: index_transactions_on_house_id; Type: INDEX; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE INDEX index_transactions_on_house_id ON transactions USING btree (house_id);


--
-- Name: fk_rails_09ddd7eecb; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT fk_rails_09ddd7eecb FOREIGN KEY (agent_id) REFERENCES agents(id);


--
-- Name: fk_rails_1ee49dcaca; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_rails_1ee49dcaca FOREIGN KEY (house_id) REFERENCES houses(id);


--
-- Name: fk_rails_2694e6e2fe; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY contracts
    ADD CONSTRAINT fk_rails_2694e6e2fe FOREIGN KEY (house_id) REFERENCES houses(id);


--
-- Name: fk_rails_2fe9d6a78f; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT fk_rails_2fe9d6a78f FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- Name: fk_rails_32ab35cb4e; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY agents
    ADD CONSTRAINT fk_rails_32ab35cb4e FOREIGN KEY (contact_id) REFERENCES contacts(id);


--
-- Name: fk_rails_3cf73bde9b; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY houses
    ADD CONSTRAINT fk_rails_3cf73bde9b FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- Name: fk_rails_44e4e21f27; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY buyers
    ADD CONSTRAINT fk_rails_44e4e21f27 FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- Name: fk_rails_4fac37e12a; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY houses
    ADD CONSTRAINT fk_rails_4fac37e12a FOREIGN KEY (agent_id) REFERENCES agents(id);


--
-- Name: fk_rails_5cfe53efe0; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY reccomendations
    ADD CONSTRAINT fk_rails_5cfe53efe0 FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- Name: fk_rails_5e77a749c8; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY attractions
    ADD CONSTRAINT fk_rails_5e77a749c8 FOREIGN KEY (house_id) REFERENCES houses(id);


--
-- Name: fk_rails_900cac5d97; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY infos
    ADD CONSTRAINT fk_rails_900cac5d97 FOREIGN KEY (infolist_id) REFERENCES infolists(id);


--
-- Name: fk_rails_9250f4d0c4; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY infolists
    ADD CONSTRAINT fk_rails_9250f4d0c4 FOREIGN KEY (house_id) REFERENCES houses(id);


--
-- Name: fk_rails_b04cc9daf7; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY investors
    ADD CONSTRAINT fk_rails_b04cc9daf7 FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- Name: fk_rails_b25ff6c149; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY showings
    ADD CONSTRAINT fk_rails_b25ff6c149 FOREIGN KEY (house_id) REFERENCES houses(id);


--
-- Name: fk_rails_ce59a30623; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT fk_rails_ce59a30623 FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- Name: fk_rails_cffb51a4de; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT fk_rails_cffb51a4de FOREIGN KEY (tasklist_id) REFERENCES tasklists(id);


--
-- Name: fk_rails_e4b518a65c; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY reccomendations
    ADD CONSTRAINT fk_rails_e4b518a65c FOREIGN KEY (vendor_id) REFERENCES vendors(id);


--
-- Name: fk_rails_e64bc9f069; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT fk_rails_e64bc9f069 FOREIGN KEY (house_id) REFERENCES houses(id);


--
-- Name: fk_rails_f40b7590c4; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY tasklists
    ADD CONSTRAINT fk_rails_f40b7590c4 FOREIGN KEY (house_id) REFERENCES houses(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

