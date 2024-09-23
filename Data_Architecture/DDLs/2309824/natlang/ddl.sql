-- Core Modules

CREATE TABLE core_conversations (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    prompt_id INTEGER REFERENCES core_prompts(id) ON DELETE SET NULL,
    output_id INTEGER REFERENCES core_outputs(id) ON DELETE SET NULL,
    agent_id INTEGER REFERENCES core_agents(id) ON DELETE SET NULL,
    conversation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE core_prompts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    prompt TEXT NOT NULL,
    engineered BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    conversation_ids INTEGER[],
    output_ids INTEGER[]
);

CREATE TABLE core_outputs (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    output TEXT NOT NULL,
    output_edited TEXT,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    conversation_ids INTEGER[],
    prompt_id INTEGER REFERENCES core_prompts(id) ON DELETE SET NULL
);

CREATE TABLE core_agents (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    conversation_ids INTEGER[]
);

-- Main Lookup Tables

CREATE TABLE lookup_tags (
    id SERIAL PRIMARY KEY,
    tagname VARCHAR(255),
    tagdesc TEXT,
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE lookup_cats (
    id SERIAL PRIMARY KEY,
    cat_name VARCHAR(255),
    cat_desc TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Secondary Lookup Tables

CREATE TABLE lookup_accessui (
    id SERIAL PRIMARY KEY,
    uiname VARCHAR(255)
);

CREATE TABLE lookup_accuracy_level (
    id SERIAL PRIMARY KEY,
    level_name VARCHAR(255),
    desc TEXT
);

CREATE TABLE lookup_actionability (
    id SERIAL PRIMARY KEY,
    levelname VARCHAR(255),
    level_desc TEXT
);

CREATE TABLE lookup_activitystatus (
    id SERIAL PRIMARY KEY,
    statusname VARCHAR(255),
    status_desc TEXT
);

CREATE TABLE lookup_agentgroups (
    id SERIAL PRIMARY KEY,
    groupname VARCHAR(255),
    groupdesc TEXT
);

CREATE TABLE lookup_automationlevel (
    id SERIAL PRIMARY KEY,
    levelname VARCHAR(255),
    desc TEXT
);

CREATE TABLE lookup_creationaccount (
    id SERIAL PRIMARY KEY,
    accountname VARCHAR(255),
    accountemail VARCHAR(255),
    notes TEXT
);

CREATE TABLE lookup_outputlibraries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description TEXT
);

CREATE TABLE lookup_dataretentionplan (
    id SERIAL PRIMARY KEY,
    plan_name VARCHAR(255),
    description TEXT
);

CREATE TABLE lookup_datasensitivity (
    id SERIAL PRIMARY KEY,
    sensitivitylevel VARCHAR(255),
    description TEXT
);

CREATE TABLE lookup_programminglanguage (
    id SERIAL PRIMARY KEY,
    language VARCHAR(255),
    desc TEXT
);

CREATE TABLE lookup_datasizes (
    id SERIAL PRIMARY KEY,
    size VARCHAR(255),
    minsize BIGINT,
    maxsize BIGINT,
    desc TEXT
);

CREATE TABLE lookup_output_types (
    id SERIAL PRIMARY KEY,
    type VARCHAR(255),
    desc VARCHAR(255)
);

CREATE TABLE lookup_md_conversion (
    id SERIAL PRIMARY KEY,
    status VARCHAR(255)
);

CREATE TABLE lookup_fileformats (
    id SERIAL PRIMARY KEY,
    format VARCHAR(255),
    extension VARCHAR(255),
    desc TEXT
);

CREATE TABLE lookup_followup_activities (
    id SERIAL PRIMARY KEY,
    activity VARCHAR(255),
    desc VARCHAR(255)
);

CREATE TABLE lookup_github_plans (
    id SERIAL PRIMARY KEY,
    plan VARCHAR(255),
    desc VARCHAR(255)
);

CREATE TABLE lookup_llms (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    desc VARCHAR(255),
    by VARCHAR(255)
);

CREATE TABLE lookup_llm_platforms (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    desc VARCHAR(255)
);

CREATE TABLE lookup_statuses (
    id SERIAL PRIMARY KEY,
    status VARCHAR(255),
    desc VARCHAR(255)
);

CREATE TABLE lookup_agent_capabilities (
    id SERIAL PRIMARY KEY,
    capability VARCHAR(255),
    desc TEXT
);

CREATE TABLE lookup_knowledge_types (
    id SERIAL PRIMARY KEY,
    type VARCHAR(255),
    desc VARCHAR(255)
);

CREATE TABLE lookup_promptstage (
    id SERIAL PRIMARY KEY,
    stage VARCHAR(255),
    desc VARCHAR(255)
);

CREATE TABLE lookup_countries (
    id SERIAL PRIMARY KEY,
    country VARCHAR(255)
);

-- Junction Tables for Many-to-Many Relationships

CREATE TABLE core_conversations_tags (
    conversation_id INTEGER REFERENCES core_conversations(id) ON DELETE CASCADE,
    tag_id INTEGER REFERENCES lookup_tags(id) ON DELETE CASCADE,
    PRIMARY KEY (conversation_id, tag_id)
);

CREATE TABLE core_prompts_tags (
    prompt_id INTEGER REFERENCES core_prompts(id) ON DELETE CASCADE,
    tag_id INTEGER REFERENCES lookup_tags(id) ON DELETE CASCADE,
    PRIMARY KEY (prompt_id, tag_id)
);

CREATE TABLE core_outputs_tags (
    output_id INTEGER REFERENCES core_outputs(id) ON DELETE CASCADE,
    tag_id INTEGER REFERENCES lookup_tags(id) ON DELETE CASCADE,
    PRIMARY KEY (output_id, tag_id)
);

CREATE TABLE core_agents_tags (
    agent_id INTEGER REFERENCES core_agents(id) ON DELETE CASCADE,
    tag_id INTEGER REFERENCES lookup_tags(id) ON DELETE CASCADE,
    PRIMARY KEY (agent_id, tag_id)
);

CREATE TABLE core_conversations_categories (
    conversation_id INTEGER REFERENCES core_conversations(id) ON DELETE CASCADE,
    category_id INTEGER REFERENCES lookup_cats(id) ON DELETE CASCADE,
    PRIMARY KEY (conversation_id, category_id)
);

CREATE TABLE core_prompts_categories (
    prompt_id INTEGER REFERENCES core_prompts(id) ON DELETE CASCADE,
    category_id INTEGER REFERENCES lookup_cats(id) ON DELETE CASCADE,
    PRIMARY KEY (prompt_id, category_id)
);

CREATE TABLE core_outputs_categories (
    output_id INTEGER REFERENCES core_outputs(id) ON DELETE CASCADE,
    category_id INTEGER REFERENCES lookup_cats(id) ON DELETE CASCADE,
    PRIMARY KEY (output_id, category_id)
);

CREATE TABLE core_agents_categories (
    agent_id INTEGER REFERENCES core_agents(id) ON DELETE CASCADE,
    category_id INTEGER REFERENCES lookup_cats(id) ON DELETE CASCADE,
    PRIMARY KEY (agent_id, category_id)
);

CREATE TABLE core_agents_agentgroups (
    agent_id INTEGER REFERENCES core_agents(id) ON DELETE CASCADE,
    group_id INTEGER REFERENCES lookup_agentgroups(id) ON DELETE CASCADE,
    PRIMARY KEY (agent_id, group_id)
);

CREATE TABLE core_agents_automationlevel (
    agent_id INTEGER REFERENCES core_agents(id) ON DELETE CASCADE,
    level_id INTEGER REFERENCES lookup_automationlevel(id) ON DELETE CASCADE,
    PRIMARY KEY (agent_id, level_id)
);

CREATE TABLE core_outputs_outputlibraries (
    output_id INTEGER REFERENCES core_outputs(id) ON DELETE CASCADE,
    library_id INTEGER REFERENCES lookup_outputlibraries(id) ON DELETE CASCADE,
    PRIMARY KEY (output_id, library_id)
);

CREATE TABLE core_conversations_dataretentionplan (
    conversation_id INTEGER REFERENCES core_conversations(id) ON DELETE CASCADE,
    plan_id INTEGER REFERENCES lookup_dataretentionplan(id) ON DELETE CASCADE,
    PRIMARY KEY (conversation_id, plan_id)
);

CREATE TABLE core_prompts_dataretentionplan (
    prompt_id INTEGER REFERENCES core_prompts(id) ON DELETE CASCADE,
    plan_id INTEGER REFERENCES lookup_dataretentionplan(id) ON DELETE CASCADE,
    PRIMARY KEY (prompt_id, plan_id)
);

CREATE TABLE core_outputs_dataretentionplan (
    output_id INTEGER REFERENCES core_outputs(id) ON DELETE CASCADE,
    plan_id INTEGER REFERENCES lookup_dataretentionplan(id) ON DELETE CASCADE,
    PRIMARY KEY (output_id, plan_id)
);

CREATE TABLE core_agents_dataretentionplan (
    agent_id INTEGER REFERENCES core_agents(id) ON DELETE CASCADE,
    plan_id INTEGER REFERENCES lookup_dataretentionplan(id) ON DELETE CASCADE,
    PRIMARY KEY (agent_id, plan_id)
);

CREATE TABLE core_conversations_programminglanguage (
    conversation_id INTEGER REFERENCES core_conversations(id) ON DELETE CASCADE,
    language_id INTEGER REFERENCES lookup_programminglanguage(id) ON DELETE CASCADE,
    PRIMARY KEY (conversation_id, language_id)
);

CREATE TABLE core_prompts_programminglanguage (
    prompt_id INTEGER REFERENCES core_prompts(id) ON DELETE CASCADE,
    language_id INTEGER REFERENCES lookup_programminglanguage(id) ON DELETE CASCADE,
    PRIMARY KEY (prompt_id, language_id)
);

CREATE TABLE core_outputs_programminglanguage (
    output_id INTEGER REFERENCES core_outputs(id) ON DELETE CASCADE,
    language_id INTEGER REFERENCES lookup_programminglanguage(id) ON DELETE CASCADE,
    PRIMARY KEY (output_id, language_id)
);

CREATE TABLE core_agents_programminglanguage (
    agent_id INTEGER REFERENCES core_agents(id) ON DELETE CASCADE,
    language_id INTEGER REFERENCES lookup_programminglanguage(id) ON DELETE CASCADE,
    PRIMARY KEY (agent_id, language_id)
);

CREATE TABLE core_outputs_output_types (
    output_id INTEGER REFERENCES core_outputs(id) ON DELETE CASCADE,
    type_id INTEGER REFERENCES lookup_output_types(id) ON DELETE CASCADE,
    PRIMARY KEY (output_id, type_id)
);

CREATE TABLE core_prompts_followup_activities (
    prompt_id INTEGER REFERENCES core_prompts(id) ON DELETE CASCADE,
    activity_id INTEGER REFERENCES lookup_followup_activities(id) ON DELETE CASCADE,
    PRIMARY KEY (prompt_id, activity_id)
);

CREATE TABLE core_outputs_followup_activities (
    output_id INTEGER REFERENCES core_outputs(id) ON DELETE CASCADE,
    activity_id INTEGER REFERENCES lookup_followup_activities(id) ON DELETE CASCADE,
    PRIMARY KEY (output_id, activity_id)
);

CREATE TABLE core_agents_agent_capabilities (
    agent_id INTEGER REFERENCES core_agents(id) ON DELETE CASCADE,
    capability_id INTEGER REFERENCES lookup_agent_capabilities(id) ON DELETE CASCADE,
    PRIMARY KEY (agent_id, capability_id)
);

-- Add foreign key columns for one-to-many relationships

ALTER TABLE core_conversations ADD COLUMN access_ui_id INTEGER REFERENCES lookup_accessui(id);
ALTER TABLE core_prompts ADD COLUMN access_ui_id INTEGER REFERENCES lookup_accessui(id);
ALTER TABLE core_outputs ADD COLUMN access_ui_id INTEGER REFERENCES lookup_accessui(id);
ALTER TABLE core_agents ADD COLUMN access_ui_id INTEGER REFERENCES lookup_accessui(id);

ALTER TABLE core_agents ADD COLUMN accuracy_level_id INTEGER REFERENCES lookup_accuracy_level(id);
ALTER TABLE core_outputs ADD COLUMN accuracy_level_id INTEGER REFERENCES lookup_accuracy_level(id);

ALTER TABLE core_outputs ADD COLUMN actionability_id INTEGER REFERENCES lookup_actionability(id);

ALTER TABLE core_agents ADD COLUMN activity_status_id INTEGER REFERENCES lookup_activitystatus(id) NOT NULL;
ALTER TABLE core_prompts ADD COLUMN activity_status_id INTEGER REFERENCES lookup_activitystatus(id) NOT NULL;

ALTER TABLE core_agents ADD COLUMN creation_account_id INTEGER REFERENCES lookup_creationaccount(id);
ALTER TABLE core_conversations ADD COLUMN creation_account_id INTEGER REFERENCES lookup_creationaccount(id);
ALTER TABLE core_outputs ADD COLUMN creation_account_id INTEGER REFERENCES lookup_creationaccount(id);
ALTER TABLE core_prompts ADD COLUMN creation_account_id INTEGER REFERENCES lookup_creationaccount(id);

ALTER TABLE core_agents ADD COLUMN data_sensitivity_id INTEGER REFERENCES lookup_datasensitivity(id);
ALTER TABLE core_conversations ADD COLUMN data_sensitivity_id INTEGER REFERENCES lookup_datasensitivity(id);
ALTER TABLE core_outputs ADD COLUMN data_sensitivity_id INTEGER REFERENCES lookup_datasensitivity(id);
ALTER TABLE core_prompts ADD COLUMN data_sensitivity_id INTEGER REFERENCES lookup_datasensitivity(id);

ALTER TABLE core_outputs ADD COLUMN md_conversion_id INTEGER REFERENCES lookup_md_conversion(id) NOT NULL;

ALTER TABLE core_prompts ADD COLUMN github_plan_id INTEGER REFERENCES lookup_github_plans(id);
ALTER TABLE core_agents ADD COLUMN github_plan_id INTEGER REFERENCES lookup_github_plans(id);
ALTER TABLE core_outputs ADD COLUMN github_plan_id INTEGER REFERENCES lookup_github_plans(id);

ALTER TABLE core_prompts ADD COLUMN llm_id INTEGER REFERENCES lookup_llms(id);
ALTER TABLE core_outputs ADD COLUMN llm_id INTEGER REFERENCES lookup_llms(id);
ALTER TABLE core_agents ADD COLUMN llm_id INTEGER REFERENCES lookup_llms(id);

ALTER TABLE core_prompts ADD COLUMN llm_platform_id INTEGER REFERENCES lookup_llm_platforms(id);
ALTER TABLE core_outputs ADD COLUMN llm_platform_id INTEGER REFERENCES lookup_llm_platforms(id);
ALTER TABLE core_agents ADD COLUMN llm_platform_id INTEGER REFERENCES lookup_llm_platforms(id);

ALTER TABLE core_prompts ADD COLUMN status_id INTEGER REFERENCES lookup_statuses(id);
ALTER TABLE core_outputs ADD COLUMN status_id INTEGER REFERENCES lookup_statuses(id);
ALTER TABLE core_agents ADD COLUMN status_id INTEGER REFERENCES lookup_statuses(id);

ALTER TABLE core_outputs ADD COLUMN knowledge_type_id INTEGER REFERENCES lookup_knowledge_types(id);

ALTER TABLE core_prompts ADD COLUMN prompt_stage_id INTEGER REFERENCES lookup_promptstage(id) NOT NULL;

ALTER TABLE core_prompts ADD COLUMN country_id INTEGER REFERENCES lookup_countries(id);
ALTER TABLE core_outputs ADD COLUMN country_id INTEGER REFERENCES lookup_countries(id);
ALTER TABLE core_agents ADD COLUMN country_id INTEGER REFERENCES lookup_countries(id);

-- Add comments to tables

COMMENT ON TABLE core_conversations IS 'Holds outputs, prompts, and agents together in a cohesive data relationship';
COMMENT ON TABLE lookup_tags IS 'List of tags for categorizing core modules';
COMMENT ON TABLE lookup_cats IS 'Category lookup table for core modules';
COMMENT ON TABLE lookup_accessui IS 'Lookup table with access UIs';
COMMENT ON TABLE lookup_accuracy_level IS 'Lookup to gauge the accuracy of generations from LLMs';
COMMENT ON TABLE lookup_actionability IS 'Lookup to triage prompt outputs for internal review';
COMMENT ON TABLE lookup_activitystatus IS 'Lookup to distinguish between active entities and those removed from production';
COMMENT ON TABLE lookup_agentgroups IS 'Lookup to divide agents into groups';
COMMENT ON TABLE lookup_automationlevel IS 'Lookup to store various levels of automation';
COMMENT ON TABLE lookup_creationaccount IS 'Lookup to note which account a specific entity was generated with';
COMMENT ON TABLE lookup_outputlibraries IS 'Lookup to control access to outputs by assigning them to a specific library';
COMMENT ON TABLE lookup_dataretentionplan IS 'Lookup to store different data retention plans';
COMMENT ON TABLE lookup_datasensitivity IS 'Lookup to facilitate internal compliance requirements and label sensitive data';
 -- Continuing from where we left off with table comments

COMMENT ON TABLE lookup_programminglanguage IS 'Lookup table listing common programming languages';
COMMENT ON TABLE lookup_datasizes IS 'Lookup table for grouping files or output lengths according to size parameters';
COMMENT ON TABLE lookup_output_types IS 'Lookup table to note the format in which an output is stored in the system';
COMMENT ON TABLE lookup_md_conversion IS 'Lookup table used to mark off markdown files that have been converted to other output formats';
COMMENT ON TABLE lookup_fileformats IS 'Lookup table holding a list of common file formats';
COMMENT ON TABLE lookup_followup_activities IS 'Lookup table to assign follow-up activities to outputs';
COMMENT ON TABLE lookup_github_plans IS 'Lookup table to mark up entities for release on Github';
COMMENT ON TABLE lookup_llms IS 'Lookup table containing a list of large language models (LLMs)';
COMMENT ON TABLE lookup_llm_platforms IS 'Lookup table storing a list of platforms through which LLMs are made available';
COMMENT ON TABLE lookup_statuses IS 'Lookup table holding simple statuses for fallback use';
COMMENT ON TABLE lookup_agent_capabilities IS 'Lookup table to denote the discrete capabilities of specific agents';
COMMENT ON TABLE lookup_knowledge_types IS 'Lookup table used to group outputs according to the type of knowledge exhibited in the generation';
COMMENT ON TABLE lookup_promptstage IS 'Lookup table to assign the stage a prompt is at in the system retention process';
COMMENT ON TABLE lookup_countries IS 'Lookup table listing world countries for assigning entities to specific geographies';

-- Add any missing constraints or indexes

-- Ensure at least one category for core modules
ALTER TABLE core_conversations ADD CONSTRAINT chk_conversation_category CHECK (EXISTS (SELECT 1 FROM core_conversations_categories WHERE conversation_id = core_conversations.id));
ALTER TABLE core_prompts ADD CONSTRAINT chk_prompt_category CHECK (EXISTS (SELECT 1 FROM core_prompts_categories WHERE prompt_id = core_prompts.id));
ALTER TABLE core_outputs ADD CONSTRAINT chk_output_category CHECK (EXISTS (SELECT 1 FROM core_outputs_categories WHERE output_id = core_outputs.id));
ALTER TABLE core_agents ADD CONSTRAINT chk_agent_category CHECK (EXISTS (SELECT 1 FROM core_agents_categories WHERE agent_id = core_agents.id));

-- Add indexes for frequently queried columns
CREATE INDEX idx_conversations_date ON core_conversations(conversation_date);
CREATE INDEX idx_prompts_created_at ON core_prompts(created_at);
CREATE INDEX idx_outputs_created_at ON core_outputs(created_at);
CREATE INDEX idx_agents_name ON core_agents(name);

-- Add any additional constraints or indexes as needed based on expected query patterns and data integrity requirements

-- End of SQL DDL