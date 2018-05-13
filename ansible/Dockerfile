FROM alpine

RUN apk update \ 
    && apk add openssh \
    && apk add -u ansible \
    && apk add py-pip \
    && pip install 'dopy==0.3.7' \
    && apk add --update bash && rm -rf /var/cache/apk/* 
RUN ansible-galaxy install elastic.elasticsearch

COPY . /
ADD ./.ssh /root/.ssh
RUN chmod 400 ~/.ssh/id_rsa \
    && chmod +x ./ingest-nodes.sh


# ENTRYPOINT [ "./ingest-nodes.sh","1"]

# CMD [ "./ansible-playbook digitalocean.yml --ask-vault-pass" ]
