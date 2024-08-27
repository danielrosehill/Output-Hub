import csv

def generate_human_readable_matrix(table_names, output_csv):
    with open(output_csv, 'w', newline='') as outfile:
        writer = csv.writer(outfile)

        # Write the header row
        writer.writerow([''] + table_names)

        # Write each row with an empty intersection
        for table in table_names:
            writer.writerow([table] + ['' for _ in table_names])

if __name__ == "__main__":
    table_names = [
        "Custom GPTs", "Custom GPT Libraries", "Custom GPT Planner", "Review Status List", "Access UI List", 
        "Accuracy Levels List", "Actionability Levels List", "Automation Levels List", "Backup Statuses List", 
        "Business System Tags List", "ChatGPT Output Formats List", "Cost Levels List", "Creation Account List", 
        "Creative Commons Licenses List", "Data Sensitivity Levels List", "Data Sharing Groups List", "Data Sizes List", 
        "Data Sources List", "Data Types List", "Data Visualization Types List", "Experimentation Methodologies List", 
        "File Formats List", "Follow-Up Activities List", "GitHub Plan List", "GPT Activity Status List", 
        "GPT Agent Groups List", "GPT API Integrations List", "GPT Capabilities List", "GPT Configuration Types List", 
        "GPT Output Reviews Conducted List", "GPT Prompt Stages List", "GPT Response Times List", 
        "GPT Review Statuses List", "GPT Software Platforms List", "GPT Tasks List", "GPT Models List", 
        "GPT Privacy Levels List", "Industries List", "Israel Cities List", "Large Language Models List", 
        "Main Languages List", "MD Conversion Status List", "Media Types List", "Open Source Licenses List", 
        "Output Quality Assessment List", "Output Types List", "Prompt Complexity Levels List", 
        "Prompt Engineering Techniques List", "Prompt Sources List", "Prompt Storage Locations List", 
        "Prompt Types List", "Prompt Versions List", "Publication Platforms List", "Quality Control Activities List", 
        "Reading Levels List", "Reference Sources List", "Relational Database Technologies List", 
        "Retention Plan List", "Review Priority Levels List", "SaaS Subscription Models List", "Sentiment Types List", 
        "Target Audiences List", "Taxonomy Organization Methods List", "Urgency Levels List", "User Feedback Types List", 
        "User Roles in GPT System List", "World Countries List", "Prompt Library", "Prompt Outputs", 
        "Prompt Outputs to Prompt Actions Mapping", "Prompt Queue", "Custom GPTs to Custom GPT Libraries Mapping", 
        "Custom GPTs to GPT Categories Mapping", "Custom GPTs to GPT Tags Mapping", "Prompt Outputs to Project Tags Mapping", 
        "Scraping URLs", "GPT Categories Taxonomy", "GPT Models Taxonomy", "GPT Platforms Taxonomy", 
        "GPT Tags Taxonomy", "Knowledge Types Taxonomy", "Output Categories Taxonomy", "Output Formats Taxonomy", 
        "Output Types Taxonomy", "Output Languages Taxonomy", "Project Tags Taxonomy", "Prompt Actions Taxonomy", 
        "Unique IDs Taxonomy", "Use Cases Taxonomy", "Third-Party GPTs"
    ]

    output_csv = 'human_readable_matrix.csv'
    generate_human_readable_matrix(table_names, output_csv)
