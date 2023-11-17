ARG CODENAME=jammy
FROM ubuntu:${CODENAME}

LABEL org.opencontainers.image.author="Adam Rajczy <arajczy@gmail.com>" \
      org.opencontainers.image.description="Nagios Core" \
      org.opencontainers.image.version="1.0.0"

ARG CODENAME
ARG PHP_VERSION="8.1"
ARG DEBIAN_FRONTEND="noninteractive"
ARG S6_OVERLAY_VERSION="3.1.5.0"
ARG MONGOSH_VERSION="7.0"
ARG NAGIOS_VERSION="4.4.14"
ARG NAGIOS_PLUGINS_VERSION="2.4.6"
ARG NAGIOS_THEMES_VERSION="0.1.0"
ARG NCPA_VERSION="2.4.1"
ARG NRPE_VERSION="4.1.0"
ARG NSCA_VERSION="2.10.2"
ARG NAGIOSTV_VERSION="0.8.7"

ENV MAIL_ADDRESS="" \
    MAIL_PASS="" \
    MAIL_RELAY_HOST="[smtp.gmail.com]:587" \
    NAGIOS_FQDN="nagios.example.com" \
    NAGIOSADMIN_USER="nagiosadmin" \
    NAGIOSADMIN_PASS="nagios" \
    NAGIOS_STARTPAGE="default" \
    NAGIOS_THEME="default"

ADD --chmod=0644 https://www.mongodb.org/static/pgp/server-${MONGOSH_VERSION}.asc /etc/apt/trusted.gpg.d/server-${MONGOSH_VERSION}.asc
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz.sha256 /tmp
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz /tmp
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz.sha256 /tmp
ADD https://github.com/NagiosEnterprises/nagioscore/releases/download/nagios-${NAGIOS_VERSION}/nagios-${NAGIOS_VERSION}.tar.gz /tmp
ADD https://nagios-plugins.org/download/nagios-plugins-${NAGIOS_PLUGINS_VERSION}.tar.gz /tmp
ADD https://github.com/NagiosEnterprises/nrpe/releases/download/nrpe-${NRPE_VERSION}/nrpe-${NRPE_VERSION}.tar.gz /tmp
ADD https://github.com/NagiosEnterprises/nsca/releases/download/nsca-${NSCA_VERSION}/nsca-${NSCA_VERSION}.tar.gz /tmp
ADD https://github.com/chriscareycode/nagiostv-react/releases/download/v${NAGIOSTV_VERSION}/nagiostv-${NAGIOSTV_VERSION}.tar.gz /tmp
ADD https://github.com/arajczy/nagios-themes/archive/refs/tags/nagios-themes-v${NAGIOS_THEMES_VERSION}.tar.gz /tmp

