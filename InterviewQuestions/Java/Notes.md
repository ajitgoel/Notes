##  Type casting
Implicit casting is done automatically by Java (converting a smaller type to a larger type size): byte -> short -> char -> int -> long -> float -> double Explicit casting should be done manually (converting a larger type to a smaller size type): double -> float -> long -> int -> char -> short -> byte
Remember 1 casting rule, implicit casting only work for larger type direction-->-->-->--> When you're trying to insert big into small, you need to do explicit casting<--(explicit)<--

Q: Select all lines where explicit casting is required.
long lo = Integer.MAX_VALUE; // (1)
==int i = lo; // (2)
char ch = i; // (3)==
double d = ch; // (4)
==float f = d; // (5)==

The combination of the name of the method and the list of its parameters is known as a method signature.

Q: Given a variable **str** of the type **String**.
 Select one or more options from the list
==**str.substring(0, 5)** returns a substring from 0 to 4 indexes (inclusive) of the string.==
**str[n]** returns a character that has the index n.
**str.get(n)** returns a character that has the index n.
**str.substring(0, 3)** returns a substring from 0 to 3 indexes (inclusive) of the string.
==**str.charAt(n)** returns a character that has the index n.==

## Arrays as parameters
##### Varargs and other parameters
If a method has more than one parameter, the `vararg` parameter must be the last one in the declaration of the method.

Q: You are given a method with the following declaration:
public static int method(int[] array, int... vararg) { return 1; }
Select all correct ways to invoke this method.
 ==method(new int[] { 1, 2, 3 });
method(new int[] { 1, 2, 3 }, 4, 5);==
method(1, 2, 3);
method();
==method(new int[] { 1, 2, 3 }, new int[] { 4, 5, 6 });==

## Final variables
Find two lines in the code that will cause compile errors.
final Scanner scanner = new Scanner(System.in); // 1
final int a;                                    // 2
==final int b = scanner.nextInt() + a;            // 3==
final int c = 0;                                // 4
==c = b;                                          // 5==
System.out.println(c + 1);                      // 6

## Write, compile, and run
Select all correct statements.
 ==The JVM understands bytecode.==
A computer understands source code.
==To run a compiled Java program, a JVM must be installed on the computer.
The JVM provides platform independence for Java programs.==

## Package
You have the following public classes:
org.demo.A
org.demo.mypackage.B
org.demo.mypackage.C
In the body of the class org.demo.mypackage.B you'd like to use other classes for writing fields:
package org.demo.mypackage;
public class B {
    C c1 = new C();  // (1)
    C c2 = new org.demo.mypackage.C(); // (2)
    mypackage.C c3 = new org.demo.mypackage.C(); // (3)
    org.demo.A a = new org.demo.A(); // (4)
    A a1 = new A(); // (5)
}
Select all correct lines (see the number in comments).
==Just remember that if two classes are in the same package you can use them without import. And to access class without importing package you have to use full name==
 Select one or more options from the list
==1
2==
3
==4==
5

Which of the following is a correct statement about default packages in Java?
 Select one option from the list
Import statement can't import a class from a named package into a java file inside the default package.
Classes inside the default package are invisible to each other.
==Import statement can't import a class from the default package into a java file inside a named package.==

## Access modifiers

Which types of the access modifiers can be applied to a class, a field and a method?

|                    | public | protected | private | no modifier |
| ------------------ | ------ | --------- | ------- | ----------- |
| class (not nested) | Yes    |           |         | Yes         |
| field              | Yes    | Yes       | Yes     | Yes         |
| method             | Yes    | Yes       | Yes     | Yes         |
| constructor        | Yes    | Yes       | Yes     | Yes         |

## Getters and setters

Choose a pair of getter and setter names for the boolean field `completed` according to the convention.

readCompleted

getCompleted

==isCompleted==

==setCompleted==

completed

## Inheritance

You have a base class and a derived class. Both classes are in different packages.

The base class:

```cpp
public class BaseClass {
    ??? int a;
}
```

The derived class:

```java
public class DerivedClass extends BaseClass {
    private int b;

    public int sum() {
        return a + b;
    }
}
```

Which of the following access modifiers can be written instead of **???** to make this code compile?
private
==protected==
no access modifier
==public==

