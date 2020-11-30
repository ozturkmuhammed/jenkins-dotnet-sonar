#FROM jenkinsci/blueocean:1.24.3-bcc31d32159f
FROM jenkins:2.60.3

USER root

RUN mkdir dotnet \
    && wget https://dot.net/v1/dotnet-install.sh \
    && chmod +x dotnet-install.sh \
    && ./dotnet-install.sh --install-dir dotnet

ENV PATH="/dotnet:${PATH}"

RUN dotnet tool install --global dotnet-sonarscanner --version 5.0.4

#RUN wget https://updates.jenkins.io/download/plugins/sonar/2.12/sonar.hpi
