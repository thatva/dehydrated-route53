FROM alpine:3.4

ENV DEHYDRATED_VERSION v0.4.0
VOLUME /var/dehydrated

RUN apk add --update bash curl openssl ca-certificates python py-pip
RUN pip install boto
RUN	mkdir -p /var/dehydrated/certs ;\
	mkdir -p /var/dehydrated/accounts

# Install route53 hook
COPY route53.py /opt/route53.py
RUN chmod a+x /opt/route53.py

WORKDIR /opt

# Install dehydrated
ADD https://github.com/lukas2511/dehydrated/archive/${DEHYDRATED_VERSION}.tar.gz /opt/dehydrated.tar.gz
COPY config /opt/config
RUN tar -zxf dehydrated.tar.gz

ENTRYPOINT ["/opt/dehydrated-0.4.0/dehydrated", "--accept-terms"]

LABEL maintainer="demian@opentierra.com" 
	  
