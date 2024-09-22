### Table: `users` (Schema: `public`)
**Description:** Stores user information

**Fields:**

- `id`: This field is of type `INTEGER`.
- `username`: This field is of type `VARCHAR(255)`.
- `email`: This field is of type `VARCHAR(255)`.
- `password_hash`: This field is of type `VARCHAR(255)`.
- `is_active`: This field is of type `BOOLEAN`.
- `created_at`: This field is of type `TIMESTAMP`.
- `updated_at`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `accessui` (Schema: `public`)
**Description:** Stores different user interface access levels

**Fields:**

- `id`: This field is of type `INTEGER`.
- `ui_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `accuracylevels` (Schema: `public`)
**Description:** Defines levels of accuracy for assessments

**Fields:**

- `id`: This field is of type `INTEGER`.
- `accuracy_level`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `actionability_levels` (Schema: `public`)
**Description:** Defines levels of actionability for outputs

**Fields:**

- `id`: This field is of type `INTEGER`.
- `actionability_level`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `activitystatus` (Schema: `public`)
**Description:** Stores possible activity statuses

**Fields:**

- `id`: This field is of type `INTEGER`.
- `status_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `agentgroups` (Schema: `public`)
**Description:** Defines groups of agents

**Fields:**

- `id`: This field is of type `INTEGER`.
- `group_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `apiintegrations` (Schema: `public`)
**Description:** Stores information about API integrations

**Fields:**

- `id`: This field is of type `INTEGER`.
- `integration_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `automation_levels` (Schema: `public`)
**Description:** Defines levels of automation

**Fields:**

- `id`: This field is of type `INTEGER`.
- `automation_level`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `backupstatuses` (Schema: `public`)
**Description:** Stores possible backup statuses

**Fields:**

- `id`: This field is of type `INTEGER`.
- `status_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `business_system_tags` (Schema: `public`)
**Description:** Stores tags for business systems

**Fields:**

- `id`: This field is of type `INTEGER`.
- `tag_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `cc_license_types` (Schema: `public`)
**Description:** Stores types of Creative Commons licenses

**Fields:**

- `id`: This field is of type `INTEGER`.
- `license_type`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `chatgpt_output_formats` (Schema: `public`)
**Description:** Defines output formats for ChatGPT

**Fields:**

- `id`: This field is of type `INTEGER`.
- `format_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `citiesinisrael` (Schema: `public`)
**Description:** List of cities in Israel

**Fields:**

- `id`: This field is of type `INTEGER`.
- `city_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `cost_levels` (Schema: `public`)
**Description:** Defines levels of cost

**Fields:**

- `id`: This field is of type `INTEGER`.
- `cost_level`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `creation_account` (Schema: `public`)
**Description:** Stores information about creation accounts

**Fields:**

- `id`: This field is of type `INTEGER`.
- `account_name`: This field is of type `VARCHAR(255)`.
- `account_email`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `customgptlibraries` (Schema: `public`)
**Description:** Stores custom GPT libraries

**Fields:**

- `id`: This field is of type `INTEGER`.
- `library_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `data_retention_plans` (Schema: `public`)
**Description:** Defines data retention plans

**Fields:**

- `id`: This field is of type `INTEGER`.
- `plan_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `data_sensitivity_levels` (Schema: `public`)
**Description:** Defines levels of data sensitivity

**Fields:**

- `id`: This field is of type `INTEGER`.
- `sensitivity_level`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `data_sharing_groups` (Schema: `public`)
**Description:** Defines groups for data sharing

**Fields:**

- `id`: This field is of type `INTEGER`.
- `group_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `data_size_classifiers` (Schema: `public`)
**Description:** Classifies data sizes

**Fields:**

- `id`: This field is of type `INTEGER`.
- `classifier_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `data_source_classifiers` (Schema: `public`)
**Description:** Classifies data sources

**Fields:**

- `id`: This field is of type `INTEGER`.
- `classifier_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `data_types` (Schema: `public`)
**Description:** Defines types of data

**Fields:**

- `id`: This field is of type `INTEGER`.
- `type_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `data_viz_formats` (Schema: `public`)
**Description:** Defines formats for data visualization

**Fields:**

- `id`: This field is of type `INTEGER`.
- `format_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `experimentation_methodologies` (Schema: `public`)
**Description:** Defines methodologies for experimentation

**Fields:**

- `id`: This field is of type `INTEGER`.
- `methodology_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `file_formats` (Schema: `public`)
**Description:** Defines file formats

