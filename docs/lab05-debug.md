# Reference external Mule applications #

1. Install file into local repository (.m2)

    Local Maven repository m2 folder: `/users/{user}/.m2`

2. Add dependency in Maven (pom.xml)

```
    <dependency>
        <groupId>com.mulesoft.training</groupId>
        <artifactId>templates</artifactId>
        <version>1.0.0</version>
        <classifier>es</classifier>
    </dependency>
```

3. Create a global configuration to import `template.xml` file


Additional Reference:

    Maven
    https://docs.mulesoft.com/mule-runtime/3.6/using-maven-with-mule


# Application Properties #

Global configuration:
- Global properties: `${env}-properties.yaml`

Anypoint Studio configure: 
- Command line (program argument): `-Denv=dev``
- Environment variable: `env=dev`

YAML accepts only string configurations
