# certbot-duckdns
Certbot manual DNS challenge for DuckDNS

#### Requirements:
- certbot
- curl
- cron (recommended)

#### Setup:
1. Clone repository
2. Write DuckDNS token to the `token` file
3. Run certbot in manual mode

#### Usage:
Getting a certificate (or several) :
```sh
certbot certonly --manual --preferred-challenges dns \
  [--non-interactive] [--quiet] [--agree-tos] [--manual-public-ip-logging-ok] \
  --manual-auth-hook $(pwd)/cleanup-hook.sh \
  --manual-cleanup-hook $(pwd)/certbot-post-hook.sh \
  --email your.email@here.net \
  [--domain yourdomain.duckdns.org \]
  --domain *.yourdomain.duckdns.org
```

Example renew cron job:

```
* * * * 1 /path/to/certbot renew
```
