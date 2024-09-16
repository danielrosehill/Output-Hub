--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6
-- Dumped by pg_dump version 16.3

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accessui; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accessui (
    id integer NOT NULL,
    ui_name character varying(100),
    custom_gpt_id integer
);


ALTER TABLE public.accessui OWNER TO postgres;

--
-- Name: accessui_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accessui_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accessui_id_seq OWNER TO postgres;

--
-- Name: accessui_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accessui_id_seq OWNED BY public.accessui.id;


--
-- Name: action_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.action_events (
    id bigint NOT NULL,
    batch_id character(36) NOT NULL,
    user_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    actionable_type character varying(255) NOT NULL,
    actionable_id bigint NOT NULL,
    target_type character varying(255) NOT NULL,
    target_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint,
    fields text NOT NULL,
    status character varying(25) DEFAULT 'running'::character varying NOT NULL,
    exception text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    original text,
    changes text
);


ALTER TABLE public.action_events OWNER TO postgres;

--
-- Name: action_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.action_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.action_events_id_seq OWNER TO postgres;

--
-- Name: action_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.action_events_id_seq OWNED BY public.action_events.id;


--
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- Name: customgpt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customgpt (
    id integer NOT NULL,
    name character varying(100),
    link character varying,
    description text,
    config text,
    creation_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    activity_status_id integer,
    gpt_model_id integer,
    gpt_rating_id integer,
    response_time_id integer,
    llm_list_id integer
);


ALTER TABLE public.customgpt OWNER TO postgres;

--
-- Name: TABLE customgpt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.customgpt IS 'Custom GPTs';


--
-- Name: customgpt_agentgroups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customgpt_agentgroups (
    customgpt_id integer NOT NULL,
    agentgroups_id integer NOT NULL
);


ALTER TABLE public.customgpt_agentgroups OWNER TO postgres;

--
-- Name: customgpt_gptcats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customgpt_gptcats (
    customgpt_id integer NOT NULL,
    gptcats_id integer NOT NULL
);


ALTER TABLE public.customgpt_gptcats OWNER TO postgres;

--
-- Name: customgpt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customgpt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customgpt_id_seq OWNER TO postgres;

--
-- Name: customgpt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customgpt_id_seq OWNED BY public.customgpt.id;


--
-- Name: customgpt_outputreviewsdone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customgpt_outputreviewsdone (
    customgpt_id integer NOT NULL,
    outputreviewsdone_id integer NOT NULL
);


ALTER TABLE public.customgpt_outputreviewsdone OWNER TO postgres;

--
-- Name: customgpt_projecttags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customgpt_projecttags (
    customgpt_id integer NOT NULL,
    projecttags_id integer NOT NULL
);


ALTER TABLE public.customgpt_projecttags OWNER TO postgres;

--
-- Name: customgpt_promptlibrary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customgpt_promptlibrary (
    customgpt_id integer NOT NULL,
    promptlibrary_id integer NOT NULL
);


ALTER TABLE public.customgpt_promptlibrary OWNER TO postgres;

--
-- Name: customgpt_promptoutput; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customgpt_promptoutput (
    customgpt_id integer NOT NULL,
    promptoutput_id integer NOT NULL
);


ALTER TABLE public.customgpt_promptoutput OWNER TO postgres;

--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: lookupaccuracylevel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lookupaccuracylevel (
    id integer NOT NULL,
    level character varying(100),
    description text
);


ALTER TABLE public.lookupaccuracylevel OWNER TO postgres;

--
-- Name: lookupaccuracylevel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lookupaccuracylevel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lookupaccuracylevel_id_seq OWNER TO postgres;

--
-- Name: lookupaccuracylevel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lookupaccuracylevel_id_seq OWNED BY public.lookupaccuracylevel.id;


--
-- Name: lookupactionabilitylevel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lookupactionabilitylevel (
    id integer NOT NULL,
    level_name character varying(100),
    description text
);


ALTER TABLE public.lookupactionabilitylevel OWNER TO postgres;

--
-- Name: lookupactionabilitylevel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lookupactionabilitylevel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lookupactionabilitylevel_id_seq OWNER TO postgres;

--
-- Name: lookupactionabilitylevel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lookupactionabilitylevel_id_seq OWNED BY public.lookupactionabilitylevel.id;


--
-- Name: lookupactivitystatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lookupactivitystatus (
    id integer NOT NULL,
    status_name character varying(100),
    description text
);


ALTER TABLE public.lookupactivitystatus OWNER TO postgres;

--
-- Name: lookupactivitystatus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lookupactivitystatus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lookupactivitystatus_id_seq OWNER TO postgres;

--
-- Name: lookupactivitystatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lookupactivitystatus_id_seq OWNED BY public.lookupactivitystatus.id;


--
-- Name: lookupagentgroups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lookupagentgroups (
    id integer NOT NULL,
    group_name character varying(100),
    group_description text
);


ALTER TABLE public.lookupagentgroups OWNER TO postgres;

--
-- Name: lookupagentgroups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lookupagentgroups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lookupagentgroups_id_seq OWNER TO postgres;

--
-- Name: lookupagentgroups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lookupagentgroups_id_seq OWNED BY public.lookupagentgroups.id;


