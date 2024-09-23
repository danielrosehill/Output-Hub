# Natural Language Data Model Definition Prompt 2

Thank you for your help in defining some basic fields for the four core modules in this system.

To keep all this information together, I'll repeat the combined SQL:

```sql
CREATE TABLE conversations (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    prompt_id INTEGER REFERENCES prompts(id) ON DELETE SET NULL,
    output_id INTEGER REFERENCES outputs(id) ON DELETE SET NULL,
    agent_id INTEGER REFERENCES agents(id) ON DELETE SET NULL,
    conversation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE prompts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),  -- Nullable, allows for prompts that don't need a title
    prompt TEXT NOT NULL,
    engineered BOOLEAN DEFAULT FALSE,  -- Whether the prompt was manually engineered
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    conversation_ids INTEGER[],  -- Array of conversation IDs related to this prompt
    output_ids INTEGER[]  -- Array of output IDs generated from this prompt
);

CREATE TABLE outputs (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),  -- Nullable, allows for outputs that don't need a title
    output TEXT NOT NULL,
    output_edited TEXT,  -- Nullable, in case the output is edited
    notes TEXT,  -- Additional notes about the output
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    conversation_ids INTEGER[],  -- Array of conversation IDs related to this output
    prompt_id INTEGER REFERENCES prompts(id) ON DELETE SET NULL  -- Foreign key to the prompt that generated this output
);

CREATE TABLE agents (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,  -- The name of the GPT/LLM
    description TEXT,  -- A description of the GPT/LLM or its purpose
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    conversation_ids INTEGER[]  -- Array of conversation IDs related to this agent
);
```

## Additional Tables

I'd like to try to add back some of the data that was part of my original model but without adding back too much of the complication (if possible).

For the purpose of distinguishing between these essential parts of the database and less key parts, let's refer to the first four tables as the core modules.

Those are:

- Conversations (conversations)
- Prompts (prompts)
- Outputs (outputs)
- Agents (agents)

If I refer to the "core modules" - this is what I'm referring to.

Do you think it makes sense to add `core_` to each table name to make them easy to distinguish? If so, please make that change.

I'll describe the additional lookup tables in my database design and will also describe their purpose. Feel free to extract some of that information into table comments.

Where possible, I will define both the fields in my design and their database. If I neglect to include any details, make educated guesses.

## Notes

The main purpose of the conversations table is to hold the outputs, prompts, and agents together in a cohesive data relationship. While relationships are configured between each of these units and conversations, most relationships with lookups are to the other three elements.

---

# The Main Lookup Tables: Tags and Categories

## Tags Lookup

### Table Name
**`lookup_tags`**

### Table Fields

- `id`
- `tagname` (varchar)
- `tagdesc` (text)
- `createdat` (timestamp)

### Table Description

This table is a list of tags.

### Data Relationships

Every core module can be associated with an unlimited number of tags, so there are four many-to-many relationships here. 

The related values should be nullable—users should be able to skip the tag assignment.

---

## Categories Lookup

### Table Name
**`lookup_cats`**

### Table Fields

- `id` (serial)
- `cat_name` (varchar)
- `cat_desc` (text)
- `created_at` (timestamp)

### Table Description

As the name suggests, this is a category lookup table. Again, there should be many-to-many relationships between this table and the four core modules.

### Data Relationships

### Constraints

Values on tables related to the categories table should NOT be nullable. For every module, users should be required to assign at least one category.

---

# Secondary Lookup Tables

In addition to that, I had quite a long list of secondary lookup tables.

## Access UI Lookup

### Table Name
**`lookup_accessui`**

### Table Fields

- `id`
- `uiname` (varchar)

### Table Description

This is a lookup table with access UIs. Each of the four core modules can only be associated with one value in this lookup.

### Data Relationships

### Constraints

The related values should be nullable.

---

## Accuracy Level Table (Lookup)

### Table Name
**`lookup_accuracy_level`**

### Table Fields

- `id`
- `level_name` (varchar)
- `desc` (text)

### Table Description

This lookup is intended to allow the user to gauge the accuracy of generations from LLMs in order to flag suspect generations for closer examination.

### Data Relationships

There is a one to many (02M) relationship between this table and those tables related to it (each agent or output could be tagged with one level, but each accuracy level could be associated with many values on the corresponding tables).

### Constraints

The related values should be nullable. Users should be able to skip assigning an accuracy level.

---

## Actionability Level Table (Lookup)

### Table Name
**`lookup_actionability`**

### Table Fields

- `id`
- `levelname` (varchar)
- `level_desc` (text)

### Table Description

This lookup table lists levels of "actionability." It's used to triage prompt outputs for internal review by flagging those that are more actionable.

### Data Relationships

This table holds a one to many (02M) relationship with the outputs table.

Each output can only have one level of actionability, but each level of actionability can be associated with many outputs.

### Constraints

The related values should be nullable. Users should be able to skip assigning an actionability level.

---

## Activity Status Table (Lookup)

