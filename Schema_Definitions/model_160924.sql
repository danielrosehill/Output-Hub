CREATE TABLE LookupAccuracyLevel (
    id SERIAL PRIMARY KEY,
    level VARCHAR(100),
    description TEXT
);

CREATE TABLE LookupActionabilityLevel (
    id SERIAL PRIMARY KEY,
    level_name VARCHAR(100),
    description TEXT
);

CREATE TABLE LookupActivityStatus (
    id SERIAL PRIMARY KEY,
    status_name VARCHAR(100),
    description TEXT
);

CREATE TABLE LookupAgentGroups (
    id SERIAL PRIMARY KEY,
    group_name VARCHAR(100),
    group_description TEXT
);

CREATE TABLE LookupGptModels (
    id SERIAL PRIMARY KEY,
    model_name VARCHAR(100),
    model_description TEXT
);

CREATE TABLE LookupGptOutputReviewsDone (
    id SERIAL PRIMARY KEY,
    review_name VARCHAR(100),
    review_desc TEXT
);

CREATE TABLE LookupGptRating (
    id SERIAL PRIMARY KEY,
    rating INTEGER,
    rating_description TEXT
);

CREATE TABLE LookupGptResponseTimes (
    id SERIAL PRIMARY KEY,
    response_time VARCHAR(100),
    min_value INTEGER,
    max_value INTEGER,
    description TEXT
);

CREATE TABLE LookupGptCats (
    id SERIAL PRIMARY KEY,
    cat_name VARCHAR(100),
    cat_desc TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE LookupKnowledgeTypes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    description TEXT
);

CREATE TABLE LookupLlmList (
    id SERIAL PRIMARY KEY,
    llm_name VARCHAR(100),
    llm_desc TEXT,
    year_released INTEGER
);

CREATE TABLE LookupMdConversionStatus (
    id SERIAL PRIMARY KEY,
    status_name VARCHAR(100)
);

CREATE TABLE LookupMediaTypes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    description TEXT
);

CREATE TABLE LookupProjectTags (
    id SERIAL PRIMARY KEY,
    tag_name VARCHAR(100),
    tag_desc TEXT
);

CREATE TABLE LookupPromptDevStages (
    id SERIAL PRIMARY KEY,
    stage_name VARCHAR(100),
    stage_desc TEXT
);

CREATE TABLE CustomGPT (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    link VARCHAR,
    description TEXT,
    config JSON,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    activity_status_id INTEGER REFERENCES LookupActivityStatus(id) ON DELETE SET NULL,
    gpt_model_id INTEGER REFERENCES LookupGptModels(id) ON DELETE SET NULL,
    gpt_rating_id INTEGER REFERENCES LookupGptRating(id) ON DELETE SET NULL,
    response_time_id INTEGER REFERENCES LookupGptResponseTimes(id) ON DELETE SET NULL,
    llm_list_id INTEGER REFERENCES LookupLlmList(id) ON DELETE SET NULL
);

CREATE TABLE PromptLibrary (
    id SERIAL PRIMARY KEY,
    prompt_name VARCHAR(100),
    prompt_text TEXT,
    prompt_dev_stage_id INTEGER REFERENCES LookupPromptDevStages(id) ON DELETE SET NULL
);

CREATE TABLE OutputTag (
    id SERIAL PRIMARY KEY,
    tag_name VARCHAR(100),
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE PromptOutput (
    id SERIAL PRIMARY KEY,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    summary TEXT,
    full_output TEXT,
    notes TEXT,
    prompt_id INTEGER REFERENCES PromptLibrary(id) ON DELETE CASCADE,
    accuracy_level_id INTEGER REFERENCES LookupAccuracyLevel(id) ON DELETE SET NULL,
    actionability_level_id INTEGER REFERENCES LookupActionabilityLevel(id) ON DELETE SET NULL,
    llm_list_id INTEGER REFERENCES LookupLlmList(id) ON DELETE SET NULL,
    md_conversion_status_id INTEGER REFERENCES LookupMdConversionStatus(id) ON DELETE SET NULL
);

CREATE TABLE AccessUI (
    id SERIAL PRIMARY KEY,
    ui_name VARCHAR(100),
    custom_gpt_id INTEGER REFERENCES CustomGPT(id) ON DELETE CASCADE
);

CREATE TABLE customgpt_promptoutput (
    customgpt_id INTEGER REFERENCES CustomGPT(id) ON DELETE CASCADE,
    promptoutput_id INTEGER REFERENCES PromptOutput(id) ON DELETE CASCADE,
    PRIMARY KEY (customgpt_id, promptoutput_id)
);

CREATE TABLE customgpt_agentgroups (
    customgpt_id INTEGER REFERENCES CustomGPT(id) ON DELETE CASCADE,
    agentgroups_id INTEGER REFERENCES LookupAgentGroups(id) ON DELETE CASCADE,
    PRIMARY KEY (customgpt_id, agentgroups_id)
);

CREATE TABLE customgpt_outputreviewsdone (
    customgpt_id INTEGER REFERENCES CustomGPT(id) ON DELETE CASCADE,
    outputreviewsdone_id INTEGER REFERENCES LookupGptOutputReviewsDone(id) ON DELETE CASCADE,
    PRIMARY KEY (customgpt_id, outputreviewsdone_id)
);

CREATE TABLE customgpt_gptcats (
    customgpt_id INTEGER REFERENCES CustomGPT(id) ON DELETE CASCADE,
    gptcats_id INTEGER REFERENCES LookupGptCats(id) ON DELETE CASCADE,
    PRIMARY KEY (customgpt_id, gptcats_id)
);

CREATE TABLE customgpt_projecttags (
    customgpt_id INTEGER REFERENCES CustomGPT(id) ON DELETE CASCADE,
    projecttags_id INTEGER REFERENCES LookupProjectTags(id) ON DELETE CASCADE,
    PRIMARY KEY (customgpt_id, projecttags_id)
);

CREATE TABLE promptlibrary_projecttags (
    promptlibrary_id INTEGER REFERENCES PromptLibrary(id) ON DELETE CASCADE,
    projecttags_id INTEGER REFERENCES LookupProjectTags(id) ON DELETE CASCADE,
    PRIMARY KEY (promptlibrary_id, projecttags_id)
);

CREATE TABLE promptoutput_tags (
    promptoutput_id INTEGER REFERENCES PromptOutput(id) ON DELETE CASCADE,
    tag_id INTEGER REFERENCES OutputTag(id) ON DELETE CASCADE,
    PRIMARY KEY (promptoutput_id, tag_id)
);

CREATE TABLE promptoutput_knowledgetypes (
    promptoutput_id INTEGER REFERENCES PromptOutput(id) ON DELETE CASCADE,
    knowledgetypes_id INTEGER REFERENCES LookupKnowledgeTypes(id) ON DELETE CASCADE,
    PRIMARY KEY (promptoutput_id, knowledgetypes_id)
);

CREATE TABLE promptoutput_mediatypes (
    promptoutput_id INTEGER REFERENCES PromptOutput(id) ON DELETE CASCADE,
    mediatypes_id INTEGER REFERENCES LookupMediaTypes(id) ON DELETE CASCADE,
    PRIMARY KEY (promptoutput_id, mediatypes_id)
);

CREATE TABLE promptoutput_projecttags (
    promptoutput_id INTEGER REFERENCES PromptOutput(id) ON DELETE CASCADE,
    projecttags_id INTEGER REFERENCES LookupProjectTags(id) ON DELETE CASCADE,
    PRIMARY KEY (promptoutput_id, projecttags_id)
);
