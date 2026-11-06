# CI Dependency Caching

The GitHub Actions workflow uses the setup-node npm cache
to reuse downloaded dependencies and reduce installation time.

The workflow also uploads the generated package as an artifact.
