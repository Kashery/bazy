--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1.pgdg120+1)

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

--
-- Name: apple_id_seq; Type: SEQUENCE; Schema: public; Owner: inwebit
--

CREATE SEQUENCE public.apple_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.apple_id_seq OWNER TO inwebit;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: apples; Type: TABLE; Schema: public; Owner: inwebit
--

CREATE TABLE public.apples (
    appleid smallint DEFAULT nextval('public.apple_id_seq'::regclass) NOT NULL,
    xpos smallint NOT NULL,
    ypos smallint NOT NULL,
    zpos smallint NOT NULL,
    detectionid integer,
    status boolean NOT NULL,
    robotid smallint
);


ALTER TABLE public.apples OWNER TO inwebit;

--
-- Name: TABLE apples; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON TABLE public.apples IS 'collectin of detected and transformed apples';


--
-- Name: COLUMN apples.appleid; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.apples.appleid IS 'apple id';


--
-- Name: COLUMN apples.xpos; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.apples.xpos IS 'x position';


--
-- Name: COLUMN apples.ypos; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.apples.ypos IS 'y position';


--
-- Name: COLUMN apples.zpos; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.apples.zpos IS 'z position';


--
-- Name: COLUMN apples.status; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.apples.status IS 'information about being gathered or not';


--
-- Name: COLUMN apples.robotid; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.apples.robotid IS 'robot id';


--
-- Name: detections_id_seq; Type: SEQUENCE; Schema: public; Owner: inwebit
--

CREATE SEQUENCE public.detections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.detections_id_seq OWNER TO inwebit;

--
-- Name: detections; Type: TABLE; Schema: public; Owner: inwebit
--

CREATE TABLE public.detections (
    detectionid smallint DEFAULT nextval('public.detections_id_seq'::regclass) NOT NULL,
    cx double precision NOT NULL,
    cy double precision NOT NULL,
    xw double precision NOT NULL,
    yh double precision NOT NULL,
    robotid smallint NOT NULL,
    confidence double precision NOT NULL
);


ALTER TABLE public.detections OWNER TO inwebit;

--
-- Name: COLUMN detections.detectionid; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.detections.detectionid IS 'detection id';


--
-- Name: COLUMN detections.cx; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.detections.cx IS 'center position x value';


--
-- Name: COLUMN detections.cy; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.detections.cy IS 'center position y value';


--
-- Name: COLUMN detections.xw; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.detections.xw IS 'width value from center position x value';


--
-- Name: COLUMN detections.yh; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.detections.yh IS 'height value from center position y value';


--
-- Name: COLUMN detections.robotid; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.detections.robotid IS 'robot id';


--
-- Name: COLUMN detections.confidence; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.detections.confidence IS 'detection confidence';


--
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: inwebit
--

CREATE SEQUENCE public.event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_id_seq OWNER TO inwebit;

--
-- Name: event_types; Type: TABLE; Schema: public; Owner: inwebit
--

CREATE TABLE public.event_types (
    event_type_id integer NOT NULL,
    v1 integer NOT NULL,
    code integer NOT NULL,
    v2 integer NOT NULL,
    val character varying NOT NULL
);


ALTER TABLE public.event_types OWNER TO inwebit;

--
-- Name: TABLE event_types; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON TABLE public.event_types IS 'event types';


--
-- Name: COLUMN event_types.event_type_id; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.event_types.event_type_id IS 'id of the event type';


--
-- Name: events; Type: TABLE; Schema: public; Owner: inwebit
--

CREATE TABLE public.events (
    robotid smallint,
    event integer NOT NULL,
    eventid smallint DEFAULT nextval('public.event_id_seq'::regclass) NOT NULL,
    ts timestamp without time zone NOT NULL
);


ALTER TABLE public.events OWNER TO inwebit;

--
-- Name: TABLE events; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON TABLE public.events IS 'robot system events';


--
-- Name: COLUMN events.eventid; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.events.eventid IS 'event id';


