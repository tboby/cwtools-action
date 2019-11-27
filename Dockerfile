FROM mcr.microsoft.com/dotnet/core/sdk:3.0

LABEL com.github.actions.name="CWTools Action"
LABEL com.github.actions.description="Run CWTools on your Clausewitz mod PDXScript code in parallel to your builds"
LABEL com.github.actions.icon="check"
LABEL com.github.actions.color="purple"

LABEL maintainer="Antoni Baum <antoni.baum@protonmail.com>"

COPY lib /action/lib

RUN apt-get update && \
  apt-get -y install \
  ruby bash git wget p7zip

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ v0.9.13

ENTRYPOINT ["/action/lib/entrypoint.sh"]
