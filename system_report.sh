#!/bin/bash

# Variables
NAME="Safe's"
FILE_PATH="/tmp/sysinfo.txt"
REPORT_CONTENT=$(<"$FILE_PATH") # Read the file content


{
echo "$NAME System Report generated on $(date)."
echo -e "\nDisk Usage:"
df -h
echo -e "\nCPU Load:"
uptime
echo -e "\nMemory Usage:"
free -h
} > "$FILE_PATH"

# Load SLACK_TOKEN and CHANNEL_ID from .env file if it exists
if [ -f .env ]; then
    export $(cat .env | xargs)
fi

# Send the content to Slack using curl
RESPONSE=$(curl -X POST \
 -H "Authorization: Bearer $SLACK_TOKEN" \
 -H "Content-Type: application/json" \
 --data "{\"channel\":\"$CHANNEL_ID\", \"text\":\"\`\`\`$REPORT_CONTENT\`\`\`\"}" \
https://slack.com/api/chat.postMessage)

echo -e "$REPORT_CONTENT"

# Response on success or failure
if [[ -s $RESPONSE == *"ok"* ]]; then
    echo "Report file successfully sent to Slack"
else
    echo "Failed to send report to Slack"
fi
