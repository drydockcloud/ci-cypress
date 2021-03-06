FROM cypress/included:7.5.0

# Drydock environment setup
LABEL exposed.command.single=cypress
ENV TARGET=http://web
VOLUME ["/src"]
WORKDIR /src

# Ensure the binary cache folder is accessible even as non-root
ENV CYPRESS_CACHE_FOLDER=/etc/Cypress
RUN mv /root/.cache/Cypress/ /etc

# Copy in sample files for base image testing
COPY cypress.json /src/
COPY smoketest.js /src/cypress/integration/

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
