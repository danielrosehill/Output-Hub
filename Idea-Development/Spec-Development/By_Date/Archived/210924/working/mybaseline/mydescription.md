## Overview

I have been working for the past few months on building out a system for capturing my daily interactions with GPT systems.

I use ChatGPT and Claude extensively for both professional and personal needs. 

I frequently write complex prompts for things like speccing out technical projects. In return, I get back detailed outputs. I don't want the only record of these interactions to be in the originating systems.

I began by creating a Postgres database so that I could create data relationships between my prompts, the outputs generated from them, and custom GPTs (GPT agents) that I sometimes use. Additionally, I use a number of lookup tables to capture additional parameters about my GPT workflow. An example is a lookup table for the LLM model which has an M2O relationship to GPT outputs. In this way, I can "tag" specific outputs with the model that was used to generate them.

The system serves multiple purposes:

- Firstly, it allows for the development of a growing knowledge-base that is well-organised at source (because ideally the data relationships and other parameters are captured when the data is entered)
- Secondly, it provides the foundation for a system in which raw LLM outputs (which often contain errors) can be refined by human action. For example there is an output_edited field in the outputs table. Its purpose is to provide a field to capture improvements upon a GPT output by the user

## Example data relationships

As the data relationships are an integral part of this system, there are a few for illustrative purposes:

- Each prompt (in the prompt library) can be associated with many outputs (M20). By correlating prompts with the outputs that were generated from them, we can make iterative improvements to our prompts. In essence, establishing and developing this data relationship creates a feedback loop between outputs and prompts.
- Each prompt output can be associated with many "tags" and each tag can have be associated with many outputs. This is an M2M relationship.

## Desired user interfaces:

- Web UI for performing CRUD operations on the key tables in the database, including entering prompt outputs (creating new rows in the outputs table), editing existing outputs, and deleting those that were not helpful.
- Web UI for managing the prompt library including marking off QA activities

 A key requirement is that all these interfaces will have easy UIs for configuring and editing related data.