## Referencing subclass objects

##### Invalid method invocations

There is a class hierarchy that includes three classes:

```java
class Animal {
    protected int age;
    public int getAge() {
        return age;
    }
    public void setAge(int age) {
        this.age = age;
    }
}
class Pet extends Animal {
    protected String name;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
class Cat extends Pet {    
    protected String color;
    public String getColor() {
        return color;
    }
    public void setColor(String color) {
        this.color = color;
    }
}
```


Given the following object:

```java
Pet cat = new Cat();
```

Select all **invalid** method invocations.

cat.getName();

cat.getAge();

==cat.getColor();==

cat.setAge(5);

==cat.setColor("Gray");==

cat.setName("Pharaoh");

## The Object class

##### The full name of Object

Enter the full name of the class `Object`. It refers to the package as well.
==java.lang.Object==

## Objects

##### What is my age?

You have the class `Tree`:

```java
class Tree {
    String sort;
    int age;
    double height;
}
```

After you execute the following code,

```java
Tree tree1 =  new Tree();
Tree tree2 = tree1;
Tree tree3 = tree2;
tree1 = new Tree();
tree1.age = 5;
tree2.age = 10;
tree3 = null;
```

what will be the value of `tree1.age` ?

 null

0

==5==

10

## Interface

##### Which methods must be overridden

Here is an interface and a class implementing this interface:

```java
interface A {    
    static void staticMethod() { }    
    void method();    
    default void defaultMethod() { }
    abstract void abstractMethod();
}
class B implements A { }
```

