Maven
======

# Build Lifecycle #

http://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html

Built-in build lifecycles: `default`, `clean`, `site`.

The `default` lifecycle is composed of the following phases:
- validate
- compile
- test
- package
- verify
- install 
- deploy

Plugin goals: represent a single task, which is bound to zero or more build phases. A goal
not bounded can be executed outside of the build cycle by direct invocation. For example:

    mvn dependency:copy-dependencies

Not all phases are called from the command line though. 
These are usually the phases prefixed with `pre-*`, `post-*` and `process-*`. 
For example: because `integration-test` may leave the environment in a hanging state,
plugins will bind goals to `pre-integration-test` and `post-integration-test` to prepare
and deallocate the resources.

# Packaging #

The most common way to set up packaging for your project is via `<packaging>`. When the
packaging is defined, plugin goals are automatically assigned to build phases.

# Errors #

Failure:

    Caused by: org.eclipse.aether.transfer.ArtifactNotFoundException: Failure to find com.mulesoft.training:mock-servers:jar:1.1.0 in https://maven.anypoint.mulesoft.com/api/v1/maven was cached in the local repository, resolution will not be reattempted until the update interval of anypoint-exchange has elapsed or updates are forced

Troubleshooting:
- Check `pom.xml` file and dependencies
- Register the local dependency in `.m2``
- Validate the group Id, artifact, version and classifer


