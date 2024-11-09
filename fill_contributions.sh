#!/bin/bash

# Start and end dates
START_DATE="2024-01-01"
END_DATE="2024-11-09"

# Loop through the date range
current_date=$START_DATE
while [[ "$current_date" < "$END_DATE" ]]; do
    # Create or modify a file
    echo "Contribution on $current_date" > contribution.txt
    git add contribution.txt

    # Make a commit with the specific date
    GIT_COMMITTER_DATE="$current_date 12:00:00" git commit -m "Contribution on $current_date" --date="$current_date 12:00:00"

    # Move to the next date (with a 2-3 day interval)
    skip_days=$((RANDOM % 2 + 2))  # Skip between 2 and 3 days
    current_date=$(date -I -d "$current_date + $skip_days days")
done

# Push the commits to GitHub
git push origin main