--
-- Name: COLUMN events.ts; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.events.ts IS 'time stamp for the event';


--
-- Name: robot_id_seq; Type: SEQUENCE; Schema: public; Owner: inwebit
--

CREATE SEQUENCE public.robot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.robot_id_seq OWNER TO inwebit;

--
-- Name: robotinfo; Type: TABLE; Schema: public; Owner: inwebit
--

CREATE TABLE public.robotinfo (
    robotid smallint DEFAULT nextval('public.robot_id_seq'::regclass) NOT NULL,
    transformframe_x smallint NOT NULL,
    transformframe_y smallint NOT NULL,
    transformframe_rx smallint NOT NULL,
    transformframe_ry smallint NOT NULL,
    status character varying,
    name character varying,
    serial_number character varying DEFAULT 0 NOT NULL
);


ALTER TABLE public.robotinfo OWNER TO inwebit;

--
-- Name: TABLE robotinfo; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON TABLE public.robotinfo IS 'general info about connected robots';


--
-- Name: COLUMN robotinfo.robotid; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.robotinfo.robotid IS 'robot id';


--
-- Name: COLUMN robotinfo.transformframe_x; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.robotinfo.transformframe_x IS 'transform frame of robot';


--
-- Name: COLUMN robotinfo.transformframe_y; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.robotinfo.transformframe_y IS 'transform frame of robot';


--
-- Name: COLUMN robotinfo.transformframe_rx; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.robotinfo.transformframe_rx IS 'transform frame of robot';


--
-- Name: COLUMN robotinfo.transformframe_ry; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.robotinfo.transformframe_ry IS 'transform frame of robot';


--
-- Name: COLUMN robotinfo.status; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.robotinfo.status IS 'current robot status';


--
-- Name: COLUMN robotinfo.name; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.robotinfo.name IS 'robot name';


--
-- Name: COLUMN robotinfo.serial_number; Type: COMMENT; Schema: public; Owner: inwebit
--

COMMENT ON COLUMN public.robotinfo.serial_number IS 'robot serial number';


--
-- Data for Name: apples; Type: TABLE DATA; Schema: public; Owner: inwebit
--

COPY public.apples (appleid, xpos, ypos, zpos, detectionid, status, robotid) FROM stdin;
\.


--
-- Data for Name: detections; Type: TABLE DATA; Schema: public; Owner: inwebit
--

COPY public.detections (detectionid, cx, cy, xw, yh, robotid, confidence) FROM stdin;
2	0	0	2.5	2.5	1	0.9
3	2.5	2.5	34.5	21.5	2	0.2
\.


--
-- Data for Name: event_types; Type: TABLE DATA; Schema: public; Owner: inwebit
--

COPY public.event_types (event_type_id, v1, code, v2, val) FROM stdin;
16842762	1	10	1	Short circuit motor phases/braking resistor.
16842763	1	11	1	Over-current monitoring.
16908300	1	12	2	I²t monitoring: motor warning limit.
16908301	1	13	2	I²t monitoring: motor error limit.
16908302	1	14	2	I²t monitoring: output stage warning limit.
16908303	1	15	2	I²t monitoring: output stage error limit.
16908304	1	16	2	I²t monitoring: output stage v0 warning limit.
16908305	1	17	2	I²t monitoring: output stage v0 error limit.
16908306	1	18	2	Parameterisation I²t: motor monitoring invalid.
16908546	1	258	2	I²t monitoring: motor model warning limit.
16908547	1	259	2	I²t monitoring: motor model error limit.
16973843	1	19	3	Warning: pulse energy monitoring, braking resistor.
16973844	1	20	3	Error: pulse energy monitoring, braking resistor.
16973845	1	21	3	Parameterisation braking resistor.
33619990	2	22	1	Undervoltage in logicsupply 24V.
33619991	2	23	1	Overvoltage in logic supply 24V.
33619992	2	24	1	Undervoltage in logic supply 5V.
33619993	2	25	1	Overvoltage in logic supply 5V.
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: inwebit
--

