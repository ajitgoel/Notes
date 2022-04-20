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