--
-- Name: lookupgptcats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lookupgptcats (
    id integer NOT NULL,
    cat_name character varying(100),
    cat_desc text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.lookupgptcats OWNER TO postgres;

--
-- Name: lookupgptcats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lookupgptcats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lookupgptcats_id_seq OWNER TO postgres;

--
-- Name: lookupgptcats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lookupgptcats_id_seq OWNED BY public.lookupgptcats.id;


--
-- Name: lookupgptmodels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lookupgptmodels (
    id integer NOT NULL,
    model_name character varying(100),
    model_description text
);


ALTER TABLE public.lookupgptmodels OWNER TO postgres;

--
-- Name: lookupgptmodels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lookupgptmodels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lookupgptmodels_id_seq OWNER TO postgres;

--
-- Name: lookupgptmodels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lookupgptmodels_id_seq OWNED BY public.lookupgptmodels.id;


--
-- Name: lookupgptoutputreviewsdone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lookupgptoutputreviewsdone (
    id integer NOT NULL,
    review_name character varying(100),
    review_desc text
);


ALTER TABLE public.lookupgptoutputreviewsdone OWNER TO postgres;

--
-- Name: lookupgptoutputreviewsdone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lookupgptoutputreviewsdone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lookupgptoutputreviewsdone_id_seq OWNER TO postgres;

--
-- Name: lookupgptoutputreviewsdone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lookupgptoutputreviewsdone_id_seq OWNED BY public.lookupgptoutputreviewsdone.id;


--
-- Name: lookupgptrating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lookupgptrating (
    id integer NOT NULL,
    rating integer,
    rating_description text
);


ALTER TABLE public.lookupgptrating OWNER TO postgres;

--
-- Name: lookupgptrating_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lookupgptrating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lookupgptrating_id_seq OWNER TO postgres;

--
-- Name: lookupgptrating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lookupgptrating_id_seq OWNED BY public.lookupgptrating.id;


--
-- Name: lookupgptresponsetimes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lookupgptresponsetimes (
    id integer NOT NULL,
    response_time character varying(100),
    min_value integer,
    max_value integer,
    description text
);


ALTER TABLE public.lookupgptresponsetimes OWNER TO postgres;

--
-- Name: lookupgptresponsetimes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lookupgptresponsetimes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lookupgptresponsetimes_id_seq OWNER TO postgres;

--
-- Name: lookupgptresponsetimes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lookupgptresponsetimes_id_seq OWNED BY public.lookupgptresponsetimes.id;


--
-- Name: lookupknowledgetypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lookupknowledgetypes (
    id integer NOT NULL,
    name character varying(100),
    description text
);


ALTER TABLE public.lookupknowledgetypes OWNER TO postgres;

--
-- Name: lookupknowledgetypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lookupknowledgetypes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lookupknowledgetypes_id_seq OWNER TO postgres;

--
-- Name: lookupknowledgetypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lookupknowledgetypes_id_seq OWNED BY public.lookupknowledgetypes.id;


--
-- Name: lookupllmlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lookupllmlist (
    id integer NOT NULL,
    llm_name character varying(100),
    llm_desc text,
    year_released integer
);


ALTER TABLE public.lookupllmlist OWNER TO postgres;

--
-- Name: lookupllmlist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lookupllmlist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lookupllmlist_id_seq OWNER TO postgres;

--
-- Name: lookupllmlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lookupllmlist_id_seq OWNED BY public.lookupllmlist.id;


--
-- Name: lookupmdconversionstatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lookupmdconversionstatus (
    id integer NOT NULL,
    status_name character varying(100)
);


ALTER TABLE public.lookupmdconversionstatus OWNER TO postgres;

--
-- Name: lookupmdconversionstatus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lookupmdconversionstatus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lookupmdconversionstatus_id_seq OWNER TO postgres;

--
-- Name: lookupmdconversionstatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lookupmdconversionstatus_id_seq OWNED BY public.lookupmdconversionstatus.id;


--
-- Name: lookupmediatypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lookupmediatypes (
    id integer NOT NULL,
    name character varying(100),
    description text
);


ALTER TABLE public.lookupmediatypes OWNER TO postgres;

--
-- Name: lookupmediatypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lookupmediatypes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lookupmediatypes_id_seq OWNER TO postgres;

--
-- Name: lookupmediatypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lookupmediatypes_id_seq OWNED BY public.lookupmediatypes.id;


--
-- Name: lookupprojecttags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lookupprojecttags (
    id integer NOT NULL,
    tag_name character varying(100),
    tag_desc text
);


ALTER TABLE public.lookupprojecttags OWNER TO postgres;

--
-- Name: lookupprojecttags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lookupprojecttags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lookupprojecttags_id_seq OWNER TO postgres;

--
-- Name: lookupprojecttags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lookupprojecttags_id_seq OWNED BY public.lookupprojecttags.id;


--
-- Name: lookuppromptdevstages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lookuppromptdevstages (
    id integer NOT NULL,
    stage_name character varying(100),
    stage_desc text
);


ALTER TABLE public.lookuppromptdevstages OWNER TO postgres;

--
-- Name: lookuppromptdevstages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lookuppromptdevstages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lookuppromptdevstages_id_seq OWNER TO postgres;

--
-- Name: lookuppromptdevstages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lookuppromptdevstages_id_seq OWNED BY public.lookuppromptdevstages.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: nova_field_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nova_field_attachments (
    id integer NOT NULL,
    attachable_type character varying(255) NOT NULL,
    attachable_id bigint NOT NULL,
    attachment character varying(255) NOT NULL,
    disk character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.nova_field_attachments OWNER TO postgres;

--
-- Name: nova_field_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nova_field_attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nova_field_attachments_id_seq OWNER TO postgres;

--
-- Name: nova_field_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nova_field_attachments_id_seq OWNED BY public.nova_field_attachments.id;


--
-- Name: nova_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nova_notifications (
    id uuid NOT NULL,
    type character varying(255) NOT NULL,
    notifiable_type character varying(255) NOT NULL,
    notifiable_id bigint NOT NULL,
    data text NOT NULL,
    read_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.nova_notifications OWNER TO postgres;

--
-- Name: nova_pending_field_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nova_pending_field_attachments (
    id integer NOT NULL,
    draft_id character varying(255) NOT NULL,
    attachment character varying(255) NOT NULL,
    disk character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.nova_pending_field_attachments OWNER TO postgres;

--
-- Name: nova_pending_field_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nova_pending_field_attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nova_pending_field_attachments_id_seq OWNER TO postgres;

--
-- Name: nova_pending_field_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nova_pending_field_attachments_id_seq OWNED BY public.nova_pending_field_attachments.id;


--
-- Name: outputtag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.outputtag (
    id integer NOT NULL,
    tag_name character varying(100),
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.outputtag OWNER TO postgres;

--
-- Name: outputtag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.outputtag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.outputtag_id_seq OWNER TO postgres;

--
-- Name: outputtag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.outputtag_id_seq OWNED BY public.outputtag.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- Name: promptlibrary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promptlibrary (
    id integer NOT NULL,
    prompt_name character varying(100),
    prompt_text text,
    prompt_dev_stage_id integer
);


ALTER TABLE public.promptlibrary OWNER TO postgres;

--
-- Name: promptlibrary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promptlibrary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promptlibrary_id_seq OWNER TO postgres;

--
-- Name: promptlibrary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promptlibrary_id_seq OWNED BY public.promptlibrary.id;


--
-- Name: promptlibrary_projecttags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promptlibrary_projecttags (
    promptlibrary_id integer NOT NULL,
    projecttags_id integer NOT NULL
);


ALTER TABLE public.promptlibrary_projecttags OWNER TO postgres;

--
-- Name: promptoutput; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promptoutput (
    id integer NOT NULL,
    date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    summary text,
    full_output text,
    notes text,
    prompt_id integer,
    accuracy_level_id integer,
    actionability_level_id integer,
    llm_list_id integer,
    md_conversion_status_id integer
);


ALTER TABLE public.promptoutput OWNER TO postgres;

--
-- Name: promptoutput_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promptoutput_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promptoutput_id_seq OWNER TO postgres;

--
-- Name: promptoutput_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promptoutput_id_seq OWNED BY public.promptoutput.id;


--
-- Name: promptoutput_knowledgetypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promptoutput_knowledgetypes (
    promptoutput_id integer NOT NULL,
    knowledgetypes_id integer NOT NULL
);


ALTER TABLE public.promptoutput_knowledgetypes OWNER TO postgres;

--
-- Name: promptoutput_mediatypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promptoutput_mediatypes (
    promptoutput_id integer NOT NULL,
    mediatypes_id integer NOT NULL
);


ALTER TABLE public.promptoutput_mediatypes OWNER TO postgres;

--
-- Name: promptoutput_projecttags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promptoutput_projecttags (
    promptoutput_id integer NOT NULL,
    projecttags_id integer NOT NULL
);


ALTER TABLE public.promptoutput_projecttags OWNER TO postgres;

--
-- Name: promptoutput_promptlibrary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promptoutput_promptlibrary (
    promptoutput_id integer NOT NULL,
    promptlibrary_id integer NOT NULL
);


ALTER TABLE public.promptoutput_promptlibrary OWNER TO postgres;

--
-- Name: promptoutput_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promptoutput_tags (
    promptoutput_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.promptoutput_tags OWNER TO postgres;

--
-- Name: session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.session (
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.session OWNER TO postgres;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: accessui id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accessui ALTER COLUMN id SET DEFAULT nextval('public.accessui_id_seq'::regclass);


--
-- Name: action_events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_events ALTER COLUMN id SET DEFAULT nextval('public.action_events_id_seq'::regclass);


--
-- Name: customgpt id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt ALTER COLUMN id SET DEFAULT nextval('public.customgpt_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: lookupaccuracylevel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupaccuracylevel ALTER COLUMN id SET DEFAULT nextval('public.lookupaccuracylevel_id_seq'::regclass);


--
-- Name: lookupactionabilitylevel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupactionabilitylevel ALTER COLUMN id SET DEFAULT nextval('public.lookupactionabilitylevel_id_seq'::regclass);


--
-- Name: lookupactivitystatus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupactivitystatus ALTER COLUMN id SET DEFAULT nextval('public.lookupactivitystatus_id_seq'::regclass);


--
-- Name: lookupagentgroups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupagentgroups ALTER COLUMN id SET DEFAULT nextval('public.lookupagentgroups_id_seq'::regclass);


--
-- Name: lookupgptcats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupgptcats ALTER COLUMN id SET DEFAULT nextval('public.lookupgptcats_id_seq'::regclass);


--
-- Name: lookupgptmodels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupgptmodels ALTER COLUMN id SET DEFAULT nextval('public.lookupgptmodels_id_seq'::regclass);


--
-- Name: lookupgptoutputreviewsdone id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupgptoutputreviewsdone ALTER COLUMN id SET DEFAULT nextval('public.lookupgptoutputreviewsdone_id_seq'::regclass);


--
-- Name: lookupgptrating id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupgptrating ALTER COLUMN id SET DEFAULT nextval('public.lookupgptrating_id_seq'::regclass);


--
-- Name: lookupgptresponsetimes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupgptresponsetimes ALTER COLUMN id SET DEFAULT nextval('public.lookupgptresponsetimes_id_seq'::regclass);


--
-- Name: lookupknowledgetypes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupknowledgetypes ALTER COLUMN id SET DEFAULT nextval('public.lookupknowledgetypes_id_seq'::regclass);


--
-- Name: lookupllmlist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupllmlist ALTER COLUMN id SET DEFAULT nextval('public.lookupllmlist_id_seq'::regclass);


--
-- Name: lookupmdconversionstatus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupmdconversionstatus ALTER COLUMN id SET DEFAULT nextval('public.lookupmdconversionstatus_id_seq'::regclass);


--
-- Name: lookupmediatypes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupmediatypes ALTER COLUMN id SET DEFAULT nextval('public.lookupmediatypes_id_seq'::regclass);


--
-- Name: lookupprojecttags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupprojecttags ALTER COLUMN id SET DEFAULT nextval('public.lookupprojecttags_id_seq'::regclass);


--
-- Name: lookuppromptdevstages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookuppromptdevstages ALTER COLUMN id SET DEFAULT nextval('public.lookuppromptdevstages_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: nova_field_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nova_field_attachments ALTER COLUMN id SET DEFAULT nextval('public.nova_field_attachments_id_seq'::regclass);


--
-- Name: nova_pending_field_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nova_pending_field_attachments ALTER COLUMN id SET DEFAULT nextval('public.nova_pending_field_attachments_id_seq'::regclass);


--
-- Name: outputtag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outputtag ALTER COLUMN id SET DEFAULT nextval('public.outputtag_id_seq'::regclass);


--
-- Name: promptlibrary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptlibrary ALTER COLUMN id SET DEFAULT nextval('public.promptlibrary_id_seq'::regclass);


--
-- Name: promptoutput id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput ALTER COLUMN id SET DEFAULT nextval('public.promptoutput_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: accessui accessui_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accessui
    ADD CONSTRAINT accessui_pkey PRIMARY KEY (id);


--
-- Name: action_events action_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_events
    ADD CONSTRAINT action_events_pkey PRIMARY KEY (id);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: customgpt_agentgroups customgpt_agentgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt_agentgroups
    ADD CONSTRAINT customgpt_agentgroups_pkey PRIMARY KEY (customgpt_id, agentgroups_id);


--
-- Name: customgpt_gptcats customgpt_gptcats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt_gptcats
    ADD CONSTRAINT customgpt_gptcats_pkey PRIMARY KEY (customgpt_id, gptcats_id);


--
-- Name: customgpt_outputreviewsdone customgpt_outputreviewsdone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt_outputreviewsdone
    ADD CONSTRAINT customgpt_outputreviewsdone_pkey PRIMARY KEY (customgpt_id, outputreviewsdone_id);


--
-- Name: customgpt customgpt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt
    ADD CONSTRAINT customgpt_pkey PRIMARY KEY (id);


--
-- Name: customgpt_projecttags customgpt_projecttags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt_projecttags
    ADD CONSTRAINT customgpt_projecttags_pkey PRIMARY KEY (customgpt_id, projecttags_id);


--
-- Name: customgpt_promptlibrary customgpt_promptlibrary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt_promptlibrary
    ADD CONSTRAINT customgpt_promptlibrary_pkey PRIMARY KEY (customgpt_id, promptlibrary_id);


--
-- Name: customgpt_promptoutput customgpt_promptoutput_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt_promptoutput
    ADD CONSTRAINT customgpt_promptoutput_pkey PRIMARY KEY (customgpt_id, promptoutput_id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: lookupaccuracylevel lookupaccuracylevel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupaccuracylevel
    ADD CONSTRAINT lookupaccuracylevel_pkey PRIMARY KEY (id);


--
-- Name: lookupactionabilitylevel lookupactionabilitylevel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupactionabilitylevel
    ADD CONSTRAINT lookupactionabilitylevel_pkey PRIMARY KEY (id);


--
-- Name: lookupactivitystatus lookupactivitystatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupactivitystatus
    ADD CONSTRAINT lookupactivitystatus_pkey PRIMARY KEY (id);


--
-- Name: lookupagentgroups lookupagentgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupagentgroups
    ADD CONSTRAINT lookupagentgroups_pkey PRIMARY KEY (id);


--
-- Name: lookupgptcats lookupgptcats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupgptcats
    ADD CONSTRAINT lookupgptcats_pkey PRIMARY KEY (id);


--
-- Name: lookupgptmodels lookupgptmodels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupgptmodels
    ADD CONSTRAINT lookupgptmodels_pkey PRIMARY KEY (id);


--
-- Name: lookupgptoutputreviewsdone lookupgptoutputreviewsdone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupgptoutputreviewsdone
    ADD CONSTRAINT lookupgptoutputreviewsdone_pkey PRIMARY KEY (id);


--
-- Name: lookupgptrating lookupgptrating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupgptrating
    ADD CONSTRAINT lookupgptrating_pkey PRIMARY KEY (id);


--
-- Name: lookupgptresponsetimes lookupgptresponsetimes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupgptresponsetimes
    ADD CONSTRAINT lookupgptresponsetimes_pkey PRIMARY KEY (id);


--
-- Name: lookupknowledgetypes lookupknowledgetypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupknowledgetypes
    ADD CONSTRAINT lookupknowledgetypes_pkey PRIMARY KEY (id);


--
-- Name: lookupllmlist lookupllmlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupllmlist
    ADD CONSTRAINT lookupllmlist_pkey PRIMARY KEY (id);


--
-- Name: lookupmdconversionstatus lookupmdconversionstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupmdconversionstatus
    ADD CONSTRAINT lookupmdconversionstatus_pkey PRIMARY KEY (id);


--
-- Name: lookupmediatypes lookupmediatypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupmediatypes
    ADD CONSTRAINT lookupmediatypes_pkey PRIMARY KEY (id);


--
-- Name: lookupprojecttags lookupprojecttags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookupprojecttags
    ADD CONSTRAINT lookupprojecttags_pkey PRIMARY KEY (id);


--
-- Name: lookuppromptdevstages lookuppromptdevstages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lookuppromptdevstages
    ADD CONSTRAINT lookuppromptdevstages_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: nova_field_attachments nova_field_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nova_field_attachments
    ADD CONSTRAINT nova_field_attachments_pkey PRIMARY KEY (id);


--
-- Name: nova_notifications nova_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nova_notifications
    ADD CONSTRAINT nova_notifications_pkey PRIMARY KEY (id);


--
-- Name: nova_pending_field_attachments nova_pending_field_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nova_pending_field_attachments
    ADD CONSTRAINT nova_pending_field_attachments_pkey PRIMARY KEY (id);


--
-- Name: outputtag outputtag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outputtag
    ADD CONSTRAINT outputtag_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: promptlibrary promptlibrary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptlibrary
    ADD CONSTRAINT promptlibrary_pkey PRIMARY KEY (id);


--
-- Name: promptlibrary_projecttags promptlibrary_projecttags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptlibrary_projecttags
    ADD CONSTRAINT promptlibrary_projecttags_pkey PRIMARY KEY (promptlibrary_id, projecttags_id);


--
-- Name: promptoutput_knowledgetypes promptoutput_knowledgetypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput_knowledgetypes
    ADD CONSTRAINT promptoutput_knowledgetypes_pkey PRIMARY KEY (promptoutput_id, knowledgetypes_id);


--
-- Name: promptoutput_mediatypes promptoutput_mediatypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput_mediatypes
    ADD CONSTRAINT promptoutput_mediatypes_pkey PRIMARY KEY (promptoutput_id, mediatypes_id);


--
-- Name: promptoutput promptoutput_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput
    ADD CONSTRAINT promptoutput_pkey PRIMARY KEY (id);


--
-- Name: promptoutput_projecttags promptoutput_projecttags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput_projecttags
    ADD CONSTRAINT promptoutput_projecttags_pkey PRIMARY KEY (promptoutput_id, projecttags_id);


--
-- Name: promptoutput_promptlibrary promptoutput_promptlibrary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput_promptlibrary
    ADD CONSTRAINT promptoutput_promptlibrary_pkey PRIMARY KEY (promptoutput_id, promptlibrary_id);


--
-- Name: promptoutput_tags promptoutput_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput_tags
    ADD CONSTRAINT promptoutput_tags_pkey PRIMARY KEY (promptoutput_id, tag_id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: IDX_session_expire; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_session_expire" ON public.session USING btree (expire);


--
-- Name: action_events_actionable_type_actionable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX action_events_actionable_type_actionable_id_index ON public.action_events USING btree (actionable_type, actionable_id);


--
-- Name: action_events_batch_id_model_type_model_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX action_events_batch_id_model_type_model_id_index ON public.action_events USING btree (batch_id, model_type, model_id);


--
-- Name: action_events_target_type_target_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX action_events_target_type_target_id_index ON public.action_events USING btree (target_type, target_id);


--
-- Name: action_events_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX action_events_user_id_index ON public.action_events USING btree (user_id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: nova_field_attachments_attachable_type_attachable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX nova_field_attachments_attachable_type_attachable_id_index ON public.nova_field_attachments USING btree (attachable_type, attachable_id);


--
-- Name: nova_field_attachments_url_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX nova_field_attachments_url_index ON public.nova_field_attachments USING btree (url);


--
-- Name: nova_notifications_notifiable_type_notifiable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX nova_notifications_notifiable_type_notifiable_id_index ON public.nova_notifications USING btree (notifiable_type, notifiable_id);


--
-- Name: nova_pending_field_attachments_draft_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX nova_pending_field_attachments_draft_id_index ON public.nova_pending_field_attachments USING btree (draft_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: accessui accessui_custom_gpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accessui
    ADD CONSTRAINT accessui_custom_gpt_id_fkey FOREIGN KEY (custom_gpt_id) REFERENCES public.customgpt(id) ON DELETE CASCADE;


--
-- Name: customgpt customgpt_activity_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt
    ADD CONSTRAINT customgpt_activity_status_id_fkey FOREIGN KEY (activity_status_id) REFERENCES public.lookupactivitystatus(id) ON DELETE SET NULL;


--
-- Name: customgpt_agentgroups customgpt_agentgroups_agentgroups_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt_agentgroups
    ADD CONSTRAINT customgpt_agentgroups_agentgroups_id_fkey FOREIGN KEY (agentgroups_id) REFERENCES public.lookupagentgroups(id) ON DELETE CASCADE;


--
-- Name: customgpt_agentgroups customgpt_agentgroups_customgpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt_agentgroups
    ADD CONSTRAINT customgpt_agentgroups_customgpt_id_fkey FOREIGN KEY (customgpt_id) REFERENCES public.customgpt(id) ON DELETE CASCADE;


--
-- Name: customgpt customgpt_gpt_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt
    ADD CONSTRAINT customgpt_gpt_model_id_fkey FOREIGN KEY (gpt_model_id) REFERENCES public.lookupgptmodels(id) ON DELETE SET NULL;


--
-- Name: customgpt customgpt_gpt_rating_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt
    ADD CONSTRAINT customgpt_gpt_rating_id_fkey FOREIGN KEY (gpt_rating_id) REFERENCES public.lookupgptrating(id) ON DELETE SET NULL;


--
-- Name: customgpt_gptcats customgpt_gptcats_customgpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt_gptcats
    ADD CONSTRAINT customgpt_gptcats_customgpt_id_fkey FOREIGN KEY (customgpt_id) REFERENCES public.customgpt(id) ON DELETE CASCADE;


--
-- Name: customgpt_gptcats customgpt_gptcats_gptcats_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt_gptcats
    ADD CONSTRAINT customgpt_gptcats_gptcats_id_fkey FOREIGN KEY (gptcats_id) REFERENCES public.lookupgptcats(id) ON DELETE CASCADE;


--
-- Name: customgpt customgpt_llm_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt
    ADD CONSTRAINT customgpt_llm_list_id_fkey FOREIGN KEY (llm_list_id) REFERENCES public.lookupllmlist(id) ON DELETE SET NULL;


--
-- Name: customgpt_outputreviewsdone customgpt_outputreviewsdone_customgpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt_outputreviewsdone
    ADD CONSTRAINT customgpt_outputreviewsdone_customgpt_id_fkey FOREIGN KEY (customgpt_id) REFERENCES public.customgpt(id) ON DELETE CASCADE;


--
-- Name: customgpt_outputreviewsdone customgpt_outputreviewsdone_outputreviewsdone_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt_outputreviewsdone
    ADD CONSTRAINT customgpt_outputreviewsdone_outputreviewsdone_id_fkey FOREIGN KEY (outputreviewsdone_id) REFERENCES public.lookupgptoutputreviewsdone(id) ON DELETE CASCADE;


--
-- Name: customgpt_projecttags customgpt_projecttags_customgpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt_projecttags
    ADD CONSTRAINT customgpt_projecttags_customgpt_id_fkey FOREIGN KEY (customgpt_id) REFERENCES public.customgpt(id) ON DELETE CASCADE;


--
-- Name: customgpt_projecttags customgpt_projecttags_projecttags_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt_projecttags
    ADD CONSTRAINT customgpt_projecttags_projecttags_id_fkey FOREIGN KEY (projecttags_id) REFERENCES public.lookupprojecttags(id) ON DELETE CASCADE;


--
-- Name: customgpt_promptlibrary customgpt_promptlibrary_customgpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt_promptlibrary
    ADD CONSTRAINT customgpt_promptlibrary_customgpt_id_fkey FOREIGN KEY (customgpt_id) REFERENCES public.customgpt(id) ON DELETE CASCADE;


--
-- Name: customgpt_promptlibrary customgpt_promptlibrary_promptlibrary_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt_promptlibrary
    ADD CONSTRAINT customgpt_promptlibrary_promptlibrary_id_fkey FOREIGN KEY (promptlibrary_id) REFERENCES public.promptlibrary(id) ON DELETE CASCADE;


--
-- Name: customgpt_promptoutput customgpt_promptoutput_customgpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt_promptoutput
    ADD CONSTRAINT customgpt_promptoutput_customgpt_id_fkey FOREIGN KEY (customgpt_id) REFERENCES public.customgpt(id) ON DELETE CASCADE;


--
-- Name: customgpt_promptoutput customgpt_promptoutput_promptoutput_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt_promptoutput
    ADD CONSTRAINT customgpt_promptoutput_promptoutput_id_fkey FOREIGN KEY (promptoutput_id) REFERENCES public.promptoutput(id) ON DELETE CASCADE;


--
-- Name: customgpt customgpt_response_time_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customgpt
    ADD CONSTRAINT customgpt_response_time_id_fkey FOREIGN KEY (response_time_id) REFERENCES public.lookupgptresponsetimes(id) ON DELETE SET NULL;


--
-- Name: promptlibrary_projecttags promptlibrary_projecttags_projecttags_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptlibrary_projecttags
    ADD CONSTRAINT promptlibrary_projecttags_projecttags_id_fkey FOREIGN KEY (projecttags_id) REFERENCES public.lookupprojecttags(id) ON DELETE CASCADE;


--
-- Name: promptlibrary_projecttags promptlibrary_projecttags_promptlibrary_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptlibrary_projecttags
    ADD CONSTRAINT promptlibrary_projecttags_promptlibrary_id_fkey FOREIGN KEY (promptlibrary_id) REFERENCES public.promptlibrary(id) ON DELETE CASCADE;


--
-- Name: promptlibrary promptlibrary_prompt_dev_stage_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptlibrary
    ADD CONSTRAINT promptlibrary_prompt_dev_stage_id_fkey FOREIGN KEY (prompt_dev_stage_id) REFERENCES public.lookuppromptdevstages(id) ON DELETE SET NULL;


--
-- Name: promptoutput promptoutput_accuracy_level_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput
    ADD CONSTRAINT promptoutput_accuracy_level_id_fkey FOREIGN KEY (accuracy_level_id) REFERENCES public.lookupaccuracylevel(id) ON DELETE SET NULL;


--
-- Name: promptoutput promptoutput_actionability_level_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput
    ADD CONSTRAINT promptoutput_actionability_level_id_fkey FOREIGN KEY (actionability_level_id) REFERENCES public.lookupactionabilitylevel(id) ON DELETE SET NULL;


--
-- Name: promptoutput_knowledgetypes promptoutput_knowledgetypes_knowledgetypes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput_knowledgetypes
    ADD CONSTRAINT promptoutput_knowledgetypes_knowledgetypes_id_fkey FOREIGN KEY (knowledgetypes_id) REFERENCES public.lookupknowledgetypes(id) ON DELETE CASCADE;


--
-- Name: promptoutput_knowledgetypes promptoutput_knowledgetypes_promptoutput_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput_knowledgetypes
    ADD CONSTRAINT promptoutput_knowledgetypes_promptoutput_id_fkey FOREIGN KEY (promptoutput_id) REFERENCES public.promptoutput(id) ON DELETE CASCADE;


--
-- Name: promptoutput promptoutput_llm_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput
    ADD CONSTRAINT promptoutput_llm_list_id_fkey FOREIGN KEY (llm_list_id) REFERENCES public.lookupllmlist(id) ON DELETE SET NULL;


--
-- Name: promptoutput promptoutput_md_conversion_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput
    ADD CONSTRAINT promptoutput_md_conversion_status_id_fkey FOREIGN KEY (md_conversion_status_id) REFERENCES public.lookupmdconversionstatus(id) ON DELETE SET NULL;


--
-- Name: promptoutput_mediatypes promptoutput_mediatypes_mediatypes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput_mediatypes
    ADD CONSTRAINT promptoutput_mediatypes_mediatypes_id_fkey FOREIGN KEY (mediatypes_id) REFERENCES public.lookupmediatypes(id) ON DELETE CASCADE;


--
-- Name: promptoutput_mediatypes promptoutput_mediatypes_promptoutput_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput_mediatypes
    ADD CONSTRAINT promptoutput_mediatypes_promptoutput_id_fkey FOREIGN KEY (promptoutput_id) REFERENCES public.promptoutput(id) ON DELETE CASCADE;


--
-- Name: promptoutput_projecttags promptoutput_projecttags_projecttags_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput_projecttags
    ADD CONSTRAINT promptoutput_projecttags_projecttags_id_fkey FOREIGN KEY (projecttags_id) REFERENCES public.lookupprojecttags(id) ON DELETE CASCADE;


--
-- Name: promptoutput_projecttags promptoutput_projecttags_promptoutput_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput_projecttags
    ADD CONSTRAINT promptoutput_projecttags_promptoutput_id_fkey FOREIGN KEY (promptoutput_id) REFERENCES public.promptoutput(id) ON DELETE CASCADE;


--
-- Name: promptoutput promptoutput_prompt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput
    ADD CONSTRAINT promptoutput_prompt_id_fkey FOREIGN KEY (prompt_id) REFERENCES public.promptlibrary(id) ON DELETE CASCADE;


--
-- Name: promptoutput_promptlibrary promptoutput_promptlibrary_promptlibrary_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput_promptlibrary
    ADD CONSTRAINT promptoutput_promptlibrary_promptlibrary_id_fkey FOREIGN KEY (promptlibrary_id) REFERENCES public.promptlibrary(id) ON DELETE CASCADE;


--
-- Name: promptoutput_promptlibrary promptoutput_promptlibrary_promptoutput_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput_promptlibrary
    ADD CONSTRAINT promptoutput_promptlibrary_promptoutput_id_fkey FOREIGN KEY (promptoutput_id) REFERENCES public.promptoutput(id) ON DELETE CASCADE;


--
-- Name: promptoutput_tags promptoutput_tags_promptoutput_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput_tags
    ADD CONSTRAINT promptoutput_tags_promptoutput_id_fkey FOREIGN KEY (promptoutput_id) REFERENCES public.promptoutput(id) ON DELETE CASCADE;


--
-- Name: promptoutput_tags promptoutput_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promptoutput_tags
    ADD CONSTRAINT promptoutput_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.outputtag(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;
GRANT ALL ON SCHEMA public TO PUBLIC;
GRANT USAGE ON SCHEMA public TO test_user;


--
-- Name: TABLE accessui; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.accessui TO anon;
GRANT ALL ON TABLE public.accessui TO authenticated;
GRANT ALL ON TABLE public.accessui TO service_role;


--
-- Name: SEQUENCE accessui_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.accessui_id_seq TO anon;
GRANT ALL ON SEQUENCE public.accessui_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.accessui_id_seq TO service_role;


--
-- Name: TABLE action_events; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.action_events TO anon;
GRANT ALL ON TABLE public.action_events TO authenticated;
GRANT ALL ON TABLE public.action_events TO service_role;


--
-- Name: SEQUENCE action_events_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.action_events_id_seq TO anon;
GRANT ALL ON SEQUENCE public.action_events_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.action_events_id_seq TO service_role;


--
-- Name: TABLE cache; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.cache TO anon;
GRANT ALL ON TABLE public.cache TO authenticated;
GRANT ALL ON TABLE public.cache TO service_role;


--
-- Name: TABLE cache_locks; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.cache_locks TO anon;
GRANT ALL ON TABLE public.cache_locks TO authenticated;
GRANT ALL ON TABLE public.cache_locks TO service_role;


--
-- Name: TABLE customgpt; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.customgpt TO anon;
GRANT ALL ON TABLE public.customgpt TO authenticated;
GRANT ALL ON TABLE public.customgpt TO service_role;


--
-- Name: TABLE customgpt_agentgroups; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.customgpt_agentgroups TO anon;
GRANT ALL ON TABLE public.customgpt_agentgroups TO authenticated;
GRANT ALL ON TABLE public.customgpt_agentgroups TO service_role;


--
-- Name: TABLE customgpt_gptcats; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.customgpt_gptcats TO anon;
GRANT ALL ON TABLE public.customgpt_gptcats TO authenticated;
GRANT ALL ON TABLE public.customgpt_gptcats TO service_role;


--
-- Name: SEQUENCE customgpt_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.customgpt_id_seq TO anon;
GRANT ALL ON SEQUENCE public.customgpt_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.customgpt_id_seq TO service_role;


--
-- Name: TABLE customgpt_outputreviewsdone; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.customgpt_outputreviewsdone TO anon;
GRANT ALL ON TABLE public.customgpt_outputreviewsdone TO authenticated;
GRANT ALL ON TABLE public.customgpt_outputreviewsdone TO service_role;


--
-- Name: TABLE customgpt_projecttags; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.customgpt_projecttags TO anon;
GRANT ALL ON TABLE public.customgpt_projecttags TO authenticated;
GRANT ALL ON TABLE public.customgpt_projecttags TO service_role;


--
-- Name: TABLE customgpt_promptlibrary; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.customgpt_promptlibrary TO anon;
GRANT ALL ON TABLE public.customgpt_promptlibrary TO authenticated;
GRANT ALL ON TABLE public.customgpt_promptlibrary TO service_role;


--
-- Name: TABLE customgpt_promptoutput; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.customgpt_promptoutput TO anon;
GRANT ALL ON TABLE public.customgpt_promptoutput TO authenticated;
GRANT ALL ON TABLE public.customgpt_promptoutput TO service_role;


--
-- Name: TABLE failed_jobs; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.failed_jobs TO anon;
GRANT ALL ON TABLE public.failed_jobs TO authenticated;
GRANT ALL ON TABLE public.failed_jobs TO service_role;


--
-- Name: SEQUENCE failed_jobs_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.failed_jobs_id_seq TO anon;
GRANT ALL ON SEQUENCE public.failed_jobs_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.failed_jobs_id_seq TO service_role;


--
-- Name: TABLE job_batches; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.job_batches TO anon;
GRANT ALL ON TABLE public.job_batches TO authenticated;
GRANT ALL ON TABLE public.job_batches TO service_role;


--
-- Name: TABLE jobs; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.jobs TO anon;
GRANT ALL ON TABLE public.jobs TO authenticated;
GRANT ALL ON TABLE public.jobs TO service_role;


--
-- Name: SEQUENCE jobs_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.jobs_id_seq TO anon;
GRANT ALL ON SEQUENCE public.jobs_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.jobs_id_seq TO service_role;


--
-- Name: TABLE lookupaccuracylevel; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lookupaccuracylevel TO anon;
GRANT ALL ON TABLE public.lookupaccuracylevel TO authenticated;
GRANT ALL ON TABLE public.lookupaccuracylevel TO service_role;


--
-- Name: SEQUENCE lookupaccuracylevel_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.lookupaccuracylevel_id_seq TO anon;
GRANT ALL ON SEQUENCE public.lookupaccuracylevel_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.lookupaccuracylevel_id_seq TO service_role;


--
-- Name: TABLE lookupactionabilitylevel; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lookupactionabilitylevel TO anon;
GRANT ALL ON TABLE public.lookupactionabilitylevel TO authenticated;
GRANT ALL ON TABLE public.lookupactionabilitylevel TO service_role;


--
-- Name: SEQUENCE lookupactionabilitylevel_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.lookupactionabilitylevel_id_seq TO anon;
GRANT ALL ON SEQUENCE public.lookupactionabilitylevel_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.lookupactionabilitylevel_id_seq TO service_role;


--
-- Name: TABLE lookupactivitystatus; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lookupactivitystatus TO anon;
GRANT ALL ON TABLE public.lookupactivitystatus TO authenticated;
GRANT ALL ON TABLE public.lookupactivitystatus TO service_role;


--
-- Name: SEQUENCE lookupactivitystatus_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.lookupactivitystatus_id_seq TO anon;
GRANT ALL ON SEQUENCE public.lookupactivitystatus_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.lookupactivitystatus_id_seq TO service_role;


--
-- Name: TABLE lookupagentgroups; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lookupagentgroups TO anon;
GRANT ALL ON TABLE public.lookupagentgroups TO authenticated;
GRANT ALL ON TABLE public.lookupagentgroups TO service_role;


--
-- Name: SEQUENCE lookupagentgroups_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.lookupagentgroups_id_seq TO anon;
GRANT ALL ON SEQUENCE public.lookupagentgroups_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.lookupagentgroups_id_seq TO service_role;


--
-- Name: TABLE lookupgptcats; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lookupgptcats TO anon;
GRANT ALL ON TABLE public.lookupgptcats TO authenticated;
GRANT ALL ON TABLE public.lookupgptcats TO service_role;


--
-- Name: SEQUENCE lookupgptcats_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.lookupgptcats_id_seq TO anon;
GRANT ALL ON SEQUENCE public.lookupgptcats_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.lookupgptcats_id_seq TO service_role;


--
-- Name: TABLE lookupgptmodels; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lookupgptmodels TO anon;
GRANT ALL ON TABLE public.lookupgptmodels TO authenticated;
GRANT ALL ON TABLE public.lookupgptmodels TO service_role;


--
-- Name: SEQUENCE lookupgptmodels_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.lookupgptmodels_id_seq TO anon;
GRANT ALL ON SEQUENCE public.lookupgptmodels_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.lookupgptmodels_id_seq TO service_role;


--
-- Name: TABLE lookupgptoutputreviewsdone; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lookupgptoutputreviewsdone TO anon;
GRANT ALL ON TABLE public.lookupgptoutputreviewsdone TO authenticated;
GRANT ALL ON TABLE public.lookupgptoutputreviewsdone TO service_role;


--
-- Name: SEQUENCE lookupgptoutputreviewsdone_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.lookupgptoutputreviewsdone_id_seq TO anon;
GRANT ALL ON SEQUENCE public.lookupgptoutputreviewsdone_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.lookupgptoutputreviewsdone_id_seq TO service_role;


--
-- Name: TABLE lookupgptrating; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lookupgptrating TO anon;
GRANT ALL ON TABLE public.lookupgptrating TO authenticated;
GRANT ALL ON TABLE public.lookupgptrating TO service_role;


--
-- Name: SEQUENCE lookupgptrating_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.lookupgptrating_id_seq TO anon;
GRANT ALL ON SEQUENCE public.lookupgptrating_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.lookupgptrating_id_seq TO service_role;


--
-- Name: TABLE lookupgptresponsetimes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lookupgptresponsetimes TO anon;
GRANT ALL ON TABLE public.lookupgptresponsetimes TO authenticated;
GRANT ALL ON TABLE public.lookupgptresponsetimes TO service_role;


--
-- Name: SEQUENCE lookupgptresponsetimes_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.lookupgptresponsetimes_id_seq TO anon;
GRANT ALL ON SEQUENCE public.lookupgptresponsetimes_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.lookupgptresponsetimes_id_seq TO service_role;


--
-- Name: TABLE lookupknowledgetypes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lookupknowledgetypes TO anon;
GRANT ALL ON TABLE public.lookupknowledgetypes TO authenticated;
GRANT ALL ON TABLE public.lookupknowledgetypes TO service_role;


--
-- Name: SEQUENCE lookupknowledgetypes_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.lookupknowledgetypes_id_seq TO anon;
GRANT ALL ON SEQUENCE public.lookupknowledgetypes_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.lookupknowledgetypes_id_seq TO service_role;


--
-- Name: TABLE lookupllmlist; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lookupllmlist TO anon;
GRANT ALL ON TABLE public.lookupllmlist TO authenticated;
GRANT ALL ON TABLE public.lookupllmlist TO service_role;


--
-- Name: SEQUENCE lookupllmlist_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.lookupllmlist_id_seq TO anon;
GRANT ALL ON SEQUENCE public.lookupllmlist_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.lookupllmlist_id_seq TO service_role;


--
-- Name: TABLE lookupmdconversionstatus; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lookupmdconversionstatus TO anon;
GRANT ALL ON TABLE public.lookupmdconversionstatus TO authenticated;
GRANT ALL ON TABLE public.lookupmdconversionstatus TO service_role;


--
-- Name: SEQUENCE lookupmdconversionstatus_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.lookupmdconversionstatus_id_seq TO anon;
GRANT ALL ON SEQUENCE public.lookupmdconversionstatus_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.lookupmdconversionstatus_id_seq TO service_role;


--
-- Name: TABLE lookupmediatypes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lookupmediatypes TO anon;
GRANT ALL ON TABLE public.lookupmediatypes TO authenticated;
GRANT ALL ON TABLE public.lookupmediatypes TO service_role;


--
-- Name: SEQUENCE lookupmediatypes_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.lookupmediatypes_id_seq TO anon;
GRANT ALL ON SEQUENCE public.lookupmediatypes_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.lookupmediatypes_id_seq TO service_role;


--
-- Name: TABLE lookupprojecttags; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lookupprojecttags TO anon;
GRANT ALL ON TABLE public.lookupprojecttags TO authenticated;
GRANT ALL ON TABLE public.lookupprojecttags TO service_role;


--
-- Name: SEQUENCE lookupprojecttags_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.lookupprojecttags_id_seq TO anon;
GRANT ALL ON SEQUENCE public.lookupprojecttags_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.lookupprojecttags_id_seq TO service_role;


--
-- Name: TABLE lookuppromptdevstages; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lookuppromptdevstages TO anon;
GRANT ALL ON TABLE public.lookuppromptdevstages TO authenticated;
GRANT ALL ON TABLE public.lookuppromptdevstages TO service_role;


--
-- Name: SEQUENCE lookuppromptdevstages_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.lookuppromptdevstages_id_seq TO anon;
GRANT ALL ON SEQUENCE public.lookuppromptdevstages_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.lookuppromptdevstages_id_seq TO service_role;


--
-- Name: TABLE migrations; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.migrations TO anon;
GRANT ALL ON TABLE public.migrations TO authenticated;
GRANT ALL ON TABLE public.migrations TO service_role;


--
-- Name: SEQUENCE migrations_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.migrations_id_seq TO anon;
GRANT ALL ON SEQUENCE public.migrations_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.migrations_id_seq TO service_role;


--
-- Name: TABLE nova_field_attachments; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.nova_field_attachments TO anon;
GRANT ALL ON TABLE public.nova_field_attachments TO authenticated;
GRANT ALL ON TABLE public.nova_field_attachments TO service_role;


--
-- Name: SEQUENCE nova_field_attachments_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.nova_field_attachments_id_seq TO anon;
GRANT ALL ON SEQUENCE public.nova_field_attachments_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.nova_field_attachments_id_seq TO service_role;


--
-- Name: TABLE nova_notifications; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.nova_notifications TO anon;
GRANT ALL ON TABLE public.nova_notifications TO authenticated;
GRANT ALL ON TABLE public.nova_notifications TO service_role;


--
-- Name: TABLE nova_pending_field_attachments; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.nova_pending_field_attachments TO anon;
GRANT ALL ON TABLE public.nova_pending_field_attachments TO authenticated;
GRANT ALL ON TABLE public.nova_pending_field_attachments TO service_role;


--
-- Name: SEQUENCE nova_pending_field_attachments_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.nova_pending_field_attachments_id_seq TO anon;
GRANT ALL ON SEQUENCE public.nova_pending_field_attachments_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.nova_pending_field_attachments_id_seq TO service_role;


--
-- Name: TABLE outputtag; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.outputtag TO anon;
GRANT ALL ON TABLE public.outputtag TO authenticated;
GRANT ALL ON TABLE public.outputtag TO service_role;


--
-- Name: SEQUENCE outputtag_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.outputtag_id_seq TO anon;
GRANT ALL ON SEQUENCE public.outputtag_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.outputtag_id_seq TO service_role;


--
-- Name: TABLE password_reset_tokens; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.password_reset_tokens TO anon;
GRANT ALL ON TABLE public.password_reset_tokens TO authenticated;
GRANT ALL ON TABLE public.password_reset_tokens TO service_role;


--
-- Name: TABLE promptlibrary; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.promptlibrary TO anon;
GRANT ALL ON TABLE public.promptlibrary TO authenticated;
GRANT ALL ON TABLE public.promptlibrary TO service_role;


--
-- Name: SEQUENCE promptlibrary_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.promptlibrary_id_seq TO anon;
GRANT ALL ON SEQUENCE public.promptlibrary_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.promptlibrary_id_seq TO service_role;


--
-- Name: TABLE promptlibrary_projecttags; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.promptlibrary_projecttags TO anon;
GRANT ALL ON TABLE public.promptlibrary_projecttags TO authenticated;
GRANT ALL ON TABLE public.promptlibrary_projecttags TO service_role;


--
-- Name: TABLE promptoutput; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.promptoutput TO anon;
GRANT ALL ON TABLE public.promptoutput TO authenticated;
GRANT ALL ON TABLE public.promptoutput TO service_role;


--
-- Name: SEQUENCE promptoutput_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.promptoutput_id_seq TO anon;
GRANT ALL ON SEQUENCE public.promptoutput_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.promptoutput_id_seq TO service_role;


--
-- Name: TABLE promptoutput_knowledgetypes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.promptoutput_knowledgetypes TO anon;
GRANT ALL ON TABLE public.promptoutput_knowledgetypes TO authenticated;
GRANT ALL ON TABLE public.promptoutput_knowledgetypes TO service_role;


--
-- Name: TABLE promptoutput_mediatypes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.promptoutput_mediatypes TO anon;
GRANT ALL ON TABLE public.promptoutput_mediatypes TO authenticated;
GRANT ALL ON TABLE public.promptoutput_mediatypes TO service_role;


--
-- Name: TABLE promptoutput_projecttags; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.promptoutput_projecttags TO anon;
GRANT ALL ON TABLE public.promptoutput_projecttags TO authenticated;
GRANT ALL ON TABLE public.promptoutput_projecttags TO service_role;


--
-- Name: TABLE promptoutput_promptlibrary; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.promptoutput_promptlibrary TO anon;
GRANT ALL ON TABLE public.promptoutput_promptlibrary TO authenticated;
GRANT ALL ON TABLE public.promptoutput_promptlibrary TO service_role;


--
-- Name: TABLE promptoutput_tags; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.promptoutput_tags TO anon;
GRANT ALL ON TABLE public.promptoutput_tags TO authenticated;
GRANT ALL ON TABLE public.promptoutput_tags TO service_role;


--
-- Name: TABLE session; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.session TO anon;
GRANT ALL ON TABLE public.session TO authenticated;
GRANT ALL ON TABLE public.session TO service_role;


--
-- Name: TABLE sessions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.sessions TO anon;
GRANT ALL ON TABLE public.sessions TO authenticated;
GRANT ALL ON TABLE public.sessions TO service_role;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.users TO anon;
GRANT ALL ON TABLE public.users TO authenticated;
GRANT ALL ON TABLE public.users TO service_role;


--
-- Name: SEQUENCE users_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.users_id_seq TO anon;
GRANT ALL ON SEQUENCE public.users_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.users_id_seq TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- PostgreSQL database dump complete
--

