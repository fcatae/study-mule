# Project

Add a simple test flows:
- HTTP (TCP 9090) -> HTTP (TCP 8081) -> Service

Deploy to CloudHub

# Build Project #

Anypoint Studio has features to import/export packages.

Import
- Packaged mule application

Export:
- Anypoint studio project to Mule Deployable Archive (includes Studio metadata)

Maven plugins for MuleSoft:
https://blogs.mulesoft.com/dev/mule-dev/how-to-deploy-mule-application-maven-jenkins-pipeline/


# Project Deployment #

Deploy application to CloudHub:

1. Upload Application File
2. Use configuration:
   - Runtime version: 4.2
   - Worker size: 0.1 vCores
   - Workers: 1
3. Choose the region: eg, Region: US East (Ohio)
4. Configure `Properties`


# CloudHub Networking #

Load Balance:
* HTTP/HTTPS: {appname}.cloudhub.io

Workers:
* External: mule-worker-{appname}.cloudhub.io (public DNS)
* Internal: mule-worker-internal-{appname}.cloudhub.io (VPC DNS)

The load balancer does (1) round robin; (2) application upgrade rollover.
Application (workers) must listen to 0.0.0.0 at ports 8081 (http.port) or 8082 (https.port).

    Networking Guide
    https://docs.mulesoft.com/runtime-manager/cloudhub-networking-guide

# API Manager #

Create an API with a Proxy.

Proxy is an API Gateway
- The backend implementation does NOT need to be a Mule application
- Is deployed as a Mule application in CloudHub
- Allows creating policies (eg: Rate limiting)
- Separates the Implementation API and Consumer API