Which methods must be implemented in the class `B`?
==Spot 🎯 the curly braces. (Where there's none, implementation is required)==
==in the class that implements the interface, all methods that do not have an implementation in the interface must be implemented.==

defaultMethod

==method==

staticMethod

==abstractMethod==

## Multiple constructors

##### Suppose, you have a class

Imagine you have a class with two constructors. You'd like to invoke the first constructor from the second one. Where should you place the statement `this(...)`? Select the most suitable option.
==https://stackoverflow.com/questions/1168345/why-do-this-and-super-have-to-be-the-first-statement-in-a-constructor==
==we need super() to be first to ensure that the object is fully constructed (has reached Object class constructor).==

It must be the first statement in the body of the first constructor.
It must be the last statement in the body of the second constructor.
It can be placed anywhere in the body of the first constructor.
It must be the last statement in the body of the first constructor.
==It must be the first statement in the body of the second constructor.==
It can be placed anywhere in the body of the second constructor.



## The keyword super

##### When the keyword cannot be used

Given the following class hierarchy, select all **illegal** usages of the keyword `super`:

```java
class A {
    protected int a;
}
class B extends A {
    protected int b;   
    public B(int a, int b) {
        super();     // 1
        super.a = a; // 2
        super.b = b; // 3
    }
}
class C extends B {
    protected int c;
    public C(int a, int b) {
        super(a); // 4
    }    
    public C(int a) {
        super(a, 10); // 5
    }
}
```

1
2
==3==
==4==
5

## Hierarchy of exceptions

##### The name of the base class

 Enter the name of the base class for all unchecked exceptions.

Use the full address of the class including packages, for instance: `com.example.SomeClass`.

 ==java.lang.RuntimeException==

## Exception handling

##### Executed blocks

Take a look at the following piece of code:

```java
try {
    // it throws an exception
} catch (RuntimeException e) {
    // ...
} catch (IOException e) {
    // ...
} catch (Exception e) {
    // ...
} finally {
    // ...
}
```

Let's assume in the `try` block the `java.lang.NumberFormatException` is thrown at runtime.
Select all blocks that will be executed.

==catch (RuntimeException e)==
catch (IOException e)
catch (Exception e)
==finally==

## Annotations basics

##### Rules of annotations

What are the rules of marking an element with an annotation in Java? Select all correct options. Select one or more options from the list
All annotations can mark classes and methods.
==It's possible to mix built-in and external annotations in a **.java** file.==
==Some annotations can mark classes, methods, fields, and variables.==
A class can be marked with no more than one annotation.
All annotations include elements.

##### Create by

An external annotation **`@CreatedBy`** has one string element named **`name`**. The element does not have a default value. How can you mark a field using this annotation? Select all correct options.

==the element can only be omitted if its name is "value", otherwise, you have to inform the name of the element.==

 Select one or more options from the list

@CreatedBy("John Coder")
==@CreatedBy(name = "Unknown")==
@CreatedBy(value = "John Coder")
@CreatedBy
==@CreatedBy(name = "John Coder")==

##### Deprecated annotation

Select all correct ways to mark a method using the `@Deprecated` annotation.

 Select one or more options from the list

==@Deprecated==

@Deprecated(since = "8", forRemoval = "unknown")

@Deprecated(since = 11, forRemoval = true)

==@Deprecated(since = "1.0")==

==@Deprecated(since = "5.3", forRemoval = true)==

##### Entity

An external annotation **`@Entity`** has one string element named **`name`**. The element has a default value (the empty string). How can you mark a class with this annotation? Select all correct ways.

Was this hint helpful? Yes NoReport

 Select one or more options from the list

==@Entity(name = "MyEntity")==

@Entity(value = "MyEntity")

==@Entity==

@Entity("MyEntity")

## Web development

Why might we need to separate the client side from the server side? Choose all possible answers.

==To be able to make changes independently to the frontend and backend logic.==

==We need a server to store and structure data.==

To always get up-to-date answers from **the client**.

## Immutability

##### Cat in a box

Imagine, you have a box of objects called `my_favorite_box`. The type of the items in the box is not predetermined and at the moment this is a box of kittens.

The object `my_favorite_box` is considered **==immutable==** (but variable reassigning is **allowed**).

What can you do with the object `my_favorite_box`? Choose all that apply.

Add another kitten to the box

Add a puppy to the box

==Get a box of puppies and say that now this box is `my_favorite_box`==

==Look at the kittens that are in the box==

Take one kitten out of the box

## Boxing and unboxing

##### Initializing long value

Select all correct ways to initialize a `Long` object with the value 4321.

==Long val = 4321L;==

==Long val = Long.parseLong("4321");==

Long val = Long.of(4321);

==Long val = Long.valueOf("4321");==

## Introduction to generic programming

##### Type arguments

Which types can be used as arguments of a generic type?

==Array  is reference type.==

==String[]==

==int[]==

int

==String==

## Introduction to generic programming

##### Pastry packing optimization

You were asked to help with Java programming for a pie company. At the moment, they bake pies, cakes, and tarts and pack them in nice boxes to sell. Unfortunately, their approach to box programming is quite outdated and each pie type requires its own box class. This approach is poorly scalable and will turn the situation into a nightmare with product range growth (imagine all these: ApplePieBox, StrawberryPieBox, etc.).

To avoid this, implement a universal Box class that will accommodate anything with *put* methods and give it back with *get* methods.

/**

  Box for cakes

*/

class CakeBox {

  private Cake cake;

  public void put(Cake cake) {

​    this.cake = cake;

  }

  public Cake get() {

​    return this.cake;

  }

}

/**

  Box for pies

*/

class PieBox {

  private Pie pie;

  public void put(Pie pie) {

​    this.pie = pie;

  }

  public Pie get() {

​    return this.pie;

  }

}

/**

  Box for tarts

*/

class TartBox {

  private Tart tart;

  public void put(Tart tart) {

​    this.tart = tart;

  }

  public Tart get() {

​    return this.tart;

  }

}

==class Box<T> {==

  ==private T t;==

  ==public void put(T t) {==

​    ==this.t = t;==

  ==}==

  ==public T get() {==

​    ==return this.t;==

  ==}==

==}==

class Cake { }

class Pie { }

class Tart { }

##### Generic parameter values

Consider a generic class:

```java
public class Example<T> { /* large body */ }
```

What can be used as X when creating instances?

```java
Example<X> example = new Example<>()
```

==Character==

42

==String==

"JetBrains"

char

## Generics and Object

##### Instance without type argument

Consider the following generic class:

```java
class MyClass<T> {

    private T t;

    public MyClass(T t) {
        this.t = t;
    }

    public T get() {
        return t;
    }
}
```

What will the `get` method return if you create an instance but don't specify the type argument?

```java
MyClass instance = new MyClass("Hello!");
```

An exception occurs after executing this line

==It will return an **Object**==

It will return **Void**

It does not compile

It will return a **String**

## Lambda expressions

##### Higher-order functions

Which of the following Java methods can be called higher-order functions according to the functional programming general theory.

int method(int n)

==Function<T, R> method(int n)==

==Function<T, R> method(Function<T, R> f, int n)==

==void method(Function<T, R> f)==

##### Statements

Select all correct statements about lambda expressions.

A lambda expression always has parameters.

==If a lambda expression has only one argument, parentheses () are not mandatory.==

A lambda expression should always return a value.

==A lambda expression can contain multiple statements within the body.==

##### Expressions

Select all valid lambda expressions.

==there are 3 answer, don't forger  if it has one argument, () is not mandatory  and if it has more than one argument, () become mandatory==

x := x

x => x

(x, y) => x + y

x, y -> x + y

==(z) -> z==

==x -> x==

==(x, y) -> x + y==

##### Parts of code

There are some parts of code with closures. Find the correct one.

1)

