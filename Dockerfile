FROM cypress/included:11.2.0

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
RUN yarn add --cwd ../ axe-core cypress-axe
RUN yarn add --cwd ../ @testing-library/cypress
RUN yarn add --cwd ../ cypress-real-events
RUN yarn add --cwd ../ cypress-file-upload
RUN yarn add --cwd ../ cypress-downloadfile

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
