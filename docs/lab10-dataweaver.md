DataWeave Quickstart
=====================

# Hello World #

```
%dw 2.0
output application/json
---
{ "Hello": "World" }
```

# Concatenating Strings #

```
%dw 2.0
output application/json
---
{ "myString": "hello" ++ "World" }
```

# Transform to XML #

```
%dw 2.0
output application/xml
---
{ "myString": "hello" ++ "World" }
```

DataWeave supports other formats: CSV, Java, yaml
https://docs.mulesoft.com/mule-runtime/4.1/dataweave-formats

```
%dw 2.0
output application/yaml
---
{ "msg": "Hello" ++ "World",
	"note": "Different types",
	"version": 3.0
}
```

Results to:

```
%YAML 1.2
---
msg: HelloWorld
note: Different types
version: 3.0
```

CSV version:

```
msg,note,version
HelloWorld,Different types,3
```

XML gives an error since it has no root.

        "javax.xml.stream.XMLStreamException - Trying to output second root, <note>, while writing Xml at 
        5| { "msg": "Hello" ++ "World",
        |  ...
        8| }
        .

        5| { "msg": "Hello" ++ "World",
        |  ...
        8| }

        Trace:
        at main (line: 5, column: 1)" evaluating expression: "%dw 2.0
        output application/xml

        ---
        { "msg": "Hello" ++ "World",
            "note": "Different types",
            "version": 3.0
        }".

The fix is quite simple:

```
%dw 2.0
output application/xml
---
root:
{ "msg": "Hello" ++ "World",
	"note": "Different types",
	"version": 3.0
}
```

Result:

```
<?xml version='1.0' encoding='UTF-8'?>
<root>
  <msg>HelloWorld</msg>
  <note>Different types</note>
  <version>3</version>
</root>
```





Use the converter:

    json = read(text, "application/json")

Reference guide:
https://docs.mulesoft.com/mule-runtime/4.1/dataweave

Functions with 2 parameters

contains(payload, "max")
payload contains "max"

filter
map
replace
orderBy

Lambda

map $.field
map (obj, index) -> obj.field

Import

import dw::core::Strings
String::dasherize

Formatting date and numbers

https://docs.oracle.com/javase/8/docs/api/java/time/format/DateTimeFormatter.html

https://docs.oracle.com/javase/8/docs/api/java/text/DecimalFormat.html
