
FROM java:8

RUN apt-get update && \
    apt-get install -y \
                python3 \
                python3-pip \
                git 

RUN pip3 install esrally==0.11.0

RUN apt-get clean && \
        rm -rf /var/lib/apt/lists/*

RUN useradd  -ms /bin/bash es

USER es


WORKDIR /home/es




COPY . /home/es
RUN mkdir /home/es/sx-stackoverflow-sample

