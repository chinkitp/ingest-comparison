FROM alpine

RUN apk update \ 
    && apk add openssh \
    && apk add -u ansible \
    && apk add py-pip \
    && apk add --update bash && rm -rf /var/cache/apk/* 

COPY . /
ADD ./.ssh /root/.ssh
RUN chmod 400 ~/.ssh/id_rsa \
    && chmod +x ./init.sh