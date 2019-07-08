# Exceptions #

Default behavior for WHEN the Exception is raised:

- Log exception to the output

        org.mule.runtime.core.internal.exception.OnErrorPropagateHandler: 
        ********************************************************************************
        Message               : value is null.
        Error type            : VALIDATION:NULL
        Element               : flow2/processors/0 @ lab09-errors:global.xml:43 (Is not null)
        Element XML           : <validation:is-not-null doc:name="Is not null" doc:id="b0cdc2
        7a-c549-4034-9d48-c21454cc5604" value="#[attributes.queryParams.flow]"></validation:i
        s-not-null>

        (set debug level logging or '-Dmule.verbose.exceptions=true' for everything)
        ********************************************************************************

- Propagate the exception to the Error Handler

The Listener converts the exceptions into HTTP 500 messages.


## Scopes ##

Exceptions can be handled in different scopes:
- Per processor using `try` scope
- Per flow using `Error handling` scope

It is possible to configure a Default Error Handling for Flows. In this case, the flow
will inherit the `Global Error Handler` if there is none.

Important: if the flow has an error handler, then the Global Error Handler is NOT inherited


## Handling Exceptions ##

Exception is handled using `On Error Continue`, which is similar to `catch`. 

Important: the behavior is NOT to "on error resume next". When the exception is raised, the code is halt
and the exception is handled. Then the execution resumes in the caller and outside of the current scope.


## Advanced ##

1. Reusing the same error handling logic: Add the syntax: `<error-handler ref="" />`.

Important: IDE has no support, and it has no visual associated!

2. Composite exceptions are created in `Scatter-gather` flow control.

        Exception(s) were found for route(s): 
            2: org.mule.extension.http.api.request.validator.ResponseValidatorTypedException: HTTP GET on resource 'http://training4-american-ws.cloudhub.io:80/api/flights' failed: bad request (400).

