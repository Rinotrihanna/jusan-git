#!/bin/bash

# Client credentials
CLIENT_ID="your_client_id"
CLIENT_SECRET="your_client_secret"

# Get OAuth token
TOKEN=$(curl -X POST -d "grant_type=client_credentials" -u "$CLIENT_ID:$CLIENT_SECRET" https://stepik.org/oauth2/token/ | jq -r .access_token)

# User ID
USER_ID="your_user_id"

# Fetch user profile data
curl -H "Authorization: Bearer $TOKEN" https://stepik.org/api/users/$USER_ID | jq '.users[0].joined'