**Fields:**

- `id`: This field is of type `INTEGER`.
- `format_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `followup_activities` (Schema: `public`)
**Description:** Defines follow-up activities

**Fields:**

- `id`: This field is of type `INTEGER`.
- `activity_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `github_plans` (Schema: `public`)
**Description:** Defines GitHub plans

**Fields:**

- `id`: This field is of type `INTEGER`.
- `plan_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `gpt_platforms` (Schema: `public`)
**Description:** Defines GPT platforms

**Fields:**

- `id`: This field is of type `INTEGER`.
- `platform_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `gpt_privacy_settings` (Schema: `public`)
**Description:** Defines privacy settings for GPTs

**Fields:**

- `id`: This field is of type `INTEGER`.
- `setting_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `gpt_tags` (Schema: `public`)
**Description:** Defines tags for GPTs

**Fields:**

- `id`: This field is of type `INTEGER`.
- `tag_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `gpt_tasks` (Schema: `public`)
**Description:** Defines tasks for GPTs

**Fields:**

- `id`: This field is of type `INTEGER`.
- `task_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `gptcapabilities` (Schema: `public`)
**Description:** Defines capabilities of GPTs

**Fields:**

- `id`: This field is of type `INTEGER`.
- `capability_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `gptconfigtypes` (Schema: `public`)
**Description:** Defines configuration types for GPTs

**Fields:**

- `id`: This field is of type `INTEGER`.
- `config_type_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `gptmodels` (Schema: `public`)
**Description:** Defines GPT models

**Fields:**

- `id`: This field is of type `INTEGER`.
- `model_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `gptoutputreviewsdone` (Schema: `public`)
**Description:** Tracks reviews done on GPT outputs

**Fields:**

- `id`: This field is of type `INTEGER`.
- `review_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `gptratings` (Schema: `public`)
**Description:** Defines ratings for GPTs

**Fields:**

- `id`: This field is of type `INTEGER`.
- `rating_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `gptresponsetimes` (Schema: `public`)
**Description:** Defines response time categories for GPTs

**Fields:**

- `id`: This field is of type `INTEGER`.
- `response_time_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `gptreviewstatuses` (Schema: `public`)
**Description:** Defines review statuses for GPTs

**Fields:**

- `id`: This field is of type `INTEGER`.
- `status_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `gpts_cats` (Schema: `public`)
**Description:** Defines categories for GPTs

**Fields:**

- `id`: This field is of type `INTEGER`.
- `category_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `gptsoftwareplatforms` (Schema: `public`)
**Description:** Defines software platforms for GPTs

**Fields:**

- `id`: This field is of type `INTEGER`.
- `platform_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `industries_list` (Schema: `public`)
**Description:** List of industries

**Fields:**

- `id`: This field is of type `INTEGER`.
- `industry_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `knowledge_types` (Schema: `public`)
**Description:** Defines types of knowledge

**Fields:**

- `id`: This field is of type `INTEGER`.
- `knowledge_type_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `llms_list` (Schema: `public`)
**Description:** List of Language Models

**Fields:**

- `id`: This field is of type `INTEGER`.
- `llm_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `mdconversionstatus` (Schema: `public`)
**Description:** Defines types of media

**Fields:**

- `id`: This field is of type `INTEGER`.
- `status_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- `CREATE`: This field is of type `TABLE`.
- `media_type_name`: This field is of type `VARCHAR(255)`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `opensource_licenses` (Schema: `public`)
**Description:** Defines open source licenses

**Fields:**

- `id`: This field is of type `INTEGER`.
- `license_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `output_types` (Schema: `public`)
**Description:** Defines types of output

**Fields:**

- `id`: This field is of type `INTEGER`.
- `output_type_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `outputqualityassessment` (Schema: `public`)
**Description:** Defines quality assessment categories for outputs

**Fields:**

- `id`: This field is of type `INTEGER`.
- `assessment_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `post_prompt_actions` (Schema: `public`)
**Description:** Defines actions to be taken after prompts

**Fields:**

- `id`: This field is of type `INTEGER`.
- `action_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `programminglanguages` (Schema: `public`)
**Description:** List of programming languages

**Fields:**

- `id`: This field is of type `INTEGER`.
- `language_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `project_tags` (Schema: `public`)
**Description:** Defines tags for projects

**Fields:**

- `id`: This field is of type `INTEGER`.
- `tag_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `promptstages` (Schema: `public`)
**Description:** Defines stages of prompts

