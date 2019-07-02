Autodiscovery 
==============

Autodiscovery allows API Manager to manage the API without a proxy.
https://docs.mulesoft.com/api-manager/2.x/api-auto-discovery-new-concept

## Step 1: Create a new API in API Manager

Go to API Manager and create a new API: (1) import from Exchange; (2) import from your machine. Configure it as a `Basic Endpoint` and provide
an optional Implementation/Consumer URI.

In the end of the process, write down the **Autodiscovery API ID**.


## Step 2: Configure the Runtime to contact API Manager

Runtime must associate the `Autodiscovery API ID` (from the last step) with the Mule Flow.
https://docs.mulesoft.com/api-manager/2.x/configure-autodiscovery-4-task

It is a global configuration:

    <api-gateway:autodiscovery apiId="<id>" flowRef="<flowname>" />


## Step 3: Obtain the API Manager credential for client access

Get the environment credential to obtain the client and secret. 
https://docs.mulesoft.com/api-manager/2.x/org-credentials-config-mule4

    Access Management -> Environments -> {sandbox} -> Environment Info

In Anypoint Studio, configure Anypoint credentials in Preference -> API Manager -> Environment credentials.

    anypoint.platform.client_id={client}
    anypoint.platform.client_secret={secret}