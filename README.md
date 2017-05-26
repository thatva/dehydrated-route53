# Dehydrated, Route53 
This is a docker image that uses [dehydrated](https://github.com/lukas2511/dehydrated) to issue Let's Encrypt certificates.
It automatically tries to pass the dns-01 challenge using an dehydrated hook.

Usage
```
docker run -it \
   -e AWS_ACCESS_KEY_ID=<your_key> \
   -e AWS_SECRET_ACCESS_KEY=<your_secret> \
   -v /var/dehydrated:/var/dehydrated \
   thatva/letsencrypt-route53 \
   -c -d <domain>
```