```java
final int a = 3;
Function<Integer, Integer> f = (x) -> a * x;
a++;
```

2)

```java
final int a = 3;
Function<Integer, Integer> f = (x) => a * x;
```

3)

```java
int a = 3;
Function<Integer, Integer> f = (x) -> a * x;
```

4)

```java
int a = 3;
Function<Integer, Integer> f = (x) => a * x;
a++;
```

5)

```java
final int a = 3;
Function<Integer, Integer> f = (x) := a * x;
```

1

2

==3==

4

5

## JVM, JRE, and JDK

##### What does JRE include

Select all components of JRE.

==JVM==

IDE

==Class library==

Java Compiler

## Command line overview

##### Directory or list

Open the terminal and run the command `dir` (Win) or `ls` (Unix/macOS). What do you see?

terminal returns all the folders in the directory that you are currently using

==terminal returns all the non-hidden files and folders in the directory that you are currently using==

terminal returns all the files and folders including hidden ones in the directory that you are currently using

terminal returns all the files in the directory that you are currently using

terminal returns nothing

**FEEDBACK:**

```
By default, dir and ls commands return only non-hidden files and subfolders. If you want to view hidden files use "dir /A" or "ls -a" command!
```

## Parameters and options

##### Recursive list of directories

Open CLI and type `dir /?` on Windows or `man ls` on Unix. Now you see the manual. What's the correct way to list the content of a directory and all of its subdirectories?

 Report a typo

 Select one option from the list

==`dir /S` (Win), `ls -R` (Linux/macOS)==

`dir /L` (win), `ls -F` (Linux/macOS)

`dir /O` (Win), `ls -d` (Linux/macOS)

`dir /D` (Win), `ls -l` (Linux/macOS)

## Java Archive

##### Where is metadata?

What is the path to the file containing metadata within a JAR?

Enter an answer without spaces like in the example below. The current directory is .jar archive.

```
DIRECTORY-NAME/FILE-NAME.EXTENSION
```

Note, the answer is case sensitive.

==META-INF/MANIFEST.MF==

## The big O notation

##### Arrange time complexities

Arrange the time complexity estimates of an algorithm from faster to slower. The fastest algorithm should be at the top.

==*O*(log*n*)==
==O(n^{2/3})==
==O(n^4)==
==O(3^n)==
==O(n^n)==

## Data structures

##### ADT

What is Abstract Data Type?

It is a synonym for data structure

A type that has a specific size, but undefined number of operations

==A type that is defined by a set of values and a set of possible operations.==

A type that represents a platform-independent way to organize data.

## What are collections

##### Processing a sequence of data

 Imagine you need to process a sequence of data of an arbitrary size. Choose the reasons why it is better to use collections than standard arrays.

==It is possible to choose the most effective collection for this problem.==

==Collections have a rich set of embedded operations for processing elements.==

==There are mutable collections which are good when the size is not fixed.==

They are part of the standard library.

## The Collections Framework overview

##### Creating instances

 Can you create an object of `Collection<E>` or `List<E>` by using the `new` keyword?

```java
new Collection<String>();
new List<Integer>();
```

 ==no for both==

