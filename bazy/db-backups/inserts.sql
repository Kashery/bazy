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
-- Data for Name: robotinfo; Type: TABLE DATA; Schema: public; Owner: inwebit
--

INSERT INTO public.robotinfo (robotid, transformframe_x, transformframe_y, transformframe_rx, transformframe_ry, status, name, serial_number) VALUES (2, 2, 2, 2, 2, '1', 'robot numer jeden', '0000-0000-0000-0002');
INSERT INTO public.robotinfo (robotid, transformframe_x, transformframe_y, transformframe_rx, transformframe_ry, status, name, serial_number) VALUES (1, 1, 1, 1, 1, '1', 'robot numer dwa', '0000-0000-0000-0001');


--
-- Data for Name: detections; Type: TABLE DATA; Schema: public; Owner: inwebit
--

INSERT INTO public.detections (detectionid, cx, cy, xw, yh, robotid, confidence) VALUES (2, 0, 0, 2.5, 2.5, 1, 0.9);
INSERT INTO public.detections (detectionid, cx, cy, xw, yh, robotid, confidence) VALUES (3, 2.5, 2.5, 34.5, 21.5, 2, 0.2);


--
-- Data for Name: apples; Type: TABLE DATA; Schema: public; Owner: inwebit
--



--
-- Data for Name: event_types; Type: TABLE DATA; Schema: public; Owner: inwebit
--

INSERT INTO public.event_types (event_type_id, v1, code, v2, val) VALUES (16842762, 1, 10, 1, 'Short circuit motor phases/braking resistor.');
INSERT INTO public.event_types (event_type_id, v1, code, v2, val) VALUES (16842763, 1, 11, 1, 'Over-current monitoring.');
INSERT INTO public.event_types (event_type_id, v1, code, v2, val) VALUES (16908300, 1, 12, 2, 'I²t monitoring: motor warning limit.');
INSERT INTO public.event_types (event_type_id, v1, code, v2, val) VALUES (16908301, 1, 13, 2, 'I²t monitoring: motor error limit.');
INSERT INTO public.event_types (event_type_id, v1, code, v2, val) VALUES (16908302, 1, 14, 2, 'I²t monitoring: output stage warning limit.');
INSERT INTO public.event_types (event_type_id, v1, code, v2, val) VALUES (16908303, 1, 15, 2, 'I²t monitoring: output stage error limit.');
INSERT INTO public.event_types (event_type_id, v1, code, v2, val) VALUES (16908304, 1, 16, 2, 'I²t monitoring: output stage v0 warning limit.');
INSERT INTO public.event_types (event_type_id, v1, code, v2, val) VALUES (16908305, 1, 17, 2, 'I²t monitoring: output stage v0 error limit.');
INSERT INTO public.event_types (event_type_id, v1, code, v2, val) VALUES (16908306, 1, 18, 2, 'Parameterisation I²t: motor monitoring invalid.');
INSERT INTO public.event_types (event_type_id, v1, code, v2, val) VALUES (16908546, 1, 258, 2, 'I²t monitoring: motor model warning limit.');
INSERT INTO public.event_types (event_type_id, v1, code, v2, val) VALUES (16908547, 1, 259, 2, 'I²t monitoring: motor model error limit.');
INSERT INTO public.event_types (event_type_id, v1, code, v2, val) VALUES (16973843, 1, 19, 3, 'Warning: pulse energy monitoring, braking resistor.');
INSERT INTO public.event_types (event_type_id, v1, code, v2, val) VALUES (16973844, 1, 20, 3, 'Error: pulse energy monitoring, braking resistor.');
INSERT INTO public.event_types (event_type_id, v1, code, v2, val) VALUES (16973845, 1, 21, 3, 'Parameterisation braking resistor.');
INSERT INTO public.event_types (event_type_id, v1, code, v2, val) VALUES (33619990, 2, 22, 1, 'Undervoltage in logicsupply 24V.');
INSERT INTO public.event_types (event_type_id, v1, code, v2, val) VALUES (33619991, 2, 23, 1, 'Overvoltage in logic supply 24V.');
INSERT INTO public.event_types (event_type_id, v1, code, v2, val) VALUES (33619992, 2, 24, 1, 'Undervoltage in logic supply 5V.');
INSERT INTO public.event_types (event_type_id, v1, code, v2, val) VALUES (33619993, 2, 25, 1, 'Overvoltage in logic supply 5V.');


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: inwebit
--

INSERT INTO public.events (robotid, event, eventid, ts) VALUES (1, 16842762, 2, '2024-04-04 16:48:51');
INSERT INTO public.events (robotid, event, eventid, ts) VALUES (1, 16842763, 3, '2024-04-04 16:51:37');
INSERT INTO public.events (robotid, event, eventid, ts) VALUES (2, 16908546, 4, '2024-04-04 16:51:50');
INSERT INTO public.events (robotid, event, eventid, ts) VALUES (1, 33619990, 5, '2024-04-04 16:52:05');
INSERT INTO public.events (robotid, event, eventid, ts) VALUES (2, 33619993, 6, '2024-04-04 16:52:21');


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
-- PostgreSQL database dump complete
--