RUN apt-get -qq update && apt-get -y upgrade && \
    apt-get -y --no-install-recommends install ca-certificates curl gnupg2 openssl ubuntu-keyring && \
    curl -fsSL https://nginx.org/keys/nginx_signing.key | gpg --dearmor > /usr/share/keyrings/nginx-archive-keyring.gpg && \
    [ -z $(gpg --dry-run --quiet --no-keyring --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg \
      | grep 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62) ] && \
    { echo "Error: keyring verification failed"; exit 1; } || \
    echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/ubuntu ${CODENAME} nginx" > /etc/apt/sources.list.d/nginx.list && \
    echo "deb https://repo.mongodb.org/apt/ubuntu ${CODENAME}/mongodb-org/7.0 multiverse" > /etc/apt/sources.list.d/mongodb-org-7.0.list && \
    echo postfix postfix/main_mailer_type string "'Internet Site'" | debconf-set-selections && \
    echo postfix postfix/mailname string ${NAGIOS_FQDN} | debconf-set-selections && \
    apt-get -qq update && \
    apt-get -y --no-install-recommends install apache2-utils build-essential bsd-mailx fcgiwrap fping iputils-ping jq libdbi-dev libgd-dev libmysqlclient-dev libnet-snmp-perl libpq-dev libsasl2-2 libsasl2-modules libssl-dev mongodb-mongosh-shared-openssl3 nginx php${PHP_VERSION}-fpm php${PHP_VERSION}-gd postfix python3 python3-pip python3-nagiosplugin python3-toml smbclient snmp snmp-mibs-downloader spawn-fcgi unzip xz-utils && \
    chmod 4755 $(which ping) $(which mongosh) && \
    cd /tmp && sha256sum -c *.sha256 && \
    tar -C / -Jxf /tmp/s6-overlay-noarch.tar.xz && \
    tar -C / -Jxf /tmp/s6-overlay-x86_64.tar.xz && \
    groupadd -g 1001 nagios && useradd -u 1001 -d /usr/local/nagios -g nagios nagios && \
    usermod -aG nagios nginx && \
    postconf \
      smtp_sasl_auth_enable=yes \
      smtp_sasl_password_maps=hash:/etc/postfix/password_maps \
      smtp_sasl_security_options=noanonymous \
      smtp_tls_CAfile=/etc/postfix/cacert.pem \
      smtp_use_tls=yes && \
    tar -zxf nagios-${NAGIOS_VERSION}.tar.gz && cd nagios-${NAGIOS_VERSION} && \
    ./configure && \
    make all && make install && make install-commandmode && make install-config && make clean && \
    cd /tmp && \
    tar -zxf nagios-plugins-${NAGIOS_PLUGINS_VERSION}.tar.gz && cd nagios-plugins-${NAGIOS_PLUGINS_VERSION} && \
    ./configure --with-nagios-user=nagios --with-nagios-group=nagios --with-ping-command="$(which ping) -n -U -W %d -c %d %s" && \
    make && make install && make clean && \
    cd /tmp && \
    tar -zxf nrpe-${NRPE_VERSION}.tar.gz && cd nrpe-${NRPE_VERSION} && \
    ./configure --with-ssl=/usr/bin/openssl --with-ssl-lib=/usr/lib/x86_64-linux-gnu && \
    make check_nrpe && cp src/check_nrpe /usr/local/nagios/libexec/ && make clean && \
    cd /tmp && \
    tar -zxf nsca-${NSCA_VERSION}.tar.gz && cd nsca-${NSCA_VERSION} && \
    ./configure --with-nsca-user=nagios --with-nsca-grp=nagios && make all && \
    cp src/nsca /usr/local/nagios/bin/ && \
    cp src/send_nsca /usr/local/nagios/bin/ && \
    cp sample-config/nsca.cfg /usr/local/nagios/etc/ && \
    cp sample-config/send_nsca.cfg /usr/local/nagios/etc/ && \
    cd /tmp && tar -C /usr/local/nagios/share -zxf nagiostv-$NAGIOSTV_VERSION.tar.gz && \
    cd /tmp && tar -C /usr/local/nagios/ -zxpf nagios-themes-v${NAGIOS_THEMES_VERSION}.tar.gz --strip-components=1 --exclude=README.md && \
    ln -s /usr/sbin/php-fpm${PHP_VERSION} /usr/sbin/php-fpm && \
    echo mibs +ALL > /etc/snmp/snmp.conf && \
    apt-get -y --purge autoremove automake autoconf build-essential && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives /tmp/*

ADD --chmod=0644 https://www.thawte.com/roots/thawte_Premium_Server_CA.pem /etc/postfix/cacert.pem
ADD --chmod=0755 https://raw.githubusercontent.com/NagiosEnterprises/ncpa/v${NCPA_VERSION}/client/check_ncpa.py /usr/local/nagios/libexec/
ADD --chmod=0755 https://raw.githubusercontent.com/m-erhardt/check-mongodb-plugins/master/check_mongodb_stats.py /usr/local/nagios/libexec/
ADD --chmod=0755 https://raw.githubusercontent.com/m-erhardt/check-mongodb-plugins/master/check_mongodb_dbsize.py /usr/local/nagios/libexec/

COPY root /

VOLUME /usr/local/nagios/etc /usr/local/nagios/themes /usr/local/nagios/var

ENTRYPOINT [ "/init" ]