yes for both

yes, only for List<E>

yes, only for Collection<E>

## Build tools

##### The reasons to use a build tool

What are **three good reasons** to use a build tool in your project?

You would like to run the source code of the application immediately, without compilation into bytecode.

You would like to start your application without JVM installed on the computer.

==The project depends on large number of external libraries.==

==You would like to generate a production-ready application archive easily.==

==You always need to run automated tests after changes in the application.==

## Gradle basics

##### Customizing build steps

A developer wants to customize build steps for Gradle.

Select all the languages that they can use to do so.

XML

Scala

==Kotlin==

==Groovy==

JavaScript

## Basic project with Gradle

##### Initializing a project

 You need to initialize a new repository using Gradle.There is a command to do that: `gradle init --type basic --dsl kotlin`. Describe its result.

==It adds several default tasks in the build file.==

It initializes a new project

==It builds a Kotlin application.==

It creates the build.gradle.kts file.

## Building apps using Gradle

##### Find mistakes

Find a mistake in the `build.gradle` file to run it using the `gradle run` command:

```java
plugins {
    id 'application'
    // here are other plugins (incl. for Java or Kotlin)
}
jar {
    manifest {
        mainClassName = 'Main'
    }
}
```

No version specification

No sources directory specification

==The main class is defined in an unsuitable place==

No dependencies section

## Dependency management

##### Adding a dependency

Select the correct ways to add Guava library as a dependency in your project.

implementation group: 'com.google.guava'

==implementation 'com.google.guava:guava:28.0-jre'==

implementation 'com.google.guava', guava, 28.0-jre'

==implementation ('com.google.guava:guava:28.0-jre')==

==implementation group: 'com.google.guava', name: 'guava', version: '28.0-jre'==

## External resources

##### The last 10

 **Git** is a **version** control system for tracking changes in source code and coordinating work among programmers. It’s used worldwide by all developers. In git terms, to **commit** means to save the latest changes in your code locally. All information about the commit is then saved: who committed, when, a short description of changes made, the unique id of the commit, and, of course, the committed version.

John wants to see the commits he made recently. Write down the command that will let him see his **commit history**. Note that you don't need to write the full command line! We ask you to submit **only the name of the command**, without arguments.

==git log==

## Tags and attributes

##### Good syntax

Select the correctly written tag with the correct attribute:

``<img src="image.jpg"></img>``

``<img src"img.jpg"></img>``

==``<img src="img.jpg">``==

``<img src=image.jpg>``

## Dynamic array

##### Time complexities

What are the average and the worst time complexities for Add, Add to index, and Update operations?

Match each operation below with its time complexity. The first option is the average time complexity, and the second is the worst.

==Update the value at the specified index	O(1) *O*(1)==

==Add an element at the specified index		O(n)*O*(*n*)==

==Add an element to the end of the array		O(1) O(n)==

## The List interface

##### Select correct assignments

 Which of the following assignments are correct?

 ==Collection<Integer> list = new ArrayList<>();==

==List<Integer> list = new ArrayList<>();==

==ArrayList<Integer> list = new ArrayList<>();==

LinkedList<Integer> list = new ArrayList<>();

==LinkedList<Integer> list = new LinkedList<>(new ArrayList<>());==

##### Third-party library

 What is true about a third-party library?

 t comes with a language implementation

It is always developed by the programming language maintainers

==You can get it from sites like Github for your language==

==It extends the standard library with high-level modules==

## Frameworks

##### Choosing a framework

 What should be considered when choosing a framework?

==The popularity of the framework==

The catchy name of the framework

==The size and complexity of the application you want to write==

==Adequacy and clarity of documentation==

## JSON

##### The JSON object

Carefully study the JSON object below and specify which line contains an error:

```json
{  
  persons: [  
    {  
      "firstName": "Stanislaw",
      "lastName": "Lem",
      "book": [  
        {  
          "title": "Summa Technologiae",
          "year": 1964
        }
      ]
    },
    {  
      "firstName": "Isaac",
      "lastName": "Asimov",
      "book": [  
        {  
          "title": "The End of Eternity",
          "year": 1955
        }
      ]
    }
  ]
}
```

Write the line number as the answer.

