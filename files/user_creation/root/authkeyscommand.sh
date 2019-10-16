#!/bin/bash
source /etc/profile
if [ "$1" != "keys-sync" ] && [ "$1" != "ubuntu" ]; then
/usr/bin/curl -s --connect-timeout 5 --max-time 20 -H "Authorization: {{ gitea_auth_token }}" --request GET --url  "http://{{ gitea_server_url }}:{{ gitea_server_port }}/api/v1/users/$1/keys" | /usr/bin/python -m json.tool | /usr/bin/jq -r '.[] | .key'  > /var/local/keys-sync/$1
fi;