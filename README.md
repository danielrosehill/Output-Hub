![A sloth opening up a chest full of GPTs](/images/banner.webp)
*Banner: A depiction of a sloth opening up a wooden chest containing GPTs. DALLE.*

## Repository Description

The purpose of this GPT is to provide documentation which I will update periodically documenting a system I am creating for organizing and storing the output of ChatGPT prompts. 

The system is a work in progress but also currently includes the ability to store prompts (AKA a "prompt library") and includes other taxonomies to help organize data. 

The system leverages the usefulness of the underlying relational database in order to help the user make logical connections between custom GPTs, prompts used, and prompt outputs stored from generations.

## Data Architecture

See: `Data_Architecture`

![Data relationships](/images/banner.png)

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
