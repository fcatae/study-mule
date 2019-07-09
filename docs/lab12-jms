JMS
====

The operator `Flow Reference` can be replaced with a message transport to
decouple the implementations. 

Considerations:

1. Serialization: Cannot use native Java objects - convert to JSON instead
2. Boundary: Variables are not passed to messages - must pass it explicitly

    Example: store the information in userProperties and retrieve using
    `attributes.properties.userProperties`.


# Performance Consideration #

- Send 1 or multiple messages? Batching the messages for performance.
- Specify JMS content type. Use an appropriate Serialization
- Large message size. Break large messages into chunks of data


# VM x JMS #

VM queue is a Mule ESB implementation. JMS is a Java Middleware for exchanging
messages. Because JMS lives outside of the process, it is more flexible to
exchange information with external applications.

# Reference #

Reliability Patterns
https://docs.mulesoft.com/mule-runtime/3.9/reliability-patterns

JMS Connector
https://docs.mulesoft.com/connectors/jms/jms-connector

JMS Safari Book
https://www.oreilly.com/library/view/java-message-service/9780596802264/
