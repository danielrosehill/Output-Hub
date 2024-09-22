# Output Hub PostgreSQL Database Model Description

## Overview

The Output Hub database model is implemented in PostgreSQL. It is designed to manage custom GPT models, prompts, and their outputs. The model includes various lookup tables for categorization and classification purposes, uses ENUM types for specific statuses, and incorporates timestamps for tracking creation and updates.

## Main Tables

1. `users`: Stores user information including username, email, and password hash.
2. `customgpt`: Central table for custom GPT models.
3. `promptlibrary`: Contains prompts used in the system.
4. `promptoutput`: Stores outputs generated from prompts.
5. `outputtag`: Contains tags for categorizing prompt outputs.
6. `accessui`: Manages UI access for custom GPTs.

## Core Modules Field Descriptions

### 1. Custom GPTs (`customgpt` table)

- `id`: BIGSERIAL, Primary Key
- `name`: VARCHAR(100), Not Null
- `link`: VARCHAR(255)
- `description`: TEXT
- `config`: TEXT
- `creation_date`: TIMESTAMP WITH TIME ZONE, Default: CURRENT_TIMESTAMP
- `activity_status`: activity_status ENUM ('active', 'inactive', 'archived'), Not Null, Default: 'active'
- `gpt_model_id`: INTEGER, Foreign Key to lookupgptmodels
- `gpt_rating_id`: INTEGER, Foreign Key to lookupgptrating
- `response_time_id`: INTEGER, Foreign Key to lookupgptresponsetimes
- `llm_list_id`: INTEGER, Foreign Key to lookupllmlist

### 2. Prompt Library (`promptlibrary` table)

- `id`: BIGSERIAL, Primary Key
- `prompt_name`: VARCHAR(100), Not Null
- `prompt_text`: TEXT, Not Null
- `prompt_dev_stage_id`: INTEGER, Foreign Key to lookuppromptdevstages

### 3. Prompt Outputs (`promptoutput` table)

- `id`: BIGSERIAL, Primary Key
- `date`: TIMESTAMP WITH TIME ZONE, Default: CURRENT_TIMESTAMP
- `summary`: TEXT
- `full_output`: TEXT, Not Null
- `notes`: TEXT
- `prompt_id`: BIGINT, Foreign Key to promptlibrary
- `accuracy_level_id`: INTEGER, Foreign Key to lookupaccuracylevel
- `actionability_level_id`: INTEGER, Foreign Key to lookupactionabilitylevel
- `llm_list_id`: INTEGER, Foreign Key to lookupllmlist
- `md_conversion_status`: md_conversion_status ENUM ('not_started', 'in_progress', 'completed', 'failed'), Not Null, Default: 'not_started'

## Lookup Tables

1. `lookupllmlist`: List of LLM (Language Learning Model) names and descriptions.
2. `lookupgptmodels`: Available GPT models.
3. `lookupgptrating`: Rating system for GPT models.
4. `lookupgptresponsetimes`: Response time categories for GPT models.
5. `lookupagentgroups`: Groups for categorizing custom GPTs.
6. `lookupgptcats`: Categories for custom GPTs.
7. `lookupgptoutputreviewsdone`: Types of reviews done on GPT outputs.
8. `lookupprojecttags`: Tags for projects.
9. `lookuppromptdevstages`: Development stages for prompts.
10. `lookupaccuracylevel`: Accuracy levels for prompt outputs.
11. `lookupactionabilitylevel`: Actionability levels for prompt outputs.
12. `lookupknowledgetypes`: Types of knowledge associated with prompt outputs.
13. `lookupmediatypes`: Media types associated with prompt outputs.

## Relationships

### Many-to-Many (M2M) Relationships

1. `customgpt` and `lookupagentgroups` via `customgpt_agentgroups`
2. `customgpt` and `lookupgptcats` via `customgpt_gptcats`
3. `customgpt` and `lookupgptoutputreviewsdone` via `customgpt_outputreviewsdone`
4. `customgpt` and `lookupprojecttags` via `customgpt_projecttags`
5. `customgpt` and `promptlibrary` via `customgpt_promptlibrary`
6. `promptlibrary` and `lookupprojecttags` via `promptlibrary_projecttags`
7. `customgpt` and `promptoutput` via `customgpt_promptoutput`
8. `promptoutput` and `lookupknowledgetypes` via `promptoutput_knowledgetypes`
9. `promptoutput` and `lookupmediatypes` via `promptoutput_mediatypes`
10. `promptoutput` and `lookupprojecttags` via `promptoutput_projecttags`
11. `promptoutput` and `promptlibrary` via `promptoutput_promptlibrary`
12. `promptoutput` and `outputtag` via `promptoutput_tags`

### Many-to-One (M2O) Relationships

1. `customgpt` to `lookupgptmodels`
2. `customgpt` to `lookupgptrating`
3. `customgpt` to `lookupgptresponsetimes`
4. `customgpt` to `lookupllmlist`
5. `promptlibrary` to `lookuppromptdevstages`
6. `promptoutput` to `promptlibrary`
7. `promptoutput` to `lookupaccuracylevel`
8. `promptoutput` to `lookupactionabilitylevel`
9. `promptoutput` to `lookupllmlist`
10. `accessui` to `customgpt`

## Additional Features

1. The model uses PostgreSQL-specific ENUM types for `activity_status` and `md_conversion_status`.
2. Timestamps are used to track creation and updates in relevant tables, utilizing PostgreSQL's TIMESTAMP WITH TIME ZONE data type.
3. Indexes are created on foreign key columns to optimize query performance in PostgreSQL.
4. Comments are added to main tables for documentation purposes, which can be queried using PostgreSQL's system catalogs.
5. The model includes various constraints, such as unique constraints on names in lookup tables and check constraints on numeric values, leveraging PostgreSQL's constraint capabilities.
6. The use of BIGSERIAL for primary keys in main tables ensures support for a large number of records.

This PostgreSQL database model provides a comprehensive structure for managing custom GPT models, prompts, and their outputs, with extensive categorization and classification capabilities through the use of lookup tables and many-to-many relationships. The design takes advantage of PostgreSQL-specific features for optimized performance and data integrity.