### Table Name
**`lookup_activitystatus`**

### Table Fields

- `id` (serial)
- `statusname` (varchar)
- `status_desc` (text)

### Table Description

This is a lookup table that lists activity levels. It's intended to distinguish between active entities and those that have been removed from production.

### Data Relationships

This status can apply to agents and prompts. In both cases, it's a one-to-many (O2M) relationship (each agent or prompt can only have one activity status, but each status can be associated with many values in the corresponding tables).

### Constraints

The related values should not be nullable. If there is a relationship between a module and "activity status," a value should be required.

---

## Agent Groups Table (Lookup)

### Table Name
**`lookup_agentgroups`**

### Table Fields

- `id`
- `groupname` (varchar)
- `groupdesc` (text)

### Table Description

This is a lookup table that is intended to divide agents into groups (for filtering, access restrictions, or to group common agents together for other reasons).

### Data Relationships

This lookup table has a many-to-many relationship with agents. Each agent can be in multiple groups and vice versa.

### Constraints

The related values should be nullable. Users should not assign an agent to a group.

---

## Automation Level Table (Lookup)

### Table Name
**`lookup_automationlevel`**

### Table Fields

- `id` (serial)
- `levelname` (varchar)
- `desc` (text)

### Table Description

This lookup table stores various levels of automation, but those are not mutually exclusive.

### Data Relationships

It relates to the agents table. There is a many-to-many relationship between this lookup and agents.

### Constraints

Related values should be nullable. Users can choose to skip assigning an automation level to an agent.

---

## Creation Account Table (Lookup)

### Table Name
**`lookup_creationaccount`**

### Table Fields

- `id`
- `accountname` (varchar)
- `accountemail` (varchar)
- `notes` (text)

### Table Description

This is a lookup table used to note which account a specific agent (or prompt or output) was generated with, intended for users who have multiple accounts with various LLM providers.

### Data Relationships

This table has a one-to-many (02M) relationship with all four core modules (agents, conversations, outputs, prompts). 

Each of these entities can be associated with one account, but each account can be associated with multiple entities within each of the core modules.

### Constraints

If related values exist, they should not be nullable. Users are required to specify which account an entity was created under.

---

## Output Libraries Table (Lookup)

### Table Name
**`lookup_outputlibraries`**

### Table Description

This is a lookup table that is intended to allow the user to control access to outputs they log by assigning them to a specific library (and in turn, access permissions can be configured for users against that library).

### Data Relationships

There is a many-to-many relationship between this table and the outputs table: each output can be associated with many libraries, and each library can store many associated outputs.

### Constraints

Related fields should be nullable. Users should be able to choose to skip assigning outputs to libraries.

---

## Data Retention Plan Table (Lookup)

### Table Name
**`lookup_dataretentionplan`**

### Table Description

This is a lookup table that stores different data retention plans (for example, GDPR). This table is intended to allow the user to associate specific LLM-generated entities with common compliance requirements related to data storage.

### Data Relationships

Because there are many compliance requirements, and users may wish to configure their own ones, a many-to-many relationship exists between this table and all four of the core modules (agents, conversations, outputs, prompts).

### Constraints

This related value is nullable. Users should not be required to

 assign a data retention policy if none applies.

---

## Data Sensitivity Level Table (Lookup)

### Table Name
**`lookup_datasensitivity`**

### Table Fields

- `id` (serial)
- `sensitivitylevel` (varchar)
- `description` (text)

### Table Description

This lookup table is intended to facilitate internal compliance requirements and to allow business users to label sensitive data accordingly or mark data as suitable for public release.

### Data Relationships

This table has a one to many (O2M) relationship with all of my core modules. Each core module can be associated with only one of these levels, but each level can be associated with many values in the core modules.

### Constraints

The related fields are nullable. Users should be able to skip assigning the related value.

---

## Programming Language Lookup Table

### Table Name

lookup_programminglanguage

### Table Fields

id (serial)
language (varchar)
desc (text)

### Table Description

This lookup table lists common programming languages. It is useful because all four system modules may target specific or various programming languages (for example, an output may contain a snippet of Python).

### Data Relationships

A many to many relationship should be configured between this lookup table and the four core modules.

### Constraints

For fields with relationship to this table, this should be a nullable values. Users should never be required to specify a programming language.

---

## Data Size Classifiers (Lookup)

### Table Name

lookup_datasizes

### Table Fields

id (serial)
size (varchar)
minsize (bigint)
maxsize (bigint)
desc (text)

### Table Description

This is a lookup table is intended for broad use throughout the system in order to group files or output lengths according to size parameters. The minimum and maximum integer values are intended to store numbers like the numbers of bytes.

### Data Relationships

Currently none

### Constraints

---

## Output Types (Lookup)

## Table Name

lookup_output_types

### Table Fields

id
type (varchar)
desc (varchar)

### Table Description

This is a lookup table which is intended to note the format in which an output is currently stored in the system. Sometimes, LLMs output to markdown while in other instances their outputs may be captured as text or JSON.

