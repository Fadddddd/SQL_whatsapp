--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact (
    contact_id integer NOT NULL,
    first_name text,
    last_name text,
    phone_number integer NOT NULL
);


ALTER TABLE public.contact OWNER TO postgres;

--
-- Name: contact_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_contact_id_seq OWNER TO postgres;

--
-- Name: contact_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_contact_id_seq OWNED BY public.contact.contact_id;


--
-- Name: conversation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conversation (
    conversation_id integer NOT NULL,
    conversation_name text
);


ALTER TABLE public.conversation OWNER TO postgres;

--
-- Name: conversation_conversation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conversation_conversation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conversation_conversation_id_seq OWNER TO postgres;

--
-- Name: conversation_conversation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conversation_conversation_id_seq OWNED BY public.conversation.conversation_id;


--
-- Name: conversation_member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conversation_member (
    contact_id integer NOT NULL,
    conversation_id integer,
    joined_conversation timestamp without time zone,
    quit_conversation timestamp without time zone
);


ALTER TABLE public.conversation_member OWNER TO postgres;

--
-- Name: conversation_member_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conversation_member_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conversation_member_contact_id_seq OWNER TO postgres;

--
-- Name: conversation_member_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conversation_member_contact_id_seq OWNED BY public.conversation_member.contact_id;


--
-- Name: message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message (
    message_id integer NOT NULL,
    conversation_id integer,
    from_number integer NOT NULL,
    to_number integer NOT NULL,
    message text,
    sent_date timestamp without time zone
);


ALTER TABLE public.message OWNER TO postgres;

--
-- Name: message_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.message_message_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.message_message_id_seq OWNER TO postgres;

--
-- Name: message_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.message_message_id_seq OWNED BY public.message.message_id;


--
-- Name: contact contact_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact ALTER COLUMN contact_id SET DEFAULT nextval('public.contact_contact_id_seq'::regclass);


--
-- Name: conversation conversation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversation ALTER COLUMN conversation_id SET DEFAULT nextval('public.conversation_conversation_id_seq'::regclass);


--
-- Name: conversation_member contact_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversation_member ALTER COLUMN contact_id SET DEFAULT nextval('public.conversation_member_contact_id_seq'::regclass);


--
-- Name: message message_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message ALTER COLUMN message_id SET DEFAULT nextval('public.message_message_id_seq'::regclass);


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact (contact_id, first_name, last_name, phone_number) FROM stdin;
1	Michael	Scott	809080808
2	Jim	Halpert	708090900
3	Pam	Beesly	600060006
4	Kevin	Malone	606060606
5	Stanley	Hudson	500060006
6	Dwight	Shrute	304040404
\.


--
-- Data for Name: conversation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conversation (conversation_id, conversation_name) FROM stdin;
1	Chili party
2	Jim party
\.


--
-- Data for Name: conversation_member; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conversation_member (contact_id, conversation_id, joined_conversation, quit_conversation) FROM stdin;
\.


--
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.message (message_id, conversation_id, from_number, to_number, message, sent_date) FROM stdin;
1	\N	304040404	809080808	Hi Michael, do you need me to work on saturday?	2022-08-23 18:42:02
\.


--
-- Name: contact_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_contact_id_seq', 6, true);


--
-- Name: conversation_conversation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conversation_conversation_id_seq', 2, true);


--
-- Name: conversation_member_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conversation_member_contact_id_seq', 1, false);


--
-- Name: message_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.message_message_id_seq', 1, true);


--
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (contact_id);


--
-- Name: conversation_member conversation_member_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversation_member
    ADD CONSTRAINT conversation_member_pkey PRIMARY KEY (contact_id);


--
-- Name: conversation conversation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversation
    ADD CONSTRAINT conversation_pkey PRIMARY KEY (conversation_id);


--
-- Name: message message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (message_id);


--
-- Name: message fk_conversation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT fk_conversation FOREIGN KEY (conversation_id) REFERENCES public.conversation(conversation_id);


--
-- Name: conversation_member fk_conversation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversation_member
    ADD CONSTRAINT fk_conversation FOREIGN KEY (conversation_id) REFERENCES public.conversation(conversation_id);


--
-- PostgreSQL database dump complete
--

