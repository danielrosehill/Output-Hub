# NocoDB GPT Management System

## System Core

The backbone of the system is a self-hosted NocoDB instance using Postgres, deployed as a standalone database (i.e., not as a Docker image). This database type offers excellent relational support and is primed for scalability, both of which are key factors for this project.

I chose NocoDB because it is open source, ensuring that my system isn’t tied to one vendor. It saved a lot of time in designing the backend and has many excellent features, including the ability to easily generate an API layer for integrating the data store into a custom frontend. These are functionalities I am working on for future development.

## Basic Data Architecture

*For details, see `Data_Architecture`*

The system is based on a single base with many tables. Although this is not perhaps the ideal architecture, it allows for extensive relationship configuration within the base. In a more ideal architecture, the main components of the system, like the prompt library, the GPT register, and the GPT output list, would be more decoupled.

I have created tables to serve various purposes:

- **Custom GPTs**: This is a register of all the GPTs that I have developed for various purposes. This table is frequently updated.
- **Prompt Library**: This table stores prompts. Ideally, the prompt library would include a table for prompts and another for versions. While it's possible to achieve this in NocoDB, I wasn’t able to figure out a way to do this within the one base (and the one base design was necessary to link the prompts to the other key taxonomies like outputs).
- **Prompt Outputs**: This table stores the actual outputs of the prompts that are run.

### Diagram

![Data relationships](Diagrams/Taxonomy_Tables.png)

## Taxonomy Tables

These are the three key “modules” for the system, and I have created a number of tables to store taxonomies for these modules.

Key taxonomy tables include:

- **Output Categories**: This taxonomy provides a top-level data structure for organizing prompt outputs.
- **Output Tags**: This taxonomy provides a much more granular data structure for organizing prompt outputs. At the time of writing, I have more than 500 tags. GPT was used to support taxonomy development.
- **Output Types**: This taxonomy helps classify the output according to its type, such as a list or a briefing document.
- **GPT Categories**: This taxonomy organizes the custom GPTs by common functions.

Additional taxonomy tables include:

- **GPT Models**: Stores a list of GPT models so that outputs can be classified according to the model they were run on.
- **GPT Platforms**: Stores a list of GPT platforms so that outputs can be linked to specific platforms.
- **Prompt Projects**: Provides a logical way to link specific GPT outputs with specific projects.
- **Prompt Objectives**: Classifies the objective the user had in mind when prompting.
- **Knowledge Categories**: Classifies the output according to the type of information it provided.
- **Action Categories**: Provides a structure to guide the user on how to make actionable use of the outputs generated.

## Additional Data Details

A formula is used to generate a unique system-wide identifier for every:

- Prompt
- Prompt output
- Custom GPT
- GPT output tag
- Every other taxonomy in the system

## Module 1: Custom GPTs - Data Fields

Within the custom GPTs table, the following fields are captured:

- **Name**: The name of the GPT
- **Summary**: Summary of the purpose of the custom GPT
- **Importance**: A rating system from 1 to 5 stars where the user rates the importance of the custom GPT. This helps the user focus on refining the most high-priority GPT agents/custom GPTs.
- **Link**: Link to the live GPT where it can be accessed and interacted with.
- **Configuration Text**: Stores the configuration text used to configure the GPT.
- **Configuration JSON**: Configuration text in JSON or converted to JSON for easy replication between services.
- **Creation Date**: Useful for retroactively entering created custom GPTs.
- **Duplicate GPT**: A Boolean for the user to mark duplicates and then remove them.
- **Category**: Link to the category table to classify the custom GPTs.
- **GPT Fleet**: Stores a link to a GPT Fleets table to help the user group key GPTs into “fleets” in support of key business functions. This may be very helpful in a collaborative environment.
- **Prompts Run**: Stores links between the custom GPTs and recorded GPT outputs that were generated with it. This allows the user to easily call up prompts from a particular custom GPT to assess its quality and identify areas for improvement.

## Module 2: Prompt Outputs - Data Fields

In the prompt outputs module, the following fields are captured:

- **Date of Creation**
- **Output**: Captures the output itself.
- **Output (Markdown)**: Captures outputs in Markdown format.
- **Output (Code Blocks)**: Captures outputs as code blocks, which can also be used to copy the code blocks from the main output text for easy storage and automatic conversion to a file.
- **Output (PDF)**: Allows the user to upload a PDF of the output for easy reading on other devices.
- **Output (docx)**: As above.
- **Output (Other Files)**: Allows the user to store additional files that may have been generated by the GPT, like complete scripts or data types (CSV).
- **Categories**: Assigns categories to the outputs.
- **Tags**: Very important! Assigns tags to the outputs captured.
- **Priority**: Allows the user to capture the priority of the output for review.
- **Urgency**: Allows the user to mark up urgent items.
- **Project Tags**: Used to associate outputs with discrete projects.
- **Output Language**: Intended for code generations and allows the user to state the programming language in which the output was generated.
- **Output Type**: Allows the user to categorize the output according to its type.

## Module 3: Prompt Library - Data Fields

The final “core” system module (at the moment) is the prompt library.

This is currently a two-part system and my architecture could use a bit of tweaking:

- Given that I capture prompt texts in the prompt capture screen (which outputs to prompt outputs), I’ve developed a view there just to view those prompt outputs.
- I’ve developed a separate prompt library intended for prompt engineering and capturing the best outputs.

Right now, the two sides of this system aren’t “connected.” The prompt library module is intended for selective, careful prompt engineering while the prompts saved in the output are just data that should be captured. I will likely think about how to integrate the two soon.

The prompt library itself stores:

- **Prompt ID**: Unique ID for each prompt.
- **Prompt Text**: The prompt text.
- **Prompt Type**: Field to distinguish between full prompts, prompt snippets, and prompt skeletons.
- **Version**: Allows the user to state a version and store old versions in a comment history or another field called “old versions.”
- **Tags**: Relational field to associate the prompt with GPT tags.
- **Categories**: Relational field to associate the prompt with GPT categories.

I also use a few fields to help triage the prompts according to their importance:

- **Utility**: How useful is this prompt?
- **Rating**: How useful has this prompt actually been shown to be?

And some other fields:

- **Model Output**: A demonstration output from this prompt.