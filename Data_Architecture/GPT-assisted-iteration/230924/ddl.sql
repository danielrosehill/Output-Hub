-- Core Modules

CREATE TABLE core_conversations (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    prompt_id INTEGER REFERENCES core_prompts(id) ON DELETE SET NULL,
    output_id INTEGER REFERENCES core_outputs(id) ON DELETE SET NULL,
    agent_id INTEGER REFERENCES core_agents(id) ON DELETE SET NULL,
    conversation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    access_ui_id INTEGER REFERENCES lookup_access_ui(id),
    creation_account_id INTEGER REFERENCES lookup_creation_account(id),
    data_sensitivity_id INTEGER REFERENCES lookup_data_sensitivity(id)
);

CREATE TABLE core_prompts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    prompt TEXT NOT NULL,
    engineered BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    conversation_ids INTEGER[],
    output_ids INTEGER[],
    access_ui_id INTEGER REFERENCES lookup_access_ui(id),
    activity_status_id INTEGER REFERENCES lookup_activity_status(id) NOT NULL,
    creation_account_id INTEGER REFERENCES lookup_creation_account(id),
    data_sensitivity_id INTEGER REFERENCES lookup_data_sensitivity(id),
    github_plan_id INTEGER REFERENCES lookup_github_plans(id),
    llm_id INTEGER REFERENCES lookup_llms(id),
    llm_platform_id INTEGER REFERENCES lookup_llm_platforms(id),
    status_id INTEGER REFERENCES lookup_statuses(id),
    prompt_stage_id INTEGER REFERENCES lookup_prompt_stage(id) NOT NULL,
    country_id INTEGER REFERENCES lookup_countries(id)
);

CREATE TABLE core_outputs (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    output TEXT NOT NULL,
    output_edited TEXT,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    conversation_ids INTEGER[],
    prompt_id INTEGER REFERENCES core_prompts(id) ON DELETE SET NULL,
    access_ui_id INTEGER REFERENCES lookup_access_ui(id),
    accuracy_level_id INTEGER REFERENCES lookup_accuracy_level(id),
    actionability_id INTEGER REFERENCES lookup_actionability(id),
    creation_account_id INTEGER REFERENCES lookup_creation_account(id),
    data_sensitivity_id INTEGER REFERENCES lookup_data_sensitivity(id),
    markdown_conversion_id INTEGER REFERENCES lookup_markdown_conversion(id) NOT NULL,
    github_plan_id INTEGER REFERENCES lookup_github_plans(id),
    llm_id INTEGER REFERENCES lookup_llms(id),
    llm_platform_id INTEGER REFERENCES lookup_llm_platforms(id),
    status_id INTEGER REFERENCES lookup_statuses(id),
    knowledge_type_id INTEGER REFERENCES lookup_knowledge_types(id),
    country_id INTEGER REFERENCES lookup_countries(id)
);

CREATE TABLE core_agents (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    conversation_ids INTEGER[],
    access_ui_id INTEGER REFERENCES lookup_access_ui(id),
    accuracy_level_id INTEGER REFERENCES lookup_accuracy_level(id),
    activity_status_id INTEGER REFERENCES lookup_activity_status(id) NOT NULL,
    creation_account_id INTEGER REFERENCES lookup_creation_account(id),
    data_sensitivity_id INTEGER REFERENCES lookup_data_sensitivity(id),
    github_plan_id INTEGER REFERENCES lookup_github_plans(id),
    llm_id INTEGER REFERENCES lookup_llms(id),
    llm_platform_id INTEGER REFERENCES lookup_llm_platforms(id),
    status_id INTEGER REFERENCES lookup_statuses(id),
    country_id INTEGER REFERENCES lookup_countries(id)
);

-- Lookup Tables

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

CREATE TABLE lookup_access_ui (
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

CREATE TABLE lookup_activity_status (
    id SERIAL PRIMARY KEY,
    statusname VARCHAR(255),
    status_desc TEXT
);

CREATE TABLE lookup_agent_groups (
    id SERIAL PRIMARY KEY,
    groupname VARCHAR(255),
    groupdesc TEXT
);

CREATE TABLE lookup_automation_level (
    id SERIAL PRIMARY KEY,
    levelname VARCHAR(255),
    desc TEXT
);

CREATE TABLE lookup_creation_account (
    id SERIAL PRIMARY KEY,
    accountname VARCHAR(255),
    accountemail VARCHAR(255),
    notes TEXT
);

CREATE TABLE lookup_output_libraries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description TEXT
);