COPY public.events (robotid, event, eventid, ts) FROM stdin;
1	16842762	2	2024-04-04 16:48:51
1	16842763	3	2024-04-04 16:51:37
2	16908546	4	2024-04-04 16:51:50
1	33619990	5	2024-04-04 16:52:05
2	33619993	6	2024-04-04 16:52:21
\.


--
-- Data for Name: robotinfo; Type: TABLE DATA; Schema: public; Owner: inwebit
--

COPY public.robotinfo (robotid, transformframe_x, transformframe_y, transformframe_rx, transformframe_ry, status, name, serial_number) FROM stdin;
2	2	2	2	2	1	robot numer jeden	0000-0000-0000-0002
1	1	1	1	1	1	robot numer dwa	0000-0000-0000-0001
\.


--
-- Name: apple_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inwebit
--

SELECT pg_catalog.setval('public.apple_id_seq', 1, false);


--
-- Name: detections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inwebit
--

SELECT pg_catalog.setval('public.detections_id_seq', 3, true);


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inwebit
--

SELECT pg_catalog.setval('public.event_id_seq', 6, true);


--
-- Name: robot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inwebit
--

SELECT pg_catalog.setval('public.robot_id_seq', 3, true);


--
-- Name: apples apples_pk; Type: CONSTRAINT; Schema: public; Owner: inwebit
--

ALTER TABLE ONLY public.apples
    ADD CONSTRAINT apples_pk PRIMARY KEY (appleid);


--
-- Name: detections detections_pk; Type: CONSTRAINT; Schema: public; Owner: inwebit
--

ALTER TABLE ONLY public.detections
    ADD CONSTRAINT detections_pk PRIMARY KEY (detectionid);


--
-- Name: event_types event_types_pk; Type: CONSTRAINT; Schema: public; Owner: inwebit
--

ALTER TABLE ONLY public.event_types
    ADD CONSTRAINT event_types_pk PRIMARY KEY (event_type_id);


--
-- Name: events events_pk; Type: CONSTRAINT; Schema: public; Owner: inwebit
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pk PRIMARY KEY (eventid);


--
-- Name: robotinfo robotinfo_pk; Type: CONSTRAINT; Schema: public; Owner: inwebit
--

ALTER TABLE ONLY public.robotinfo
    ADD CONSTRAINT robotinfo_pk PRIMARY KEY (robotid);


--
-- Name: apples apples_detections_detectionid_fk; Type: FK CONSTRAINT; Schema: public; Owner: inwebit
--

ALTER TABLE ONLY public.apples
    ADD CONSTRAINT apples_detections_detectionid_fk FOREIGN KEY (detectionid) REFERENCES public.detections(detectionid);


--
-- Name: apples apples_robotinfo_robotid_fk; Type: FK CONSTRAINT; Schema: public; Owner: inwebit
--

ALTER TABLE ONLY public.apples
    ADD CONSTRAINT apples_robotinfo_robotid_fk FOREIGN KEY (robotid) REFERENCES public.robotinfo(robotid);


--
-- Name: detections detections_robotinfo_robotid_fk; Type: FK CONSTRAINT; Schema: public; Owner: inwebit
--

ALTER TABLE ONLY public.detections
    ADD CONSTRAINT detections_robotinfo_robotid_fk FOREIGN KEY (robotid) REFERENCES public.robotinfo(robotid);


--
-- Name: events events_event_types_event_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: inwebit
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_event_types_event_type_id_fk FOREIGN KEY (event) REFERENCES public.event_types(event_type_id);


--
-- Name: events events_robotinfo_robotid_fk; Type: FK CONSTRAINT; Schema: public; Owner: inwebit
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_robotinfo_robotid_fk FOREIGN KEY (robotid) REFERENCES public.robotinfo(robotid);


--
-- PostgreSQL database dump complete
--

