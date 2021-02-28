#!/bin/bash
# get duckdns token
TOKEN=$(cat ./token)
# remove duckdns.org and subdomains from domain
CERTBOT_DOMAIN=${CERTBOT_DOMAIN%%.duckdns.org}
CERTBOT_DOMAIN=${CERTBOT_DOMAIN##*.}
# remove TXT record
RESULT=$(curl -k "https://www.duckdns.org/update?domains=$CERTBOT_DOMAIN&token=$TOKEN&txt=$CERTBOT_VALIDATION&clear=true")
# deny http in
ufw deny http
