-- Ensure we're using the public schema
SET search_path TO public;

-- Create ENUM types
CREATE TYPE activity_status AS ENUM ('active', 'inactive', 'archived');
CREATE TYPE md_conversion_status AS ENUM ('not_started', 'in_progress', 'completed', 'failed');

-- Create tables
CREATE TABLE public.users (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE public.lookupllmlist (
    id SERIAL PRIMARY KEY,
    llm_name VARCHAR(100) NOT NULL UNIQUE,
    llm_desc TEXT,
    year_released INTEGER CHECK (year_released > 1950 AND year_released <= EXTRACT(YEAR FROM CURRENT_DATE))
);

CREATE TABLE public.lookupgptmodels (
    id SERIAL PRIMARY KEY,
    model_name VARCHAR(100) NOT NULL UNIQUE,
    model_description TEXT
);

CREATE TABLE public.lookupgptrating (
    id SERIAL PRIMARY KEY,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    rating_description TEXT
);

CREATE TABLE public.lookupgptresponsetimes (
    id SERIAL PRIMARY KEY,
    response_time VARCHAR(100) NOT NULL,
    min_value INTEGER NOT NULL CHECK (min_value >= 0),
    max_value INTEGER NOT NULL CHECK (max_value > min_value),
    description TEXT
);

CREATE TABLE public.customgpt (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    link VARCHAR(255),
    description TEXT,
    config TEXT,
    creation_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    activity_status activity_status NOT NULL DEFAULT 'active',
    gpt_model_id INTEGER REFERENCES lookupgptmodels(id) ON DELETE SET NULL,
    gpt_rating_id INTEGER REFERENCES lookupgptrating(id) ON DELETE SET NULL,
    response_time_id INTEGER REFERENCES lookupgptresponsetimes(id) ON DELETE SET NULL,
    llm_list_id INTEGER REFERENCES lookupllmlist(id) ON DELETE SET NULL
);

CREATE TABLE public.lookupagentgroups (
    id SERIAL PRIMARY KEY,
    group_name VARCHAR(100) NOT NULL UNIQUE,
    group_description TEXT
);

CREATE TABLE public.customgpt_agentgroups (
    customgpt_id BIGINT REFERENCES customgpt(id) ON DELETE CASCADE,
    agentgroups_id INTEGER REFERENCES lookupagentgroups(id) ON DELETE CASCADE,
    PRIMARY KEY (customgpt_id, agentgroups_id)
);

CREATE TABLE public.lookupgptcats (
    id SERIAL PRIMARY KEY,
    cat_name VARCHAR(100) NOT NULL UNIQUE,
    cat_desc TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE public.customgpt_gptcats (
    customgpt_id BIGINT REFERENCES customgpt(id) ON DELETE CASCADE,
    gptcats_id INTEGER REFERENCES lookupgptcats(id) ON DELETE CASCADE,
    PRIMARY KEY (customgpt_id, gptcats_id)
);

CREATE TABLE public.lookupgptoutputreviewsdone (
    id SERIAL PRIMARY KEY,
    review_name VARCHAR(100) NOT NULL UNIQUE,
    review_desc TEXT
);

CREATE TABLE public.customgpt_outputreviewsdone (
    customgpt_id BIGINT REFERENCES customgpt(id) ON DELETE CASCADE,
    outputreviewsdone_id INTEGER REFERENCES lookupgptoutputreviewsdone(id) ON DELETE CASCADE,
    PRIMARY KEY (customgpt_id, outputreviewsdone_id)
);

CREATE TABLE public.lookupprojecttags (
    id SERIAL PRIMARY KEY,
    tag_name VARCHAR(100) NOT NULL UNIQUE,
    tag_desc TEXT
);

CREATE TABLE public.customgpt_projecttags (
    customgpt_id BIGINT REFERENCES customgpt(id) ON DELETE CASCADE,
    projecttags_id INTEGER REFERENCES lookupprojecttags(id) ON DELETE CASCADE,
    PRIMARY KEY (customgpt_id, projecttags_id)
);

CREATE TABLE public.lookuppromptdevstages (
    id SERIAL PRIMARY KEY,
    stage_name VARCHAR(100) NOT NULL UNIQUE,
    stage_desc TEXT
);

CREATE TABLE public.promptlibrary (
    id BIGSERIAL PRIMARY KEY,
    prompt_name VARCHAR(100) NOT NULL,
    prompt_text TEXT NOT NULL,
    prompt_dev_stage_id INTEGER REFERENCES lookuppromptdevstages(id) ON DELETE SET NULL
);

CREATE TABLE public.customgpt_promptlibrary (
    customgpt_id BIGINT REFERENCES customgpt(id) ON DELETE CASCADE,
    promptlibrary_id BIGINT REFERENCES promptlibrary(id) ON DELETE CASCADE,
    PRIMARY KEY (customgpt_id, promptlibrary_id)
);

CREATE TABLE public.promptlibrary_projecttags (
    promptlibrary_id BIGINT REFERENCES promptlibrary(id) ON DELETE CASCADE,
    projecttags_id INTEGER REFERENCES lookupprojecttags(id) ON DELETE CASCADE,
    PRIMARY KEY (promptlibrary_id, projecttags_id)
);

CREATE TABLE public.lookupaccuracylevel (
    id SERIAL PRIMARY KEY,
    level VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE public.lookupactionabilitylevel (
    id SERIAL PRIMARY KEY,
    level_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE public.promptoutput (
    id BIGSERIAL PRIMARY KEY,
    date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    summary TEXT,
    full_output TEXT NOT NULL,
    notes TEXT,
    prompt_id BIGINT REFERENCES promptlibrary(id) ON DELETE CASCADE,
    accuracy_level_id INTEGER REFERENCES lookupaccuracylevel(id) ON DELETE SET NULL,
    actionability_level_id INTEGER REFERENCES lookupactionabilitylevel(id) ON DELETE SET NULL,
    llm_list_id INTEGER REFERENCES lookupllmlist(id) ON DELETE SET NULL,
    md_conversion_status md_conversion_status NOT NULL DEFAULT 'not_started'
);

CREATE TABLE public.customgpt_promptoutput (
    customgpt_id BIGINT REFERENCES customgpt(id) ON DELETE CASCADE,
    promptoutput_id BIGINT REFERENCES promptoutput(id) ON DELETE CASCADE,
    PRIMARY KEY (customgpt_id, promptoutput_id)
);

CREATE TABLE public.lookupknowledgetypes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE public.promptoutput_knowledgetypes (
    promptoutput_id BIGINT REFERENCES promptoutput(id) ON DELETE CASCADE,
    knowledgetypes_id INTEGER REFERENCES lookupknowledgetypes(id) ON DELETE CASCADE,
    PRIMARY KEY (promptoutput_id, knowledgetypes_id)
);

CREATE TABLE public.lookupmediatypes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE public.promptoutput_mediatypes (
    promptoutput_id BIGINT REFERENCES promptoutput(id) ON DELETE CASCADE,
    mediatypes_id INTEGER REFERENCES lookupmediatypes(id) ON DELETE CASCADE,
    PRIMARY KEY (promptoutput_id, mediatypes_id)
);

CREATE TABLE public.promptoutput_projecttags (
    promptoutput_id BIGINT REFERENCES promptoutput(id) ON DELETE CASCADE,
    projecttags_id INTEGER REFERENCES lookupprojecttags(id) ON DELETE CASCADE,
    PRIMARY KEY (promptoutput_id, projecttags_id)
);

CREATE TABLE public.promptoutput_promptlibrary (
    promptoutput_id BIGINT REFERENCES promptoutput(id) ON DELETE CASCADE,
    promptlibrary_id BIGINT REFERENCES promptlibrary(id) ON DELETE CASCADE,
    PRIMARY KEY (promptoutput_id, promptlibrary_id)
);

CREATE TABLE public.outputtag (
    id SERIAL PRIMARY KEY,
    tag_name VARCHAR(100) NOT NULL UNIQUE,
    created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE public.promptoutput_tags (
    promptoutput_id BIGINT REFERENCES promptoutput(id) ON DELETE CASCADE,
    tag_id INTEGER REFERENCES outputtag(id) ON DELETE CASCADE,
    PRIMARY KEY (promptoutput_id, tag_id)
);

CREATE TABLE public.accessui (
    id SERIAL PRIMARY KEY,
    ui_name VARCHAR(100) NOT NULL,
    custom_gpt_id BIGINT REFERENCES customgpt(id) ON DELETE CASCADE
);

-- Add indexes
CREATE INDEX idx_customgpt_gpt_model ON customgpt(gpt_model_id);
CREATE INDEX idx_customgpt_gpt_rating ON customgpt(gpt_rating_id);
CREATE INDEX idx_customgpt_response_time ON customgpt(response_time_id);
CREATE INDEX idx_customgpt_llm_list ON customgpt(llm_list_id);
CREATE INDEX idx_promptlibrary_dev_stage ON promptlibrary(prompt_dev_stage_id);
CREATE INDEX idx_promptoutput_prompt ON promptoutput(prompt_id);
CREATE INDEX idx_promptoutput_accuracy ON promptoutput(accuracy_level_id);
CREATE INDEX idx_promptoutput_actionability ON promptoutput(actionability_level_id);
CREATE INDEX idx_promptoutput_llm_list ON promptoutput(llm_list_id);
CREATE INDEX idx_accessui_custom_gpt ON accessui(custom_gpt_id);

-- Add comments
COMMENT ON TABLE customgpt IS 'Stores information about custom GPT models';
COMMENT ON TABLE promptlibrary IS 'Contains a library of prompts used in the system';
COMMENT ON TABLE promptoutput IS 'Stores outputs generated from prompts';
COMMENT ON TABLE outputtag IS 'Contains tags for categorizing prompt outputs';
COMMENT ON TABLE accessui IS 'Manages UI access for custom GPTs';