### Data Relationships

To cater for the possibility that a single output could contain multiple artifacts (for instance code blocks in different languages) there is a many to many (M2M) relationship between outputs and this table.

### Constraints

The field in the outputs table holding the foreign key should not be nullable. Users should be required to assign an output to a form.

---

### Markdown Conversion Lookup 

### Table Name

lookup_md_conversion

### Table Fields

id(serial)
status (varchar)

### Table Description

This is a very simple lookup table used to mark off markdown files that have been converted to other output formats.

### Data Relationships

02M (one to many) with outputs.

Each output can be associated with one conversion status, but each converstion status can be associated with many outputs.

### Constraints

This should not be nullable on the outputs table.

--

## File Formats Lookup Table

## Table Name

lookup_fileformats

### Table Fields

id (serial)
format (varchar)
extension (varchar)
desc (text)

### Table Description

This lookup table holds a list of common file formats and is used to note the formats of files that were generated during LLM interactions. 

### Data Relationships

Because a single output could result in the creation of multiple files with different file extensions, an M2M relationship exists between the outputs table and this table. 

### Constraints

The related fields should be nullable.

---

## Follow Up Activities Lookup Table

### Table Name

lookup_followup_activities

### Table Fields

id (serial)
activitiy (varchar)
desc (varchar)

### Table Description

This is an important table which is intended to allow users to assign follow up activities to outputs (like 'fact check', or 'review sources').

### Data Relationships

An M2M exists between this table and each of:

- the prompts table
- the outputs table

### Constraints

For all related fields, the values should be nullable.

--

## Github Plans (Lookup)

## Table Name

lookup_github_plans

### Table Fields

id (serial)
plan (varchar)
desc (varchar)

### Table Description

This table is intended to allow users to mark up agents or prompts or outputs for release on Github (ie, open sourcing).

### Data Relationships

A one to many (O2M) exists between this table and:

- The prompts table
- The agents table
- The outputs table

### Constraints

Related fields are nullable.

--

## LLMs (Lookup)

### Table Name

lookup_llms

### Table Fields

id (serial)
name (varchar)
desc (varchar)
by (varchar)

### Table Description

This lookup table contains a list of large language models (LLMs) and is used to create associations between the various core system modules and the evolving list of major LLMs in production.

### Data Relationships

One to many (o2m) relationships should exist between the LLM lookup table and:

- The prompts table
- The outputs table
- The agents table

### Constraints

Related fields are nullable.

## LLM Platforms Lookup Table

## Table Name

lookup_llm_platforms

### Table Fields

id (serial)
name (varchar)
desc (varchar)

### Table Description

This lookup table stores a list of platforms through which LLMs are made available and can be used to state where prompts, outputs, and agents were developed or are being stored (via different relationships)

### Data Relationships
 
 One to many relationships between this table and:

 - The prompts table
 - The outputs table
 - The agents table

### Constraints

Related fields are nullable.

---

## Common Statuses Lookup Table

### Table Name

lookup_statuses

### Table Fields

id (serial)
status (varchar)
desc (varchar)

### Table Description

This lookup table is intended to hold simple statuses (like to do, pending, in progress, done) and is intended as a fallback for tables on which this hasn't been configured in another way.

### Data Relationships

One to many between this table and:

- Prompts
- Outputs
- Agents

### Constraints

--

## Agent Capabilities Lookup Table

## Table Name

lookup_agent_capabilities

### Table Fields

id (serial)
capability (varchar)
desc (text)

### Table Description

This lookup table is intended to allow users to denote the discrete capabilities (such as 'text summation') that specific agents have for the purpose of filtering and searching through scaling inventories of agents.

### Data Relationships

Many to many between this table and the agents table.

### Constraints

Related fields are nullable.

--

## Knowledge Types (Lookups)

### Table Name

lookup_knowledge_types

### Table Fields

id (serial)
type (varchar)
desc (varchar)

### Table Description

This table is used to group outputs according to the type of knowledge exhibited in the generation. An example might be "a guide" or "a checklist"

### Data Relationships

### Constraints

Nullable for related fields.

## Prompt Stage Lookup

### Table Name

lookup_promptstage

### Table Fields

id (serial)
stage (varchar)
desc (varchar)

### Table Description

This lookup table is designed to facilitate the management of the prompt library by allowing users to assign the "stage" a prompt is at in the system retention process. Prompts automatically captured through the capture form might enter as drafts. Some prompts might be active. And others might be deactivated.

### Data Relationships

A one to many (02M) between this table and the prompts table.

### Constraints

Not-nullable.

## Countries Lookup Table

### Table Name

lookup_countries

### Table Fields

id (serial)
country (varchar)

### Table Description

A list of world countries in order to assign entities to specific geographies where applicable.

### Data Relationships

A one to many between this lookup table and:

- Prompts
- Outputs
- Agents

Intended to support less common cases in which it makes sense to create these associations.

### Constraints

Nullable.
