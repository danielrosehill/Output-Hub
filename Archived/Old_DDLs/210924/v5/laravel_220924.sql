--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Ubuntu 16.4-0ubuntu0.24.04.2)
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
-- Name: global_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.global_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accessui; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accessui (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    ui_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE accessui; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.accessui IS 'Stores different user interface access levels';


--
-- Name: accuracylevels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accuracylevels (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    accuracy_level character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE accuracylevels; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.accuracylevels IS 'Defines levels of accuracy for assessments';


--
-- Name: action_events; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: action_events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.action_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: action_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.action_events_id_seq OWNED BY public.action_events.id;


--
-- Name: actionability_levels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.actionability_levels (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    actionability_level character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE actionability_levels; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.actionability_levels IS 'Defines levels of actionability for outputs';


--
-- Name: activitystatus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.activitystatus (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    status_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE activitystatus; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.activitystatus IS 'Stores possible activity statuses';


--
-- Name: agentgroups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.agentgroups (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    group_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE agentgroups; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.agentgroups IS 'Defines groups of agents';


--
-- Name: apiintegrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.apiintegrations (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    integration_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE apiintegrations; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.apiintegrations IS 'Stores information about API integrations';


--
-- Name: automation_levels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.automation_levels (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    automation_level character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE automation_levels; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.automation_levels IS 'Defines levels of automation';


--
-- Name: backupstatuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.backupstatuses (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    status_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE backupstatuses; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.backupstatuses IS 'Stores possible backup statuses';


--
-- Name: business_system_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.business_system_tags (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    tag_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE business_system_tags; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.business_system_tags IS 'Stores tags for business systems';


--
-- Name: cache; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


--
-- Name: cc_license_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cc_license_types (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    license_type character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE cc_license_types; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.cc_license_types IS 'Stores types of Creative Commons licenses';


--
-- Name: chatgpt_output_formats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chatgpt_output_formats (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    format_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE chatgpt_output_formats; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.chatgpt_output_formats IS 'Defines output formats for ChatGPT';


--
-- Name: citiesinisrael; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.citiesinisrael (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    city_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE citiesinisrael; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.citiesinisrael IS 'List of cities in Israel';


--
-- Name: cost_levels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cost_levels (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    cost_level character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE cost_levels; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.cost_levels IS 'Defines levels of cost';


--
-- Name: creation_account; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.creation_account (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    account_name character varying(255) NOT NULL,
    account_email character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE creation_account; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.creation_account IS 'Stores information about creation accounts';


--
-- Name: custom_gpts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_gpts (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    user_id integer NOT NULL,
    gpt_name text NOT NULL,
    config_text text,
    link character varying(255),
    importance integer NOT NULL,
    is_gpt_optimised boolean DEFAULT false NOT NULL,
    summary text,
    version integer DEFAULT 1 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    created_by integer,
    updated_by integer,
    access_ui_id integer NOT NULL,
    activity_status_id integer NOT NULL,
    creation_account_id integer NOT NULL,
    configuration_type_id integer NOT NULL,
    gpt_model_id integer NOT NULL,
    gpt_rating_id integer,
    github_release_status_id integer,
    underlying_llm_id integer,
    CONSTRAINT check_importance CHECK (((importance >= 0) AND (importance <= 10)))
);


--
-- Name: TABLE custom_gpts; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.custom_gpts IS 'Stores information about custom GPT models';


--
-- Name: COLUMN custom_gpts.gpt_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.custom_gpts.gpt_name IS 'Name of the custom GPT';


--
-- Name: COLUMN custom_gpts.importance; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.custom_gpts.importance IS 'Importance rating from 0 to 10';


--
-- Name: COLUMN custom_gpts.version; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.custom_gpts.version IS 'Version number of the custom GPT';


--
-- Name: custom_gpts_agent_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_gpts_agent_groups (
    custom_gpt_id integer NOT NULL,
    agent_group_id integer NOT NULL
);


--
-- Name: custom_gpts_backup_statuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_gpts_backup_statuses (
    custom_gpt_id integer NOT NULL,
    backup_status_id integer NOT NULL
);


--
-- Name: custom_gpts_business_system_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_gpts_business_system_tags (
    custom_gpt_id integer NOT NULL,
    business_system_tag_id integer NOT NULL
);


--
-- Name: custom_gpts_capabilities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_gpts_capabilities (
    custom_gpt_id integer NOT NULL,
    capability_id integer NOT NULL
);


--
-- Name: custom_gpts_data_retention_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_gpts_data_retention_plans (
    custom_gpt_id integer NOT NULL,
    data_retention_plan_id integer NOT NULL
);


--
-- Name: custom_gpts_data_sharing_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_gpts_data_sharing_groups (
    custom_gpt_id integer NOT NULL,
    data_sharing_group_id integer NOT NULL
);


--
-- Name: custom_gpts_gpt_privacy_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_gpts_gpt_privacy_settings (
    custom_gpt_id integer NOT NULL,
    gpt_privacy_setting_id integer NOT NULL
);


--
-- Name: custom_gpts_gpt_review_statuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_gpts_gpt_review_statuses (
    custom_gpt_id integer NOT NULL,
    gpt_review_status_id integer NOT NULL
);


--
-- Name: custom_gpts_media_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_gpts_media_types (
    custom_gpt_id integer NOT NULL,
    media_type_id integer NOT NULL
);


--
-- Name: custom_gpts_output_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_gpts_output_types (
    custom_gpt_id integer NOT NULL,
    output_type_id integer NOT NULL
);


--
-- Name: custom_gpts_programming_languages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_gpts_programming_languages (
    custom_gpt_id integer NOT NULL,
    programming_language_id integer NOT NULL
);


--
-- Name: custom_gpts_prompt_library; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_gpts_prompt_library (
    custom_gpt_id integer NOT NULL,
    prompt_library_id integer NOT NULL
);


--
-- Name: custom_gpts_use_cases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_gpts_use_cases (
    custom_gpt_id integer NOT NULL,
    use_case_id integer NOT NULL
);


--
-- Name: custom_gpts_version_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_gpts_version_history (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    custom_gpt_id integer NOT NULL,
    version integer NOT NULL,
    change_description text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    created_by integer
);


--
-- Name: customgptlibraries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customgptlibraries (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    library_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE customgptlibraries; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.customgptlibraries IS 'Stores custom GPT libraries';


--
-- Name: data_retention_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.data_retention_plans (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    plan_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE data_retention_plans; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.data_retention_plans IS 'Defines data retention plans';


--
-- Name: data_sensitivity_levels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.data_sensitivity_levels (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    sensitivity_level character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE data_sensitivity_levels; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.data_sensitivity_levels IS 'Defines levels of data sensitivity';


--
-- Name: data_sharing_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.data_sharing_groups (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    group_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE data_sharing_groups; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.data_sharing_groups IS 'Defines groups for data sharing';


--
-- Name: data_size_classifiers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.data_size_classifiers (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    classifier_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE data_size_classifiers; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.data_size_classifiers IS 'Classifies data sizes';


--
-- Name: data_source_classifiers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.data_source_classifiers (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    classifier_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE data_source_classifiers; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.data_source_classifiers IS 'Classifies data sources';


--
-- Name: data_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.data_types (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    type_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE data_types; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.data_types IS 'Defines types of data';


--
-- Name: data_viz_formats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.data_viz_formats (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    format_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE data_viz_formats; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.data_viz_formats IS 'Defines formats for data visualization';


--
-- Name: experimentation_methodologies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.experimentation_methodologies (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    methodology_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE experimentation_methodologies; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.experimentation_methodologies IS 'Defines methodologies for experimentation';


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: file_formats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.file_formats (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    format_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE file_formats; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.file_formats IS 'Defines file formats';


--
-- Name: followup_activities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.followup_activities (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    activity_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE followup_activities; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.followup_activities IS 'Defines follow-up activities';


--
-- Name: github_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.github_plans (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    plan_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE github_plans; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.github_plans IS 'Defines GitHub plans';


--
-- Name: gpt_platforms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gpt_platforms (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    platform_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE gpt_platforms; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.gpt_platforms IS 'Defines GPT platforms';


--
-- Name: gpt_privacy_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gpt_privacy_settings (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    setting_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE gpt_privacy_settings; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.gpt_privacy_settings IS 'Defines privacy settings for GPTs';


--
-- Name: gpt_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gpt_tags (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    tag_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE gpt_tags; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.gpt_tags IS 'Defines tags for GPTs';


--
-- Name: gpt_tasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gpt_tasks (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    task_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE gpt_tasks; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.gpt_tasks IS 'Defines tasks for GPTs';


--
-- Name: gptcapabilities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gptcapabilities (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    capability_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE gptcapabilities; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.gptcapabilities IS 'Defines capabilities of GPTs';


--
-- Name: gptconfigtypes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gptconfigtypes (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    config_type_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE gptconfigtypes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.gptconfigtypes IS 'Defines configuration types for GPTs';


--
-- Name: gptmodels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gptmodels (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    model_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE gptmodels; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.gptmodels IS 'Defines GPT models';


--
-- Name: gptoutputreviewsdone; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gptoutputreviewsdone (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    review_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE gptoutputreviewsdone; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.gptoutputreviewsdone IS 'Tracks reviews done on GPT outputs';


--
-- Name: gptratings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gptratings (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    rating_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE gptratings; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.gptratings IS 'Defines ratings for GPTs';


--
-- Name: gptresponsetimes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gptresponsetimes (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    response_time_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE gptresponsetimes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.gptresponsetimes IS 'Defines response time categories for GPTs';


--
-- Name: gptreviewstatuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gptreviewstatuses (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    status_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE gptreviewstatuses; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.gptreviewstatuses IS 'Defines review statuses for GPTs';


--
-- Name: gpts_cats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gpts_cats (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    category_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE gpts_cats; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.gpts_cats IS 'Defines categories for GPTs';


--
-- Name: gptsoftwareplatforms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gptsoftwareplatforms (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    platform_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE gptsoftwareplatforms; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.gptsoftwareplatforms IS 'Defines software platforms for GPTs';


--
-- Name: industries_list; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.industries_list (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    industry_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE industries_list; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.industries_list IS 'List of industries';


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: knowledge_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.knowledge_types (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    knowledge_type_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE knowledge_types; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.knowledge_types IS 'Defines types of knowledge';


--
-- Name: llms_list; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.llms_list (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    llm_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE llms_list; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.llms_list IS 'List of Language Models';


--
-- Name: lookup_tables; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lookup_tables (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: lookup_tables_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lookup_tables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lookup_tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lookup_tables_id_seq OWNED BY public.lookup_tables.id;


--
-- Name: main_tables; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.main_tables (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: main_tables_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.main_tables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: main_tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.main_tables_id_seq OWNED BY public.main_tables.id;


--
-- Name: mdconversionstatus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mdconversionstatus (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    status_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE mdconversionstatus; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.mdconversionstatus IS 'Defines statuses for Markdown conversion';


--
-- Name: mediatypes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mediatypes (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    media_type_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE mediatypes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.mediatypes IS 'Defines types of media';


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: nova_field_attachments; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: nova_field_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.nova_field_attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nova_field_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.nova_field_attachments_id_seq OWNED BY public.nova_field_attachments.id;


--
-- Name: nova_notifications; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: nova_pending_field_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nova_pending_field_attachments (
    id integer NOT NULL,
    draft_id character varying(255) NOT NULL,
    attachment character varying(255) NOT NULL,
    disk character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: nova_pending_field_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.nova_pending_field_attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nova_pending_field_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.nova_pending_field_attachments_id_seq OWNED BY public.nova_pending_field_attachments.id;


--
-- Name: opensource_licenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opensource_licenses (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    license_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE opensource_licenses; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.opensource_licenses IS 'Defines open source licenses';


--
-- Name: output_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.output_types (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    output_type_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE output_types; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.output_types IS 'Defines types of output';


--
-- Name: outputqualityassessment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.outputqualityassessment (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    assessment_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE outputqualityassessment; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.outputqualityassessment IS 'Defines quality assessment categories for outputs';


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


--
-- Name: post_prompt_actions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.post_prompt_actions (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    action_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE post_prompt_actions; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.post_prompt_actions IS 'Defines actions to be taken after prompts';


--
-- Name: programminglanguages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.programminglanguages (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    language_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE programminglanguages; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.programminglanguages IS 'List of programming languages';


--
-- Name: project_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_tags (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    tag_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE project_tags; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.project_tags IS 'Defines tags for projects';


--
-- Name: prompt_library; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prompt_library (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    user_id integer NOT NULL,
    prompt_text text NOT NULL,
    is_engineered boolean DEFAULT false NOT NULL,
    rating integer,
    display_in_library boolean DEFAULT true NOT NULL,
    notes_for_improvement text,
    limitations text,
    usecase_notes text,
    data_sensitivity_notes text,
    prompt_success_stories text,
    prompt_failures text,
    prompt_benchmarking text,
    prompt_refinement_history text,
    planned_enhancements text,
    description text,
    summary character varying(255),
    version integer DEFAULT 1 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    created_by integer,
    updated_by integer,
    CONSTRAINT check_rating CHECK (((rating >= 0) AND (rating <= 5)))
);


--
-- Name: TABLE prompt_library; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.prompt_library IS 'Stores prompts used with custom GPTs';


--
-- Name: COLUMN prompt_library.prompt_text; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.prompt_library.prompt_text IS 'The actual text of the prompt';


--
-- Name: COLUMN prompt_library.rating; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.prompt_library.rating IS 'Rating of the prompt from 0 to 5';


--
-- Name: COLUMN prompt_library.version; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.prompt_library.version IS 'Version number of the prompt';


--
-- Name: prompt_library_programming_languages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prompt_library_programming_languages (
    prompt_library_id integer NOT NULL,
    programming_language_id integer NOT NULL
);


--
-- Name: prompt_library_use_cases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prompt_library_use_cases (
    prompt_library_id integer NOT NULL,
    use_case_id integer NOT NULL
);


--
-- Name: prompt_library_version_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prompt_library_version_history (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    prompt_library_id integer NOT NULL,
    version integer NOT NULL,
    change_description text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    created_by integer
);


--
-- Name: prompt_outputs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prompt_outputs (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    user_id integer NOT NULL,
    output text NOT NULL,
    prompt_used text NOT NULL,
    custom_gpt_id integer NOT NULL,
    prompt_library_id integer NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    created_by integer,
    updated_by integer,
    md_conversion_status_id integer,
    accuracy_assessment_id integer,
    actionability_id integer,
    data_sensitivity_id integer,
    data_size_id integer,
    output_language_id integer,
    output_reading_level_id integer,
    review_urgency_id integer,
    review_priority_id integer,
    output_category_id integer
);


--
-- Name: COLUMN prompt_outputs.output; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.prompt_outputs.output IS 'The generated output text';


--
-- Name: COLUMN prompt_outputs.prompt_used; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.prompt_outputs.prompt_used IS 'The prompt used to generate this output';


--
-- Name: prompt_outputs_partitioned; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prompt_outputs_partitioned (
    id integer NOT NULL,
    prompt_id integer NOT NULL,
    output text NOT NULL,
    created_at timestamp without time zone NOT NULL
)
PARTITION BY RANGE (created_at);


--
-- Name: prompt_outputs_partitioned_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.prompt_outputs_partitioned_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prompt_outputs_partitioned_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.prompt_outputs_partitioned_id_seq OWNED BY public.prompt_outputs_partitioned.id;


--
-- Name: prompt_outputs_y2023; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prompt_outputs_y2023 (
    id integer DEFAULT nextval('public.prompt_outputs_partitioned_id_seq'::regclass) NOT NULL,
    prompt_id integer NOT NULL,
    output text NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: prompt_outputs_y2024; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prompt_outputs_y2024 (
    id integer DEFAULT nextval('public.prompt_outputs_partitioned_id_seq'::regclass) NOT NULL,
    prompt_id integer NOT NULL,
    output text NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: promptstages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.promptstages (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    stage_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE promptstages; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.promptstages IS 'Defines stages of prompts';


--
-- Name: publication_platforms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.publication_platforms (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    platform_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE publication_platforms; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.publication_platforms IS 'Defines platforms for publication';


--
-- Name: qc_activities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.qc_activities (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    activity_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE qc_activities; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.qc_activities IS 'Defines quality control activities';


--
-- Name: reading_levels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reading_levels (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    level_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE reading_levels; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.reading_levels IS 'Defines reading levels';


--
-- Name: reference_sources; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reference_sources (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    source_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE reference_sources; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.reference_sources IS 'Defines sources of references';


--
-- Name: relationdb_techs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.relationdb_techs (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    tech_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE relationdb_techs; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.relationdb_techs IS 'Defines relational database technologies';


--
-- Name: review_priority_levels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.review_priority_levels (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    priority_level_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE review_priority_levels; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.review_priority_levels IS 'Defines priority levels for reviews';


--
-- Name: review_statuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.review_statuses (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    status_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE review_statuses; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.review_statuses IS 'Defines statuses for reviews';


--
-- Name: saas_sub_models; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.saas_sub_models (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    model_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE saas_sub_models; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.saas_sub_models IS 'Defines SaaS subscription models';


--
-- Name: sentiment_classifiers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sentiment_classifiers (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    classifier_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE sentiment_classifiers; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.sentiment_classifiers IS 'Defines sentiment classifiers';


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


--
-- Name: system_unique_ids; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.system_unique_ids (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    unique_id_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE system_unique_ids; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.system_unique_ids IS 'Defines unique identifiers for systems';


--
-- Name: systemmodules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.systemmodules (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    module_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE systemmodules; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.systemmodules IS 'Defines system modules';


--
-- Name: tabletypes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tabletypes (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    table_type_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE tabletypes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.tabletypes IS 'Defines types of tables';


--
-- Name: targetaudiences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.targetaudiences (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    audience_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE targetaudiences; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.targetaudiences IS 'Defines target audiences';


--
-- Name: taxonomy_organisation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.taxonomy_organisation (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    organisation_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE taxonomy_organisation; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.taxonomy_organisation IS 'Defines taxonomy organizations';


--
-- Name: urgency_levels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urgency_levels (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    urgency_level_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE urgency_levels; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.urgency_levels IS 'Defines levels of urgency';


--
-- Name: usecases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usecases (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    usecase_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE usecases; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.usecases IS 'Defines use cases';


--
-- Name: userfeedback_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.userfeedback_types (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    feedback_type_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE userfeedback_types; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.userfeedback_types IS 'Defines types of user feedback';


--
-- Name: userroles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.userroles (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    role_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE userroles; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.userroles IS 'Defines user roles';


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: TABLE users; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.users IS 'Stores user information';


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: worldcountries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.worldcountries (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    country_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE worldcountries; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.worldcountries IS 'List of countries in the world';


--
-- Name: worldlanguages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.worldlanguages (
    id integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    language_name character varying(255) NOT NULL,
    description text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE worldlanguages; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.worldlanguages IS 'List of world languages';


--
-- Name: prompt_outputs_y2023; Type: TABLE ATTACH; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs_partitioned ATTACH PARTITION public.prompt_outputs_y2023 FOR VALUES FROM ('2023-01-01 00:00:00') TO ('2024-01-01 00:00:00');


--
-- Name: prompt_outputs_y2024; Type: TABLE ATTACH; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs_partitioned ATTACH PARTITION public.prompt_outputs_y2024 FOR VALUES FROM ('2024-01-01 00:00:00') TO ('2025-01-01 00:00:00');


--
-- Name: action_events id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_events ALTER COLUMN id SET DEFAULT nextval('public.action_events_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: lookup_tables id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lookup_tables ALTER COLUMN id SET DEFAULT nextval('public.lookup_tables_id_seq'::regclass);


--
-- Name: main_tables id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.main_tables ALTER COLUMN id SET DEFAULT nextval('public.main_tables_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: nova_field_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nova_field_attachments ALTER COLUMN id SET DEFAULT nextval('public.nova_field_attachments_id_seq'::regclass);


--
-- Name: nova_pending_field_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nova_pending_field_attachments ALTER COLUMN id SET DEFAULT nextval('public.nova_pending_field_attachments_id_seq'::regclass);


--
-- Name: prompt_outputs_partitioned id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs_partitioned ALTER COLUMN id SET DEFAULT nextval('public.prompt_outputs_partitioned_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: accessui accessui_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accessui
    ADD CONSTRAINT accessui_pkey PRIMARY KEY (id);


--
-- Name: accessui accessui_ui_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accessui
    ADD CONSTRAINT accessui_ui_name_key UNIQUE (ui_name);


--
-- Name: accuracylevels accuracylevels_accuracy_level_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accuracylevels
    ADD CONSTRAINT accuracylevels_accuracy_level_key UNIQUE (accuracy_level);


--
-- Name: accuracylevels accuracylevels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accuracylevels
    ADD CONSTRAINT accuracylevels_pkey PRIMARY KEY (id);


--
-- Name: action_events action_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_events
    ADD CONSTRAINT action_events_pkey PRIMARY KEY (id);


--
-- Name: actionability_levels actionability_levels_actionability_level_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actionability_levels
    ADD CONSTRAINT actionability_levels_actionability_level_key UNIQUE (actionability_level);


--
-- Name: actionability_levels actionability_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actionability_levels
    ADD CONSTRAINT actionability_levels_pkey PRIMARY KEY (id);


--
-- Name: activitystatus activitystatus_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activitystatus
    ADD CONSTRAINT activitystatus_pkey PRIMARY KEY (id);


--
-- Name: activitystatus activitystatus_status_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activitystatus
    ADD CONSTRAINT activitystatus_status_name_key UNIQUE (status_name);


--
-- Name: agentgroups agentgroups_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agentgroups
    ADD CONSTRAINT agentgroups_group_name_key UNIQUE (group_name);


--
-- Name: agentgroups agentgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agentgroups
    ADD CONSTRAINT agentgroups_pkey PRIMARY KEY (id);


--
-- Name: apiintegrations apiintegrations_integration_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.apiintegrations
    ADD CONSTRAINT apiintegrations_integration_name_key UNIQUE (integration_name);


--
-- Name: apiintegrations apiintegrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.apiintegrations
    ADD CONSTRAINT apiintegrations_pkey PRIMARY KEY (id);


--
-- Name: automation_levels automation_levels_automation_level_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.automation_levels
    ADD CONSTRAINT automation_levels_automation_level_key UNIQUE (automation_level);


--
-- Name: automation_levels automation_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.automation_levels
    ADD CONSTRAINT automation_levels_pkey PRIMARY KEY (id);


--
-- Name: backupstatuses backupstatuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.backupstatuses
    ADD CONSTRAINT backupstatuses_pkey PRIMARY KEY (id);


--
-- Name: backupstatuses backupstatuses_status_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.backupstatuses
    ADD CONSTRAINT backupstatuses_status_name_key UNIQUE (status_name);


--
-- Name: business_system_tags business_system_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.business_system_tags
    ADD CONSTRAINT business_system_tags_pkey PRIMARY KEY (id);


--
-- Name: business_system_tags business_system_tags_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.business_system_tags
    ADD CONSTRAINT business_system_tags_tag_name_key UNIQUE (tag_name);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: cc_license_types cc_license_types_license_type_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_license_types
    ADD CONSTRAINT cc_license_types_license_type_key UNIQUE (license_type);


--
-- Name: cc_license_types cc_license_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cc_license_types
    ADD CONSTRAINT cc_license_types_pkey PRIMARY KEY (id);


--
-- Name: chatgpt_output_formats chatgpt_output_formats_format_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chatgpt_output_formats
    ADD CONSTRAINT chatgpt_output_formats_format_name_key UNIQUE (format_name);


--
-- Name: chatgpt_output_formats chatgpt_output_formats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chatgpt_output_formats
    ADD CONSTRAINT chatgpt_output_formats_pkey PRIMARY KEY (id);


--
-- Name: citiesinisrael citiesinisrael_city_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.citiesinisrael
    ADD CONSTRAINT citiesinisrael_city_name_key UNIQUE (city_name);


--
-- Name: citiesinisrael citiesinisrael_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.citiesinisrael
    ADD CONSTRAINT citiesinisrael_pkey PRIMARY KEY (id);


--
-- Name: cost_levels cost_levels_cost_level_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_levels
    ADD CONSTRAINT cost_levels_cost_level_key UNIQUE (cost_level);


--
-- Name: cost_levels cost_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_levels
    ADD CONSTRAINT cost_levels_pkey PRIMARY KEY (id);


--
-- Name: creation_account creation_account_account_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.creation_account
    ADD CONSTRAINT creation_account_account_email_key UNIQUE (account_email);


--
-- Name: creation_account creation_account_account_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.creation_account
    ADD CONSTRAINT creation_account_account_name_key UNIQUE (account_name);


--
-- Name: creation_account creation_account_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.creation_account
    ADD CONSTRAINT creation_account_pkey PRIMARY KEY (id);


--
-- Name: custom_gpts_agent_groups custom_gpts_agent_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_agent_groups
    ADD CONSTRAINT custom_gpts_agent_groups_pkey PRIMARY KEY (custom_gpt_id, agent_group_id);


--
-- Name: custom_gpts_backup_statuses custom_gpts_backup_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_backup_statuses
    ADD CONSTRAINT custom_gpts_backup_statuses_pkey PRIMARY KEY (custom_gpt_id, backup_status_id);


--
-- Name: custom_gpts_business_system_tags custom_gpts_business_system_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_business_system_tags
    ADD CONSTRAINT custom_gpts_business_system_tags_pkey PRIMARY KEY (custom_gpt_id, business_system_tag_id);


--
-- Name: custom_gpts_capabilities custom_gpts_capabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_capabilities
    ADD CONSTRAINT custom_gpts_capabilities_pkey PRIMARY KEY (custom_gpt_id, capability_id);


--
-- Name: custom_gpts_data_retention_plans custom_gpts_data_retention_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_data_retention_plans
    ADD CONSTRAINT custom_gpts_data_retention_plans_pkey PRIMARY KEY (custom_gpt_id, data_retention_plan_id);


--
-- Name: custom_gpts_data_sharing_groups custom_gpts_data_sharing_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_data_sharing_groups
    ADD CONSTRAINT custom_gpts_data_sharing_groups_pkey PRIMARY KEY (custom_gpt_id, data_sharing_group_id);


--
-- Name: custom_gpts_gpt_privacy_settings custom_gpts_gpt_privacy_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_gpt_privacy_settings
    ADD CONSTRAINT custom_gpts_gpt_privacy_settings_pkey PRIMARY KEY (custom_gpt_id, gpt_privacy_setting_id);


--
-- Name: custom_gpts_gpt_review_statuses custom_gpts_gpt_review_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_gpt_review_statuses
    ADD CONSTRAINT custom_gpts_gpt_review_statuses_pkey PRIMARY KEY (custom_gpt_id, gpt_review_status_id);


--
-- Name: custom_gpts_media_types custom_gpts_media_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_media_types
    ADD CONSTRAINT custom_gpts_media_types_pkey PRIMARY KEY (custom_gpt_id, media_type_id);


--
-- Name: custom_gpts_output_types custom_gpts_output_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_output_types
    ADD CONSTRAINT custom_gpts_output_types_pkey PRIMARY KEY (custom_gpt_id, output_type_id);


--
-- Name: custom_gpts custom_gpts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts
    ADD CONSTRAINT custom_gpts_pkey PRIMARY KEY (id);


--
-- Name: custom_gpts_programming_languages custom_gpts_programming_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_programming_languages
    ADD CONSTRAINT custom_gpts_programming_languages_pkey PRIMARY KEY (custom_gpt_id, programming_language_id);


--
-- Name: custom_gpts_prompt_library custom_gpts_prompt_library_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_prompt_library
    ADD CONSTRAINT custom_gpts_prompt_library_pkey PRIMARY KEY (custom_gpt_id, prompt_library_id);


--
-- Name: custom_gpts_use_cases custom_gpts_use_cases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_use_cases
    ADD CONSTRAINT custom_gpts_use_cases_pkey PRIMARY KEY (custom_gpt_id, use_case_id);


--
-- Name: custom_gpts custom_gpts_user_id_gpt_name_version_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts
    ADD CONSTRAINT custom_gpts_user_id_gpt_name_version_key UNIQUE (user_id, gpt_name, version);


--
-- Name: custom_gpts_version_history custom_gpts_version_history_custom_gpt_id_version_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_version_history
    ADD CONSTRAINT custom_gpts_version_history_custom_gpt_id_version_key UNIQUE (custom_gpt_id, version);


--
-- Name: custom_gpts_version_history custom_gpts_version_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_version_history
    ADD CONSTRAINT custom_gpts_version_history_pkey PRIMARY KEY (id);


--
-- Name: customgptlibraries customgptlibraries_library_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customgptlibraries
    ADD CONSTRAINT customgptlibraries_library_name_key UNIQUE (library_name);


--
-- Name: customgptlibraries customgptlibraries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customgptlibraries
    ADD CONSTRAINT customgptlibraries_pkey PRIMARY KEY (id);


--
-- Name: data_retention_plans data_retention_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_retention_plans
    ADD CONSTRAINT data_retention_plans_pkey PRIMARY KEY (id);


--
-- Name: data_retention_plans data_retention_plans_plan_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_retention_plans
    ADD CONSTRAINT data_retention_plans_plan_name_key UNIQUE (plan_name);


--
-- Name: data_sensitivity_levels data_sensitivity_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_sensitivity_levels
    ADD CONSTRAINT data_sensitivity_levels_pkey PRIMARY KEY (id);


--
-- Name: data_sensitivity_levels data_sensitivity_levels_sensitivity_level_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_sensitivity_levels
    ADD CONSTRAINT data_sensitivity_levels_sensitivity_level_key UNIQUE (sensitivity_level);


--
-- Name: data_sharing_groups data_sharing_groups_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_sharing_groups
    ADD CONSTRAINT data_sharing_groups_group_name_key UNIQUE (group_name);


--
-- Name: data_sharing_groups data_sharing_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_sharing_groups
    ADD CONSTRAINT data_sharing_groups_pkey PRIMARY KEY (id);


--
-- Name: data_size_classifiers data_size_classifiers_classifier_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_size_classifiers
    ADD CONSTRAINT data_size_classifiers_classifier_name_key UNIQUE (classifier_name);


--
-- Name: data_size_classifiers data_size_classifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_size_classifiers
    ADD CONSTRAINT data_size_classifiers_pkey PRIMARY KEY (id);


--
-- Name: data_source_classifiers data_source_classifiers_classifier_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_source_classifiers
    ADD CONSTRAINT data_source_classifiers_classifier_name_key UNIQUE (classifier_name);


--
-- Name: data_source_classifiers data_source_classifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_source_classifiers
    ADD CONSTRAINT data_source_classifiers_pkey PRIMARY KEY (id);


--
-- Name: data_types data_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_types
    ADD CONSTRAINT data_types_pkey PRIMARY KEY (id);


--
-- Name: data_types data_types_type_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_types
    ADD CONSTRAINT data_types_type_name_key UNIQUE (type_name);


--
-- Name: data_viz_formats data_viz_formats_format_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_viz_formats
    ADD CONSTRAINT data_viz_formats_format_name_key UNIQUE (format_name);


--
-- Name: data_viz_formats data_viz_formats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_viz_formats
    ADD CONSTRAINT data_viz_formats_pkey PRIMARY KEY (id);


--
-- Name: experimentation_methodologies experimentation_methodologies_methodology_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experimentation_methodologies
    ADD CONSTRAINT experimentation_methodologies_methodology_name_key UNIQUE (methodology_name);


--
-- Name: experimentation_methodologies experimentation_methodologies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.experimentation_methodologies
    ADD CONSTRAINT experimentation_methodologies_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: file_formats file_formats_format_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.file_formats
    ADD CONSTRAINT file_formats_format_name_key UNIQUE (format_name);


--
-- Name: file_formats file_formats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.file_formats
    ADD CONSTRAINT file_formats_pkey PRIMARY KEY (id);


--
-- Name: followup_activities followup_activities_activity_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.followup_activities
    ADD CONSTRAINT followup_activities_activity_name_key UNIQUE (activity_name);


--
-- Name: followup_activities followup_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.followup_activities
    ADD CONSTRAINT followup_activities_pkey PRIMARY KEY (id);


--
-- Name: github_plans github_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.github_plans
    ADD CONSTRAINT github_plans_pkey PRIMARY KEY (id);


--
-- Name: github_plans github_plans_plan_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.github_plans
    ADD CONSTRAINT github_plans_plan_name_key UNIQUE (plan_name);


--
-- Name: gpt_platforms gpt_platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gpt_platforms
    ADD CONSTRAINT gpt_platforms_pkey PRIMARY KEY (id);


--
-- Name: gpt_platforms gpt_platforms_platform_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gpt_platforms
    ADD CONSTRAINT gpt_platforms_platform_name_key UNIQUE (platform_name);


--
-- Name: gpt_privacy_settings gpt_privacy_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gpt_privacy_settings
    ADD CONSTRAINT gpt_privacy_settings_pkey PRIMARY KEY (id);


--
-- Name: gpt_privacy_settings gpt_privacy_settings_setting_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gpt_privacy_settings
    ADD CONSTRAINT gpt_privacy_settings_setting_name_key UNIQUE (setting_name);


--
-- Name: gpt_tags gpt_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gpt_tags
    ADD CONSTRAINT gpt_tags_pkey PRIMARY KEY (id);


--
-- Name: gpt_tags gpt_tags_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gpt_tags
    ADD CONSTRAINT gpt_tags_tag_name_key UNIQUE (tag_name);


--
-- Name: gpt_tasks gpt_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gpt_tasks
    ADD CONSTRAINT gpt_tasks_pkey PRIMARY KEY (id);


--
-- Name: gpt_tasks gpt_tasks_task_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gpt_tasks
    ADD CONSTRAINT gpt_tasks_task_name_key UNIQUE (task_name);


--
-- Name: gptcapabilities gptcapabilities_capability_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gptcapabilities
    ADD CONSTRAINT gptcapabilities_capability_name_key UNIQUE (capability_name);


--
-- Name: gptcapabilities gptcapabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gptcapabilities
    ADD CONSTRAINT gptcapabilities_pkey PRIMARY KEY (id);


--
-- Name: gptconfigtypes gptconfigtypes_config_type_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gptconfigtypes
    ADD CONSTRAINT gptconfigtypes_config_type_name_key UNIQUE (config_type_name);


--
-- Name: gptconfigtypes gptconfigtypes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gptconfigtypes
    ADD CONSTRAINT gptconfigtypes_pkey PRIMARY KEY (id);


--
-- Name: gptmodels gptmodels_model_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gptmodels
    ADD CONSTRAINT gptmodels_model_name_key UNIQUE (model_name);


--
-- Name: gptmodels gptmodels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gptmodels
    ADD CONSTRAINT gptmodels_pkey PRIMARY KEY (id);


--
-- Name: gptoutputreviewsdone gptoutputreviewsdone_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gptoutputreviewsdone
    ADD CONSTRAINT gptoutputreviewsdone_pkey PRIMARY KEY (id);


--
-- Name: gptoutputreviewsdone gptoutputreviewsdone_review_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gptoutputreviewsdone
    ADD CONSTRAINT gptoutputreviewsdone_review_name_key UNIQUE (review_name);


--
-- Name: gptratings gptratings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gptratings
    ADD CONSTRAINT gptratings_pkey PRIMARY KEY (id);


--
-- Name: gptratings gptratings_rating_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gptratings
    ADD CONSTRAINT gptratings_rating_name_key UNIQUE (rating_name);


--
-- Name: gptresponsetimes gptresponsetimes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gptresponsetimes
    ADD CONSTRAINT gptresponsetimes_pkey PRIMARY KEY (id);


--
-- Name: gptresponsetimes gptresponsetimes_response_time_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gptresponsetimes
    ADD CONSTRAINT gptresponsetimes_response_time_name_key UNIQUE (response_time_name);


--
-- Name: gptreviewstatuses gptreviewstatuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gptreviewstatuses
    ADD CONSTRAINT gptreviewstatuses_pkey PRIMARY KEY (id);


--
-- Name: gptreviewstatuses gptreviewstatuses_status_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gptreviewstatuses
    ADD CONSTRAINT gptreviewstatuses_status_name_key UNIQUE (status_name);


--
-- Name: gpts_cats gpts_cats_category_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gpts_cats
    ADD CONSTRAINT gpts_cats_category_name_key UNIQUE (category_name);


--
-- Name: gpts_cats gpts_cats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gpts_cats
    ADD CONSTRAINT gpts_cats_pkey PRIMARY KEY (id);


--
-- Name: gptsoftwareplatforms gptsoftwareplatforms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gptsoftwareplatforms
    ADD CONSTRAINT gptsoftwareplatforms_pkey PRIMARY KEY (id);


--
-- Name: gptsoftwareplatforms gptsoftwareplatforms_platform_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gptsoftwareplatforms
    ADD CONSTRAINT gptsoftwareplatforms_platform_name_key UNIQUE (platform_name);


--
-- Name: industries_list industries_list_industry_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.industries_list
    ADD CONSTRAINT industries_list_industry_name_key UNIQUE (industry_name);


--
-- Name: industries_list industries_list_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.industries_list
    ADD CONSTRAINT industries_list_pkey PRIMARY KEY (id);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: knowledge_types knowledge_types_knowledge_type_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.knowledge_types
    ADD CONSTRAINT knowledge_types_knowledge_type_name_key UNIQUE (knowledge_type_name);


--
-- Name: knowledge_types knowledge_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.knowledge_types
    ADD CONSTRAINT knowledge_types_pkey PRIMARY KEY (id);


--
-- Name: llms_list llms_list_llm_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.llms_list
    ADD CONSTRAINT llms_list_llm_name_key UNIQUE (llm_name);


--
-- Name: llms_list llms_list_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.llms_list
    ADD CONSTRAINT llms_list_pkey PRIMARY KEY (id);


--
-- Name: lookup_tables lookup_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lookup_tables
    ADD CONSTRAINT lookup_tables_pkey PRIMARY KEY (id);


--
-- Name: main_tables main_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.main_tables
    ADD CONSTRAINT main_tables_pkey PRIMARY KEY (id);


--
-- Name: mdconversionstatus mdconversionstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mdconversionstatus
    ADD CONSTRAINT mdconversionstatus_pkey PRIMARY KEY (id);


--
-- Name: mdconversionstatus mdconversionstatus_status_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mdconversionstatus
    ADD CONSTRAINT mdconversionstatus_status_name_key UNIQUE (status_name);


--
-- Name: mediatypes mediatypes_media_type_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mediatypes
    ADD CONSTRAINT mediatypes_media_type_name_key UNIQUE (media_type_name);


--
-- Name: mediatypes mediatypes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mediatypes
    ADD CONSTRAINT mediatypes_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: nova_field_attachments nova_field_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nova_field_attachments
    ADD CONSTRAINT nova_field_attachments_pkey PRIMARY KEY (id);


--
-- Name: nova_notifications nova_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nova_notifications
    ADD CONSTRAINT nova_notifications_pkey PRIMARY KEY (id);


--
-- Name: nova_pending_field_attachments nova_pending_field_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nova_pending_field_attachments
    ADD CONSTRAINT nova_pending_field_attachments_pkey PRIMARY KEY (id);


--
-- Name: opensource_licenses opensource_licenses_license_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opensource_licenses
    ADD CONSTRAINT opensource_licenses_license_name_key UNIQUE (license_name);


--
-- Name: opensource_licenses opensource_licenses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opensource_licenses
    ADD CONSTRAINT opensource_licenses_pkey PRIMARY KEY (id);


--
-- Name: output_types output_types_output_type_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.output_types
    ADD CONSTRAINT output_types_output_type_name_key UNIQUE (output_type_name);


--
-- Name: output_types output_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.output_types
    ADD CONSTRAINT output_types_pkey PRIMARY KEY (id);


--
-- Name: outputqualityassessment outputqualityassessment_assessment_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.outputqualityassessment
    ADD CONSTRAINT outputqualityassessment_assessment_name_key UNIQUE (assessment_name);


--
-- Name: outputqualityassessment outputqualityassessment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.outputqualityassessment
    ADD CONSTRAINT outputqualityassessment_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: post_prompt_actions post_prompt_actions_action_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_prompt_actions
    ADD CONSTRAINT post_prompt_actions_action_name_key UNIQUE (action_name);


--
-- Name: post_prompt_actions post_prompt_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_prompt_actions
    ADD CONSTRAINT post_prompt_actions_pkey PRIMARY KEY (id);


--
-- Name: programminglanguages programminglanguages_language_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programminglanguages
    ADD CONSTRAINT programminglanguages_language_name_key UNIQUE (language_name);


--
-- Name: programminglanguages programminglanguages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programminglanguages
    ADD CONSTRAINT programminglanguages_pkey PRIMARY KEY (id);


--
-- Name: project_tags project_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_tags
    ADD CONSTRAINT project_tags_pkey PRIMARY KEY (id);


--
-- Name: project_tags project_tags_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_tags
    ADD CONSTRAINT project_tags_tag_name_key UNIQUE (tag_name);


--
-- Name: prompt_library prompt_library_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_library
    ADD CONSTRAINT prompt_library_pkey PRIMARY KEY (id);


--
-- Name: prompt_library_programming_languages prompt_library_programming_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_library_programming_languages
    ADD CONSTRAINT prompt_library_programming_languages_pkey PRIMARY KEY (prompt_library_id, programming_language_id);


--
-- Name: prompt_library_use_cases prompt_library_use_cases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_library_use_cases
    ADD CONSTRAINT prompt_library_use_cases_pkey PRIMARY KEY (prompt_library_id, use_case_id);


--
-- Name: prompt_library prompt_library_user_id_prompt_text_version_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_library
    ADD CONSTRAINT prompt_library_user_id_prompt_text_version_key UNIQUE (user_id, prompt_text, version);


--
-- Name: prompt_library_version_history prompt_library_version_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_library_version_history
    ADD CONSTRAINT prompt_library_version_history_pkey PRIMARY KEY (id);


--
-- Name: prompt_library_version_history prompt_library_version_history_prompt_library_id_version_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_library_version_history
    ADD CONSTRAINT prompt_library_version_history_prompt_library_id_version_key UNIQUE (prompt_library_id, version);


--
-- Name: prompt_outputs_partitioned prompt_outputs_partitioned_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs_partitioned
    ADD CONSTRAINT prompt_outputs_partitioned_pkey PRIMARY KEY (id, created_at);


--
-- Name: prompt_outputs prompt_outputs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs
    ADD CONSTRAINT prompt_outputs_pkey PRIMARY KEY (id);


--
-- Name: prompt_outputs_y2023 prompt_outputs_y2023_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs_y2023
    ADD CONSTRAINT prompt_outputs_y2023_pkey PRIMARY KEY (id, created_at);


--
-- Name: prompt_outputs_y2024 prompt_outputs_y2024_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs_y2024
    ADD CONSTRAINT prompt_outputs_y2024_pkey PRIMARY KEY (id, created_at);


--
-- Name: promptstages promptstages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.promptstages
    ADD CONSTRAINT promptstages_pkey PRIMARY KEY (id);


--
-- Name: promptstages promptstages_stage_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.promptstages
    ADD CONSTRAINT promptstages_stage_name_key UNIQUE (stage_name);


--
-- Name: publication_platforms publication_platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.publication_platforms
    ADD CONSTRAINT publication_platforms_pkey PRIMARY KEY (id);


--
-- Name: publication_platforms publication_platforms_platform_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.publication_platforms
    ADD CONSTRAINT publication_platforms_platform_name_key UNIQUE (platform_name);


--
-- Name: qc_activities qc_activities_activity_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qc_activities
    ADD CONSTRAINT qc_activities_activity_name_key UNIQUE (activity_name);


--
-- Name: qc_activities qc_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qc_activities
    ADD CONSTRAINT qc_activities_pkey PRIMARY KEY (id);


--
-- Name: reading_levels reading_levels_level_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reading_levels
    ADD CONSTRAINT reading_levels_level_name_key UNIQUE (level_name);


--
-- Name: reading_levels reading_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reading_levels
    ADD CONSTRAINT reading_levels_pkey PRIMARY KEY (id);


--
-- Name: reference_sources reference_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reference_sources
    ADD CONSTRAINT reference_sources_pkey PRIMARY KEY (id);


--
-- Name: reference_sources reference_sources_source_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reference_sources
    ADD CONSTRAINT reference_sources_source_name_key UNIQUE (source_name);


--
-- Name: relationdb_techs relationdb_techs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relationdb_techs
    ADD CONSTRAINT relationdb_techs_pkey PRIMARY KEY (id);


--
-- Name: relationdb_techs relationdb_techs_tech_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relationdb_techs
    ADD CONSTRAINT relationdb_techs_tech_name_key UNIQUE (tech_name);


--
-- Name: review_priority_levels review_priority_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.review_priority_levels
    ADD CONSTRAINT review_priority_levels_pkey PRIMARY KEY (id);


--
-- Name: review_priority_levels review_priority_levels_priority_level_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.review_priority_levels
    ADD CONSTRAINT review_priority_levels_priority_level_name_key UNIQUE (priority_level_name);


--
-- Name: review_statuses review_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.review_statuses
    ADD CONSTRAINT review_statuses_pkey PRIMARY KEY (id);


--
-- Name: review_statuses review_statuses_status_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.review_statuses
    ADD CONSTRAINT review_statuses_status_name_key UNIQUE (status_name);


--
-- Name: saas_sub_models saas_sub_models_model_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saas_sub_models
    ADD CONSTRAINT saas_sub_models_model_name_key UNIQUE (model_name);


--
-- Name: saas_sub_models saas_sub_models_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saas_sub_models
    ADD CONSTRAINT saas_sub_models_pkey PRIMARY KEY (id);


--
-- Name: sentiment_classifiers sentiment_classifiers_classifier_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sentiment_classifiers
    ADD CONSTRAINT sentiment_classifiers_classifier_name_key UNIQUE (classifier_name);


--
-- Name: sentiment_classifiers sentiment_classifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sentiment_classifiers
    ADD CONSTRAINT sentiment_classifiers_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: system_unique_ids system_unique_ids_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.system_unique_ids
    ADD CONSTRAINT system_unique_ids_pkey PRIMARY KEY (id);


--
-- Name: system_unique_ids system_unique_ids_unique_id_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.system_unique_ids
    ADD CONSTRAINT system_unique_ids_unique_id_name_key UNIQUE (unique_id_name);


--
-- Name: systemmodules systemmodules_module_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.systemmodules
    ADD CONSTRAINT systemmodules_module_name_key UNIQUE (module_name);


--
-- Name: systemmodules systemmodules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.systemmodules
    ADD CONSTRAINT systemmodules_pkey PRIMARY KEY (id);


--
-- Name: tabletypes tabletypes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tabletypes
    ADD CONSTRAINT tabletypes_pkey PRIMARY KEY (id);


--
-- Name: tabletypes tabletypes_table_type_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tabletypes
    ADD CONSTRAINT tabletypes_table_type_name_key UNIQUE (table_type_name);


--
-- Name: targetaudiences targetaudiences_audience_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.targetaudiences
    ADD CONSTRAINT targetaudiences_audience_name_key UNIQUE (audience_name);


--
-- Name: targetaudiences targetaudiences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.targetaudiences
    ADD CONSTRAINT targetaudiences_pkey PRIMARY KEY (id);


--
-- Name: taxonomy_organisation taxonomy_organisation_organisation_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taxonomy_organisation
    ADD CONSTRAINT taxonomy_organisation_organisation_name_key UNIQUE (organisation_name);


--
-- Name: taxonomy_organisation taxonomy_organisation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taxonomy_organisation
    ADD CONSTRAINT taxonomy_organisation_pkey PRIMARY KEY (id);


--
-- Name: urgency_levels urgency_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urgency_levels
    ADD CONSTRAINT urgency_levels_pkey PRIMARY KEY (id);


--
-- Name: urgency_levels urgency_levels_urgency_level_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urgency_levels
    ADD CONSTRAINT urgency_levels_urgency_level_name_key UNIQUE (urgency_level_name);


--
-- Name: usecases usecases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usecases
    ADD CONSTRAINT usecases_pkey PRIMARY KEY (id);


--
-- Name: usecases usecases_usecase_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usecases
    ADD CONSTRAINT usecases_usecase_name_key UNIQUE (usecase_name);


--
-- Name: userfeedback_types userfeedback_types_feedback_type_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userfeedback_types
    ADD CONSTRAINT userfeedback_types_feedback_type_name_key UNIQUE (feedback_type_name);


--
-- Name: userfeedback_types userfeedback_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userfeedback_types
    ADD CONSTRAINT userfeedback_types_pkey PRIMARY KEY (id);


--
-- Name: userroles userroles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userroles
    ADD CONSTRAINT userroles_pkey PRIMARY KEY (id);


--
-- Name: userroles userroles_role_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userroles
    ADD CONSTRAINT userroles_role_name_key UNIQUE (role_name);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: worldcountries worldcountries_country_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.worldcountries
    ADD CONSTRAINT worldcountries_country_name_key UNIQUE (country_name);


--
-- Name: worldcountries worldcountries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.worldcountries
    ADD CONSTRAINT worldcountries_pkey PRIMARY KEY (id);


--
-- Name: worldlanguages worldlanguages_language_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.worldlanguages
    ADD CONSTRAINT worldlanguages_language_name_key UNIQUE (language_name);


--
-- Name: worldlanguages worldlanguages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.worldlanguages
    ADD CONSTRAINT worldlanguages_pkey PRIMARY KEY (id);


--
-- Name: action_events_actionable_type_actionable_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX action_events_actionable_type_actionable_id_index ON public.action_events USING btree (actionable_type, actionable_id);


--
-- Name: action_events_batch_id_model_type_model_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX action_events_batch_id_model_type_model_id_index ON public.action_events USING btree (batch_id, model_type, model_id);


--
-- Name: action_events_target_type_target_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX action_events_target_type_target_id_index ON public.action_events USING btree (target_type, target_id);


--
-- Name: action_events_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX action_events_user_id_index ON public.action_events USING btree (user_id);


--
-- Name: idx_custom_gpts_composite; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_custom_gpts_composite ON public.custom_gpts USING btree (user_id, gpt_name, importance, created_at);


--
-- Name: idx_custom_gpts_gpt_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_custom_gpts_gpt_name ON public.custom_gpts USING btree (gpt_name);


--
-- Name: idx_custom_gpts_prompt_library_custom_gpt_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_custom_gpts_prompt_library_custom_gpt_id ON public.custom_gpts_prompt_library USING btree (custom_gpt_id);


--
-- Name: idx_custom_gpts_prompt_library_prompt_library_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_custom_gpts_prompt_library_prompt_library_id ON public.custom_gpts_prompt_library USING btree (prompt_library_id);


--
-- Name: idx_custom_gpts_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_custom_gpts_user_id ON public.custom_gpts USING btree (user_id);


--
-- Name: idx_prompt_library_composite; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_prompt_library_composite ON public.prompt_library USING btree (user_id, rating, display_in_library, created_at);


--
-- Name: idx_prompt_library_summary; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_prompt_library_summary ON public.prompt_library USING btree (summary);


--
-- Name: idx_prompt_library_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_prompt_library_user_id ON public.prompt_library USING btree (user_id);


--
-- Name: idx_prompt_outputs_composite; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_prompt_outputs_composite ON public.prompt_outputs USING btree (user_id, created_at, accuracy_assessment_id, review_urgency_id);


--
-- Name: idx_prompt_outputs_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_prompt_outputs_created_at ON public.prompt_outputs USING btree (created_at);


--
-- Name: idx_prompt_outputs_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_prompt_outputs_user_id ON public.prompt_outputs USING btree (user_id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: nova_field_attachments_attachable_type_attachable_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nova_field_attachments_attachable_type_attachable_id_index ON public.nova_field_attachments USING btree (attachable_type, attachable_id);


--
-- Name: nova_field_attachments_url_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nova_field_attachments_url_index ON public.nova_field_attachments USING btree (url);


--
-- Name: nova_notifications_notifiable_type_notifiable_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nova_notifications_notifiable_type_notifiable_id_index ON public.nova_notifications USING btree (notifiable_type, notifiable_id);


--
-- Name: nova_pending_field_attachments_draft_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nova_pending_field_attachments_draft_id_index ON public.nova_pending_field_attachments USING btree (draft_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: prompt_outputs_y2023_pkey; Type: INDEX ATTACH; Schema: public; Owner: -
--

ALTER INDEX public.prompt_outputs_partitioned_pkey ATTACH PARTITION public.prompt_outputs_y2023_pkey;


--
-- Name: prompt_outputs_y2024_pkey; Type: INDEX ATTACH; Schema: public; Owner: -
--

ALTER INDEX public.prompt_outputs_partitioned_pkey ATTACH PARTITION public.prompt_outputs_y2024_pkey;


--
-- Name: custom_gpts custom_gpts_access_ui_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts
    ADD CONSTRAINT custom_gpts_access_ui_id_fkey FOREIGN KEY (access_ui_id) REFERENCES public.accessui(id) ON DELETE CASCADE;


--
-- Name: custom_gpts custom_gpts_activity_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts
    ADD CONSTRAINT custom_gpts_activity_status_id_fkey FOREIGN KEY (activity_status_id) REFERENCES public.activitystatus(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_agent_groups custom_gpts_agent_groups_agent_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_agent_groups
    ADD CONSTRAINT custom_gpts_agent_groups_agent_group_id_fkey FOREIGN KEY (agent_group_id) REFERENCES public.agentgroups(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_agent_groups custom_gpts_agent_groups_custom_gpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_agent_groups
    ADD CONSTRAINT custom_gpts_agent_groups_custom_gpt_id_fkey FOREIGN KEY (custom_gpt_id) REFERENCES public.custom_gpts(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_backup_statuses custom_gpts_backup_statuses_backup_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_backup_statuses
    ADD CONSTRAINT custom_gpts_backup_statuses_backup_status_id_fkey FOREIGN KEY (backup_status_id) REFERENCES public.backupstatuses(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_backup_statuses custom_gpts_backup_statuses_custom_gpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_backup_statuses
    ADD CONSTRAINT custom_gpts_backup_statuses_custom_gpt_id_fkey FOREIGN KEY (custom_gpt_id) REFERENCES public.custom_gpts(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_business_system_tags custom_gpts_business_system_tags_business_system_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_business_system_tags
    ADD CONSTRAINT custom_gpts_business_system_tags_business_system_tag_id_fkey FOREIGN KEY (business_system_tag_id) REFERENCES public.business_system_tags(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_business_system_tags custom_gpts_business_system_tags_custom_gpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_business_system_tags
    ADD CONSTRAINT custom_gpts_business_system_tags_custom_gpt_id_fkey FOREIGN KEY (custom_gpt_id) REFERENCES public.custom_gpts(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_capabilities custom_gpts_capabilities_capability_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_capabilities
    ADD CONSTRAINT custom_gpts_capabilities_capability_id_fkey FOREIGN KEY (capability_id) REFERENCES public.gptcapabilities(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_capabilities custom_gpts_capabilities_custom_gpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_capabilities
    ADD CONSTRAINT custom_gpts_capabilities_custom_gpt_id_fkey FOREIGN KEY (custom_gpt_id) REFERENCES public.custom_gpts(id) ON DELETE CASCADE;


--
-- Name: custom_gpts custom_gpts_configuration_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts
    ADD CONSTRAINT custom_gpts_configuration_type_id_fkey FOREIGN KEY (configuration_type_id) REFERENCES public.gptconfigtypes(id) ON DELETE CASCADE;


--
-- Name: custom_gpts custom_gpts_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts
    ADD CONSTRAINT custom_gpts_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: custom_gpts custom_gpts_creation_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts
    ADD CONSTRAINT custom_gpts_creation_account_id_fkey FOREIGN KEY (creation_account_id) REFERENCES public.creation_account(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_data_retention_plans custom_gpts_data_retention_plans_custom_gpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_data_retention_plans
    ADD CONSTRAINT custom_gpts_data_retention_plans_custom_gpt_id_fkey FOREIGN KEY (custom_gpt_id) REFERENCES public.custom_gpts(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_data_retention_plans custom_gpts_data_retention_plans_data_retention_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_data_retention_plans
    ADD CONSTRAINT custom_gpts_data_retention_plans_data_retention_plan_id_fkey FOREIGN KEY (data_retention_plan_id) REFERENCES public.data_retention_plans(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_data_sharing_groups custom_gpts_data_sharing_groups_custom_gpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_data_sharing_groups
    ADD CONSTRAINT custom_gpts_data_sharing_groups_custom_gpt_id_fkey FOREIGN KEY (custom_gpt_id) REFERENCES public.custom_gpts(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_data_sharing_groups custom_gpts_data_sharing_groups_data_sharing_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_data_sharing_groups
    ADD CONSTRAINT custom_gpts_data_sharing_groups_data_sharing_group_id_fkey FOREIGN KEY (data_sharing_group_id) REFERENCES public.data_sharing_groups(id) ON DELETE CASCADE;


--
-- Name: custom_gpts custom_gpts_github_release_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts
    ADD CONSTRAINT custom_gpts_github_release_status_id_fkey FOREIGN KEY (github_release_status_id) REFERENCES public.github_plans(id) ON DELETE SET NULL;


--
-- Name: custom_gpts custom_gpts_gpt_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts
    ADD CONSTRAINT custom_gpts_gpt_model_id_fkey FOREIGN KEY (gpt_model_id) REFERENCES public.gptmodels(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_gpt_privacy_settings custom_gpts_gpt_privacy_settings_custom_gpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_gpt_privacy_settings
    ADD CONSTRAINT custom_gpts_gpt_privacy_settings_custom_gpt_id_fkey FOREIGN KEY (custom_gpt_id) REFERENCES public.custom_gpts(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_gpt_privacy_settings custom_gpts_gpt_privacy_settings_gpt_privacy_setting_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_gpt_privacy_settings
    ADD CONSTRAINT custom_gpts_gpt_privacy_settings_gpt_privacy_setting_id_fkey FOREIGN KEY (gpt_privacy_setting_id) REFERENCES public.gpt_privacy_settings(id) ON DELETE CASCADE;


--
-- Name: custom_gpts custom_gpts_gpt_rating_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts
    ADD CONSTRAINT custom_gpts_gpt_rating_id_fkey FOREIGN KEY (gpt_rating_id) REFERENCES public.gptratings(id) ON DELETE SET NULL;


--
-- Name: custom_gpts_gpt_review_statuses custom_gpts_gpt_review_statuses_custom_gpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_gpt_review_statuses
    ADD CONSTRAINT custom_gpts_gpt_review_statuses_custom_gpt_id_fkey FOREIGN KEY (custom_gpt_id) REFERENCES public.custom_gpts(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_gpt_review_statuses custom_gpts_gpt_review_statuses_gpt_review_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_gpt_review_statuses
    ADD CONSTRAINT custom_gpts_gpt_review_statuses_gpt_review_status_id_fkey FOREIGN KEY (gpt_review_status_id) REFERENCES public.gptreviewstatuses(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_media_types custom_gpts_media_types_custom_gpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_media_types
    ADD CONSTRAINT custom_gpts_media_types_custom_gpt_id_fkey FOREIGN KEY (custom_gpt_id) REFERENCES public.custom_gpts(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_media_types custom_gpts_media_types_media_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_media_types
    ADD CONSTRAINT custom_gpts_media_types_media_type_id_fkey FOREIGN KEY (media_type_id) REFERENCES public.mediatypes(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_output_types custom_gpts_output_types_custom_gpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_output_types
    ADD CONSTRAINT custom_gpts_output_types_custom_gpt_id_fkey FOREIGN KEY (custom_gpt_id) REFERENCES public.custom_gpts(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_output_types custom_gpts_output_types_output_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_output_types
    ADD CONSTRAINT custom_gpts_output_types_output_type_id_fkey FOREIGN KEY (output_type_id) REFERENCES public.output_types(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_programming_languages custom_gpts_programming_languages_custom_gpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_programming_languages
    ADD CONSTRAINT custom_gpts_programming_languages_custom_gpt_id_fkey FOREIGN KEY (custom_gpt_id) REFERENCES public.custom_gpts(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_programming_languages custom_gpts_programming_languages_programming_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_programming_languages
    ADD CONSTRAINT custom_gpts_programming_languages_programming_language_id_fkey FOREIGN KEY (programming_language_id) REFERENCES public.programminglanguages(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_prompt_library custom_gpts_prompt_library_custom_gpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_prompt_library
    ADD CONSTRAINT custom_gpts_prompt_library_custom_gpt_id_fkey FOREIGN KEY (custom_gpt_id) REFERENCES public.custom_gpts(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_prompt_library custom_gpts_prompt_library_prompt_library_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_prompt_library
    ADD CONSTRAINT custom_gpts_prompt_library_prompt_library_id_fkey FOREIGN KEY (prompt_library_id) REFERENCES public.prompt_library(id) ON DELETE CASCADE;


--
-- Name: custom_gpts custom_gpts_underlying_llm_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts
    ADD CONSTRAINT custom_gpts_underlying_llm_id_fkey FOREIGN KEY (underlying_llm_id) REFERENCES public.llms_list(id) ON DELETE SET NULL;


--
-- Name: custom_gpts custom_gpts_updated_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts
    ADD CONSTRAINT custom_gpts_updated_by_fkey FOREIGN KEY (updated_by) REFERENCES public.users(id);


--
-- Name: custom_gpts_use_cases custom_gpts_use_cases_custom_gpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_use_cases
    ADD CONSTRAINT custom_gpts_use_cases_custom_gpt_id_fkey FOREIGN KEY (custom_gpt_id) REFERENCES public.custom_gpts(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_use_cases custom_gpts_use_cases_use_case_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_use_cases
    ADD CONSTRAINT custom_gpts_use_cases_use_case_id_fkey FOREIGN KEY (use_case_id) REFERENCES public.usecases(id) ON DELETE CASCADE;


--
-- Name: custom_gpts custom_gpts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts
    ADD CONSTRAINT custom_gpts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: custom_gpts_version_history custom_gpts_version_history_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_version_history
    ADD CONSTRAINT custom_gpts_version_history_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: custom_gpts_version_history custom_gpts_version_history_custom_gpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_gpts_version_history
    ADD CONSTRAINT custom_gpts_version_history_custom_gpt_id_fkey FOREIGN KEY (custom_gpt_id) REFERENCES public.custom_gpts(id) ON DELETE CASCADE;


--
-- Name: prompt_library prompt_library_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_library
    ADD CONSTRAINT prompt_library_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: prompt_library_programming_languages prompt_library_programming_languag_programming_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_library_programming_languages
    ADD CONSTRAINT prompt_library_programming_languag_programming_language_id_fkey FOREIGN KEY (programming_language_id) REFERENCES public.programminglanguages(id) ON DELETE CASCADE;


--
-- Name: prompt_library_programming_languages prompt_library_programming_languages_prompt_library_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_library_programming_languages
    ADD CONSTRAINT prompt_library_programming_languages_prompt_library_id_fkey FOREIGN KEY (prompt_library_id) REFERENCES public.prompt_library(id) ON DELETE CASCADE;


--
-- Name: prompt_library prompt_library_updated_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_library
    ADD CONSTRAINT prompt_library_updated_by_fkey FOREIGN KEY (updated_by) REFERENCES public.users(id);


--
-- Name: prompt_library_use_cases prompt_library_use_cases_prompt_library_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_library_use_cases
    ADD CONSTRAINT prompt_library_use_cases_prompt_library_id_fkey FOREIGN KEY (prompt_library_id) REFERENCES public.prompt_library(id) ON DELETE CASCADE;


--
-- Name: prompt_library_use_cases prompt_library_use_cases_use_case_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_library_use_cases
    ADD CONSTRAINT prompt_library_use_cases_use_case_id_fkey FOREIGN KEY (use_case_id) REFERENCES public.usecases(id) ON DELETE CASCADE;


--
-- Name: prompt_library prompt_library_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_library
    ADD CONSTRAINT prompt_library_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: prompt_library_version_history prompt_library_version_history_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_library_version_history
    ADD CONSTRAINT prompt_library_version_history_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: prompt_library_version_history prompt_library_version_history_prompt_library_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_library_version_history
    ADD CONSTRAINT prompt_library_version_history_prompt_library_id_fkey FOREIGN KEY (prompt_library_id) REFERENCES public.prompt_library(id) ON DELETE CASCADE;


--
-- Name: prompt_outputs prompt_outputs_accuracy_assessment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs
    ADD CONSTRAINT prompt_outputs_accuracy_assessment_id_fkey FOREIGN KEY (accuracy_assessment_id) REFERENCES public.accuracylevels(id) ON DELETE SET NULL;


--
-- Name: prompt_outputs prompt_outputs_actionability_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs
    ADD CONSTRAINT prompt_outputs_actionability_id_fkey FOREIGN KEY (actionability_id) REFERENCES public.actionability_levels(id) ON DELETE SET NULL;


--
-- Name: prompt_outputs prompt_outputs_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs
    ADD CONSTRAINT prompt_outputs_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: prompt_outputs prompt_outputs_custom_gpt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs
    ADD CONSTRAINT prompt_outputs_custom_gpt_id_fkey FOREIGN KEY (custom_gpt_id) REFERENCES public.custom_gpts(id) ON DELETE CASCADE;


--
-- Name: prompt_outputs prompt_outputs_data_sensitivity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs
    ADD CONSTRAINT prompt_outputs_data_sensitivity_id_fkey FOREIGN KEY (data_sensitivity_id) REFERENCES public.data_sensitivity_levels(id) ON DELETE SET NULL;


--
-- Name: prompt_outputs prompt_outputs_data_size_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs
    ADD CONSTRAINT prompt_outputs_data_size_id_fkey FOREIGN KEY (data_size_id) REFERENCES public.data_size_classifiers(id) ON DELETE SET NULL;


--
-- Name: prompt_outputs prompt_outputs_md_conversion_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs
    ADD CONSTRAINT prompt_outputs_md_conversion_status_id_fkey FOREIGN KEY (md_conversion_status_id) REFERENCES public.mdconversionstatus(id) ON DELETE SET NULL;


--
-- Name: prompt_outputs prompt_outputs_output_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs
    ADD CONSTRAINT prompt_outputs_output_category_id_fkey FOREIGN KEY (output_category_id) REFERENCES public.gpts_cats(id) ON DELETE SET NULL;


--
-- Name: prompt_outputs prompt_outputs_output_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs
    ADD CONSTRAINT prompt_outputs_output_language_id_fkey FOREIGN KEY (output_language_id) REFERENCES public.worldlanguages(id) ON DELETE SET NULL;


--
-- Name: prompt_outputs prompt_outputs_output_reading_level_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs
    ADD CONSTRAINT prompt_outputs_output_reading_level_id_fkey FOREIGN KEY (output_reading_level_id) REFERENCES public.reading_levels(id) ON DELETE SET NULL;


--
-- Name: prompt_outputs prompt_outputs_prompt_library_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs
    ADD CONSTRAINT prompt_outputs_prompt_library_id_fkey FOREIGN KEY (prompt_library_id) REFERENCES public.prompt_library(id) ON DELETE CASCADE;


--
-- Name: prompt_outputs prompt_outputs_review_priority_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs
    ADD CONSTRAINT prompt_outputs_review_priority_id_fkey FOREIGN KEY (review_priority_id) REFERENCES public.review_priority_levels(id) ON DELETE SET NULL;


--
-- Name: prompt_outputs prompt_outputs_review_urgency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs
    ADD CONSTRAINT prompt_outputs_review_urgency_id_fkey FOREIGN KEY (review_urgency_id) REFERENCES public.urgency_levels(id) ON DELETE SET NULL;


--
-- Name: prompt_outputs prompt_outputs_updated_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs
    ADD CONSTRAINT prompt_outputs_updated_by_fkey FOREIGN KEY (updated_by) REFERENCES public.users(id);


--
-- Name: prompt_outputs prompt_outputs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_outputs
    ADD CONSTRAINT prompt_outputs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Ubuntu 16.4-0ubuntu0.24.04.2)
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
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.migrations (id, migration, batch) FROM stdin;
9	0001_01_01_000000_create_users_table	1
1	0001_01_01_000001_create_cache_table	2
2	0001_01_01_000002_create_jobs_table	2
3	2018_01_01_000000_create_action_events_table	2
4	2019_05_10_000000_add_fields_to_action_events_table	2
5	2021_08_25_193039_create_nova_notifications_table	2
6	2022_04_26_000000_add_fields_to_nova_notifications_table	2
7	2022_12_19_000000_create_field_attachments_table	2
8	2024_09_22_153441_create_lookup_tables	2
\.


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 9, true);


--
-- PostgreSQL database dump complete
--