**Fields:**

- `id`: This field is of type `INTEGER`.
- `stage_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `publication_platforms` (Schema: `public`)
**Description:** Defines platforms for publication

**Fields:**

- `id`: This field is of type `INTEGER`.
- `platform_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `qc_activities` (Schema: `public`)
**Description:** Defines quality control activities

**Fields:**

- `id`: This field is of type `INTEGER`.
- `activity_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `reading_levels` (Schema: `public`)
**Description:** Defines reading levels

**Fields:**

- `id`: This field is of type `INTEGER`.
- `level_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `reference_sources` (Schema: `public`)
**Description:** Defines sources of references

**Fields:**

- `id`: This field is of type `INTEGER`.
- `source_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `relationdb_techs` (Schema: `public`)
**Description:** Defines relational database technologies

**Fields:**

- `id`: This field is of type `INTEGER`.
- `tech_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `review_priority_levels` (Schema: `public`)
**Description:** Defines priority levels for reviews

**Fields:**

- `id`: This field is of type `INTEGER`.
- `priority_level_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `review_statuses` (Schema: `public`)
**Description:** Defines statuses for reviews

**Fields:**

- `id`: This field is of type `INTEGER`.
- `status_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `saas_sub_models` (Schema: `public`)
**Description:** Defines SaaS subscription models

**Fields:**

- `id`: This field is of type `INTEGER`.
- `model_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `sentiment_classifiers` (Schema: `public`)
**Description:** Defines sentiment classifiers

**Fields:**

- `id`: This field is of type `INTEGER`.
- `classifier_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `system_unique_ids` (Schema: `public`)
**Description:** Defines unique identifiers for systems

**Fields:**

- `id`: This field is of type `INTEGER`.
- `unique_id_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `systemmodules` (Schema: `public`)
**Description:** Defines system modules

**Fields:**

- `id`: This field is of type `INTEGER`.
- `module_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `tabletypes` (Schema: `public`)
**Description:** Defines types of tables

**Fields:**

- `id`: This field is of type `INTEGER`.
- `table_type_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `targetaudiences` (Schema: `public`)
**Description:** Defines target audiences

**Fields:**

- `id`: This field is of type `INTEGER`.
- `audience_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `taxonomy_organisation` (Schema: `public`)
**Description:** Defines taxonomy organizations

**Fields:**

- `id`: This field is of type `INTEGER`.
- `organisation_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `urgency_levels` (Schema: `public`)
**Description:** Defines levels of urgency

**Fields:**

- `id`: This field is of type `INTEGER`.
- `urgency_level_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `usecases` (Schema: `public`)
**Description:** Defines use cases

**Fields:**

- `id`: This field is of type `INTEGER`.
- `usecase_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `userfeedback_types` (Schema: `public`)
**Description:** Defines types of user feedback

**Fields:**

- `id`: This field is of type `INTEGER`.
- `feedback_type_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `userroles` (Schema: `public`)
**Description:** Defines user roles

**Fields:**

- `id`: This field is of type `INTEGER`.
- `role_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `worldcountries` (Schema: `public`)
**Description:** List of countries in the world

**Fields:**

- `id`: This field is of type `INTEGER`.
- `country_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `worldlanguages` (Schema: `public`)
**Description:** List of world languages

**Fields:**

- `id`: This field is of type `INTEGER`.
- `language_name`: This field is of type `VARCHAR(255)`.
- `description`: This field is of type `TEXT`.
- `date_created`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `custom_gpts` (Schema: `public`)
**Description:** Stores information about custom GPT models

**Fields:**

- `id`: This field is of type `INTEGER`.
- `user_id`: This field is of type `INTEGER`.
- `gpt_name`: This field is of type `TEXT`.
- `config_text`: This field is of type `TEXT`.
- `link`: This field is of type `VARCHAR(255)`.
- `importance`: This field is of type `INTEGER`.
- `is_gpt_optimised`: This field is of type `BOOLEAN`.
- `summary`: This field is of type `TEXT`.
- `version`: This field is of type `INTEGER`.
- `is_active`: This field is of type `BOOLEAN`.
- `created_at`: This field is of type `TIMESTAMP`.
- `updated_at`: This field is of type `TIMESTAMP`.
- `created_by`: This field is of type `INTEGER`.
- `updated_by`: This field is of type `INTEGER`.
- `access_ui_id`: This field is of type `INTEGER`.
- `activity_status_id`: This field is of type `INTEGER`.
- `creation_account_id`: This field is of type `INTEGER`.
- `configuration_type_id`: This field is of type `INTEGER`.
- `gpt_model_id`: This field is of type `INTEGER`.
- `gpt_rating_id`: This field is of type `INTEGER`.
- `github_release_status_id`: This field is of type `INTEGER`.
- `underlying_llm_id`: This field is of type `INTEGER`.
- `CONSTRAINT`: This field is of type `check_importance`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `prompt_library` (Schema: `public`)
**Description:** Stores prompts used with custom GPTs