CREATE TABLE lookup_data_retention_plan (
    id SERIAL PRIMARY KEY,
    plan_name VARCHAR(255),
    description TEXT
);

CREATE TABLE lookup_data_sensitivity (
    id SERIAL PRIMARY KEY,
    sensitivitylevel VARCHAR(255),
    description TEXT
);

CREATE TABLE lookup_programming_language (
    id SERIAL PRIMARY KEY,
    language VARCHAR(255),
    desc TEXT
);

CREATE TABLE lookup_data_sizes (
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

CREATE TABLE lookup_markdown_conversion (
    id SERIAL PRIMARY KEY,
    status VARCHAR(255)
);

CREATE TABLE lookup_file_formats (
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

CREATE TABLE lookup_prompt_stage (
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

CREATE TABLE core_agents_agent_groups (
    agent_id INTEGER REFERENCES core_agents(id) ON DELETE CASCADE,
    agent_group_id INTEGER REFERENCES lookup_agent_groups(id) ON DELETE CASCADE,
    PRIMARY KEY (agent_id, agent_group_id)
);

CREATE TABLE core_agents_automation_level (
    agent_id INTEGER REFERENCES core_agents(id) ON DELETE CASCADE,
    level_id INTEGER REFERENCES lookup_automation_level(id) ON DELETE CASCADE,
    PRIMARY KEY (agent_id, level_id)
);

CREATE TABLE core_outputs_output_libraries (
    output_id INTEGER REFERENCES core_outputs(id) ON DELETE CASCADE,
    output_library_id INTEGER REFERENCES lookup_output_libraries(id) ON DELETE CASCADE,
    PRIMARY KEY (output_id, output_library_id)
);

CREATE TABLE core_conversations_data_retention_plan (
    conversation_id INTEGER REFERENCES core_conversations(id) ON DELETE CASCADE,
    data_retention_plan_id INTEGER REFERENCES lookup_data_retention_plan(id) ON DELETE CASCADE,
    PRIMARY KEY (conversation_id, data_retention_plan_id)
);

CREATE TABLE core_prompts_data_retention_plan (
    prompt_id INTEGER REFERENCES core_prompts(id) ON DELETE CASCADE,
    data_retention_plan_id INTEGER REFERENCES lookup_data_retention_plan(id) ON DELETE CASCADE,
    PRIMARY KEY (prompt_id, data_retention_plan_id)
);

CREATE TABLE core_outputs_data_retention_plan (
    output_id INTEGER REFERENCES core_outputs(id) ON DELETE CASCADE,
    data_retention_plan_id INTEGER REFERENCES lookup_data_retention_plan(id) ON DELETE CASCADE,
    PRIMARY KEY (output_id, data_retention_plan_id)
);

CREATE TABLE core_agents_data_retention_plan (
    agent_id INTEGER REFERENCES core_agents(id) ON DELETE CASCADE,
    data_retention_plan_id INTEGER REFERENCES lookup_data_retention_plan(id) ON DELETE CASCADE,
    PRIMARY KEY (agent_id, data_retention_plan_id)
);

CREATE TABLE core_conversations_programming_language (
    conversation_id INTEGER REFERENCES core_conversations(id) ON DELETE CASCADE,
    language_id INTEGER REFERENCES lookup_programming_language(id) ON DELETE CASCADE,
    PRIMARY KEY (conversation_id, language_id)
);

CREATE TABLE core_prompts_programming_language (
    prompt_id INTEGER REFERENCES core_prompts(id) ON DELETE CASCADE,
    language_id INTEGER REFERENCES lookup_programming_language(id) ON DELETE CASCADE,
    PRIMARY KEY (prompt_id, language_id)
);

CREATE TABLE core_outputs_programming_language (
    output_id INTEGER REFERENCES core_outputs(id) ON DELETE CASCADE,
    language_id INTEGER REFERENCES lookup_programming_language(id) ON DELETE CASCADE,
    PRIMARY KEY (output_id, language_id)
);

CREATE TABLE core_agents_programming_language (
    agent_id INTEGER REFERENCES core_agents(id) ON DELETE CASCADE,
    language_id INTEGER REFERENCES lookup_programming_language(id) ON DELETE CASCADE,
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

CREATE TABLE core_agents_prompts (
    agent_id INTEGER REFERENCES core_agents(id) ON DELETE CASCADE,
    prompt_id INTEGER REFERENCES core_prompts(id) ON DELETE CASCADE,
    PRIMARY KEY (agent_id, prompt_id)
);

-- Constraints

ALTER TABLE core_conversations ADD CONSTRAINT chk_conversation_category 
CHECK (EXISTS (SELECT 1 FROM core_conversations_categories WHERE conversation_id = core_conversations.id));

ALTER TABLE core_prompts ADD CONSTRAINT chk_prompt_category 
CHECK (EXISTS (SELECT 1 FROM core_prompts_categories WHERE prompt_id = core_prompts.id));

ALTER TABLE core_outputs ADD CONSTRAINT chk_output_category 
CHECK (EXISTS (SELECT 1 FROM core_outputs_categories WHERE output_id = core_outputs.id));

ALTER TABLE core_agents ADD CONSTRAINT chk_agent_category 
CHECK (EXISTS (SELECT 1 FROM core_agents_categories WHERE agent_id = core_agents.id));

-- Indexes

CREATE INDEX idx_conversations_date ON core_conversations(conversation_date);
CREATE INDEX idx_prompts_created_at ON core_prompts(created_at);
CREATE INDEX idx_outputs_created_at ON core_outputs(created_at);
CREATE INDEX idx_agents_name ON core_agents(name);

-- Comments

COMMENT ON TABLE core_conversations IS 'Holds outputs, prompts, and agents together in a cohesive data relationship';
COMMENT ON TABLE lookup_tags IS 'List of tags for categorizing core modules';
COMMENT ON TABLE lookup_cats IS 'Category lookup table for core modules';
COMMENT ON TABLE lookup_access_ui IS 'Lookup table with access UIs';
COMMENT ON TABLE lookup_accuracy_level IS 'Lookup to gauge the accuracy of generations from LLMs';
COMMENT ON TABLE lookup_actionability IS 'Lookup to triage prompt outputs for internal review';
COMMENT ON TABLE lookup_activity_status IS 'Lookup to distinguish between active entities and those removed from production';
COMMENT ON TABLE lookup_agent_groups IS 'Lookup to divide agents into groups';
COMMENT ON TABLE lookup_automation_level IS 'Lookup to store various levels of automation';
COMMENT ON TABLE lookup_creation_account IS 'Lookup to note which account a specific entity was generated with';
COMMENT ON TABLE lookup_output_libraries IS 'Lookup to control access to outputs by assigning them to a specific library';
-- Continuing from where we left off with table comments

COMMENT ON TABLE lookup_data_retention_plan IS 'Lookup to store different data retention plans';
COMMENT ON TABLE lookup_data_sensitivity IS 'Lookup to facilitate internal compliance requirements and label sensitive data';
COMMENT ON TABLE lookup_programming_language IS 'Lookup table listing common programming languages';
COMMENT ON TABLE lookup_data_sizes IS 'Lookup table for grouping files or output lengths according to size parameters';
COMMENT ON TABLE lookup_output_types IS 'Lookup table to note the format in which an output is stored in the system';
COMMENT ON TABLE lookup_markdown_conversion IS 'Lookup table used to mark off markdown files that have been converted to other output formats';
COMMENT ON TABLE lookup_file_formats IS 'Lookup table holding a list of common file formats';
COMMENT ON TABLE lookup_followup_activities IS 'Lookup table to assign follow-up activities to outputs';
COMMENT ON TABLE lookup_github_plans IS 'Lookup table to mark up entities for release on Github';
COMMENT ON TABLE lookup_llms IS 'Lookup table containing a list of large language models (LLMs)';
COMMENT ON TABLE lookup_llm_platforms IS 'Lookup table storing a list of platforms through which LLMs are made available';
COMMENT ON TABLE lookup_statuses IS 'Lookup table holding simple statuses for fallback use';
COMMENT ON TABLE lookup_agent_capabilities IS 'Lookup table to denote the discrete capabilities of specific agents';
COMMENT ON TABLE lookup_knowledge_types IS 'Lookup table used to group outputs according to the type of knowledge exhibited in the generation';
COMMENT ON TABLE lookup_prompt_stage IS 'Lookup table to assign the stage a prompt is at in the system retention process';
COMMENT ON TABLE lookup_countries IS 'Lookup table listing world countries for assigning entities to specific geographies';
COMMENT ON TABLE core_agents_prompts IS 'Junction table for the many-to-many relationship between agents and prompts';

-- End of SQL DDL