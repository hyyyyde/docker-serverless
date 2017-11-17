from node:slim

LABEL maintainer "hyyyyde"

RUN apt-get update -y \
    && apt-get install -y \
    git \
    curl \
    python

# aws cli
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" \
    && python get-pip.py \
    && pip install awscli

# nodebrew
#RUN echo "export PATH=$HOME/.nodebrew/current/bin:$PATH" >> $HOME/.bashrc \
#    && curl -L git.io/nodebrew | perl - setup
RUN curl -L git.io/nodebrew | perl - setup
ENV PATH $HOME/.nodebrew/current/bin:$PATH
RUN echo "export PATH=$HOME/.nodebrew/current/bin:$PATH" >> $HOME/.bashrc

# nodejs
RUN . ~/.bashrc && nodebrew install-binary v6.10.3 \
    && . ~/.bashrc && nodebrew use v6.10.3

# Serverless Framework
RUN . ~/.bashrc && npm config set user 0 \
    && . ~/.bashrc && npm config set unsafe-perm true \
    && . ~/.bashrc && npm install -g serverless
