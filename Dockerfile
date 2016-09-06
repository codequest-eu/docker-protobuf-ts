FROM mhart/alpine-node:6.5.0

ENV CODE_HOME=/code
RUN mkdir $CODE_HOME
WORKDIR $CODE_HOME
ADD ./package.json $CODE_HOME
RUN npm install
ADD . $CODE_HOME
