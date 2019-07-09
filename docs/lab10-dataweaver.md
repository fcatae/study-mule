DataWeave Quickstart
=====================

# Hello World #

```
%dw 2.0
output application/json
---
{ "Hello": "World" }
```

## Concatenating Strings ##

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

# Supported Data Types #

```
%dw 2.0
output application/json
---
{
  /*
   * A multi-line
   * comment here.
   */
  myString: "hello world",
  myNumber: 123,
  myFloatingPointNumber: 123.456,
  myVeryBigNumber: 12341234134123412341234123,
  myDate: |2018-12-07|,
  myTime: |11:55:56|,
  myDateTime: |2018-10-01T23:57:59-03:00|,
  myBoolean: true,
  myArray: [ 1, 2, 3, 5, 8],
  myMixedArray: [ 1, 2, "blah", { hello: "there" } ],
  myObjectKeyValuePair: { innerKey: "innerValue" },
  myObjectWithConditionalField: { a : { b : 1, ( c : 2 ) if true, (d : 4) if false } },
  myNull: null,
  myBinary: "abcd1234123" as Binary
  //A one-line comment here.
}
```

Review the types using `application/java` output format.

```
{
  myString: "hello world" as String {class: "java.lang.String"},
  myNumber: 123 as Number {class: "java.lang.Integer"},
  myFloatingPointNumber: 123.456 as Number {class: "java.lang.Double"},
  myVeryBigNumber: 12341234134123412341234123 as Number {class: "java.math.BigInteger"},
  myDate: |2018-12-07| as Date {class: "java.time.LocalDate"},
  myTime: |11:55:56| as LocalTime {class: "java.time.LocalTime"},
  myDateTime: |2018-10-01T23:57:59-03:00| as DateTime {class: "java.time.ZonedDateTime"},
  myBoolean: true as Boolean {class: "java.lang.Boolean"},
  myArray: [
    1 as Number {class: "java.lang.Integer"}, 
    2 as Number {class: "java.lang.Integer"}, 
    3 as Number {class: "java.lang.Integer"}, 
    5 as Number {class: "java.lang.Integer"}, 
    8 as Number {class: "java.lang.Integer"}
  ] as Array {class: "java.util.ArrayList"},
  myMixedArray: [
    1 as Number {class: "java.lang.Integer"}, 
    2 as Number {class: "java.lang.Integer"}, 
    "blah" as String {class: "java.lang.String"}, 
    {
      hello: "there" as String {class: "java.lang.String"}
    } as Object {class: "java.util.LinkedHashMap"}
  ] as Array {class: "java.util.ArrayList"},
  myObjectKeyValuePair: {
    innerKey: "innerValue" as String {class: "java.lang.String"}
  } as Object {class: "java.util.LinkedHashMap"},
  myObjectWithConditionalField: {
    a: {
      b: 1 as Number {class: "java.lang.Integer"},
      c: 2 as Number {class: "java.lang.Integer"}
    } as Object {class: "java.util.LinkedHashMap"}
  } as Object {class: "java.util.LinkedHashMap"},
  myNull: null,
  myBinary: "abcd1234123" as Binary {class: "org.mule.weave.v2.io.ByteArraySeekableStream"}
} as Object {encoding: "UTF-8", mediaType: "*/*", mimeType: "*/*", class: "java.util.LinkedHashMap"}
```

## Converting formats inline ##

It is possible to parse XML strings:

    read("<car><color>red</color></car>", "application/xml")

The general use of converter is:

    json = read(text, "application/json")
 
## Reading from files ##

Similar it is possible to read files stored in `/src/main/resources`:

    readUrl("classpath://data.json", "application/json")

But `readUrl` can point to external sites:

    readUrl("http://bing.com", "text/plain")


# Map Elements from Arrays #

Use the `map`:

    [1,2,3] map ($+1)

It applies to array of objects:

```
%dw 2.0
output application/json
var books = [{ id:1, name: "code complete"}, 
	{ id:2, name: "sql databases"}]
---
books map {
	bookId: $.id,
	name: upper($.name)
}
```

It is also possible to use the complete syntax for lamda functions:

```
books map (book, index) -> {
	bookId: book.id,
	name: upper(book.name)
}
```

## Formatting Data Types ##

Simple conversions:

    "10" as Number

And the opposite:

    3.14 as String

Consider the formating syntax:

    3.14 as String {format: "0.000"}

And also the parsing:

    { 
	date1: ("2019-07-01" as String) as Date,
	date2: ("Jul 02, 2019" as String) as Date {format: "MMM d, yyyy"}
	}

The format string follows Java syntax.

    Formatting date and numbers
    https://docs.oracle.com/javase/8/docs/api/java/time/format/DateTimeFormatter.html
    https://docs.oracle.com/javase/8/docs/api/java/text/DecimalFormat.html


# Functions with 2 parameters #

Functions with 2 parameters accept another syntax.

    contains(payload, "max")

It is possible to write in a functional notation:

    payload contains "max"

For example, these are functions that accept this syntax:

- filter
- map
- replace
- orderBy
- groupBy
- distinctBy


# Importing libraries #

Use the syntax to import a library:

    import dw::core::Strings

Then the function is available with the namespace:

    String::dasherize("a b c")

It is possible to import the function:

    import dasherize from dw::core::Strings

And then there is no need to specify the namespace:

    dasherize("a b c")

It is possible to import all the functions:

    import * from dw::core::Strings

User libraries are stored in `src/main/resources` and are accessible directly.

    import modules::fileutil

This will import the file `modules/fileutil.dwl`.


# Reference #

Reference guide:
https://docs.mulesoft.com/mule-runtime/4.1/dataweave
