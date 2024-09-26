### **Data Relationships Overview:**

#### **Many-to-Many (M2M) Relationships:**

1. **Tags Lookup** (`lookup_tags`)
   - **Core Modules:** All core modules (Conversations, Prompts, Outputs, Agents) can be associated with multiple tags, and each tag can be associated with multiple entities across these modules.

2. **Categories Lookup** (`lookup_cats`)
   - **Core Modules:** All core modules must be associated with at least one category, and each category can be linked to multiple entities across these modules.

3. **Agent Groups Lookup** (`lookup_agentgroups`)
   - **Agents:** Each agent can belong to multiple groups, and each group can contain multiple agents.

4. **Automation Level Lookup** (`lookup_automationlevel`)
   - **Agents:** Agents can have multiple automation levels, and each automation level can be associated with multiple agents.

5. **Output Libraries Lookup** (`lookup_outputlibraries`)
   - **Outputs:** Outputs can be stored in multiple libraries, and each library can contain multiple outputs.

6. **Data Retention Plan Lookup** (`lookup_dataretentionplan`)
   - **Core Modules:** Entities across all core modules can be associated with multiple data retention plans, and each retention plan can apply to multiple entities.

7. **Programming Language Lookup** (`lookup_programminglanguage`)
   - **Core Modules:** Entities across all core modules can be linked to multiple programming languages, and each programming language can be associated with multiple entities.

8. **File Formats Lookup** (`lookup_fileformats`)
   - **Outputs:** Outputs can result in multiple files with different formats, and each format can be associated with multiple outputs.

9. **Follow Up Activities Lookup** (`lookup_followup_activities`)
   - **Prompts and Outputs:** Both prompts and outputs can have multiple follow-up activities assigned, and each activity can apply to multiple prompts or outputs.

10. **Agent Capabilities Lookup** (`lookup_agent_capabilities`)
    - **Agents:** Each agent can have multiple capabilities, and each capability can be associated with multiple agents.

#### **One-to-Many (O2M) Relationships:**

1. **Conversations Table** (`conversations`)
   - **Core Modules:** Conversations can be associated with a single prompt, output, and agent, but each prompt, output, and agent can be part of multiple conversations.

2. **Prompts Table** (`prompts`)
   - **Outputs:** Each prompt can generate multiple outputs, but each output is linked to only one prompt.

3. **Outputs Table** (`outputs`)
   - **Markdown Conversion Lookup** (`lookup_md_conversion`): Each output can have one conversion status, but each conversion status can be associated with multiple outputs.

4. **Accuracy Level Lookup** (`lookup_accuracy_level`)
   - **Outputs and Agents:** Each output and agent can be associated with one accuracy level, but each accuracy level can apply to multiple outputs or agents.

5. **Actionability Level Lookup** (`lookup_actionability`)
   - **Outputs:** Each output can have one actionability level, but each level can be associated with multiple outputs.

6. **Activity Status Lookup** (`lookup_activitystatus`)
   - **Agents and Prompts:** Each agent or prompt can have one activity status, but each status can apply to multiple agents or prompts.

7. **Creation Account Lookup** (`lookup_creationaccount`)
   - **Core Modules:** Each entity in the core modules can be associated with one account, but each account can have multiple associated entities.

8. **Output Types Lookup** (`lookup_output_types`)
   - **Outputs:** Each output must be associated with one output type, but each type can be linked to multiple outputs.

9. **Github Plans Lookup** (`lookup_github_plans`)
   - **Prompts, Agents, Outputs:** Each entity in these core modules can have one associated GitHub plan, but each plan can be linked to multiple entities.

10. **LLMs Lookup** (`lookup_llms`)
    - **Prompts, Outputs, Agents:** Each entity can be associated with one LLM, but each LLM can apply to multiple entities.

11. **LLM Platforms Lookup** (`lookup_llm_platforms`)
    - **Prompts, Outputs, Agents:** Each entity can be associated with one LLM platform, but each platform can apply to multiple entities.

12. **Common Statuses Lookup** (`lookup_statuses`)
    - **Prompts, Outputs, Agents:** Each entity can have one status, but each status can apply to multiple entities.

13. **Knowledge Types Lookup** (`lookup_knowledge_types`)
    - **Outputs:** Each output can be associated with one knowledge type, but each type can apply to multiple outputs.

14. **Prompt Stage Lookup** (`lookup_promptstage`)
    - **Prompts:** Each prompt must be associated with one stage, but each stage can apply to multiple prompts.

15. **Countries Lookup** (`lookup_countries`)
    - **Prompts, Outputs, Agents:** Each entity can be associated with one country, but each country can apply to multiple entities.

