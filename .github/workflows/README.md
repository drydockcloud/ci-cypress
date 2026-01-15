# Workflows

## docker-hub.yml

Workflow is used to publish a Docker image to docker hub on release.

The docker hub URL: https://hub.docker.com/r/drydockcloud/ci-cypress

We use an access token that is created by member who has access to docker hub and the username and password is added to
GitHub as a repository secret. Names are `DOCKER_USERNAME` and `DOCKER_PASSWORD` respectively.

## docker-build-test.yml

Workflow is used to test a Docker image build in a pull request.

# References

* https://docs.github.com/en/actions/publishing-packages/publishing-docker-images#publishing-images-to-docker-hub
