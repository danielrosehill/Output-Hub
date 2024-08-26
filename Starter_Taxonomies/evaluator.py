import os
import csv

def evaluate_and_rectify_csv(directory):
    error_report = {}
    
    for root, dirs, files in os.walk(directory):
        for filename in files:
            if filename.endswith(".csv"):
                filepath = os.path.join(root, filename)
                with open(filepath, 'r', newline='', encoding='utf-8') as file:
                    reader = csv.reader(file)
                    rows = list(reader)
                    
                    if not rows:
                        error_report[filepath] = "Empty file"
                        continue

                    header = rows[0]
                    header_length = len(header)
                    modified = False
                    
                    for i, row in enumerate(rows[1:], start=2):
                        if len(row) < header_length:
                            row.extend([''] * (header_length - len(row)))
                            modified = True
                        elif len(row) > header_length:
                            row = row[:header_length]
                            rows[i-1] = row
                            modified = True
                    
                    if modified:
                        with open(filepath, 'w', newline='', encoding='utf-8') as file:
                            writer = csv.writer(file)
                            writer.writerows(rows)
                        error_report[filepath] = "Rectified structural errors"
                    else:
                        error_report[filepath] = "No structural errors found"

    return error_report

directory_path = "."
errors = evaluate_and_rectify_csv(directory_path)

for file, error in errors.items():
    print(f"{file}: {error}")