**Fields:**

- `id`: This field is of type `INTEGER`.
- `user_id`: This field is of type `INTEGER`.
- `prompt_text`: This field is of type `TEXT`.
- `is_engineered`: This field is of type `BOOLEAN`.
- `rating`: This field is of type `INTEGER`.
- `display_in_library`: This field is of type `BOOLEAN`.
- `notes_for_improvement`: This field is of type `TEXT`.
- `limitations`: This field is of type `TEXT`.
- `usecase_notes`: This field is of type `TEXT`.
- `data_sensitivity_notes`: This field is of type `TEXT`.
- `prompt_success_stories`: This field is of type `TEXT`.
- `prompt_failures`: This field is of type `TEXT`.
- `prompt_benchmarking`: This field is of type `TEXT`.
- `prompt_refinement_history`: This field is of type `TEXT`.
- `planned_enhancements`: This field is of type `TEXT`.
- `description`: This field is of type `TEXT`.
- `summary`: This field is of type `VARCHAR(255)`.
- `version`: This field is of type `INTEGER`.
- `is_active`: This field is of type `BOOLEAN`.
- `created_at`: This field is of type `TIMESTAMP`.
- `updated_at`: This field is of type `TIMESTAMP`.
- `created_by`: This field is of type `INTEGER`.
- `updated_by`: This field is of type `INTEGER`.
- `CONSTRAINT`: This field is of type `check_rating`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `prompt_outputs` (Schema: `public`)
**Description:** Stores outputs generated from prompts

**Fields:**

- `id`: This field is of type `INTEGER`.
- `user_id`: This field is of type `INTEGER`.
- `output`: This field is of type `TEXT`.
- `prompt_used`: This field is of type `TEXT`.
- `is_active`: This field is of type `BOOLEAN`.
- `created_at`: This field is of type `TIMESTAMP`.
- `updated_at`: This field is of type `TIMESTAMP`.
- `created_by`: This field is of type `INTEGER`.
- `updated_by`: This field is of type `INTEGER`.
- `md_conversion_status_id`: This field is of type `INTEGER`.
- `accuracy_assessment_id`: This field is of type `INTEGER`.
- `actionability_id`: This field is of type `INTEGER`.
- `data_sensitivity_id`: This field is of type `INTEGER`.
- `data_size_id`: This field is of type `INTEGER`.
- `output_language_id`: This field is of type `INTEGER`.
- `output_reading_level_id`: This field is of type `INTEGER`.
- `review_urgency_id`: This field is of type `INTEGER`.
- `review_priority_id`: This field is of type `INTEGER`.
- `output_category_id`: This field is of type `INTEGER`.
- `user_feedback`: This field is of type `TEXT`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `custom_gpts_agent_groups` (Schema: `public`)
**Description:** This table is used for storing specific information.

> **Note:** The table `custom_gpts_agent_groups` is a **many-to-many (m2m) join table**.

**Fields:**

- `custom_gpt_id`: This field is of type `INTEGER`. It is a **foreign key** related to another table.
- `agent_group_id`: This field is of type `INTEGER`. It is a **foreign key** related to another table.
- `PRIMARY`: This field is of type `KEY`.

### Table: `custom_gpts_capabilities` (Schema: `public`)
**Description:** This table is used for storing specific information.

**Fields:**

- `custom_gpt_id`: This field is of type `INTEGER`. It is a **foreign key** related to another table.
- `capability_id`: This field is of type `INTEGER`.
- `PRIMARY`: This field is of type `KEY`.
- `CREATE`: This field is of type `TABLE`.
- `backup_status_id`: This field is of type `INTEGER`.

### Table: `custom_gpts_business_system_tags` (Schema: `public`)
**Description:** This table is used for storing specific information.

> **Note:** The table `custom_gpts_business_system_tags` is a **many-to-many (m2m) join table**.

