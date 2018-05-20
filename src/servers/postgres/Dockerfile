FROM postgres:10.1


RUN apt-get -y update \
&& apt-get -y install jq

COPY . /postgresfiles


ADD docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
ADD SqlScripts /SqlScripts
