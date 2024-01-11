FROM httpd:2.4-alpine

RUN apk add openssh git bash python3 py3-pip nodejs apache2-mod-wsgi graphviz

# Kopier tilgangsnøkkelen til Git-repoet
RUN mkdir /root/.ssh
COPY ./ssh/config /root/.ssh/
RUN mkdir /ssh
COPY ./ssh/*.key /ssh
VOLUME [ "/ssh" ]

VOLUME [ "/srv" ]

# Inkluder httpd-konfigurasjonen frå git-repoet
RUN echo "LoadModule ssl_module /usr/local/apache2/modules/mod_ssl.so" >> /usr/local/apache2/conf/httpd.conf
RUN echo "LoadModule wsgi_module /usr/local/apache2/modules/mod_wsgi.so" >> /usr/local/apache2/conf/httpd.conf
RUN echo "LoadModule rewrite_module /usr/local/apache2/modules/mod_rewrite.so" >> /usr/local/apache2/conf/httpd.conf
RUN echo "IncludeOptional /srv/apache/*.conf" >> /usr/local/apache2/conf/httpd.conf

COPY ./scripts/* /scripts/
RUN chmod +x /scripts/*
CMD /scripts/run.sh
