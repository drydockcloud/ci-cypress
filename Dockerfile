FROM cypress/included:16.2.1

# Drydock environment setup
LABEL exposed.command.single=cypress
ENV TARGET=http://web
VOLUME ["/src"]
WORKDIR /src

# Ensure the binary cache folder is accessible even as non-root
ENV CYPRESS_CACHE_FOLDER=/etc/Cypress
RUN mv /root/.cache/Cypress/ /etc

# Copy in sample files for base image testing
COPY cypress.config.js /src/
COPY smoketest.cy.js /src/cypress/e2e/

# Install Cypress plugins
RUN npm install --prefix ../ axe-core cypress-axe
RUN npm install --prefix ../ @testing-library/cypress
RUN npm install --prefix ../ cypress-real-events
RUN npm install --prefix ../ cypress-file-upload
RUN npm install --prefix ../ cypress-downloadfile
RUN npm install --prefix ../ cypress-iframe

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
