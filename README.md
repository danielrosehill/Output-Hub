![A sloth opening up a chest full of GPTs](/graphics/banner.webp)
*Banner: A depiction of a sloth opening up a wooden chest containing GPTs. DALLE.*

## Repository Description

The purpose of this GPT is to provide documentation which I will update periodically documenting a system I am creating for organizing and storing the output of ChatGPT prompts. 

The system is a work in progress but also currently includes the ability to store prompts (AKA a "prompt library") and includes other taxonomies to help organize data. 

The system leverages the usefulness of the underlying relational database in order to help the user make logical connections between custom GPTs, prompts used, and prompt outputs stored from generations.

## Screenshots

See `screenshots.md` for some screenshots of system modules as I develop them!

## Data Structure & Relationships

 ![alt text](Data_Architecture/sampleerd.png)

### Listing Custom GPTs

### Custom GPT List View

![alt text](screenshots/frontend/020924_directus/customgpts/customgpts_listview.png)

### View & Edit Output

![alt text](screenshots/frontend/020924_directus/outputmanagement/view_edit_output.png)

## Core Modules

### 1: Prompt Output Library

The core function of this module is to record and store for recall the output of GPT prompts that may have lasting value (for whatever purpose). 

The module can be written to and read from both programatically (via direct API integration with ChatGPT, for example) or via a web UI (for example, the user copies and pastes prompts and prompt outputs or perhaps uses some RPA tools to do this more efficiently.)

Over time, a rich and useful repository of information is developed. As prompt outputs are reviewed by humans, human-refined AI outputs can be stored in a separate database field (like `edited_output`).

### 2: Custom GPT Library

Just as engineered prompts are valuable assets for ongoing interactions with GPTs, customised GPTs (context and knowledge layered onto core GPT models) have potentially significant business value.

The second module in GPT Workbench (working name) is a system for storing these configurations. Again, you could record custom GPTs created programatically or visually.

An important data relationship is that which is captured between **GPT outputs** and **custom GPTs**. By mapping outputs onto the GPTs they originated from (where those are custom GPTs and not the undifferentiated GPT models) custom GPT configurations can be evaluated for efficacy and refined iteratively. 

In a future iteration, these two datasets might even be compared by AI (that is to say, an AI could parse a custom GPT's outputs to identify configuration changes for the underlying GPT).

### 3: Prompt Library

My current architecture is like this:

- When prompt outputs are recorded, the prompts (their corresponding input) is recorded. 

This is a means of capturing prompts that are written casually on an ad-hoc basis. 

Prompt libraries are more typically used in the reverse order: to capture prompts that are drafted, carefully refined, and then used in production. This module captures those prompts too.

A work in progress? Figuring out the best way to make these two sides of the prompting journey connect as a unified dataset. The workflow I'm working towards: casual prompts are captured as draft "serious" prompts (in the library). They may be discarded or evaluated as prospective production prompts. 

## Key Data Relationships

| Relationship | Description | Why It Matters |
| --- | --- | -- | 
| Prompt outputs to tags | Prompt outputs have tags (M2M) | A useful basic system taxonomy for exploring prompt outputs at a later date by selecting for specific tags. |
| Prompt outputs to prompts | Every prompt output has at least one prompt. One prompt can generate many outputs | Correlate prompting (input) with output (output) |
| Custom GPTs to prompt outputs | A custom GPT is used to generate a prompt. Any GPT can be used to generate an infinite number of prompts. | Correlate custom GPT configurations with the prompt outputs that they generate |
| Prompts to custom GPTs | Prompts are used to generate outputs from custom GPTs | Identifying what kind of prompting strategy works best for a specific custom GPT | 

## Data Architecture

See: `Data_Architecture`

![Data relationships](/images/banner.png)

## Starter System Taxonomies

See the starter taxonomies and the `notes.md` in the folder.

Some of the demo taxonomies will quickly become outdated (e.g. the list of GPT models).

## What Is A GPT "Management System"?

Here's my thinking and definition: 

Even at a basic level of scale, leveraging GPTs *professionally* involves an evolving series of functions which will likely become more "standardised" as harnessing GPTs for business uses becomes more entrenched and established. 

While enterprise users may develop proprietary GPTs or even LLMs, many smaller businesses will access the technology through popular platforms like OpenAI's ChatGPT.

## Current Stack

See - `stack.md`

### Core Components Of A "GPT Workbench" / GPT Management System

Whether users are using GPTs programatically or via GUI elements including a web UI, these activities are likely very important:

- **Creating an inventory of custom GPTs and/or prompts**: Prompt engineering and custom GPTs both offer distinct advantages and can be used well together. To avoid vendor-lock, no matter where custom GPTs are configured, it is prudent to maintain a careful inventory of them noting all their key parameters. 
- **Prompt evaulation and testing**: A/B testing prompts and putting them through formal evaluation frameworks. Version control systems are important to iteratively improve prompts used in production settings where generation-based expenditure provides a powerful incentive for generative AI teams to optimise the prompts used.
- **Prompt output capture**: Prompt output capture entails being rigorous about capturing GPT outputs whether they are generated via a script or in a browser tab. 

Although many tools target solely one aspect of this workflow, the data is inter-related. For example:

- A human wishes to achieve something with generative AI and writes the draft for a prompt. Potentially valuable business data has now been generated. 
- After iterative improvement (probably collaboratively in the business setting) the prompt might be considered ready for production use and entered into a prompt library. 
- That prompt will be used to generate discrete outputs. Those outputs and the prompt they are generated from are highly related datapoints that should be related formally in the data structure. The outputs can be leveraged to iteratively improve the underlying prompt. 

A true GPT Management System (or "GPT Workbench") should incorporate all these related "modules" into one holistic system.

## Keywords

- LLMs
- GPTs
- Custom GPTs
- NocoDB

## Repository Components

`System.md`
- High level document describing the system

## Author

Daniel Rosehill  
(public at danielrosehill dot com)

## Licensing

This repository is licensed under CC-BY-4.0 (Attribution 4.0 International) 
[License](https://creativecommons.org/licenses/by/4.0/)
