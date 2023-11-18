FROM quay.io/fedora/fedora-minimal:39

ARG S6_OVERLAY_VERSION="3.1.6.0"
ARG MONGOSH_VERSION="2.0.2"
ARG CHECK-MONGODB-PLUGINS_VERSION="1.0.0"
ARG NAGIOS_VERSION="4.5.0"
ARG NAGIOS_PLUGINS_VERSION="2.4.6"
ARG NAGIOS_THEMES_VERSION="0.2.0"
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

ADD https://downloads.mongodb.com/compass/mongosh-${MONGOSH_VERSION}-linux-x64-openssl3.tgz /tmp
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

RUN microdnf -y --refresh upgrade && \
    microdnf -y --setopt install_weak_deps=False install \
      automake cyrus-sasl cyrus-sasl-plain fcgiwrap fping gcc gcc-c++ gzip httpd-tools iputils kernel-devel libdbi-devel mailx make mysql-devel net-snmp net-snmp-utils nginx openssl perl-FindBin perl-lib perl-Net-SNMP php php-fpm postfix postgresql-devel python python-pip python-nagiosplugin python-toml shadow-utils samba-client tar unzip xz && \
    # adjust ping permissions \
    chmod 4755 /usr/bin/ping && \
    # Add nagios user \
    groupadd -g 1001 nagios && useradd -u 1001 -d /usr/local/nagios -g nagios nagios && \
    usermod -aG nagios nginx && \
    # configure snmp \
    echo mibs +ALL > /etc/snmp/snmp.conf && \
    # install s6-overlay \
    cd /tmp && sha256sum -c *.sha256 && \
    tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz && \
    tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz && \
    # install mongosh \
    tar -C /tmp -zxf /tmp/mongosh-2.0.2-linux-x64-openssl3.tgz && \
    mv /tmp/mongosh-2.0.2-linux-x64-openssl3/bin/mongosh /usr/bin && \
    mv /tmp/mongosh-2.0.2-linux-x64-openssl3/bin/mongosh_crypt_v1.so /usr/lib && \
    # install nagios \
    tar -C /tmp -zxf /tmp/nagios-${NAGIOS_VERSION}.tar.gz && cd /tmp/nagios-${NAGIOS_VERSION} && \
    ./configure && \
    make all && make install && make install-commandmode && make install-config && make clean && \
    # install nagios-plugins \
    tar -C /tmp -zxf /tmp/nagios-plugins-${NAGIOS_PLUGINS_VERSION}.tar.gz && \
    cd /tmp/nagios-plugins-${NAGIOS_PLUGINS_VERSION} && \
    ./configure \
      --with-nagios-user=nagios \
      --with-nagios-group=nagios && \
    # patch nagios-plugins \
    sed -i s/PS_COMMAND/PING_COMMAND/ plugins/check_load.c && \
    make && make install && make clean && \
    # install NRPE \
    tar -C /tmp -zxf /tmp/nrpe-${NRPE_VERSION}.tar.gz && \
    cd /tmp/nrpe-${NRPE_VERSION} && \
    ./configure \
      --with-ssl=/usr/bin/openssl \
      --with-ssl-lib=/usr/lib/x86_64-linux-gnu && \
    make check_nrpe && cp src/check_nrpe /usr/local/nagios/libexec/ && make clean && \
    # install NSCA \
    tar -C /tmp -zxf /tmp/nsca-${NSCA_VERSION}.tar.gz && \
    cd /tmp/nsca-${NSCA_VERSION} && \
    ./configure \
      --with-nsca-user=nagios \
      --with-nsca-grp=nagios && \
    make all && \
    cp src/nsca /usr/local/nagios/bin/ && cp src/send_nsca /usr/local/nagios/bin/ && \
    cp sample-config/nsca.cfg /usr/local/nagios/etc/ && cp sample-config/send_nsca.cfg /usr/local/nagios/etc/ && \
    # install NAGIOSTV \
    tar -C /usr/local/nagios/share -zxf /tmp/nagiostv-$NAGIOSTV_VERSION.tar.gz && \
    tar -C /usr/local/nagios/ -zxpf /tmp/nagios-themes-v${NAGIOS_THEMES_VERSION}.tar.gz \
      --strip-components=1 \
      --exclude=README.md && \
    # cleanup \
    microdnf -y remove automake gcc gcc-c++ kernel-devel make shadow-utils tar unzip xz && \
    microdnf clean all && rm -rf /tmp/*

# Root cert required for SMTP Relay
ADD --chmod=0644 https://www.thawte.com/roots/thawte_Premium_Server_CA.pem /etc/postfix/cacert.pem
# Install NCPA
ADD --chmod=0755 https://raw.githubusercontent.com/NagiosEnterprises/ncpa/v${NCPA_VERSION}/client/check_ncpa.py /usr/local/nagios/libexec/
# Install check-mongodb-plugins
ADD --chmod=0755 https://raw.githubusercontent.com/m-erhardt/check-mongodb-plugins/${CHECK-MONGODB-PLUGINS_VERSION}/check_mongodb_stats.py /usr/local/nagios/libexec/
ADD --chmod=0755 https://raw.githubusercontent.com/m-erhardt/check-mongodb-plugins/${CHECK-MONGODB-PLUGINS_VERSION}/check_mongodb_dbsize.py /usr/local/nagios/libexec/

COPY root /

VOLUME /usr/local/nagios/etc /usr/local/nagios/themes /usr/local/nagios/var

EXPOSE 80

ENTRYPOINT [ "/init" ]