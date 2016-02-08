FROM debian:latest
MAINTAINER Fernando Membrive, membrive@gmail.com

ENV HUBOTDIR /opt/hubot

RUN apt-get update && \
	apt-get install -y wget && \
	wget -q -O - https://deb.nodesource.com/setup \ sudo bash - && \
	apt-get install -y git build-essential nodejs && \
	rm -rf /var/lib/apt/lists/* && \
	git clone --depth=1 https://github.com/membrive/hubot.git ${HUBOTDIR}

ENV HUBOT_PORT 8080
ENV HUBOT_ADAPTER slack
ENV HUBOT_NAME hubot
ENV HUBOT_SLACK_TOKEN xxxxxxxxxxxxxxxxxxxxx
ENV HUBOT_SLACK_TEAM team-name
ENV HUBOT_SLACK_BOTNAME ${HUBOT_NAME}
ENV HUBOT_JENKINS_URL https://jenkins.tld
ENV HUBOT_JENKINS_AUTH username:password
ENV HUBOT_NAGIOS_URL https://nagios.tld
ENV HUBOT_NAGIOS_AUTH username:password
ENV HUBOT_LOG_LEVEL debug
ENV PORT ${HUBOT_PORT}

EXPOSE ${HUBOT_PORT}

WORKDIR ${HUBOTDIR}

RUN npm install

CMD bin/hubot
