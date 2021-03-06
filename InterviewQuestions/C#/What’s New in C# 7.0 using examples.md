## What’s New in C# 7.0 using examples.

**Numeric literal improvements**
Numeric literals in C# 7 can include underscores to improve readability. These are ignored by the compiler:

int million = ==1_000_000;==

**Out variables and discards**
You can now declare out variables on the fly:

bool successful = int.TryParse ("123", ==out int result==);

And when calling a method with multiple out parameters, you can discard ones you’re uninterested in with the underscore character:

SomeBigMethod (==out _==, out _, out _, out int x, out _, out _, out _);

**Patterns**
You can also introduce variables on the fly with the is operator(pattern variables):

if (==x is string s==)

The switch statement also supports patterns, so you can switch on type as well as constants. You can also switch on the null value:

switch (x)
{
case ==bool b when b == true==: // Matches only when b is true
..........
break;
case ==null==:
...............
break;
}

**Local methods**
A local method is a method declared inside another function. Local methods are visible only to the containing function, and can capture local variables in the same way that lambda expressions do.

void WriteCubes()
{
Console.WriteLine (==Cube (3)==);
==int Cube (int value) => value * value * value;==
}

**More expression-bodied members**
C# 6 introduced the expression-bodied “fat-arrow” syntax for methods, read-only properties, operators, and indexers. C# 7 extends this to constructors, read/write properties, and finalizers:

public class Person
{
string name;
==public Person (string name) => Name = name;==
public string Name
{
get => name;
==set => name = value ?? "";==
}
==~Person () => Console.WriteLine ("finalize");==
}

**Deconstructors**
C# 7 introduces the deconstructor pattern. Whereas a constructor typically takes a set of values (as parameters) and assigns them to fields, a deconstructor does the reverse and assigns fields back to a set of variables:

```
public void Deconstruct (out string firstName, out string lastName)
{
int spacePos = name.IndexOf (' ');
firstName = name.Substring (0, spacePos);
lastName = name.Substring (spacePos + 1);
}
```

Deconstructors are called with the following special syntax:

var joe = new Person ("Joe Bloggs");
==var (first, last) = joe; // Deconstruction==
Console.WriteLine (first); // Joe
Console.WriteLine (last); // Bloggs

**Tuples**
Tuples provide a simple way to store a set of related values:

==var tuple = (Name:"Bob", Age:23);
Console.WriteLine (tuple.Name); // Bob==

With tuples, functions can return multiple values without resorting to out parameters:

```
static (int row, int column) GetFilePosition() => (3, 10);
static void Main()
{
var pos = GetFilePosition();
Console.WriteLine (pos.row); // 3
Console.WriteLine (pos.column); // 10
}
```

Tuples implicitly support the deconstruction pattern, so they can easily be deconstructed into individual variables.

static void Main()
{
==(int row, int column) = GetFilePosition(); // Creates 2 local variables
Console.WriteLine (row); // 3==
}

**throw expressions**
With C# 7, throw can also appear as an expression in expression-bodied functions:
public string ==Foo() => throw new NotImplementedException();==

A throw expression can also appear in a ternary conditional expression:
string Capitalize (string value) => ==value == null ? throw new ArgumentException ("value")== : value == "" ? "" : char.ToUpper (value[0]) + value.Substring (1);

Reference: [C# 7.0 in a nutshell by Oreilly publications](https://www.amazon.com/C-7-0-Nutshell-Definitive-Reference/dp/1491987650/ref=sr_1_1?keywords=c%23+7+in+a+nutshell&qid=1569731253&sr=8-1)