flowchart LR
    subgraph Main [" "]
        direction TB
        Conversations["Conversations"] 
        Conversations --> Prompts["Prompts"]
        Conversations --> Outputs["Outputs"]
        
        %% Sub-nodes under Prompts
        Prompts --> FollowUpsPrompts["Follow-Ups"]
        Prompts --> Clarifications["Clarifications"]
        
        %% Sub-nodes under Outputs
        Outputs --> FollowUpsOutputs["Follow-Ups"]
        Outputs --> CodeSnippets["Code Snippets"]
    end
    
    %% Agents on the right, with extra space but no box
    Main ~~~ Agents["Agents"]
    
    %% Styling
    classDef default fill:#3eb0c8,stroke:#333,stroke-width:2px