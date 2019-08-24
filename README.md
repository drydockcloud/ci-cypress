# Drydock CI Cypress

Status: alpha.

This provides a [Cypress.io](cypress.io) image following the Drydock pattern.

- Use the cypress.json in this repository as a starting configuration.
- Use the `TARGET` environment variable to specify the test target
- Mount or copy Cypress root (containing cypress.json) to `/src` directory (mount read only)
- Mount a `/results` directory to store reports, screenshots or other artifacts to
- For interactive use you will need to [permit X11 access](https://www.cypress.io/blog/2019/05/02/run-cypress-with-a-single-docker-command/#Interactive-mode).