If you try your best but you don't succeed, you can search the JSON validators — special services that check the correctness of the code.

==2==

## Introduction to Spring boot

##### Suitable applications

 Suppose you are responsible for choosing a tech stack in a company.

With which applications does it make sense to use the Spring Framework?

==Web==

==Server-side mobile==

==Desktop==

Small command-line programs with ten lines of code.

## Introduction to Spring boot

##### Spring and Spring Boot

Select one correct statement about using Spring together with Spring Boot.

==Spring Boot allows you to use all the features of Spring==

Spring boot limits some features of Spring, but not all of them

It is impossible to use Spring features together with Spring Boot

It is possible but not a good practice to mix Spring Boot with Spring in one application

##### What is Spring Boot

Spring boot is...

a programming language

a building tool for Spring applications

a quick launcher for Spring applications

a combination of Spring and Bootstrap CSS

==a framework that simplifies the configuration of Spring applications==

##### Application type

 What kind of applications are normally created using the Spring framework?

 desktop apps

==web apps==

command-line apps

mobile apps

## Getting started with Spring Boot

##### An impossible property

Suppose you want to generate a new Spring Boot project using the web Initializr. What **cannot** be configured for this project?

programming language

build tool

==application logic==

version of Spring Boot

dependencies

## Processes and threads

##### Process's and thread's properties

 Mark suitable properties for each kind of container.

|                              | Process | Thread |
| ---------------------------- | ------- | ------ |
| Schedule other units of work | Yes     |        |
| Owns system resources        | Yes     |        |
| Borrows shared resources     |         | Yes    |
| Run a unit of work           |         | Yes    |

## Thread management

##### Ordering the execution of threads

Implement a method that takes three objects (instances of `Thread` or its subclasses). The method must start passed objects as threads in a way that the order of their execution goes like this: **t3, t2, t1**. These threads print secret phrases to the standard output, their output must always be the same.

All given threads must be terminated before the implemented method is completed.

Otherwise, the testing system will give you some hints on throwing exceptions in the main thread, for example:

```java
Exception in thread "main" java.lang.RuntimeException: All threads must be terminated before ending the implemented method
```

 class Invoker {

  public static void invokeMethods(Thread t1, Thread t2, Thread t3) throws InterruptedException {

​    t3.start();

​    t3.join();

​    t2.start();

​    t2.join();

​    t1.start();

​    t1.join();

  }

}

## Exceptions in threads

##### MyThread class

There's a class **MyThread** that extends **Thread**.

We create and start an instance of the class in the current thread:

```java
Thread thread = new MyThread();
thread.start();

// here is a lot of code with exceptions

thread.join();
```

==If an uncaught exception occurs in **thread**, the current thread will be stopped==

If an uncaught exception occurs in **thread**, the current thread won't be stopped

==If an uncaught exception occurs in the current thread, **thread** will be stopped==

If an uncaught exception occurs in the current thread, **thread** won't be stopped

## Shared data

##### Select all atomic

Select all atomic operations.
==The volatile keyword allows us to make visible changes of a field made by one thread to other threads. This keyword also makes writing to double and long fields atomic. But the keyword doesn't make the increment/decrement and similar operations atomic.==

==value = 5; // where value is int field==

value++; // where value is volatile int field

==value = 500L; // where value is volatile long field==

value = 5L; // where value is long field

value = 5.0d; // where value is double field

## Thread synchronization

##### Multithreaded counter

Here's a class named `Counter`. The class has a single field `count`. An instance of the class is accessed by different threads concurrently. Each thread invokes the method `inc` to increment the field many times.

After the completion of all threads, this field has an incorrect value.

Fix the code, so that it can work correctly with multiple threads. Do not make the class public.

**Example:**

Let's assume we have one instance of `Counter` and two threads. Each thread invokes the method `inc` 5000000 times. If everything works correctly after the completion of both threads `count` must be 10000000.

class Counter {
  int count = 0;
  public ==synchronized== void inc() {
    count++;
  }
}

## Collections and thread-safety

##### ConcurrentModificationException cases

What collections may produce `ConcurrentModificationException`?
==You can seek for the line "throw new ConcurrentModificationException()" in: - non-thread-safe collection ArrayList, - in totally synchronized Vector, - and even in thread-safe CopyOnWriteArrayList and you'll find it in all three cases.==

