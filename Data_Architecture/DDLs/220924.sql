-- Create schema
CREATE SCHEMA IF NOT EXISTS public;

-- Create sequences
CREATE SEQUENCE IF NOT EXISTS public.global_id_seq;

-- Create all lookup tables with consistent fields and UNIQUE constraints
CREATE TABLE public.accessui (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    ui_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.accessui IS 'Stores different user interface access levels';

CREATE TABLE public.accuracylevels (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    accuracy_level VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.accuracylevels IS 'Defines levels of accuracy for assessments';

CREATE TABLE public.actionability_levels (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    actionability_level VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.actionability_levels IS 'Defines levels of actionability for outputs';

CREATE TABLE public.activitystatus (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    status_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.activitystatus IS 'Stores possible activity statuses';

CREATE TABLE public.agentgroups (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    group_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.agentgroups IS 'Defines groups of agents';

CREATE TABLE public.apiintegrations (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    integration_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.apiintegrations IS 'Stores information about API integrations';

CREATE TABLE public.automation_levels (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    automation_level VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.automation_levels IS 'Defines levels of automation';

CREATE TABLE public.backupstatuses (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    status_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.backupstatuses IS 'Stores possible backup statuses';

CREATE TABLE public.business_system_tags (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    tag_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.business_system_tags IS 'Stores tags for business systems';

CREATE TABLE public.cc_license_types (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    license_type VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.cc_license_types IS 'Stores types of Creative Commons licenses';

CREATE TABLE public.chatgpt_output_formats (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    format_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.chatgpt_output_formats IS 'Defines output formats for ChatGPT';

CREATE TABLE public.citiesinisrael (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    city_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.citiesinisrael IS 'List of cities in Israel';

CREATE TABLE public.cost_levels (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    cost_level VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.cost_levels IS 'Defines levels of cost';

CREATE TABLE public.creation_account (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    account_name VARCHAR(255) NOT NULL UNIQUE,
    account_email VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.creation_account IS 'Stores information about creation accounts';

CREATE TABLE public.customgptlibraries (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    library_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.customgptlibraries IS 'Stores custom GPT libraries';

CREATE TABLE public.data_retention_plans (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    plan_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.data_retention_plans IS 'Defines data retention plans';

CREATE TABLE public.data_sensitivity_levels (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    sensitivity_level VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.data_sensitivity_levels IS 'Defines levels of data sensitivity';

CREATE TABLE public.data_sharing_groups (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    group_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.data_sharing_groups IS 'Defines groups for data sharing';

CREATE TABLE public.data_size_classifiers (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    classifier_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.data_size_classifiers IS 'Classifies data sizes';

CREATE TABLE public.data_source_classifiers (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    classifier_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.data_source_classifiers IS 'Classifies data sources';

CREATE TABLE public.data_types (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    type_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.data_types IS 'Defines types of data';

CREATE TABLE public.data_viz_formats (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    format_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.data_viz_formats IS 'Defines formats for data visualization';

CREATE TABLE public.experimentation_methodologies (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    methodology_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.experimentation_methodologies IS 'Defines methodologies for experimentation';

CREATE TABLE public.file_formats (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    format_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.file_formats IS 'Defines file formats';

CREATE TABLE public.followup_activities (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    activity_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.followup_activities IS 'Defines follow-up activities';

CREATE TABLE public.github_plans (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    plan_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.github_plans IS 'Defines GitHub plans';

CREATE TABLE public.gpt_platforms (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    platform_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.gpt_platforms IS 'Defines GPT platforms';

CREATE TABLE public.gpt_privacy_settings (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    setting_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.gpt_privacy_settings IS 'Defines privacy settings for GPTs';

CREATE TABLE public.gpt_tags (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    tag_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.gpt_tags IS 'Defines tags for GPTs';

CREATE TABLE public.gpt_tasks (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    task_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.gpt_tasks IS 'Defines tasks for GPTs';

CREATE TABLE public.gptcapabilities (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    capability_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.gptcapabilities IS 'Defines capabilities of GPTs';

CREATE TABLE public.gptconfigtypes (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    config_type_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.gptconfigtypes IS 'Defines configuration types for GPTs';

CREATE TABLE public.gptmodels (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    model_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.gptmodels IS 'Defines GPT models';

CREATE TABLE public.gptoutputreviewsdone (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    review_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.gptoutputreviewsdone IS 'Tracks reviews done on GPT outputs';

CREATE TABLE public.gptratings (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    rating_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.gptratings IS 'Defines ratings for GPTs';

CREATE TABLE public.gptresponsetimes (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    response_time_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.gptresponsetimes IS 'Defines response time categories for GPTs';

CREATE TABLE public.gptreviewstatuses (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    status_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.gptreviewstatuses IS 'Defines review statuses for GPTs';

CREATE TABLE public.gpts_cats (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    category_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.gpts_cats IS 'Defines categories for GPTs';

CREATE TABLE public.gptsoftwareplatforms (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    platform_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.gptsoftwareplatforms IS 'Defines software platforms for GPTs';

CREATE TABLE public.industries_list (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    industry_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.industries_list IS 'List of industries';

CREATE TABLE public.knowledge_types (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    knowledge_type_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.knowledge_types IS 'Defines types of knowledge';

CREATE TABLE public.llms_list (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    llm_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.llms_list IS 'List of Language Models';

CREATE TABLE public.mdconversionstatus (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    status_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.mdconversionstatus IS 'Defines statuses for Markdown conversion';

CREATE TABLE public.mediatypes (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    media_type_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.mediatypes IS 'Defines types of media';

CREATE TABLE public.opensource_licenses (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    license_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.opensource_licenses IS 'Defines open source licenses';

CREATE TABLE public.output_types (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    output_type_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.output_types IS 'Defines types of output';

CREATE TABLE public.outputqualityassessment (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    assessment_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.outputqualityassessment IS 'Defines quality assessment categories for outputs';

CREATE TABLE public.post_prompt_actions (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    action_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.post_prompt_actions IS 'Defines actions to be taken after prompts';

CREATE TABLE public.programminglanguages (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    language_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.programminglanguages IS 'List of programming languages';

CREATE TABLE public.project_tags (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    tag_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.project_tags IS 'Defines tags for projects';

CREATE TABLE public.promptstages (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    stage_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.promptstages IS 'Defines stages of prompts';

CREATE TABLE public.publication_platforms (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    platform_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.publication_platforms IS 'Defines platforms for publication';

CREATE TABLE public.qc_activities (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    activity_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.qc_activities IS 'Defines quality control activities';

CREATE TABLE public.reading_levels (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    level_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.reading_levels IS 'Defines reading levels';

CREATE TABLE public.reference_sources (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    source_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.reference_sources IS 'Defines sources of references';

CREATE TABLE public.relationdb_techs (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    tech_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.relationdb_techs IS 'Defines relational database technologies';

CREATE TABLE public.review_priority_levels (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    priority_level_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.review_priority_levels IS 'Defines priority levels for reviews';

CREATE TABLE public.review_statuses (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    status_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.review_statuses IS 'Defines statuses for reviews';

CREATE TABLE public.saas_sub_models (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    model_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.saas_sub_models IS 'Defines SaaS subscription models';

CREATE TABLE public.sentiment_classifiers (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    classifier_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.sentiment_classifiers IS 'Defines sentiment classifiers';

CREATE TABLE public.system_unique_ids (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    unique_id_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.system_unique_ids IS 'Defines unique identifiers for systems';

CREATE TABLE public.systemmodules (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    module_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.systemmodules IS 'Defines system modules';

CREATE TABLE public.tabletypes (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    table_type_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.tabletypes IS 'Defines types of tables';

CREATE TABLE public.targetaudiences (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    audience_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.targetaudiences IS 'Defines target audiences';

CREATE TABLE public.taxonomy_organisation (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    organisation_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.taxonomy_organisation IS 'Defines taxonomy organizations';

CREATE TABLE public.urgency_levels (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    urgency_level_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.urgency_levels IS 'Defines levels of urgency';

CREATE TABLE public.usecases (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    usecase_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.usecases IS 'Defines use cases';

CREATE TABLE public.userfeedback_types (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    feedback_type_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.userfeedback_types IS 'Defines types of user feedback';

CREATE TABLE public.userroles (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    role_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.userroles IS 'Defines user roles';

CREATE TABLE public.worldcountries (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    country_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.worldcountries IS 'List of countries in the world';

CREATE TABLE public.worldlanguages (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    language_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE public.worldlanguages IS 'List of world languages';

-- Create main tables
CREATE TABLE public.custom_gpts (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    gpt_name TEXT NOT NULL UNIQUE,
    config_text TEXT,
    link VARCHAR(255),
    importance INTEGER NOT NULL,
    gpt_optimised BOOLEAN NOT NULL DEFAULT FALSE,
    summary TEXT,
    creation_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    access_ui_id INTEGER NOT NULL REFERENCES public.accessui(id) ON DELETE CASCADE,
    activity_status_id INTEGER NOT NULL REFERENCES public.activitystatus(id) ON DELETE CASCADE,
    creation_account_id INTEGER NOT NULL REFERENCES public.creation_account(id) ON DELETE CASCADE,
    configuration_type_id INTEGER NOT NULL REFERENCES public.gptconfigtypes(id) ON DELETE CASCADE,
    gpt_model_id INTEGER NOT NULL REFERENCES public.gptmodels(id) ON DELETE CASCADE,
    gpt_rating_id INTEGER REFERENCES public.gptratings(id) ON DELETE SET NULL,
    github_release_status_id INTEGER REFERENCES public.github_plans(id) ON DELETE SET NULL,
    underlying_llm_id INTEGER REFERENCES public.llms_list(id) ON DELETE SET NULL,
    CONSTRAINT check_importance CHECK (importance >= 0 AND importance <= 10)
);
COMMENT ON TABLE public.custom_gpts IS 'Stores information about custom GPT models';
COMMENT ON COLUMN public.custom_gpts.gpt_name IS 'Unique name of the custom GPT';
COMMENT ON COLUMN public.custom_gpts.importance IS 'Importance rating from 0 to 10';

CREATE TABLE public.prompt_library (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    prompt_text TEXT NOT NULL UNIQUE,
    engineered BOOLEAN NOT NULL DEFAULT FALSE,
    rating INTEGER,
    display_in_library BOOLEAN NOT NULL DEFAULT TRUE,
    notes_for_improvement TEXT,
    limitations TEXT,
    usecase_notes TEXT,
    data_sensitivity_notes TEXT,
    prompt_success_stories TEXT,
    prompt_failures TEXT,
    prompt_benchmarking TEXT,
    prompt_refinement_history TEXT,
    planned_enhancements TEXT,
    description TEXT,
    summary VARCHAR(255),
    creation_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT check_rating CHECK (rating >= 0 AND rating <= 5)
);
COMMENT ON TABLE public.prompt_library IS 'Stores prompts used with custom GPTs';
COMMENT ON COLUMN public.prompt_library.prompt_text IS 'The actual text of the prompt';
COMMENT ON COLUMN public.prompt_library.rating IS 'Rating of the prompt from 0 to 5';

CREATE TABLE public.prompt_outputs (
    id INTEGER PRIMARY KEY DEFAULT nextval('public.global_id_seq'),
    output TEXT NOT NULL,
    prompt_used TEXT NOT NULL,
    creation_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    md_conversion_status_id INTEGER REFERENCES public.mdconversionstatus(id) ON DELETE SET NULL,
    accuracy_assessment_id INTEGER REFERENCES public.accuracylevels(id) ON DELETE SET NULL,
    actionability_id INTEGER REFERENCES public.actionability_levels(id) ON DELETE SET NULL,
    data_sensitivity_id INTEGER REFERENCES public.data_sensitivity_levels(id) ON DELETE SET NULL,
    data_size_id INTEGER REFERENCES public.data_size_classifiers(id) ON DELETE SET NULL,
    output_language_id INTEGER REFERENCES public.worldlanguages(id) ON DELETE SET NULL,
    output_reading_level_id INTEGER REFERENCES public.reading_levels(id) ON DELETE SET NULL,
    review_urgency_id INTEGER REFERENCES public.urgency_levels(id) ON DELETE SET NULL,
    review_priority_id INTEGER REFERENCES public.review_priority_levels(id) ON DELETE SET NULL,
    output_category_id INTEGER REFERENCES public.gpts_cats(id) ON DELETE SET NULL,
    custom_gpt_id INTEGER NOT NULL REFERENCES public.custom_gpts(id) ON DELETE CASCADE,
    FOREIGN KEY (prompt_used) REFERENCES public.prompt_library(prompt_text) ON DELETE CASCADE
);
COMMENT ON TABLE public.prompt_outputs IS 'Stores outputs generated by custom GPTs';
COMMENT ON COLUMN public.prompt_outputs.output IS 'The generated output text';
COMMENT ON COLUMN public.prompt_outputs.prompt_used IS 'The prompt used to generate this output';

-- Create junction tables for many-to-many relationships
CREATE TABLE public.custom_gpts_agent_groups (
    custom_gpt_id INTEGER REFERENCES public.custom_gpts(id) ON DELETE CASCADE,
    agent_group_id INTEGER REFERENCES public.agentgroups(id) ON DELETE CASCADE,
    PRIMARY KEY (custom_gpt_id, agent_group_id)
);

CREATE TABLE public.custom_gpts_capabilities (
    custom_gpt_id INTEGER REFERENCES public.custom_gpts(id) ON DELETE CASCADE,
    capability_id INTEGER REFERENCES public.gptcapabilities(id) ON DELETE CASCADE,
    PRIMARY KEY (custom_gpt_id, capability_id)
);

CREATE TABLE public.custom_gpts_backup_statuses (
    custom_gpt_id INTEGER REFERENCES public.custom_gpts(id) ON DELETE CASCADE,
    backup_status_id INTEGER REFERENCES public.backupstatuses(id) ON DELETE CASCADE,
    PRIMARY KEY (custom_gpt_id, backup_status_id)
);

CREATE TABLE public.custom_gpts_business_system_tags (
    custom_gpt_id INTEGER REFERENCES public.custom_gpts(id) ON DELETE CASCADE,
    business_system_tag_id INTEGER REFERENCES public.business_system_tags(id) ON DELETE CASCADE,
    PRIMARY KEY (custom_gpt_id, business_system_tag_id)
);

CREATE TABLE public.custom_gpts_data_retention_plans (
    custom_gpt_id INTEGER REFERENCES public.custom_gpts(id) ON DELETE CASCADE,
    data_retention_plan_id INTEGER REFERENCES public.data_retention_plans(id) ON DELETE CASCADE,
    PRIMARY KEY (custom_gpt_id, data_retention_plan_id)
);

CREATE TABLE public.custom_gpts_data_sharing_groups (
    custom_gpt_id INTEGER REFERENCES public.custom_gpts(id) ON DELETE CASCADE,
    data_sharing_group_id INTEGER REFERENCES public.data_sharing_groups(id) ON DELETE CASCADE,
    PRIMARY KEY (custom_gpt_id, data_sharing_group_id)
);

CREATE TABLE public.custom_gpts_gpt_privacy_settings (
    custom_gpt_id INTEGER REFERENCES public.custom_gpts(id) ON DELETE CASCADE,
    gpt_privacy_setting_id INTEGER REFERENCES public.gpt_privacy_settings(id) ON DELETE CASCADE,
    PRIMARY KEY (custom_gpt_id, gpt_privacy_setting_id)
);

CREATE TABLE public.custom_gpts_gpt_review_statuses (
    custom_gpt_id INTEGER REFERENCES public.custom_gpts(id) ON DELETE CASCADE,
    gpt_review_status_id INTEGER REFERENCES public.gptreviewstatuses(id) ON DELETE CASCADE,
    PRIMARY KEY (custom_gpt_id, gpt_review_status_id)
);

CREATE TABLE public.custom_gpts_media_types (
    custom_gpt_id INTEGER REFERENCES public.custom_gpts(id) ON DELETE CASCADE,
    media_type_id INTEGER REFERENCES public.mediatypes(id) ON DELETE CASCADE,
    PRIMARY KEY (custom_gpt_id, media_type_id)
);

CREATE TABLE public.custom_gpts_output_types (
    custom_gpt_id INTEGER REFERENCES public.custom_gpts(id) ON DELETE CASCADE,
    output_type_id INTEGER REFERENCES public.output_types(id) ON DELETE CASCADE,
    PRIMARY KEY (custom_gpt_id, output_type_id)
);

CREATE TABLE public.custom_gpts_programming_languages (
    custom_gpt_id INTEGER REFERENCES public.custom_gpts(id) ON DELETE CASCADE,
    programming_language_id INTEGER REFERENCES public.programminglanguages(id) ON DELETE CASCADE,
    PRIMARY KEY (custom_gpt_id, programming_language_id)
);

CREATE TABLE public.custom_gpts_use_cases (
    custom_gpt_id INTEGER REFERENCES public.custom_gpts(id) ON DELETE CASCADE,
    use_case_id INTEGER REFERENCES public.usecases(id) ON DELETE CASCADE,
    PRIMARY KEY (custom_gpt_id, use_case_id)
);

CREATE TABLE public.prompt_library_programming_languages (
    prompt_library_id INTEGER REFERENCES public.prompt_library(id) ON DELETE CASCADE,
    programming_language_id INTEGER REFERENCES public.programminglanguages(id) ON DELETE CASCADE,
    PRIMARY KEY (prompt_library_id, programming_language_id)
);

CREATE TABLE public.prompt_library_use_cases (
    prompt_library_id INTEGER REFERENCES public.prompt_library(id) ON DELETE CASCADE,
    use_case_id INTEGER REFERENCES public.usecases(id) ON DELETE CASCADE,
    PRIMARY KEY (prompt_library_id, use_case_id)
);

CREATE TABLE public.custom_gpts_prompt_library (
    custom_gpt_id INTEGER REFERENCES public.custom_gpts(id) ON DELETE CASCADE,
    prompt_library_id INTEGER REFERENCES public.prompt_library(id) ON DELETE CASCADE,
    PRIMARY KEY (custom_gpt_id, prompt_library_id)
);

CREATE TABLE public.custom_gpts_prompt_outputs (
    custom_gpt_id INTEGER REFERENCES public.custom_gpts(id) ON DELETE CASCADE,
    prompt_output_id INTEGER REFERENCES public.prompt_outputs(id) ON DELETE CASCADE,
    PRIMARY KEY (custom_gpt_id, prompt_output_id)
);

CREATE TABLE public.prompt_library_prompt_outputs (
    prompt_library_id INTEGER REFERENCES public.prompt_library(id) ON DELETE CASCADE,
    prompt_output_id INTEGER REFERENCES public.prompt_outputs(id) ON DELETE CASCADE,
    PRIMARY KEY (prompt_library_id, prompt_output_id)
);

-- Create indexes
CREATE INDEX idx_custom_gpts_gpt_name ON public.custom_gpts(gpt_name);
CREATE INDEX idx_prompt_library_summary ON public.prompt_library(summary);
CREATE INDEX idx_prompt_outputs_creation_date ON public.prompt_outputs(creation_date);

-- Create composite indexes on main tables
CREATE INDEX idx_custom_gpts_composite ON public.custom_gpts(gpt_name, importance, creation_date);
CREATE INDEX idx_prompt_library_composite ON public.prompt_library(rating, display_in_library, creation_date);
CREATE INDEX idx_prompt_outputs_composite ON public.prompt_outputs(creation_date, accuracy_assessment_id, review_urgency_id);

-- Create indexes for the junction tables
CREATE INDEX idx_custom_gpts_prompt_library_custom_gpt_id ON public.custom_gpts_prompt_library(custom_gpt_id);
CREATE INDEX idx_custom_gpts_prompt_library_prompt_library_id ON public.custom_gpts_prompt_library(prompt_library_id);
CREATE INDEX idx_custom_gpts_prompt_outputs_custom_gpt_id ON public.custom_gpts_prompt_outputs(custom_gpt_id);
CREATE INDEX idx_custom_gpts_prompt_outputs_prompt_output_id ON public.custom_gpts_prompt_outputs(prompt_output_id);
CREATE INDEX idx_prompt_library_prompt_outputs_prompt_library_id ON public.prompt_library_prompt_outputs(prompt_library_id);
CREATE INDEX idx_prompt_library_prompt_outputs_prompt_output_id ON public.prompt_library_prompt_outputs(prompt_output_id);

-- Add table partitioning for large tables (example for prompt_outputs)
CREATE TABLE public.prompt_outputs_partitioned (
    LIKE public.prompt_outputs INCLUDING ALL
) PARTITION BY RANGE (creation_date);

CREATE TABLE public.prompt_outputs_y2023 PARTITION OF public.prompt_outputs_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE public.prompt_outputs_y2024 PARTITION OF public.prompt_outputs_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

