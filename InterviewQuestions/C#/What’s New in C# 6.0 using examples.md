## What’s New in C# 6.0 using examples.

The **null-conditional operator** avoids having to explicitly check for null before calling a method or accessing a type member.

```
System.Text.StringBuilder sb = null;
string result = sb?.ToString(); // result is null
```

**Expression-bodied functions** allow methods, properties, operators, and indexers that comprise a single expression to be written more tersely, in the style of a lambda expression:

```
public int TimesTwo (int x) => x * 2;
public string SomeProperty => "Property value";
```

Property initializers let you assign an initial value to an automatic property:

```
public DateTime TimeCreated { get; set; } = DateTime.Now;
```

Read-only properties can also be set in the constructor, making it easier to create immutable (read-only) types.
Index initializers allow single-step initialization of any type that exposes an indexer:

```
var dict = new Dictionary()
{
[3] = "three",
[10] = "ten"
};
```

String interpolation offers a succinct alternative to string.Format:

```
string s = $"It is {DateTime.Now.DayOfWeek} today";
```

Exception filters let you apply a condition to a catch block:

string html;
try
{
html = new WebClient().DownloadString ("http://asef");
}
==catch (WebException ex) when (ex.Status == WebExceptionStatus.Timeout)==
{
...
}

The using static directive lets you import all the static members of a type, so that you can use those members unqualified:

```
using static System.Console;
...
WriteLine ("Hello, world"); // WriteLine instead of Console.WriteLine
```

The nameof operator returns the name of a variable, type, or other symbol as a string. This avoids breaking code when you rename a symbol in Visual Studio:

```
int capacity = 123;
string x = nameof (capacity); // x is "capacity"
string y = nameof (Uri.Host); // y is "Host"
```

You’re now allowed to await inside catch and finally blocks.

Reference: [C# 7.0 in a nutshell by Oreilly publications](https://www.amazon.com/C-7-0-Nutshell-Definitive-Reference/dp/1491987650/ref=sr_1_1?keywords=c%23+7+in+a+nutshell&qid=1569731253&sr=8-1)
