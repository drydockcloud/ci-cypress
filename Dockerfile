FROM cypress/included:3.4.1

# Drydock environment setup
LABEL exposed.command.single=cypress
ENV TARGET=http://web
VOLUME ["/src"]
WORKDIR /src

# Copy in sample files for base image testing
COPY cypress.json /src/
COPY smoketest.js /src/cypress/integration/

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]