#!/bin/bash
# get duckdns token
TOKEN=$(cat ./token)
# remove duckdns.org and subdomains from domain
CERTBOT_DOMAIN=${CERTBOT_DOMAIN%%.duckdns.org}
CERTBOT_DOMAIN=${CERTBOT_DOMAIN##*.}
# allow http in
ufw allow http
# set up TXT record
RESULT=$(curl -k "https://www.duckdns.org/update?domains=$CERTBOT_DOMAIN&token=$TOKEN&txt=$CERTBOT_VALIDATION")
# wait to be sure TXT is propagated
sleep 5
