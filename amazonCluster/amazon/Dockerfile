FROM alpine

RUN apk update \ 
    && apk add openssh \
    && apk add -u ansible \
    && apk add py-pip \
    && apk add --update bash && rm -rf /var/cache/apk/* 

COPY . /
RUN chmod +x ./init.sh \
 && pip install boto3