**Fields:**

- `custom_gpt_id`: This field is of type `INTEGER`. It is a **foreign key** related to another table.
- `business_system_tag_id`: This field is of type `INTEGER`.
- `PRIMARY`: This field is of type `KEY`.

### Table: `custom_gpts_data_retention_plans` (Schema: `public`)
**Description:** This table is used for storing specific information.

> **Note:** The table `custom_gpts_data_retention_plans` is a **many-to-many (m2m) join table**.

**Fields:**

- `custom_gpt_id`: This field is of type `INTEGER`. It is a **foreign key** related to another table.
- `data_retention_plan_id`: This field is of type `INTEGER`.
- `PRIMARY`: This field is of type `KEY`.

### Table: `custom_gpts_data_sharing_groups` (Schema: `public`)
**Description:** This table is used for storing specific information.

> **Note:** The table `custom_gpts_data_sharing_groups` is a **many-to-many (m2m) join table**.

**Fields:**

- `custom_gpt_id`: This field is of type `INTEGER`. It is a **foreign key** related to another table.
- `data_sharing_group_id`: This field is of type `INTEGER`.
- `PRIMARY`: This field is of type `KEY`.

### Table: `custom_gpts_gpt_privacy_settings` (Schema: `public`)
**Description:** This table is used for storing specific information.

> **Note:** The table `custom_gpts_gpt_privacy_settings` is a **many-to-many (m2m) join table**.

**Fields:**

- `custom_gpt_id`: This field is of type `INTEGER`. It is a **foreign key** related to another table.
- `gpt_privacy_setting_id`: This field is of type `INTEGER`.
- `PRIMARY`: This field is of type `KEY`.

### Table: `custom_gpts_gpt_review_statuses` (Schema: `public`)
**Description:** This table is used for storing specific information.

> **Note:** The table `custom_gpts_gpt_review_statuses` is a **many-to-many (m2m) join table**.

**Fields:**

- `custom_gpt_id`: This field is of type `INTEGER`. It is a **foreign key** related to another table.
- `gpt_review_status_id`: This field is of type `INTEGER`.
- `PRIMARY`: This field is of type `KEY`.

### Table: `custom_gpts_media_types` (Schema: `public`)
**Description:** This table is used for storing specific information.

> **Note:** The table `custom_gpts_media_types` is a **many-to-many (m2m) join table**.

**Fields:**

- `custom_gpt_id`: This field is of type `INTEGER`. It is a **foreign key** related to another table.
- `media_type_id`: This field is of type `INTEGER`.
- `PRIMARY`: This field is of type `KEY`.

### Table: `custom_gpts_output_types` (Schema: `public`)
**Description:** This table is used for storing specific information.

> **Note:** The table `custom_gpts_output_types` is a **many-to-many (m2m) join table**.

**Fields:**

- `custom_gpt_id`: This field is of type `INTEGER`. It is a **foreign key** related to another table.
- `output_type_id`: This field is of type `INTEGER`.
- `PRIMARY`: This field is of type `KEY`.

### Table: `custom_gpts_programming_languages` (Schema: `public`)
**Description:** This table is used for storing specific information.

> **Note:** The table `custom_gpts_programming_languages` is a **many-to-many (m2m) join table**.

**Fields:**

- `custom_gpt_id`: This field is of type `INTEGER`. It is a **foreign key** related to another table.
- `programming_language_id`: This field is of type `INTEGER`.
- `PRIMARY`: This field is of type `KEY`.

### Table: `custom_gpts_use_cases` (Schema: `public`)
**Description:** This table is used for storing specific information.

> **Note:** The table `custom_gpts_use_cases` is a **many-to-many (m2m) join table**.

**Fields:**

- `custom_gpt_id`: This field is of type `INTEGER`. It is a **foreign key** related to another table.
- `use_case_id`: This field is of type `INTEGER`.
- `PRIMARY`: This field is of type `KEY`.

### Table: `prompt_library_programming_languages` (Schema: `public`)
**Description:** This table is used for storing specific information.

> **Note:** The table `prompt_library_programming_languages` is a **many-to-many (m2m) join table**.

**Fields:**

- `prompt_library_id`: This field is of type `INTEGER`.
- `programming_language_id`: This field is of type `INTEGER`.
- `PRIMARY`: This field is of type `KEY`.

### Table: `prompt_library_use_cases` (Schema: `public`)
**Description:** This table is used for storing specific information.

