YOUR_USERNAME=vivekseth
ACCESS_TOKEN=a0595bee907e441fd452f95001e60ca79a0209d7

FROM_USER=$1
FROM_REPO=$2
FROM_ISSUE=$3

TO_USER=$4
TO_REPO=$5

# Write JSON to temp file
curl -H "Authorization: token $ACCESS_TOKEN" "https://api.github.com/repos/$FROM_USER/$FROM_REPO/issues/$FROM_ISSUE" > temp 

# Issue request to copy issue
ISSUE_JSON=$(cat temp | jq "{title: .title, body: .body, labels: .labels}")
curl -H "Authorization: token $ACCESS_TOKEN" -d "$ISSUE_JSON" "https://api.github.com/repos/$TO_USER/$TO_REPO/issues"


