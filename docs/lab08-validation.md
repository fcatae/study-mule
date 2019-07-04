Validation
============

Basic validation processors are available in the Validation module.

For validating schemas (eg, JSON and XML), the module is available
in Exchange.

The schemas are stored in `src/main/resources/schemas`

XML requests return body and headers. In order to validate the body,
we have to specific:

    payload.body
    
Question: how/when to write schema?

Assist in the test.