> **Note:** The table `prompt_library_use_cases` is a **many-to-many (m2m) join table**.

**Fields:**

- `prompt_library_id`: This field is of type `INTEGER`.
- `use_case_id`: This field is of type `INTEGER`.
- `PRIMARY`: This field is of type `KEY`.

### Table: `custom_gpts_prompt_library` (Schema: `public`)
**Description:** This table is used for storing specific information.

> **Note:** The table `custom_gpts_prompt_library` is a **many-to-many (m2m) join table**.

**Fields:**

- `custom_gpt_id`: This field is of type `INTEGER`. It is a **foreign key** related to another table.
- `prompt_library_id`: This field is of type `INTEGER`.
- `PRIMARY`: This field is of type `KEY`.

### Table: `custom_gpts_version_history` (Schema: `public`)
**Description:** This table is used for storing specific information.

**Fields:**

- `id`: This field is of type `INTEGER`.
- `custom_gpt_id`: This field is of type `INTEGER`. It is a **foreign key** related to another table.
- `version`: This field is of type `INTEGER`.
- `change_description`: This field is of type `TEXT`.
- `created_at`: This field is of type `TIMESTAMP`.
- `created_by`: This field is of type `INTEGER`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `prompt_library_version_history` (Schema: `public`)
**Description:** This table is used for storing specific information.

**Fields:**

- `id`: This field is of type `INTEGER`.
- `prompt_library_id`: This field is of type `INTEGER`.
- `version`: This field is of type `INTEGER`.
- `change_description`: This field is of type `TEXT`.
- `created_at`: This field is of type `TIMESTAMP`.
- `created_by`: This field is of type `INTEGER`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `custom_gpts_outputs` (Schema: `public`)
**Description:** This table is used for storing specific information.

> **Note:** The table `custom_gpts_outputs` is a **many-to-many (m2m) join table**.

**Fields:**

- `custom_gpt_id`: This field is of type `INTEGER`. It is a **foreign key** related to another table.
- `output_id`: This field is of type `INTEGER`.
- `PRIMARY`: This field is of type `KEY`.

### Table: `prompt_library_outputs` (Schema: `public`)
**Description:** This table is used for storing specific information.

> **Note:** The table `prompt_library_outputs` is a **many-to-many (m2m) join table**.

**Fields:**

- `prompt_library_id`: This field is of type `INTEGER`.
- `output_id`: This field is of type `INTEGER`.
- `PRIMARY`: This field is of type `KEY`.

### Table: `gpt_usage_tracking` (Schema: `public`)
**Description:** This table is used for storing specific information.

**Fields:**

- `id`: This field is of type `INTEGER`.
- `custom_gpt_id`: This field is of type `INTEGER`. It is a **foreign key** related to another table.
- `user_id`: This field is of type `INTEGER`.
- `usage_date`: This field is of type `DATE`.
- `usage_count`: This field is of type `INTEGER`.
- `created_at`: This field is of type `TIMESTAMP`.
- `updated_at`: This field is of type `TIMESTAMP`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `user_favorites` (Schema: `public`)
**Description:** This table is used for storing specific information.

**Fields:**

- `id`: This field is of type `INTEGER`.
- `user_id`: This field is of type `INTEGER`.
- `custom_gpt_id`: This field is of type `INTEGER`. It is a **foreign key** related to another table.
- `prompt_library_id`: This field is of type `INTEGER`.
- `created_at`: This field is of type `TIMESTAMP`.
- `CONSTRAINT`: This field is of type `check_favorite_type`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `collaboration_sharing` (Schema: `public`)
**Description:** This table is used for storing specific information.

**Fields:**

- `id`: This field is of type `INTEGER`.
- `owner_id`: This field is of type `INTEGER`.
- `shared_with_id`: This field is of type `INTEGER`.
- `custom_gpt_id`: This field is of type `INTEGER`. It is a **foreign key** related to another table.
- `prompt_library_id`: This field is of type `INTEGER`.
- `permission_level`: This field is of type `VARCHAR(50)`.
- `created_at`: This field is of type `TIMESTAMP`.
- `updated_at`: This field is of type `TIMESTAMP`.
- `CONSTRAINT`: This field is of type `check_shared_item_type`.
- This table is **related** to other tables via its `id` field, which serves as a **primary key**.

### Table: `prompt_outputs_partitioned` (Schema: `public`)
**Description:** This table is used for storing specific information.

**Fields:**

- `LIKE`: This field is of type `public`.

