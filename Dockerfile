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

# npm 11 fails with "Tracker idealTree already exists" when installing in /, so install
# elsewhere and symlink to /node_modules so specs in /src still resolve the plugins.
RUN mkdir -p /opt/plugins \
    && cd /opt/plugins \
    && npm init -y \
    && npm install --legacy-peer-deps \
        axe-core \
        cypress-axe \
        @testing-library/cypress \
        cypress-real-events \
        cypress-file-upload \
        cypress-downloadfile \
        cypress-iframe \
    && ln -s /opt/plugins/node_modules /node_modules

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
