FROM httpd:2.4-alpine

RUN apk add openssh git python3 nodejs apache2-mod-wsgi

# Kopier tilgangsnøkkelen til Git-repoet
RUN mkdir /root/.ssh
COPY ./ssh/* /root/.ssh/
RUN ssh-keyscan -t rsa github.com >> /root/.ssh/known_hosts

# Lagre git-repoet på eit persistent volum
RUN git clone git@github.com:.../... /srv/portfolio
RUN cd /srv/portfolio && git checkout dev

# Lagre git-repoet på eit persistent volum
RUN git clone git@github.com:.../... /srv/apache
RUN cd /srv/apache && git checkout dev
VOLUME [ "/srv" ]

# Inkluder httpd-konfigurasjonen frå git-repoet
RUN echo "IncludeOptional /srv/apache/*.conf" >> /usr/local/apache2/conf/httpd.conf
RUN echo "LoadModule wsgi_module /usr/lib/apache2/mod_wsgi.so" >> /usr/local/apache2/conf/httpd.conf

COPY ./scripts/* /scripts/
RUN chmod +x /scripts/*
CMD /scripts/run.sh

EXPOSE 22