totally synchronized

none

non thread-safe

==both==

##### Hashing example

Which of the following functions can be considered a hash function?

A function that receives a text and removes all spaces from it

==A function that receives an address and returns its post code==

==A function that receives a number and returns its first digit==

## Hash function

##### Hashing an array

Consider the following hash function for an array of integers:

- if the array has at least 5 elements, pick 5 of them at random and return their sum as their hash value
- if there are fewer than 5, return the sum of all elements.

Select all the reasons why this is not a good hash function:

It is too slow

==The same array can have different hash values==

==Does not take all the values in the array into consideration==

==For arrays of up to 5 values, the hash value is the same no matter the order of the values==

## Hash table

##### Let it resize!

You have a hash table with 10 buckets, 6 elements, and a max load factor 0.75. What is the minimum number of elements you have to insert to make the hash table resize?
i.e ==What is the minimum number of elements you have to ADD to existing 6 elements to make the hash table resize==

==2==

## The Map interface

##### Creating a map

 Create `TreeMap` named `map` and fill it with the following three key-value pairs:

```java
Omega - 24
Alpha - 1
Gamma - 3
```

where strings are keys and numbers are values.

The code for displaying the map is already written.

 Report a typo

**Sample Input 1:**

```

```

**Sample Output 1:**

```
{Alpha=1, Gamma=3, Omega=24}
```

import java.util.*;

public class Main {

  public static void main(String[] args) {   

​    SortedMap<String, Integer> map=new TreeMap<>();

​    map.put("Omega", 24);

​    map.put("Alpha", 1);

​    map.put("Gamma", 3);

​    System.out.println(map);

  }

}

## YAML

##### Map mistake

This is a YAML map with personal information but it has two syntax mistakes. What are these mistakes?

```yaml
personal_information: name = Anna, age = 23, occupation = programmer
```

there should be semicolons instead of commas

==key-value pairs should be each on its line==

there are no opening and closing tags

==The key and value in each pair should be separated by colons==

## Basic project structure

##### Google annotations

In this challenge, you will apply your skill to google information about the Spring Framework.

There is an annotation called `@SpringBootApplication`. Select a combination of annotations which can replace it to provide the same abilities to your application.

It is not required to understand these annotations clearly to complete this challenge.

==@EnableAutoConfiguration==

@Autowired

==@ComponentScan==

==@Configuration==

@Controller

## Introduction to Spring Web MVC

##### Access URL

The server is running on port `9090`.

Select all the correct ways to access an `index.html` file.

==http://localhost:9090==

http://localhost:8080

==http://localhost:9090/==

http://localhost:8080/index.html

==http://localhost:9090/index.html==

## Posting and deleting data via REST

##### Complete the handler description

 Choose the missing parts of the method described below:

```java
@PostMapping("/products/{id}")
public void addProduct({1} int id, {2} String description) {
    productMap.add(id, description);
}
```

==1 - @PathVariable; 2 - @RequestParam==

1 - @RequestParam; 2 - @PathVariable

1 - @RequestParam; 2 - @RequestParam

1 - @PathVariable; 2 - @PathVariable

## Handling requests with bodies

##### Find the correct mapping class

Here is the JSON :

```json
{
  "id" : "1112hjkh3481soa7",
  "destination" : "London",
  "seat" : 143,
  "withLunch" : true
}
```

Choose the correct mapping class of the following:

1

```java
public class TicketInfo {

    public String id;
    public String destination;
    public int seat;
    public boolean withLunch;

    TicketInfo() {}

    //setters and getters
}
```

2

```java
public class TicketInfo {

    public String id;
    public String destination;
    public int seat;
    public boolean lunchEnabled;

    TicketInfo() {}

    //setters
}
```

3

```java
public class TicketInfo {

    public String id;
    public String destination;
    public int seat;
    public boolean withLunch;

    TicketInfo() {}

    //getters
}
```

4

```java
public class TicketInfo {

    public String id;
    public String destination;
    public int seat;
    public boolean withLunch;

    TicketInfo() {}

    public String getId() 
}
```

==1==

2

3

4
