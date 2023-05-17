FROM httpd:2.4-alpine

RUN apk add openssh git python3 nodejs

# Kopier tilgangsnøkkelen til Git-repoet
RUN mkdir /root/.ssh
COPY ./ssh/* /root/.ssh/
RUN ssh-keyscan -t rsa github.com >> /root/.ssh/known_hosts

# Lagre git-repoet på eit persistent volum
RUN git clone git@github.com:DarthMikke/portfolio.git /srv/portfolio
RUN cd /srv/portfolio && git checkout dev
VOLUME [ "/srv" ]

# Inkluder httpd-konfigurasjonen frå git-repoet
RUN echo "IncludeOptional /srv/portfolio/apache/*.conf" >> /usr/local/apache2/conf/httpd.conf

COPY ./scripts/* /scripts/
RUN chmod +x /scripts/*
CMD /scripts/run.sh

EXPOSE 22
