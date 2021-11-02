FROM jenkins/jenkins:centos

USER root

RUN yum update -y \
    && yum install wget -y
	
RUN yum update -y \
    && yum install nodejs -y

RUN yum update -y \
    && yum install wine -y


RUN mkdir dotnet \
    && wget https://dot.net/v1/dotnet-install.sh \
    && chmod +x dotnet-install.sh \
    && ./dotnet-install.sh --install-dir dotnet

ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1 \
    PATH="/dotnet:${PATH}"

RUN dotnet tool install --global dotnet-sonarscanner --version 5.0.4

RUN /usr/local/bin/install-plugins.sh sonar:latest \
    blueocean:latest \
	git-parameter:latest \
	locale:latest

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

USER jenkins

