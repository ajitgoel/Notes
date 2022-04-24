**Topics you need to learn in order to complete the current stage:**

[Static members](https://hyperskill.org/projects/232/stages/1162/preview#)

[Hiding and overriding](https://hyperskill.org/projects/232/stages/1162/preview#)

[Polymorphism](https://hyperskill.org/projects/232/stages/1162/preview#)

[Abstract class](https://hyperskill.org/projects/232/stages/1162/preview#)

[Introduction to databases](https://hyperskill.org/projects/232/stages/1162/preview#)

[XML](https://hyperskill.org/projects/232/stages/1162/preview#)

[H2 database](https://hyperskill.org/projects/232/stages/1162/preview#)

[Data and object mapping](https://hyperskill.org/projects/232/stages/1162/preview#)

[Web security, OWASP](https://hyperskill.org/projects/232/stages/1162/preview#)

[Authentication and Authorization](https://hyperskill.org/projects/232/stages/1162/preview#)

[Getting started with Spring Security](https://hyperskill.org/projects/232/stages/1162/preview#)

[Authentication](https://hyperskill.org/projects/232/stages/1162/preview#)

[Authorization](https://hyperskill.org/projects/232/stages/1162/preview#)

[Custom User Store](https://hyperskill.org/projects/232/stages/1162/preview#)

[HTTP Basic Auth](https://hyperskill.org/projects/232/stages/1162/preview#)

Use the material from these topics and the skills you’ve learned to successfully complete this stage of the project.



**You will be working on the following in this project stage**

Implement user registration and authentication procedures using Spring Security.

Hide details ↑

[Join a study group for the project Anti-Fraud System](https://hyperskill.org/projects/232/study-group)

Discuss your current project with fellow learners and help each other.

##### Description

Enterprise applications like anti-fraud systems are used by different types of users with various access levels. Different users should have different rights to access various system parts. Let's set up the authentication procedure for our system. Of course, you can elaborate it yourself, but it is considered good practice to use an already tested and reliable implementation. Fortunately, Spring includes the Spring Security module that contains the right methods.

In this stage, you need to provide the HTTP Basic authentication for our `REST` service with the `JDBC` implementations of `UserDetailService` for user management. You will require an endpoint for registering users at `POST /api/auth/user`.



To run the tests, the `application.properties` file should contain the following line: `spring.datasource.url=jdbc:h2:file:../service_db`.



You will also need some security dependencies in Gradle:

```java
dependencies {
   ... other dependencies ...
   implementation 'org.springframework.boot:spring-boot-starter-security'
}
```

Make sure that the [CSRF](https://owasp.org/www-community/attacks/csrf) is disabled to facilitate testing. We do not recommend disabling it in real-world projects. We suggest the following configuration:

```java
    public void configure(HttpSecurity http) throws Exception {
        http.httpBasic()
                .authenticationEntryPoint(restAuthenticationEntryPoint) // Handles auth error
                .and()
                .csrf().disable().headers().frameOptions().disable() // for Postman, the H2 console
                .and()
                .authorizeRequests() // manage access
                .antMatchers(HttpMethod.POST, "/api/auth/user").permitAll()
                .antMatchers("/actuator/shutdown").permitAll() // needs to run test
                // other matchers
                .and()
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS); // no session
    }
```

**Please note** that /actuator/shutdown endpoint should be available to unauthorized users for testing purposes.

`RestAuthenticationEntryPoint` is an instance of the class that implements the `AuthenticationEntryPoint` interface. This endpoint handles authentication errors. For example:

```java
    public class RestAuthenticationEntryPoint implements AuthenticationEntryPoint {

        @Override
        public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, authException.getMessage());
        }
    }
```

##### Objectives

- Add the Spring security to your project and configure the HTTP basic authentication;
- For storing users and passwords, add a JDBC implementation of `UserDetailsService` with an H2 database. Usernames must be **case insensitive**;
- Add the `POST /api/auth/user` endpoint. In this stage, It must be available to unauthorized users for registration and accept data in the JSON format:

```json
{
   "name": "<String value, not empty>",
   "username": "<String value, not empty>",
   "password": "<String value, not empty>"
}
```

- If a user has been successfully added, the endpoint must respond with the `HTTP CREATED` status (`201`) and the following body:

```json
{
   "id": <Long value, not empty>,
   "name": "<String value, not empty>",
   "username": "<String value, not empty>"
}
```

- If an attempt to register an existing user was a failure, the endpoint must respond with the `HTTP CONFLICT` status (`409`);
- If a request contains wrong data, the endpoint must respond with the `BAD REQUEST` status (`400`);
- Add the `GET /api/auth/list` endpoint. It must be available to all authorized users;
- The endpoint must respond with the `HTTP OK` status (`200`) and the body with an array of objects representing the users sorted by ID in **ascending order**. Return an empty JSON array if there's no information:

```java
[
    {
        "id": <user1 id>,
        "name": "<user1 name>",
        "username": "<user1 username>"
    },
     ...
    {
        "id": <userN id>,
        "name": "<userN name>",
        "username": "<userN username>"
    }
]
```

- Add the `DELETE /api/auth/user/{username}` endpoint, where `{username}` specifies the user that should be deleted. The endpoint must be available to all authorized users. The endpoint must delete the user and respond with the `HTTP OK` status (`200`) and the following body:

```java
{
   "username": "<username>",
   "status": "Deleted successfully!"
}
```

- If a user is not found, respond with the `HTTP Not Found` status (`404`);
- Change the `POST /api/antifraud/transaction` endpoint; it must be available only to all authorized users.

##### Examples

**Example 1:** *a POST request for /api/auth/user with the correct user information*

*Request body:*

```java
{
   "name": "John Doe",
   "username": "JohnDoe",
   "password": "secret"
}
```

*Response:* `201 CREATED`

*Response body:*

```java
{
   "id": 1,
   "name": "John Doe",
   "username": "JohnDoe"
}
```

**Example 2:** *a POST request for /api/auth/user with the occupied email*

*Request body:*

```java
{
   "name": "John Doe",
   "username": "JohnDoe",
   "password": "secret"
}
```

*Response:* `409 CONFLICT`

**Example 3:** *a POST request for /api/auth/user with the wrong format of the user JSON*

*Request body:*

```java
{
   "name": "John Doe",
   "password": "secret"
}
```

*Response:* `400 BAD REQUEST`

**Example 4:** *a GET request for /api/auth/list*

*Response:* `200 OK`

```json
[
  {
    "name":"John Doe",
    "username":"JohnDoe",
  },
  {
    "name":"JohnDoe2",
    "username":"JohnDoe2",
  }
]
```

**Example 5:** *a DELETE request for /api/auth/user/johndoe*

*Response:* `200 OK`

```java
{
   "username": "JohnDoe",
   "status": "Deleted successfully!"
}
```

## Static members

All objects of a class have the same fields and methods, but the values of object fields are usually different. At the same time, a class may also have fields and methods which are common for all objects. Such fields and methods are known as **static members,** which are declared with the `static` keyword.

In this topic, you will learn how to use static class members. As a bonus, you will finally understand the part that the `static` keyword plays in the declaration of the `main` method.

##### Class variables

A **class variable (static field)** is a field declared with the `static` keyword. It can have any primitive or reference type, just like a regular instance field. A static field has the same value for all instances of the class. It belongs to the class, rather than to an instance of the class.

If we want all instances of a class to share a common value, for example, a global variable, it's better to declare it as static. This can save us some memory because a single copy of a static variable is shared by all created objects.

Static variables can be accessed directly by the class name. To access a static field, you should write

```java
ClassName.fieldName;
```

Let's look at an example. Here is a class with two public static variables:

```java
class SomeClass {

    public static String staticStringField;

    public static int staticIntField;
} 
```

We can set their values and get them:

```java
SomeClass.staticIntField = 10;
SomeClass.staticStringField = "it's a static member";

System.out.println(SomeClass.staticIntField); // It prints "10"
System.out.println(SomeClass.staticStringField); // It prints "it's a static member"
```



Generally, it's not a good idea to declare **non-final** **public static fields**, here we just used them as an example.



We can also access the value of a static field through an instance of the class.

```java
SomeClass.staticIntField = 30;

SomeClass instance = new SomeClass();

System.out.println(instance.staticIntField); // It prints "30"
```

Let's see a more complex example. Here is a class with a static field named `lastCreated`. The field stores the date of the last created instance.

```java
public class SomeClass {

    public static Date lastCreated;

    public SomeClass() {
        lastCreated = new Date();
    }
}
```

The value of the static field is changed in the class constructor every time a new object is created.

The code below creates two instances and outputs intermediate results:

```java
System.out.println(SomeClass.lastCreated);

SomeClass instance1 = new SomeClass();
System.out.println(SomeClass.lastCreated);

SomeClass instance2 = new SomeClass();
System.out.println(SomeClass.lastCreated); 
```

In my case, the results were the following:

```java
null
Sun Aug 20 17:49:24 YEKT 2017
Sun Aug 20 17:49:25 YEKT 2017
```

##### Class constants

Static fields with the `final` keyword are **class constants**, which means they cannot be changed. According to the naming convention, constant fields should always be written in uppercase with an underscore (`_`) to separate parts of the name.

The standard class `Math` , for example, contains two static constants:

```java
public static final double E = 2.7182818284590452354;

public static final double PI = 3.14159265358979323846;
```

Constants are often public, but it's not a rule.

To see how they work in an example, let's declare a class named `Physics` with two static constants:

```java
class Physics {

    /**
     * The speed of light in a vacuum (m/s)
     */
    public static final long SPEED_OF_LIGHT = 299_792_458;

    /**
     * Electron mass (kg)
     */
    public static final double ELECTRON_MASS = 9.10938356e-31;
}
```

To use the constants, let's write the following code:

```java
System.out.println(Physics.ELECTRON_MASS); // 9.10938356E-31
System.out.println(Physics.SPEED_OF_LIGHT); // 299792458
```

Since those fields are constants, we cannot change their values. If we try to do it, we'll get an error:

```java
Physics.ELECTRON_MASS = 10; // compile-time error
```

##### Class methods

A class may have **static methods** as well as static fields. Such methods are also known as **class methods**. A static method can be accessed by the class name and doesn't require an object of the class.

Static methods can be called directly with the class name. To access a method, you should write

```java
ClassName.staticMethodName(args);
```

A static method may have arguments like a regular instance method or it may well have no arguments. But, unlike instance methods, static methods have several special features:

- a static method can access only static fields and cannot access non-static fields;
- a static method can invoke another static method, but it cannot invoke an instance method;
- a static method cannot refer to `this` keyword because there is no instance in the static context.

Instance methods, however, can access static fields and methods.



Static methods are often used as **utility methods** that are the same for the whole project. As an example, you can create a class with only static methods for performing typical math operations.



The Java class library provides a lot of static methods for different classes. Here are just a few of them:

- the `Math` class has a lot of static methods, such as `Math.min(a, b)`, `Math.abs(val)`, `Math.pow(x, y)` and so on;
- the `Arrays` class has a lot of static methods for processing arrays such as `toString(...)`;
- `Long.valueOf(...)`, `Integer.parseInt(...)`, `String.valueOf(...)` are static methods too.

Here is a class with one constructor, a static method and an instance method.

```java
public class SomeClass {
    
    public SomeClass() {
        invokeAnInstanceMethod(); // this is possible here
        invokeAStaticMethod();    // this is possible here too
    }
    
    public static void invokeAStaticMethod() { 
        // it's impossible to invoke invokeAnInstanceMethod() here
    }
    
    public void invokeAnInstanceMethod() { 
        invokeAStaticMethod();  // this is possible too
    }
}
```

This example shows that you can invoke a static method from the instance context (constructors and instance methods), but you can't invoke an instance method from a static context.

The only way to call an instance method from a static one is to provide a reference to this instance as an argument. You can also create objects of other classes and call their methods in a similar way. Here's an example:

```java
public static void invokeAStaticMethod(SomeClass someClassInstance) {

    // calling instance method from static context by passing instance as an argument
    someClassInstance.invokeAnInstanceMethod(); 

    // calling instance and static methods of AnotherClass instance
    AnotherClass anotherClassInstance = new AnotherClass();
    anotherClassInstance.invokeAnotherClassInstanceMethod();
    anotherClassInstance.invokeAnotherClassStaticMethod();
}
```

An example of a static method is the `main` method. It always should be static.

##### Conclusion

In this lesson, we discussed static fields and methods and some situations where we can use them. It is important to remember that static members cannot access the values of object fields since there is no instance context (`this`). Nonetheless, they are a good option for providing a set of common constants (together with `final`) and utility methods for the whole project. We will consider other helpful ways of using static members in the next topics.

## Hiding and overriding

##### Overriding instance methods

Java provides an opportunity to declare a method in a subclass with the same name as a method in the superclass. This is known as **method overriding**. The benefit of overriding is that a subclass can give its own specific implementation of a superclass method.

**Overriding methods** in subclasses allows a class to inherit from a superclass whose behavior is **"close enough"** and then to change this behavior as the subclass needs.

Instance methods can be overridden if they are inherited by the subclass. The overriding method must have the same name, parameters (number and type of parameters), and the return type (or a subclass of the type) as the overridden method.

**Example.** Here is an example of overriding.

```java
class Mammal {

    public String sayHello() {
        return "ohlllalalalalalaoaoaoa";
    }
}

class Cat extends Mammal {

    @Override
    public String sayHello() {
        return "meow";
    }
}

class Human extends Mammal {

    @Override
    public String sayHello() {
        return "hello";
    }
}
```

The hierarchy includes three classes: `Mammal`, `Cat` and `Human`. The class `Mammal` has the method `sayHello`. Each subclass overrides this method. The `@Override` annotation indicates that the method is overridden. This annotation is optional but helpful.

Let's create instances and invoke the method.

```java
Mammal mammal = new Mammal();
System.out.println(mammal.sayHello()); // it prints "ohlllalalalalalaoaoaoa"

Cat cat = new Cat();
System.out.println(cat.sayHello()); // it prints "meow"

Human human = new Human();
System.out.println(human.sayHello()); // it prints "hello"
```

As you can see, each subclass has its own implementation of the method `sayHello`.



You can invoke the base class method in the overridden method using the keyword `super`.



##### Rules for overriding methods

There are several rules for methods of subclasses which should override methods of a superclass:

- the method must have the same name as in the superclass;
- the arguments should be exactly the same as in the superclass method;
- the return type should be the same type or a subtype of the return type declared in the method of the superclass;
- the access level must be the same or more open than the overridden method's access level;
- a private method cannot be overridden because it's not inherited by subclasses;
- if the superclass and its subclass are in the same package, then package-private methods can be overridden;
- static methods cannot be overridden.

To verify these rules, there is a special annotation `@Override`. It allows you to know whether a method will be actually **overridden** or not. If for some reason, the compiler decides that the method cannot be overridden, it will generate an error. But, remember, the annotation is not required, it's only for convenience.

##### Forbidding overriding

If you'd like to forbid overriding of a method, declare it with the keyword `final`.

```java
public final void method() {
    // do something
}
```

Now, if you try to override this method in a subclass, a compile-time error will occur.

##### Overriding and overloading methods together

Recall, that **overloading** is a feature that allows a class to have more than one method with the same name, if their arguments are different.

We can also override and overload an instance method in a subclass at the same time. Overloaded methods do not override superclass instance methods. They are new methods, unique to the subclass.

The following example demonstrates it.

```java
class SuperClass {

    public void invokeInstanceMethod() {
        System.out.println("SuperClass: invokeInstanceMethod");
    }
}

class SubClass extends SuperClass {

    @Override
    public void invokeInstanceMethod() {
        System.out.println("SubClass: invokeInstanceMethod is overridden");
    }
    
    // @Override -- method doesn't override anything
    public void invokeInstanceMethod(String s) {
        System.out.println("SubClass: overloaded invokeInstanceMethod");
    }
}
```

The following code creates an instance and calls both methods:

```java
SubClass clazz = new SubClass();

clazz.invokeInstanceMethod();    // SubClass: invokeInstanceMethod() is overridden
clazz.invokeInstanceMethod("s"); // SubClass: overloaded invokeInstanceMethod(String)
```

Remember, overriding and overloading are different mechanisms but you can mix them together in one class hierarchy.

##### Hiding static methods

Static methods cannot be overridden. If a subclass has a static method with the same signature (name and parameters) as a static method in the superclass then the method in the subclass hides the one in the superclass. It's completely different from method overriding.

You will get a compile-time error if a subclass has a static method with the same signature as an instance method in the superclass or vice versa. But if the methods have the same name but different parameters there should be no problems.

## Polymorphism

[Theory](https://hyperskill.org/learn/step/3587)Practice

13% completed, 0 problems solved

##### Theory

 34 minutes reading

Verify to skipStart practicing

##### Kinds of polymorphism

In general, **polymorphism** means that something (an object or another entity) has many forms.

Java provides two types of polymorphism: **static (compile-time)** and **dynamic** **(run-time)** polymorphism. The first one is achieved by **method overloading**, the second one is based on inheritance and **method overriding**.

The more theoretical approach subdivides polymorphism into several fundamentally different types:

- **Ad-hoc polymorphism** refers to polymorphic functions that can be applied to arguments of different types, but behave differently depending on the type of the argument to which they are applied. Java supports it as **method overloading**.
- **Subtype polymorphism** (also known as subtyping) is a possibility to use an instance of a subclass when an instance of the base class is permitted.
- **Parametric polymorphism** is when the code is written without mention of any specific type and thus can be used transparently with any number of new types. Java supports it as **generics** or **generic programming**.

In this topic, we consider only **subtype (runtime) polymorphism** that is widely used in object-oriented programming.

##### Runtime polymorphic behavior

A reminder: *method overriding* is when a subclass redefines a method of the superclass with the same signature.

Run-time polymorphism relies on two principles:

- a reference variable of the superclass can refer to any subtype object;
- a superclass method can be overridden in a subclass.

Run-time polymorphism works when an overridden method is called through the reference variable of a superclass. Java determines at runtime which version of the method (superclass/subclasses) is to be executed based on the type of the object being referred, not the type of reference. It uses a mechanism known as **dynamic method dispatching**.

**Example.** Here, you can see a class hierarchy. The superclass `MythicalAnimal` has two subclasses: `Chimera` and `Dragon`. The base class has a method `hello`. Both subclasses override this method.

```java
class MythicalAnimal {    

    public void hello() {
        System.out.println("Hello, I'm an unknown animal");
    }
}

class Chimera extends MythicalAnimal {
    @Override
    public void hello() {
        System.out.println("Hello! Hello!");
    }
}

class Dragon extends MythicalAnimal {
    @Override
    public void hello() {
        System.out.println("Rrrr...");
    }
}
```

We can create a reference to the class `MythicalAnimal` and assign the subclass object to it:

```java
MythicalAnimal chimera = new Chimera();
MythicalAnimal dragon = new Dragon();
MythicalAnimal animal = new MythicalAnimal();
```

We can also invoke overridden methods through the base class references:

```java
chimera.hello(); // Hello! Hello!
dragon.hello(); // Rrrr...
animal.hello(); // Hello, I'm an unknown animal
```

So, the result of a method call depends on the actual type of instance, not the reference type. It's a polymorphic feature in Java. The JVM calls the appropriate method for the object that is referred to in each variable.

Subtype polymorphism allows a class to specify methods that will be common to all of its subclasses. Subtype polymorphism also makes it possible for subclasses to override the implementations of those methods. Together with abstract methods and interfaces, which you'll learn about later, subtype polymorphism is a fundamental object-oriented design concept.

##### Polymorphism within a class hierarchy

The same thing works with methods that are used only within a hierarchy and are not accessible from the outside.

In the following example, we have a hierarchy of files. The parent class `File` represents a description of a single file in the file system. It has a subclass named `ImageFile`. It overrides the method `getFileInfo` of the parent class.

```java
class File {

    protected String fullName;

    // constructor with a single parameter

    // getters and setters

    public void printFileInfo() {
        String info = this.getFileInfo(); // here is polymorphic behavior!!!
        System.out.println(info);
    }

    protected String getFileInfo() {
        return "File: " + fullName;
    }
}

class ImageFile extends File {

    protected int width;
    protected int height;
    protected byte[] content;

    // constructor

    // getters and setters

    @Override
    protected String getFileInfo() {
        return String.format("Image: %s, width: %d, height: %d", fullName, width, height); 
    }
}
```

The parent class has a public method `printFileInfo` and a protected method `getFileInfo`. The second method is overridden in the subclass, but the subclass doesn't override the first method.

Let's create an instance of `ImageFile` and assign it to a variable of `File`.

```java
File img = new ImageFile("/path/to/file/img.png", 480, 640, someBytes); // assigning an object
```

Now, when we call the method `printFileInfo`, it invokes the overridden version of the method `getFileInfo`.

```java
img.printFileInfo(); // It prints "Image: /path/to/file/img.png, width: 480, height: 640"
```

So, **run-time polymorphism** allows you to invoke an overridden method of a subclass having a reference to the base class.

## Polymorphism

##### What does the code output

Here's a class hierarchy consisting of four classes.

```java
class A {
    
    public void print() {
        System.out.println("class-A");
    }
}

class B extends A { }

class C extends B {
    
    public void print() {
        System.out.println("class-C");
    }
}

class D extends C {

    public void print() {
        System.out.println("class-D");
    }   
}
```

What does the code below output?

```java
B instance = new C();
instance.print();
```

==class-C==

## Abstract class

Sometimes you have a set of fields and methods that you need to reuse in all classes within a hierarchy. It is possible to put all the common members to a special base class and then declare subclasses which can access these members. At the same time, you do not need to create objects of the base class. To achieve it, you can use an **abstract class** as the base class in the hierarchy.

##### What is an abstract class?

An **abstract class** is a class declared with the keyword **`abstract`**. It represents an abstract concept that is used as a base class for subclasses.

Abstract classes have some special features:

- it's impossible to create an instance of an abstract class;
- an abstract class can contain abstract methods that must be implemented in non-abstract subclasses;
- it can contain fields and non-abstract methods (including static);
- an abstract class can extend another class, including abstract;
- it can contain a constructor.

As you can see, an abstract class has two main differences from regular (concrete) classes: **no instances** and **abstract methods**.

**Abstract methods** are declared by adding the keyword **`abstract`**. They have a declaration (modifiers, a return type, and a signature) but don't have an implementation. Each concrete (non-abstract) subclass must implement these methods.



Note, static methods can't be abstract!



##### Example

Here is an abstract class `Pet`:

```java
public abstract class Pet {

    protected String name;
    protected int age;

    protected Pet(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public abstract void say(); // an abstract method
}
```

The class has two fields, a constructor, and an abstract method.

Since `Pet` is an abstract class we cannot create instances of this class:

```java
Pet pet = new Pet("Unnamed", 5); // this throws a compile time error
```

The method `say()` is declared abstract because, at this level of abstraction, its implementation is unknown. Concrete subclasses of the class `Pet` should have an implementation of this method.

Below are two concrete subclasses of `Pet`. You can see that they override the abstract method:

```java
class Cat extends Pet {

    // It can have additional fields as well

    public Cat(String name, int age) {
        super(name, age);
    }

    @Override
    public void say() {
        System.out.println("Meow!");
    }
}

class Dog extends Pet {

    // It can have additional fields as well

    public Dog(String name, int age) {
        super(name, age);
    }

    @Override
    public void say() {
        System.out.println("Woof!");
    }
}
```

We can create instances of these classes and call the `say()` method.

```java
Dog dog = new Dog("Boss", 5);
Cat cat = new Cat("Tiger", 2);
        
dog.say(); // it prints "Woof!"
cat.say(); // it prints "Meow!"
```

Do not forget that Java doesn't support multiple inheritance for classes. Therefore, a class can extend only one abstract class.

## Abstract class

##### Parts of an abstract class

What can an abstract class have?

==private methods==

==static methods==

==abstract methods==

abstract static methods

## Introduction to databases

The world today is overloaded with information, and so are we. How do you keep important information safe and sorted? You may simply hope you neither forget nor confuse anything, but it's better to write it down or save it on your device. So you have it on your computer or phone, and the program keeps the information safe. While the program is active, it "remembers" everything. However, quitting the program may result in losing all that information. That's why it's better to keep the data using more sophisticated tools.

The challenge is to navigate a huge and complex web of information and ensure everything important is safe and organized: a task that **databases** handle well.

##### Database

A **database** is a collection of data that is specifically organized for rapid search and retrieval processed by a computer.

The difference between a database and a usual file is that a file may be structured or not, but a database must have a specific structure. For example, you can create a file with a to-do list:

![img](Stage2-Authentication.assets/d0a83903-5f02-4aff-8758-e57938a01901.svg)

Obviously, we'd say that this file has some kind of a structure, but from a computer's perspective, it's still a plain file, until you write a program that manages data in it. Usually, the information in databases is compressed and stored as binaries rather than plain text, so it's clear that this kind of structure is meant for computers, not humans.

Unlike us, computers can easily understand the binary format of data, but what allows them to read and write it correctly? It is a program called **Database Management System**, which controls the data in a database.

##### Database Management System

A Database Management System (**DBMS**) is a type of software that allows users to define, create, and control data.

The DBMS can optimize queries and retrieve data from а database in an optimal way. It is a mediator between the user and the database, which means that users can work with it through the interface of the DBMS. In addition, it can also help isolate data from them.

Another goal of this software is to help people work with different databases without exposing their actual differences.

![img](Stage2-Authentication.assets/preview.png)

Most database management systems have pretty good descriptions and tutorials on their sites. There are also specific languages that you need to learn to start working with this, but if you know programming languages, you can work with a database with their tools instead.



Although it sounds like all databases have different syntax, most of them actually implement common standards. Almost all relational databases use the SQL standard, so you can apply the same commands in different DBMSs.



##### Access to data

At this stage, you may still have doubts about how to use databases. You have to learn a new language to update and select the data, which can be time-consuming, so why not use plain files instead?

Of course, you can keep the files locally, but as they grow in number, you won't be able to find information quickly. Databases provide **schemas** and **metadata** that allow for a quick search of the needed data.



A schema describes how YOU organize the data. Metadata holds structural and statistical information.



If you want to access your data from multiple devices, most systems provide a convenient way to work with them through the web.

To open restricted access to another person, some management systems use simple login/password authentication, while some provide more powerful instruments. With their help, you can grant access to a limited portion of data for each user.

![img](Stage2-Authentication.assets/preview-16507674869221.png)

If you still are not convinced how great the DBMSs are, let's look at what else you can get from them.

##### Data consistency

One of the best features of databases is their ability to keep and restore the data correctly. It doesn't mean that the DBMS knows how to be correct, but once you define the correctness with the configuration or schema, you can be sure that nothing will break these rules. The DBMS can provide you with formats you can use for your data. You can also set up all the tests and constraints that you want to have.

If you at the same time have access to a single data with someone else there may be a problem. Updates in files usually follow the "last save wins" rule that creates a conflict of updates. While the databases isolate different users and can be configured to resolve conflicts between their updates. For example, if someone at home decides to contribute to your to-do list, then following the “last changes saved” file update rule, you risk missing the football game on TV that you have scheduled for tomorrow night.

There's another good thing about databases. When a usual file becomes corrupted and cannot be opened, you've lost your data forever. Using the DBMS instead, you can make backups and then restore the data to continue your work.

Of course, you can emulate all of these operations and develop your DBMS, but first, try to work with the existing solutions.

##### Conclusion

There's a lot of learning you need to do before you start working with databases. No pain, no gain, and here you can actually gain a lot.

With databases you can:

- Store, retrieve and update data;
- Get metadata;
- Access database remotely;
- Restrict accesses to data;
- Make concurrent updates;
- Recover to some point in time;
- Check the rules for data consistency automatically.

In a data-driven world, this kind of functionality is golden. Welcome to the world of new opportunities and good luck with exploring the databases!

##### Software to access database

What is the name of the software to access and control data in a database?

Please use the abbreviation.

==DBMS==

## XML

**XML** **(eXtensible Markup Language)** is a text-based format for storing and exchanging structured data on the Internet. In this format, the data is presented as documents with a clear and flexible structure. An XML document can be stored on the computer with the `.xml` extension that is often used to keep configuration files of programs.

At this moment, XML is one of the most popular formats around the world, used both by small startups and huge companies. XML is especially valued for being very expressive for people and easy for machine processing.

##### Tags and elements

Each XML document consists of **tags** and **elements.**

A **tag** is a string with an assigned meaning like a book, a person or something of the sort. It is interesting that XML does not provide tags at all, but it gives developers an opportunity to invent tags independently.

An **element** is a building block of an XML structure: it may contain text, tags, other elements and attributes.

Here is an example of an XML document that describes a book with a title and one author:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<book>
  <title>The Three-Body Problem</title>
  <author>Liu Cixin</author>
</book>
```

This document has three tags enclosed in angle brackets: `<book>`, `<title>` and `<author>`.

By `element` we understand the combination of a starting tag with the corresponding ending tag together with their content. Elements set the structure of a document since they can be nested in each other.

Our document has the following elements:

- `<book>....</book>` contain two other elements;
- `<title>The Three-Body Problem</title>`
- `<author>Liu Cixin</author>`



All elements should have a closing tag (a similar tag, but with a slash `/` in front) or just end with a slash (`/>`). Here's an example of using an unpaired tag: `<picture name="sun"/>`.



The first line in the XML document is called a **prologue:**

```xml
<?xml version="1.0" encoding="UTF-8"?>
```

It specifies the version of the XML standard (usually 1.0) and defines the encoding (here it's UTF-8). The prologue is optional, but if it's there, it must come first in the document.



Note that a prologue does not have a closing tag!



##### Child elements

Each XML document always has a single element called `root`. This element can contain other elements called **child elements** which in their turn can have their own **children.**

The following XML document represents books contained in a library:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<library>
  <book>
    <title>The Three-Body Problem</title>
    <author>Liu Cixin</author>
  </book>
  <book>
    <title>Modern Operating Systems</title>
    <author>Andrew S. Tanenbaum</author>
  </book>
</library>
```

Here, the root element `<library>` has two children `<book>` elements, while the elements `<title>` and `<author>` are the children of `<book>`. So, XML documents represent hierarchical structures that are often used in programming.

##### Attributes

XML elements can possess **attributes** that provide additional information about the element.

The value of the attribute is always set in either double or single quotes. For example, the name of a picture can be written as follows:

```xml
<picture name="The Black Square"/>
```

If the value of the attribute contains double quotes, you need to use single quotes. For example:

```xml
<picture name='"Sunset at Sea", Ivan Aivazovsky'/>
```

Sometimes, you can also see quotes replaced by special entity symbols (`"`):

```xml
<picture name="&quot;Sunflowers&quot;, Vincent van Gogh"/>
```

An element can contain more than one attribute:

```xml
<picture name='Sunset at Sea' author='Ivan Aivazovsky'/>
```

The following XML document presents an art gallery:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gallery>
  <picture name='Sunset at Sea' painter='Ivan Aivazovsky'/>
  <picture name='The Black Square' painter='Kazimir Malevich'/>
  <picture name='Sunflowers' painter='Vincent van Gogh'/>
</gallery>
```

As you can see, in some cases, attributes can replace child elements. There is no consensus about what's better to use. It usually depends on the data you are trying to model, your tools for XML processing and, of course, the people you work with.



Note that an element can have both attributes and child elements together.



##### Pros and cons of XML

XML has won popularity due to its apparent advantages:

- it can be easily understood by machines and people alike;
- the format is based on international standards;
- it has a well-defined structure which facilitates the search and extraction of information;
- modern programming languages have libraries for processing XML documents automatically.

At the same time, XML has an important disadvantage. Its redundant syntax causes higher storage and transportation cost. It is especially important when we need to store or transfer a large amount of data.

##### Conclusion

In summary, XML is a format for saving and transferring data as documents with the `.xml` extension. The main components of these documents are tags, elements, and attributes. Keep in mind, though XML has its advantages like a well-defined structure, using it with a large amount of data could sometimes be inefficient due to its verbose syntax.
Now that you have learned the basic principles of XML, it is time to put your skills to practice!

## H2 database

##### Why use H2 as a database

H2 is an open-source lightweight relational database for the Java platform. It is provided by Spring Boot by default and is easy and quick to set up in comparison with other databases. Using H2 as a database in training projects can help you to concentrate on learning Spring Boot and java features instead of database-specific setup.

However, it also requires a minimal configuration to be done. The config you will create in this topic can then be simply reused in other studying projects with slight changes.

There are two main ways to store data in the H2 database. You can use it as an **in-memory database** and keep your data in memory while H2 is running. After you stop using H2 or the application, all the data will be lost.

The other way is to **store the data on your drive** in the file system and reuse it when you need it. We will use this type of database here to learn the different options available for it.

##### The basic project

First, we need to create a basic Spring Boot project. Visit the Spring Initializr site and create a basic project topic. We need to add some additional dependencies:

- spring-boot-starter-data-jpa
- spring-boot-starter-jdbc
- spring-boot-starter-web
- com.h2database:h2.

Your **build.gradle** with the dependencies should look like the one below.

```no-highlight
dependencies {
    implementation 'org.springframework.boot:spring-boot-starter-jdbc'
    implementation 'org.springframework.boot:spring-boot-starter-web'
    implementation 'org.springframework.boot:spring-boot-starter-data-jpa'
    runtimeOnly 'com.h2database:h2'
    testImplementation('org.springframework.boot:spring-boot-starter-test') {
        exclude group: 'org.junit.vintage', module: 'junit-vintage-engine'
    }
}
```

Now we are ready to set up the H2 database.

##### Datasource parameters

The h2 parameters are configured in the **application.properties** file. First, we set the datasource parameters, which define where our database is stored, what type it is, and how the application can connect to it.

Let's start with the following string in the **application.properties** file:

```no-highlight
spring.datasource.driverClassName=org.h2.Driver
```

This parameter sets the class of the datasource driver. If you tap on the value, you will be able to see that it is a regular Java class in the `org.h2` package:

```java
public class Driver implements java.sql.Driver, JdbcDriverBackwardsCompat
```

The next parameter sets the place where your db files would be stored. As H2 commonly is used to manage an in-memory database, all the files will be placed on your drive. For example, the following string creates a database named "sampleDB" in the current user's directory:

==spring.datasource.url=jdbc:h2:file:~/sampleDB==

The last two options describe the database username and password.

```no-highlight
spring.datasource.username=sa
spring.datasource.password=abc123
```

The user "sa" is the default one. The default password is an empty string, so this parameter is not necessary.

You can also set the database type you are about to use. Otherwise, it will be set automatically.

```no-highlight
spring.jpa.database-platform=org.hibernate.dialect.H2Dialect
```

##### H2 console

Now we enable the h2 console so it can run our application and use the console functionality:

```no-highlight
spring.h2.console.enabled=true
spring.h2.console.settings.trace=false
```

The `trace` parameter value above hides all the H2 console trace in the application log. You can set it to `true` and look at how console actions are traced.

If you now run the application, you will see how the sampleDB is created and the console is enabled:

![img](Stage2-Authentication.assets/fe949226-1915-4dae-8170-dc2d44f9aff4.png)h2 console startup message

As the log says, the database is available at the user's directory. You can open it and find the sampleDB.mv file there. It also says that now you can get to the h2 console at the `localhost:8080/h2-console` URL with your browser.

You can also change the `/h2-console` path in the **application.properties** file:

```no-highlight
spring.h2.console.path=/h2
```

![img](Stage2-Authentication.assets/303e3484-b34d-4df1-befe-1fc3d9b4493f.png)

Replace the JDBC URL value with the one you set at `spring.datasource.url` parameter and connect with the username and password you set at `spring.datasource.username` and `spring.datasource.password` parameters.

The main console page should look like the one in the following picture.

![img](Stage2-Authentication.assets/a294e0ea-dc59-4d18-86eb-085314afbc57.png)

You can see the window for your SQL queries and the sampleDB schema. Now we can create the table to this schema.

##### Data parameters

A simple example of an entity model class is an object with specific annotations on it and its fields. For example, our table will be called "User" and will contain fields:

- id
- username
- password
- enabled

Explore the model class for this table:

```java
@Entity(name = "user")
public class User {

    @Id
    @Column
    private long userId;

    @Column
    private String username;

    @Column
    private String password;

    @Column
    private boolean enabled;

    //getters and setters

    //equals() and hashCode() methods
}
```

Hibernate can create the table according to this model. To enable updating schema by models, we set some properties at the **application.properties** file again:

```no-highlight
spring.jpa.hibernate.ddl-auto=update
```

This parameter can get different values to change the schema creation behavior on the application startup:

- update: updating schema if some changes were made to entity classes;
- create: always drops the previous schema and generates a new one;
- create-drop: creates the new schema and drops the previous when an application is stopped;
- validate: just validating the schema and making no changes to the existing one.

Now let's restart the application and check the changes at the h2 console.

![img](Stage2-Authentication.assets/67127e4b-f78e-4da0-88a8-ff928355365c.png)

You can see that the USER table was created with all of the fields from the `User` class.

##### Logging SQL queries

We did not insert any information to the table here, but usually, the application runs different SQL queries at runtime. To see these queries in the application log you can enable show-sql in the application-properties file :

```no-highlight
spring.jpa.show-sql=true
```

It will not show the queries made in the H2 console, only the queries initiated in the application.

##### Conclusion

In this topic, you've created the Spring Boot application with H2 in-memory integration and set up the H2 console by writing the **application.properties** file.

At the end of the application setting, this file can look like this:

```no-highlight
#datasource settings
spring.datasource.url=jdbc:h2:file:~/sampleDB
spring.datasource.driverClassName=org.h2.Driver
spring.datasource.username=sa
spring.datasource.password=abc123

#data settings
spring.jpa.database-platform=org.hibernate.dialect.H2Dialect
spring.jpa.hibernate.ddl-auto=update

#console settings
spring.h2.console.enabled=true
spring.h2.console.path=/h2
spring.h2.console.settings.trace=false
spring.jpa.show-sql=true
```

## Data and object mapping

Programming languages may include primitive types, classes, and data structures to store information. If you want to modify an object or interact with it somehow, you would probably prefer to do it in your favorite programming language. As a developer, you use tools you're familiar with. In the local environment, you can complete most of your tasks this way. However, to communicate with other systems and to store data [persistently](https://www.linkedin.com/pulse/what-persistent-data-why-important-c-thomas-tom-smith-iii), you need to convert your local types to a commonly used data representation.

##### Data mapping

Assume that you are developing a social network service. Every moment, some users search for a friend, and the service should reply with some information about other users in the network.

We represent each person as an instance of the `Person` class in the code. Let's stick to a simple diagram to avoid using any specific programming language:

<img src="Stage2-Authentication.assets/019442bc-cd9e-4d5c-8d29-fe4a03563a76.svg." alt="img" style="zoom:50%;" />

The problem arises when you want to retrieve the information about a person from the storage you use. Relational databases often play the role of storage but in the form of tables and relations between them. Luckily, you're not the first person who faces the task to convert one common data type to another. Just find a library for **data mapping** and it will help you a lot.

Data mapping is matching fields of **source** data representation to the fields of its **destination**. In our case, the source is a database, and the destination is the `Person` class, but the operation can also be applied the other way around. In other tasks, we could use other mappings for the `Person` class and convert it to/from JSON, XML.

<img src="Stage2-Authentication.assets/41288456-2031-49a1-a119-0f12ba611811.svg." alt="img" style="zoom:50%;" />

We use data mapping to convert the information from one type to another, but we don't synchronize the data changes over time by default, we only want a different view at a particular moment.

##### Object Mapping

The structure of data in the source system may be different from the structure of data in the destination system. We could store the information about the name in one place and the information about the age in another because retrieving data to `Person` class is not the only purpose of the storage. This time data mapping will only match the part of the data we needed. For complex operations like this one, we need a more appropriate instrument such as **object mapping**.

Object mapping is matching data from a source system to a complex object in the destination system.

The most commonly used example is **ORM** (Object-Relational Mapping) when the data from relational databases is matched with the classes in object-oriented languages.

<img src="Stage2-Authentication.assets/6bdfcdec-5e05-43fb-8baf-ae1b5ad46caf.svg." alt="img" style="zoom:50%;" />

The main distinction between data and object mapping is that object mapping not only stores data but also emulates the behavior of an object and reflects changes in its source system. As a developer, you can call methods of the class, and data mappings will change at the same time. In short, object mapping is like data mapping, but with high-level control over changes.

##### The life cycle of mapping

To see what is data and object mapping in action, let's continue our work with the social network. We receive a query with some name and look for it in our data storage. As soon as we find an appropriate result, we retrieve the information about the person from the database. We fill the class instance with the result of the search.

Now our class is only a data container and nothing more, and this action is an example of data mapping. If we store the object in the database, it's a reversed example.

The age of a person is changing over time, but the storage is not aware of such changes, so we implement a method that adds a year to the age attribute:

<img src="Stage2-Authentication.assets/94752e0e-d02b-4a5d-b233-b459c7a1cdc6.svg." alt="img" style="zoom:50%;" />

After the age is changed in the instance of the class, the value in the storage becomes outdated. If we want to mirror it, we should put some effort into working with the storage, then we need to synchronize the information. This can take place in the same method or we can define another one for it.

<img src="Stage2-Authentication.assets/809cfd8a-e8f0-45cc-a330-9fa1ec21ec88.svg." alt="img" style="zoom:50%;" />

This operation refers to object mapping; we are not only changing the object but also synchronizing data for it. Now our object has actual information in the storage, too. Synchronization is one of the important features of mapping; we want to have the definite representation of an object in our language and in the storage it uses. However, it's not obligatory to synchronize objects every time we change them. Sometimes it's more efficient to accumulate all the changes before the synchronization.

##### Conclusion

We have learned two new concepts: data mapping and object mapping. We use data mapping to match data in two different systems, and we use object mapping to represent more complex objects and to add control from one system to data in another.

## Web security, OWASP

Everyone uses the Internet: from regular people using social networks and watching movies to serious developers creating various websites. What all these people have in common is that their data is stored on the network and can be accessed if it is not secure. For data protection, there is a concept of web security.

In this topic we will take a closer look at what web security is, why we should monitor security, what types of vulnerabilities exist, and how we can find them.

##### What is web security

**Web security** is a set of measures and protocols aimed at protecting data from viruses, spam, and other threats that can harm a website, application, and/or specific user's data. It encompasses Internet, browser security, website security, and network security as it applies to other applications or operating systems as a whole.

![img](Stage2-Authentication.assets/eaa82621-9102-4a9f-b390-bac4a1189bce.svg.)

The main idea of web security is that the Internet is an inherently insecure channel for information exchange. This idea is reflected in two key concepts:

- No one is ever 100% safe. Any site or account may be hacked. There is no notion of being 100% protected from this.
- One layer of security is not enough. For example, a password from a social network or website is a good idea, but it alone may not be enough. Therefore, after entering a username and password, additional means of user authentication like one-time pins are often required.

There are different types of threats both ordinary users and developers can face so let's review the main ones.

##### Threats

Generally, users face the following threats:

- **Malware** such as viruses or Trojans. An Internet user can be tricked into downloading malicious software onto a computer. Antiviruses help avoid them.
- **Dos attack** is a type of hacker attack on a system in which real users receive a denial of service.
- **Phishing** is a type of online fraud in which attackers gain access to confidential user information such as username and password. In order to reduce the likelihood of such an attack, two-step user authentication is used. Passwords can also be changed periodically.
- **Application vulnerabilities**. If a site or program can be hacked, then it has a weak point, which is called a vulnerability. Vulnerabilities are different, they have their own classification and types.

We will discuss the last threat type in more detail below.

##### Security vulnerabilities

Web security vulnerabilities are prioritized depending on exploitability, detectability, and impact on software.

- **Exploitability** is what hackers should do to exploit the security vulnerability. The high exploitability is when an attacker needs only a web browser, and the low one is when an attacker needs advanced programming and tools.
- **Detectability** answers the question of how easy it is to detect the threat. It is easy to detect if the information is displayed in the URL or error message. In this case, we get the highest detectability level. And if it is in the source code, then it is much more difficult to find. Then the level of detectability will be very low.
- **Impact or Damage** stands for the amount of damage that will be done if the security vulnerability is exposed or attacked. The highest impact will cause a complete system crash and the lowest one does nothing at all.

There are many risks and weaknesses that may lead to vulnerabilities, the most frequent ones can be found in the [OWASP TOP-10 rating](https://owasp.org/Top10/), which is updated every three to four years. We left the link above for the 2021 ranking. **OWASP** stands for an **Open Web Application Security Project**, an online community that publishes articles on the topic of web application security, as well as documentation, various tools, and technologies. With the help of their TOP-10 list, users can be aware of the most critical risks and threats, their consequences, and countermeasures.

Despite all of the above, it is not always possible to foresee all the weak points of a site or a program. It often happens that companies hire people who specifically attack their products in order to find vulnerabilities. This is done using a special Bug Bounty program.

##### Bug Bounty

A **Bug Bounty** program is a deal offered by many websites, organizations, and software developers. Through it, people can be recognized and rewarded for finding bugs, especially those related to vulnerabilities. With these programs developers can detect and fix bugs before the general public knows about them, preventing hacking. In particular, Bug Bounty programs have been implemented by Facebook, Yahoo!, Google, Apple, Microsoft, etc.

![img](Stage2-Authentication.assets/c40d89b4-abc1-40eb-ba75-7ee62b80e9d3.svg.)



In general, they work like this: the company establishes the rules indicating what exactly one can try to break and get a reward for. These can be new features in the application, functional updates, integration with other services. As soon as changes take place, there is a chance of error. Then users begin to investigate these updates.

This approach gives the company the ability to constantly test its product and always know where a problem might arise. People find bugs, and then developers fix them.

##### Conclusion

To sum up,

- **web security** is a set of measures and protocols aimed at protecting data from viruses, spam, and other threats
- the main threats are **malware, dos attacks**, **phishing**, and **application vulnerabilities**
- the most frequent vulnerabilities can be found in the **OWASP TOP-10** rating
- companies can hire people to search for vulnerabilities using the **Bug Bounty** program.

## Authentication and Authorization

When working with data, it is important to think about protecting it to guard your privacy and avoid unauthorized access by intruders. The main tools that you can use for this are **authorization** and **authentication**. Let's take a closer look at what they are and how they work.

![img](Stage2-Authentication.assets/7e97ae03-044c-4148-abeb-91c8bd9de792.svg.)

##### What is authentication?

Authentication is the first step in any security process. It stands for the act of validating that users are who they claim to be. Thus, the system will "know" who is going to work with it now. The main types of authentication are as follows:

- First of all, it is a **password.** If a person enters the correct username and password, the system grants them access.
- Secondly, there are **one-time pins** that grant access for only one session. If your bank account has a regular password that you never change, then to protect, for example, your account data, the bank may offer you one-time pins. This level of protection is more reliable than the first, but there is a chance that someone may intercept your one-time pin.
- The third type is **an authentication app.** They work as follows: first, the system fills in a password and username and then generates a long one-time access code that changes every 30 seconds making it difficult to intercept.
- The last one is **biometrics.** A user presents a fingerprint or eye scan to gain access to the system. The advantage of biometric identification systems is that the characteristics used in these systems are an integral part of the personality so that it is impossible to lose, transfer, or forget them.

Authentication is always visible to the user so that they can pass it. Moreover, they can partially change it by replacing a password or their username, for example.

Often all the data during the authentication moves through an ID token, which is a formatted character string that contains information such as ID, username, account login time, ID Token expiration date.

Now you know what authentication is and what types of it exist. Let's move to the authorization then.

##### What is authorization?

**Authorization** often goes after authentication, when the system successfully "recognized" you. Authorization checks if you have the right to access the content or resources to which you have requested access. For example, the permission to download a particular file on a server or to provide individual users with administrative access to an application.

Often all the data here moves through special access tokens, not ID ones as during authentication.

Also, unlike authentication, authorization is not visible to the user and there is no option to change it. That is because only the data owner can provide the permissions. For example, one can not view and change a document until the document owner sends a certain invitation that permits editing it.

Having figured out what authentication and authorization are, let's talk about their fundamental differences.

##### Authentication vs. authorization

Let's use an analogy to outline their differences. Imagine someone asked their friend to pick up a parcel from the post office and take it to this person's house. The friend will need:

- a key (authentication). The lock on the door will grant them access to the house, it is like a password.
- permissions (authorization). Once inside, the friend has permission to access the living room and put the parcel on the table. But the friend may not have permission to go into the kitchen to take some food from the fridge.

Authentication and authorization work together in this example. The friend has the right to enter the house (authentication), and once there, there he gets access to certain areas of the house (authorization).

Let's put all the differences we have described into one table:

|                                   | **Authentication**                                    | **Authorization**                             |
| --------------------------------- | ----------------------------------------------------- | --------------------------------------------- |
| **What does it do?**              | Verifies credentials                                  | Grants or denies permission                   |
| **How does it work?**             | Through passwords, biometrics, one-time pins, or apps | Through settings maintained by security teams |
| **Is it visible to the user?**    | Yes                                                   | No                                            |
| **Is it changeable by the user?** | Partially                                             | No                                            |
| **How does data move?**           | Through ID tokens                                     | Through access tokens                         |

##### Conclusion

To sum up,

- Authentication is the act of validating that users are who they claim to be;
- The authentication types are password, one-time pins, authentication apps, and biometrics;
- Authorization is the process of giving the user permission to access a specific resource or function.

## Getting started with Spring Security

Access to some web pages, files, or other classified resources of a web application is often restricted to authorized users only. **Spring Security** is a module of the Spring framework that deals with authentication and authorization (or access control). It stands between the client and the application, intercepts all requests, and allows for configuring what functionalities and data are available to which users. It also helps to secure your app against common security vulnerabilities and attacks.

Some of the features of this framework:

- Easily configurable and extensible to meet the needs of a specific application.
- Protection against common attacks: session fixation, clickjacking, CSRF, and so on.
- Open source and regular updates.
- Supports integration with: HTTP basic access authentication, form-based authentication, LDAP, and many more.
- Provides a secure and flexible set of tools for managing user passwords.

In this topic, you'll learn how to start working with Spring Security and we'll create a secured single-page app.

##### Dependency

The first step in securing a Spring app is to add the Spring Boot Security starter dependency:

<details style="box-sizing: border-box;"><summary style="box-sizing: border-box; display: list-item; cursor: pointer;">Gradle</summary><pre style="box-sizing: border-box; font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; margin-top: 0px; margin-bottom: 1rem; overflow: auto; display: block; color: rgb(33, 37, 41);"><code class="language-xml" style="box-sizing: border-box; font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: inherit; color: var(--black100); overflow-wrap: normal; padding: 0.5rem 0.75rem; word-break: normal; background: rgb(250, 250, 250); border-color: var(--black07); border-style: solid; border-width: 1px; border-radius: 0.375rem; display: block; overflow: auto;"></code></pre></details>

<details style="box-sizing: border-box;"><summary style="box-sizing: border-box; display: list-item; cursor: pointer;">Maven</summary><pre style="box-sizing: border-box; font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; margin-top: 0px; margin-bottom: 1rem; overflow: auto; display: block; color: rgb(33, 37, 41);"><code class="language-xml" style="box-sizing: border-box; font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: inherit; color: var(--black100); overflow-wrap: normal; padding: 0.5rem 0.75rem; word-break: normal; background: rgb(250, 250, 250); border-color: var(--black07); border-style: solid; border-width: 1px; border-radius: 0.375rem; display: block; overflow: auto;"></code></pre></details>

This dependency includes autoconfiguration and by default enables security-related features like HTTP basic authentication, form-based authentication, protection against CSRF, and other things. It will be easier to get acquainted with Spring Security by looking at some examples first. So let's create a simple app, run it, and see what happens!

##### Preparation

Let's assume that we started a new Spring Boot project, added a web and security starter dependency, and created a simple `index.html` file located in the `/resources/static` folder.

Here's the content of the file:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Security Test</title>
</head>
<body>
    <h1>Access granted!</h1>
</body>
</html>
```

Now let's run the app and try to access the file.

##### Secured app

If we try to access the file by pointing our web browser to `http://localhost:8080/`, instead of seeing the expected "Access granted!" message, we'll be redirected to `http://localhost:8080/login` and shown the following form:

![img](Stage2-Authentication.assets/8c5ff461-2e65-4c87-ace8-5ecd7b1dc202.jpeg)

Wait a minute, we haven't implemented any login form, haven't created any users — and what are our login and password?

Our app is secured once we have added the dependency. This form is provided by autoconfiguration, and Spring Security also generated a default user. To access our app, we need to enter the correct login and password. The default login is "user", and we can find the password in the console log. The log entry will look something like this:

```xml
Using generated security password: acfa1db0-9ecf-4edf-b0a6-33d5199a8091
```

The default login is always "user" (case-insensitive) but every time we run an app a new password is generated. So your password will be different every time.

If we enter the generated login and password we'll be redirected from `http://localhost:8080/login` back to the URL that we were trying to access: `http://localhost:8080/` , and we'll see our page:

![img](Stage2-Authentication.assets/0f6a96ed-2a0a-494e-a6c8-91c3c73ab3d4.jpeg)

Autoconfiguration also adds a default logout page.

If we input `http://localhost:8080/logout` URL in a web browser we'll see the following page:

![img](Stage2-Authentication.assets/5700b550-f6eb-4922-94db-34eeff1dd2fb.jpeg)

Isn't it quite a lot for just one dependency without any code added? You'll learn more about this in the upcoming topics. For now, let's see how we can set our own login and password.

##### Configuration

We can change the login and password in the `application.properties` file.

Here's how you can specify the login:

```xml
spring.security.user.name=someone
```

And you can set the password like this:

```xml
spring.security.user.password=123
```

==If we change the password and reload the server, the default password won't be generated. Also, the console will not show the password anymore.==

##### Conclusion

In this topic, you got acquainted with Spring Security and we created a simple secured app. We've seen that starter dependency enables mandatory authentication for URLs, adds the login form and logout, and creates a default user. You also learned how to change your login and password using the `application.properties` file.

Spring Boot Security autoconfiguration is a great way to get started with security, but most applications will require to explicitly configure security to meet their unique security requirements. In the upcoming topics, you'll learn how to add multi-user support to an application, secure specific URLs, create a custom login and logout, and other interesting features of this framework.

Now, let's solve some tasks!

## Authentication

**Authentication** is how we verify the identity of whoever is trying to access our application. A common way to authenticate users is by requiring them to enter login and password. If a user enters the correct data, the system assumes the identity is valid and grants access.

As you probably know, when we add Spring Security starter dependency, Spring Security puts our app behind the authentication process and generates a default user. In most cases, one user is not enough and what we typically need is a lot of users. In this topic, you'll learn how authentication can be configured in Spring Security and we'll create a couple of hardcoded in-memory users. We will start step by step and then see the full example.

##### AuthenticationManagerBuilder

To configure what authentication should do in Spring Security, we can use a special builder — `AuthenticationManagerBuilder`. With the help of this builder and method chaining we can create hardcoded in-memory users, connect our database with user info, and set other configurations. There are two steps:

1. Obtain `AuthenticationManagerBuilder`
2. Set the configuration using this builder

One of the ways to get `AuthenticationManagerBuilder` is by extending `WebSecurityConfigurerAdapter` and overriding its method `configure`. Spring Security will pass the builder to this method as an argument. Let's see how we can start:

```java
@EnableWebSecurity
public class WebSecurityConfigurerImpl extends WebSecurityConfigurerAdapter {
    //..
}
```

Note that the class that extends the adapter is annotated with `@EnableWebSecurity` annotation. As long as this annotation is included, our configurations written in the class will be detected by Spring — otherwise they will be ignored. Now let's override the method `configure`:

```java
@Override
protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    //..
}
```

As you can see, the method receives `AuthenticationManagerBuilder`.



The adapter we mentioned allows overriding three methods with the same name — `configure`. The two remaining methods have another purpose and don't receive `AuthenticationManagerBuilder`. When overriding a method pay attention to what it receives.



To create hardcoded users we will use one of the methods of the builder — `inMemoryAuthentication()` , and then, using method chaining, we'll specify the login and password pair for one or more users. Here's an example with one user:

```java
@Override
protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    auth.inMemoryAuthentication()
            .withUser("user1")
            .password("pass1")
            .roles();
}
```

Note that apart from specifying the login and password we have one additional method call – `roles()`. This method is used to specify zero or more user roles. In our case, we aren't using any roles. You'll learn about user roles in the upcoming topics.



This approach is useful for testing and providing examples. Usually, user info will be stored in a database. We will show how to store users in a database in a separate topic.



If we want more users we can separate them with `and()` method call. Here's an example for 2 users:

```java
@Override
protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    auth.inMemoryAuthentication()
            .withUser("user1")
            .password("pass1")
            .roles()
            .and()
            .withUser("user2")
            .password("pass2")
            .roles()
            // more users
}
```

There is one more thing we need to do to have multiple hardcoded users. If we run a program with the implementation mentioned above and then try to access the resource of our app, we will see an error in the console after inputting one of the correct login/password pairs. The console log will contain the following entry:

```no-highlight
java.lang.IllegalArgumentException: There is no PasswordEncoder mapped for the id "null"
```

It indicates that the password encoder is not specified. Let's learn what it means and fix this error.

##### Password encoders

For security reasons passwords should not be stored in plain text and should be encoded. For example, if they are stored in plain text in a database and someone gets access to that database, be it a hacker or another employee, they will be able to copy unencoded passwords, log in as a user and perform account-related operations (send messages, transfer money, blackmail a real user, etc.). Storing passwords encoded makes it much harder for someone to impersonate a user.

In Spring Security password encoding is done with the implementation of the `PasswordEncoder` interface. This interface has two abstract methods:

- `String encode(CharSequence rawPassword)` – receives a raw password and returns an encoded password. Used before storing a password.
- `boolean matches(CharSequence rawPassword, String encodedPassword)` – receives a raw password and encoded password. Returns true if passwords match, otherwise false. Used in the authentication process by Spring Security to check if the inputted raw password matches the encoded password that is stored.

Spring Security forces a developer to use a password encoder, otherwise the program won't work properly. In our case, we don't use a database to store user credentials, passwords are visible, but we still need to use a password encoder.

Spring Security provides a few implementations of this interface that we can use. There is also a possibility to create a custom encoder by implementing this interface if the default implementations are not enough. Let's look at two of the encoders provided by Spring Security:

- `BCryptPasswordEncoder` – uses a bcrypt strong hashing function to encode a password, usually the best default solution available.
- `NoOpPasswordEncoder` – doesn't do any encoding of the password and returns it the way it was. As for matching, only compares the strings using `equals(Object o)`. Should only be used for testing and examples.

To make our program work, we need to encode a password before storing it and tell Spring Security what encoder we used so it can use the encoder in the authentication process. First, we need a password encoder, so let's provide a bean with `BCryptPasswordEncoder`:

```java
@Bean
public PasswordEncoder getEncoder() {
    return new BCryptPasswordEncoder();
}
```

Now we can encode a password and specify which encoder should be used in the authentication process. Here's an example:

```java
@Override
protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    auth.inMemoryAuthentication()
            .withUser("user1")
            .password(getEncoder().encode("pass1")) // encoding a password
            .roles()
             // more users
            .and()
            .passwordEncoder(getEncoder()); // specifying what encoder we used
}
```

In the case of using `NoOpPasswordEncoder` the process is the same but this class doesn't have a public constructor and to get an instance of it we need to call the static method `getInstance()`. Here's an example:

```java
NoOpPasswordEncoder.getInstance();
```

Also, as already mentioned, `NoOpPasswordEncoder` returns the same password so there is no need to encode the password, so this part can be skipped.



Now let's see the full code example and discuss what happens during authentication.

##### Putting pieces together

The full implementation looks like this:

```java
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

// Extending the adapter and adding the annotation
@EnableWebSecurity
public class WebSecurityConfigurerImpl extends WebSecurityConfigurerAdapter {

    // Acquiring the builder
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

        // storing users in memory
        auth.inMemoryAuthentication()
                .withUser("user1")
                .password(getEncoder().encode("pass1")) // encoding a password
                .roles()
                .and() // separating sections
                .withUser("user2")
                .password(getEncoder().encode("pass2"))
                .roles()
                .and()
                .passwordEncoder(getEncoder()); // specifying what encoder we used
    }

    // creating a PasswordEncoder that is needed in two places
    @Bean
    public PasswordEncoder getEncoder() {
        return new BCryptPasswordEncoder();
    }
}
```



Note that since we override the default configuration, the default user won't be created.



If we create and run a program with this implementation included, we'll be able to access it using one of the valid login/password pairs, and form-based or HTTP basic auth, that, as you already know, are enabled by default.

When a user tries to pass authentication, Spring Security will search for a user with a specified login. If the user is found, the password encoder and its method `matches` will be used to check if the inputted raw password matches the stored encoded one. If everything is correct, the user is allowed to access the app and authentication is completed. It doesn't matter where user credentials are loaded from, the process is similar. In the example above, we stored the users in memory. Usually, there is a database with user info and an endpoint responsible for user registration. This endpoint that will populate the database with user info.

The default config related to form-based and HTTP basic auth can be configured too.

##### HttpSecurity

To specify which authentication methods are allowed (form-based, HTTP basic) and how they are configured, we can override another `configure` method of `WebSecurityConfigurerAdapter` that receives the `HttpSecurity` object.

The example below shows the configuration equal to the default one.

```java
@Override
protected void configure(HttpSecurity http) throws Exception {
    http.authorizeRequests().anyRequest().authenticated() // (1)
        .and()
        .formLogin() // (2)
        .and()
        .httpBasic(); // (3)
}
```

1. To access any URI (`anyRequest()`) on our app, a user needs to authenticate (`authenticated()`).
2. Enables form-based auth with default settings.
3. Enables HTTP Basic auth.

This configuration is why your application is on lockdown, as soon as you add the Spring Security starter dependency.

Removing `.formLogin()` in the code above will disable this type of authentication. Also, by placing some additional method calls after `.formLogin()` we can change the look of the login page and some other things. With HTTP basic auth the situation is similar – if we omit `.httpBasic()` we will disable this type of auth.



When we override the `configure` method we override the default config. If for example, after overriding we don't enable HTTP basic auth explicitly, it will not be enabled. This also applies to the form-based auth.



Also, authentication is not only about logins and passwords. We may want to implement fingerprint authentication or authentication via SMS where the user has to enter a code that has been sent to their phone in an SMS as proof of their identity. Spring Security allows configuring this functionality too, but we will not consider it in this topic.

##### Conclusion

In this topic, you've learned how to override default configuration related to authentication and create one or more hardcoded in-memory users. You've also seen how to enable form-based and HTTP basic authentication explicitly or disable them. The way we chose to add hardcoded users is not the only possible one. Spring Security is more flexible, and there are often other ways to add the same functionality.

## Authorization

[Theory](https://hyperskill.org/learn/step/15269)Practice

100% completed, 0 problems solved

##### Theory

 36 minutes reading

Unskip this topicStart practicing

In simple applications, authentication might be enough – as soon as a user authenticates (confirms their identity), they can access any part of the application. However, in some situations, not all authenticated users should be granted access to some app resources. **Authorization** is the process during which the system decides if an authenticated client has permission to access the requested resource. Authorization always happens after authentication.

In this topic, you'll learn how to configure authorization in Spring Security. We will create a program with a couple of endpoints, configure access to them and then test the program using Postman.

##### Roles and authorities

To allow one authenticated user to access a resource and restrict access to another user we need a mechanism for distinguishing users. Spring Security provides **authorities** and **roles** to help you with this task.

![img](Stage2-Authentication.assets/2a6ab898-74a6-475e-a270-1fabf2655a32.svg)

- **Authorities** are actions that users can perform in an application. Only users with specific authorities can make a particular request to an endpoint. For example, Jessica can only `READ` and `WRITE` to the endpoint, while Joseph can `READ`, `WRITE`, `DELETE`, and `UPDATE` the endpoint. Under the hood, an authority is just a `String`. We can choose any name for an authority when developing an app.
- **Roles** are groups of authorities. Imagine you're going to have two types of users in your application. One type should only be able to read and write data, while another one should be able to read, write, update and delete. Instead of using four authorities, we can simply define two roles. For example, `ROLE_USER` and `ROLE_ADMIN`. Under the hood, a role is a `String` prefixed with `ROLE_`.

In Spring Security, the concepts of authority and role are often used interchangeably. In most cases, the difference is just in the naming convention used. It will become more clear once you've seen some examples.

In the program that we are going to write, we will configure access to endpoints based on user roles. Our program will have the following functionality:

- `/`, `/public` – available without authentication (no login/password is required).
- `/authenticated` – available only to authenticated users.
- `/user` – available only to authenticated users with a `ROLE_USER` or `ROLE_ADMIN` role.
- `/admin` – available only to authenticated users with a `ROLE_ADMIN` role.

We will start implementing the program by adding a controller and creating users with roles. After that, we will deal with authorization.

##### Initial setup

Let's assume that we've already created an empty new project and included web and security dependency. Here is our controller:

```java
import org.springframework.web.bind.annotation.*;

@RestController
public class Controller {

    @GetMapping("/public")
    public String testPublic() {
        return "/public is accessed";
    }

    @GetMapping("/authenticated")
    public String testAuth() {
        return "/authenticated is accessed";
    }

    @GetMapping("/user")
    public String testUser() {
        return "/user is accessed";
    }

    @GetMapping("/admin")
    public String testAdmin() {
        return "/admin is accessed";
    }
}
```

Now, let's create users and assign roles. We'll need 3 users: a user without a role, a user with a `ROLE_USER`, and a user with a `ROLE_ADMIN`. For simplicity's sake, we will create hardcoded users in memory, but overall it doesn't matter whether the users are stored in memory, in a database, or somewhere else. The process of configuring authorization is similar.

To assign a role to a user, we'll use the `roles(String... roles)` method that receives zero or more roles. There is a similar method for authorities `authorities(String... authorities)`, but we are not going to use authorities in this topic.

Here is what our implementation looks like:

```java
// imports ..

@EnableWebSecurity
public class WebSecurityConfigurerImpl extends WebSecurityConfigurerAdapter {

   @Override
   protected void configure(AuthenticationManagerBuilder auth) throws Exception {
       auth.inMemoryAuthentication()
          .withUser("user1").password(getEncoder().encode("pass1")).roles()
          .and()
          .withUser("user2").password(getEncoder().encode("pass2")).roles("USER")
          .and()
          .withUser("user3").password(getEncoder().encode("pass3")).roles("ADMIN")
          .and()
          .passwordEncoder(getEncoder());
   }

   @Bean
   public PasswordEncoder getEncoder() {
       return new BCryptPasswordEncoder();
   }
}
```



Note that we don't have to add the `ROLE_` prefix to roles. Spring Security will add it automatically. We can also use the `authorities()` method to specify a role, but in this case, it must be prefixed with `ROLE_`. Other than that, `roles("ADMIN")` is equivalent to `authorities("ROLE_ADMIN")`. This knowledge can help you avoid some mistakes and confusion.



Our program will also have a simple `index.html` file located in the `/resources/static` folder. Here's the content of the file:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Public</title>
</head>
<body>
    <h1>Welcome stranger!</h1>
</body>
</html>
```

Now, let's deal with authorization. We will start by learning about some useful methods.

##### HttpSecurity

We can configure authorization using the `HttpSecurity` object which can be obtained by overriding one of the `configure` methods of `WebSecurityConfigurerAdapter`. This is the same object that allows us to configure form-based and HTTP basic auth.

In this topic, we are interested in some of the methods that we can call using this object. The methods in question can be divided into two groups. One group allows specifying endpoints to which we want to configure access and another group allows specifying the users who can access these endpoints.

Using the following methods we can select endpoints:

- `mvcMatchers(HttpMethod method, String... patterns)` – lets us specify both the HTTP method to which the restrictions apply and the paths. This method is useful if we want to apply different restrictions to different HTTP methods with the same path. Here's an example of how we can select a `GET /public` endpoint: `mvcMatchers(HttpMethod.GET, "/public")`.
- `mvcMatchers(String... patterns)` – similar to the previous method but only allows specifying paths. The restrictions automatically apply to any HTTP method.
- `regexMatchers(HttpMethod method, String... regex)`, `regexMatchers(String... regex)` – similar to MVC matchers but allows using regular expressions.
- `anyRequest()` – maps any request, regardless of the URL or HTTP method used.



Spring Security also provides Ant matchers that are similar to MVC matchers mentioned above. The difference is that Ant matchers match only exact URLs. For example, `antMatchers("/secured")` will match only `/secured`, while `mvcMatchers("/secured")` will match `/secured`, as well as `/secured/` and `/secured.html`. It is recommended to use MVC matchers to avoid situations where some paths are mistakenly left unprotected.



The following methods allow us to specify who can access endpoints:

- `permitAll()` – specifies that anyone can access a URL (authenticated and not authenticated users).
- `denyAll()` – specifies that no one can access a URL.
- `authenticated()` – specifies that any authenticated user can access a URL.
- `hasRole(String role)` – shortcut for specifying URLs requiring a particular role. Should not start with `ROLE_` as it is automatically inserted.
- `hasAnyRole(String... roles)` – same as the previous method but allows specifying multiple roles.
- `hasAuthority(String authority)` – specifies that access to a URL requires a particular authority. We can also use this method to specify a role but it should be prefixed with `ROLE_`. That is, `hasAuthority("ROLE_ADMIN")` is similar to `hasRole("ADMIN")`.
- `hasAnyAuthority(String... authorities)` – same as the previous method but allows specifying multiple authorities (or roles).

MVC matchers and Ant matchers support **wildcards**:

- `?` – matches one character. For example, `mvcMatchers("/?")` will match `/a` and `/b` but not `/` or `/ab`.
- `*` – matches zero or more characters. For example, `mvcMatchers("/*")` will match `/`, `/a` and `/ab` but not `/a/b`.
- `**` – matches zero or more directories in a path. For example, `mvcMatchers("/**")` will match `/`, `/a`, `/ab` and `/a/b/c`.

Wildcards can be placed at any point of a path. Here are some examples: `/page/?`, `/page/*/comments`, `/api/**`.

Now let's put the pieces together and finish our program.

##### Configuring authorization

First, we override the `configure` method that receives the `HttpSecurity` object and call the `authorizeRequests()` method:

```java
@Override
protected void configure(HttpSecurity http) throws Exception {
    http.authorizeRequests()
    // more methods
}
```

To configure access to our endpoints, we stick to the following rule: first, append a call to a method that allows for selecting endpoints, after that, append a call to a method that allows for specifying who can access endpoints. Here is how we can make `/admin` available only to users with the `ROLE_ADMIN` role:

```java
.mvcMatchers("/admin").hasRole("ADMIN") // or .hasAuthority("ROLE_ADMIN")
```

If we need more rules, we can append more method pairs at the end of the method chain. Here is the full example:

```java
@Override
protected void configure(HttpSecurity http) throws Exception {
    http.authorizeRequests()
            .mvcMatchers("/admin").hasRole("ADMIN")
            .mvcMatchers("/user").hasAnyRole("ADMIN", "USER")
            .mvcMatchers("/", "/public").permitAll()
            .mvcMatchers("/**").authenticated() // or .anyRequest().authenticated()
            .and().httpBasic();
}
```

For learning purposes, we didn't specify `/authenticated` explicitly and instead used `/**` which selects all URLs including `/authenticated`.

Note that we placed `.mvcMatchers("/**").authenticated()` at the end. That's because the order of methods is important. Methods are considered in the order they were declared. If we place `.mvcMatchers("/**").authenticated()` right after `.authorizeRequests()`, the whole application will be available only to authenticated users, and the remaining rules will be ignored. Now imagine that we have a real program and instead of `.authenticated()` we specified `.permitAll()` and placed it at the top. The whole application will be available to everyone. Pay attention when configuring authorization. The order of rules must be from specific to general.

Keep in mind that we use MVC matchers here. `.mvcMatchers("/admin")` additionally matches `"/admin/"` that will also be available only to users with the `ROLE_ADMIN` role. But what will happen if we replace an MVC matcher with an Ant matcher that matches only exact URLs? `/admin` will require the `ROLE_ADMIN` role as intended, but `/admin/` will only require authentication (`/**` represents all the remaining paths in our case). This makes a huge difference!



A developer who is unaware of this could use Ant matchers and leave a path unprotected without noticing it, which can create a major security breach in an application. It doesn't mean we should never use Ant matches, though. We can still secure two paths using Ant matchers like this: `antMatchers("/admin", "/admin/")`.





Another way to configure authorization is by using special annotations. We will not consider this in this topic, but if you want to learn more about them, here is an [article](https://www.baeldung.com/spring-security-method-security).



As you can see, we also enabled HTTP basic authentication. Now we are going to use this type of auth and Postman to test our program.

##### Running the app

Let's run the program and then try to access `/` , which is supposed to be public:

![img](Stage2-Authentication.assets/b9209c2e-3797-4ff2-9600-3e4d019e7e17.jpeg)

As expected the status code is `200 OK` and we see the content of `index.html`. You can try to access `/public`, it will also work.

Now if we try to access the remaining URLs in the same way we shouldn't be able to do that because the remaining URLs require at least authentication. Here's an attempt to access `/authenticated` (or `/user` `/admin`):

![img](Stage2-Authentication.assets/b391adf0-bd6b-452e-a05a-cf6c8e040847.jpeg)

As we can see, the request couldn't be satisfied and we received `401 Unauthorized` status code that indicates that the request requires user authentication. To fix the error, we need to use HTTP basic auth and input one of the valid login/password pairs. This can be done in the "Authorization" section of Postman. Let's use the login and password of the first user that doesn't have a role and try again.

![img](Stage2-Authentication.assets/e76fcc0f-5816-4d6e-a80c-c5fc41a112c9.jpeg)

Note that apart from login and password we also specified the authentication type, making it "Basic Auth". As you can see, we were able to access our program and the status code is `200 OK`. If we try to access `/authenticated` using the two remaining users the result will be the same.

Now what will happen if we try to access `/user` or `/admin` as a user that doesn't have the required role? Let's try to access `/admin` as a user with the `ROLE_USER` role:

![img](Stage2-Authentication.assets/60cbef90-ad78-43d1-be9f-380de9222aa1.jpeg)

Even though we provided one of the valid login/password pairs and passed authentication, we received `403 Forbidden` status, which means that the server understood the request but refuses to authorize it. The same will happen if we try to access as the first user. Only users with `ROLE_ADMIN` are authorized to access `/admin` (or `/admin/`). So our application works as intended.



As you probably know, CSRF (Cross-Site Request Forgery) is enabled by default. If we try to send `POST` requests using Postman or similar programs, we will receive `403 Forbidden` status code because of this protection. In our program, we only have `GET` endpoints so we didn't have any issues. When testing `POST` requests, you can disable this type of protection by calling the `.csrf().disable()` methods on the `HttpSecurity` object. Depending on your implementation you may also need to append a call to `.and()` before the methods.

Feel free to experiment with this. You may also want to enable form-based auth and try to access endpoints using a browser. The program behavior will be similar.

##### Conclusion

In this topic, you've seen how authentication and authorization work together to make programs more secure. You've seen how we can make endpoints public or available only to authenticated users, or users with a specific role/authority.

Even though the program that we created is just an example, it is quite representative of real programs. For example, registration and home page of the platform are public and anyone can access them. Also, to access the main contents of the platform a user needs to pass authentication (after registration). There are also functionalities available only to the admins of the platform and hidden from regular users. For example, an admin can edit and delete comments.

Be careful when developing/maintaining programs that contain sensitive data. It’s easy to make a mistake and leave some parts of your program unprotected. Programs that contain sensitive data should be properly tested.

## Custom User Store

So far we have only dealt with hardcoded users that were stored in memory. The latest applications often support the registration process and store user credentials with their associated roles/authorities permanently in a database.

In this topic, you'll learn how to connect a custom user store that will be used by Spring Security in the authentication process. When a user tries to access an app with a username and a password, Spring Security will check if the user is present in the store and their credentials are correct. Based on the result, it will decide if the access should be granted or not. We won't use a database to store users; instead, they will be stored in a thread-safe `Map`. Understanding how this works will allow you to connect any user store (a file, a database, an external server). Our program will also have a simple registration endpoint – `POST /register` receives username, password, and role, and saves them in the user store.

We will start by revising the pieces that should be already familiar to you and then deal with new features.

##### Initial setup

Let's assume that we already created a Spring Boot project with web and security dependencies included.

The first thing we'll implement is a controller that will allow us to check that our program works as intended. The controller has one endpoint `GET /test` available only to authenticated users with the `ROLE_USER` role. Here is the controller:

```java
@RestController
public class TestController {

    @GetMapping("/test")
    public String test() {
        return "/test is accessed";
    }
}
```

Now we will deal with the security config. The code below shows our implementation of `WebSecurityConfigurerAdapter` where we specify that `/test` requires the `ROLE_USER` role, make `/register` available to everyone, provide a bean with a password encoder, and specify some additional configurations.

```java
@EnableWebSecurity
public class WebSecurityConfigurerImpl extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .mvcMatchers("/test").hasAnyRole("USER")
                .anyRequest().permitAll() // make remaining endpoints public (including POST /register)
                .and()
                .csrf().disable() // disabling CSRF will allow sending POST request using Postman
                .httpBasic(); // enables basic auth.
    }

    @Bean
    public PasswordEncoder getEncoder() {
        return new BCryptPasswordEncoder();
    }
}
```

The code above is part of our security config. As for authentication, we will configure it a bit later.

As we mentioned before, we'll store user data in a thread-safe `Map`. The keys for the `Map` will be usernames, and the values will be objects of the `User` class that has 3 fields: username, password, role. Here is the `User` class:

```java
class User {
    private String username;
    private String password;
    private String role; // should be prefixed with ROLE_

    // constructors, getters and setters
}
```

The `Map` with users will be located in a separate class named `UserRepository`:

```java
@Component
public class UserRepository {
    final private Map<String, User> users = new ConcurrentHashMap<>();

    public User findUserByUsername(String username) {
        return users.get(username);
    }

    public void save(User user) {
        users.put(user.getUsername(), user);
    }
}
```

As you can see, our user repository also has two convenience methods. The first method returns a user by username or `null` if the user wasn't found. The second method receives a `User` object and adds it to the `Map`. You'll see why we added these methods soon.

Now we will deal with the registration. Here is our registration controller with the `POST /register` endpoint that receives username, password, and role:

```java
@RestController
public class RegistrationController {
    @Autowired
    UserRepository userRepo;
    @Autowired
    PasswordEncoder encoder;

    @PostMapping("/register")
    public void register(@RequestBody User user) {
        // input validation omitted for brevity

        user.setPassword(encoder.encode(user.getPassword()));

        userRepo.save(user);
    }
}
```

As shown above, we inject `UserRepository` and `PasswordEncoder` in the controller. The `register` method receives an instance of `User` class that stores the inputted username/password/role. Then we encode a password and use the `save` method of the `UserRepository` to save an instance of `User` in the `Map`.

That took quite a few lines of code, so before continuing to implement our program, let's talk a little about the current state of the program. We implemented the `/test` endpoint and made it available only to authenticated users with the `ROLE_USER` role. We also have the registration endpoint that receives username/password/role and stores them in the user store. If we run the program at this step, register one user, and try to access the `/test` endpoint with the username and password we used to register, we will fail to do that and get the `401 Unauthorized` status code. That's because we haven't configured the authentication: Spring Security doesn't know about our user store and can't confirm that the inputted credentials are valid. To make this work, we need to connect our user store to Spring Security.

Our first step will be writing a class that will be used to store and transfer user information from the user store to Spring Security. The class should implement the `UserDetails` interface because Spring Security can only recognize users of this type.

##### UserDetails

The `UserDetails` interface has 7 quite self-explanatory methods that we need to implement. Here are the first three:

- `String getUsername()` returns the username used to authenticate the user.
- `String getPassword()` returns the password used to authenticate the user.
- `Collection<GrantedAuthority> getAuthorities()` returns the authorities and roles granted to the user.

Note that roles and authorities are stored together in one container and have the same type named `GrantedAuthority` (interface). To convert a `String` role/authority to `GrantedAuthority` we can use the `SimpleGrantedAuthority` class that implements the interface and has a constructor that receives a role/authority of the `String` type, for example, `new SimpleGrantedAuthority("ROLE_USER")`.

Also, now it should be more clear why we prefix a role with `ROLE_`. For the framework the difference between a role and an authority is minimal and they are stored together. To tell them from one another we prefix a role with `ROLE_`. If there is no prefix, we're dealing with an authority.

All remaining methods of the `UserDetails` interface enable or disable the account for different reasons:

- `boolean isEnabled()` indicates whether the user is enabled or disabled.
- `boolean isAccountNonExpired()` indicates whether the user's account has expired.
- `boolean isAccountNonLocked()` indicates whether the user is locked or unlocked.
- `boolean isCredentialsNonExpired()` indicates whether the user's credentials (password) have expired.

Not all applications have accounts that expire or get locked under certain conditions. If you don't need to implement these functionalities in your application, you can simply make these four methods return `true`, which means that the users are active. In this topic, we will not implement this functionality.

Now let's provide our implementation of the `UserDetails` interface. As we've mentioned before, the class that implements the interface will be used to store and transfer core user information from the user store to Spring Security. In the `UserRepository` the info about one user is stored in a `User` object with 3 fields. Now we need to provide a converter from `User` to `UserDetails`. We will do it in a constructor that will receive a `User` object and store its content. Here is the implementation:

```java
public class UserDetailsImpl implements UserDetails {
    private final String username;
    private final String password;
    private final List<GrantedAuthority> rolesAndAuthorities;
    
    public UserDetailsImpl(User user) {
        username = user.getUsername();
        password = user.getPassword();
        rolesAndAuthorities = List.of(new SimpleGrantedAuthority(user.getRole()));
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return rolesAndAuthorities;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return username;
    }

    // 4 remaining methods that just return true
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
```

As you can see, the first three methods return user info that was retrieved from a `User` object. All remaining methods just return `true`, which means that the users are active. Also, note that we converted a `String` role to `SimpleGrantedAuthority` that implements the `GrantedAuthority` interface. For simplicity, we have only one role but big applications can have a lot of roles/authorities, and all of them should be converted to `GrantedAuthority`.

In simple applications, instead of providing a separate class that implements the `UserDetails` interface, as we did above, we can use the implementation of the interface that Spring Security provides, namely the `User` class. The class implements the builder pattern and can make your code more concise. It is located in the `org.springframework.security.core.userdetails` package. If you want to learn about the `User` class, here is the [link](https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/core/userdetails/User.html).

Our next step is to implement `UserDetailsService` that is used to retrieve user data from storage.

##### UserDetailsService

This interface has only one method that we need to override:

- `UserDetails loadUserByUsername(String username) throws UsernameNotFoundException` receives a username and returns a `UserDetails` object.

This method will be used by Spring Security when someone tries to authenticate. In the method, we need to retrieve user data by username from the storage and convert that data to `UserDetails`. If the user with a specified username is not found, we throw `UsernameNotFoundException`. Here is our implementation of `UserDetailsService`:

```java
@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    UserRepository userRepo;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepo.findUserByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException("Not found: " + username);
        }

        return new UserDetailsImpl(user);
    }
}
```

As you can see, we injected `UserRepository` to use it in the `loadUserByUsername` method to retrieve user info. Also, note that the class is annotated with the `@Service` annotation.

Why do we retrieve user data just by username without checking the password or authorities/roles? The answer is they will be checked automatically by Spring Security. Our only task is to return the `UserDetails` object that stores user info. It doesn't matter how we convert user data to `UserDetails`, and where our users are stored.

There is one more step left before we can run and test our program.

##### AuthenticationManagerBuilder

We've used the `inMemoryAuthentication()` method of `AuthenticationManagerBuilder` to configure an in-memory user store (in other words, an authentication provider). Apart from an in-memory user store, the builder also allows for configuring a JDBC-based user store, an LDAP-backed user store, allows for connecting custom user details service, and has some additional methods. In this topic we are interested in the `userDetailsService()` method of `AuthenticationManagerBuilder`, which is used to connect custom `UserDetailsService`. We need to pass the instance of our `UserDetailsService` to this method.

We can also have multiple user stores (authentication providers) at once. For example, we can configure an in-memory user store with a couple of users and connect 2 different databases with user data.

The code below is the missing piece in our `WebSecurityConfigurerImpl` class that we implemented earlier. Here we override one more `configure` method that receives `AuthenticationManagerBuilder` and connect our `UserDetailsService`. Additionally, we configure an in-memory user store.

```java
@EnableWebSecurity
public class WebSecurityConfigurerImpl extends WebSecurityConfigurerAdapter {
    @Autowired
    UserDetailsService userDetailsService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .userDetailsService(userDetailsService) // user store 1
                .passwordEncoder(getEncoder());

        auth
                .inMemoryAuthentication() // user store 2
                .withUser("Admin").password("hardcoded").roles("USER")
                .and().passwordEncoder(NoOpPasswordEncoder.getInstance());
    }

    // the second configure method that receives HttpSecurity

    // password encoder
}
```

Here we injected `UserDetailsService` and passed it to the `userDetailsService` method. Also, note that our app uses two different password encoders. The first user store uses `BCryptPasswordEnoder` and the second one uses `NoOpPasswordEncoder` that does nothing and returns the password as it was.

What happens in the authentication process when a user provides a username and a password? The simple answer is the username is passed to the `loadUserByUsername` method. The method checks if a user with the provided username is present in the store (when multiple user stores are defined, they will be queried in the order they're declared). If the user is not found, `UsernameNotFoundException` is thrown and access is denied: we see the `401 Unauthorized` status code. If the user is found in the user store, user data is retrieved, converted to `UserDetails`, and returned. After that, `PasswordEncoder` and its method `matches` will be used automatically to check if the inputted raw password matches the stored encoded one, and then the roles are compared. If everything is correct, access is granted.

How can we connect a database instead of a `List`? There are a lot of ways to do it. In our case, we can remove the `List` with user data and connect the `findUserByUsername` and `save` methods of `UserRepository` with a database. To learn how to work with databases, see our topics on Spring Data.

If you are using the H2 database in your app and want to use the H2 console (or something similar), you need to unblock it by disabling CSRF protection and X-Frame-Options (prevents clickjacking attacks). It can be done by calling the following methods on the `HttpSecurity` object: `.csrf().disable().headers().frameOptions().disable()`. Depending on your implementation, you may also need to append a call to `.and()` before the methods. Also, make sure the H2 console URLs aren't blocked by Spring Security.

Now let's run our program and test it using Postman.

##### Running the app

Our first step is to populate the user store with data using a public `POST /register` endpoint. Let's create two users. The username and password of the first user are `user1` and `pass1`. The username and password of the second user are `user2` and `pass2`. Both users have the same role, `ROLE_USER`. Here is an example with the first user:

![img](Stage2-Authentication.assets/8d7bef30-a0f4-4b90-98f5-32621021fc85.jpeg)

Now let's try to access the `/test` endpoint protected with basic auth using the username/password of one of the registered users. Here is an example with the second user:

![img](Stage2-Authentication.assets/d76eda45-6e8c-4cab-881f-a32ef9e14a3c.jpeg)

As we can see, we were able to access the endpoint and the status code is `200 OK`. So it looks like our registration endpoint works as intended and `UserDetails` and `UserDetailsService` are implemented properly.

Additionally, let's try to access the `/test` endpoint using a hardcoded user:

![img](Stage2-Authentication.assets/1182a546-9862-40ad-99ca-7aa9bfc3753b.jpeg)

As shown here, this also works as intended.

##### Conclusion

In this topic, you've seen how we can attach a custom user store to Spring Security by implementing the `UserDetails` and `UserDetailsService` interfaces. `UserDetails` represents a user and stores core user information. `UserDetailsService` is used to retrieve user-related data from a user store and has only one method that receives a username and returns `UserDetails` or throws an exception if the user isn't found. Additionally, we've implemented a simple registration endpoint that populates the user store with data, created one hard-coded user, and successfully tested the program.

If you're familiar with Spring Data, you should know how to connect a database instead of a `List`. If you're not familiar with this Spring module yet, you can use a file to store user data permanently. Feel free to experiment with this.

## HTTP Basic Auth

Websites often require login and password to sign in. We've all had to enter this data, whether it is mail, some social network or a forum. After successfully entering login and password, a number of additional features become available, for example, full access to content, ability to correspond and leave comments.

The process of issuing rights to perform certain actions is called user **authorization**.

##### Benefits of authorization

Yes, authorization allows you to identify a visitor of your web page; however, at the same time it limits access rights for unauthorized users. Hence you might have some doubts: why put restrictions at all, isn't it easier to open full functionality of the site to all visitors? After all, it's a fact that people don't like unnecessary time-consuming procedures, even if registration and authorization take only a couple of minutes.

Well, authorization actually has many benefits. It lets you flexibly manage your personal data, allows commercial websites to offer additional services for a fee and better protects your confidential information. Increased security is perhaps the greatest advantage of authorization.

##### Basic authorization in HTTP

HTTP has a built-in mechanism for authorization. The easiest HTTP authorization scheme is **"Basic"**. It relies on login and password. Let's see how it works.

1. When a user enters a URL in the browser's address bar, they send a request to access the desired resource.
2. If the resource is protected, the server requires authorization from the user. It responds to the client with the HTTP status code **401 (Unauthorized)** and the header `WWW-Authenticate`. When the browser receives this code, it shows a pop-up window where the user must enter their login and password.
3. The user enters them, and the browser repeats the request to the same resource. Transmitting authorization data to the server is performed using the `Authorization` header, in which the encoded login and password are written.
4. After the web server receives the request with the specified header, it checks that login and password are correct. If both are entered correctly, the web server grants access to the resource. The response code is **200 (OK)**. If the data is incorrect, the response code is **403 (Forbidden)**, and the user will be informed about an error in the entry and that access to the desired information is denied.

The following picture shows the sequence of the authorization algorithm:

![img](Stage2-Authentication.assets/53e2bc28-96c6-4eea-ab74-cf93198a98e2.svg.)

##### Creating an HTTP header

Usually, adding a header with login and password to the request is done by the browser, but if you need to create your own library to work with HTTP for software compatibility with web services, you need to understand how this works under the hood.

==The header syntax for basic authorization looks as follows:
Authorization: <type> <credentials>
`type>` denotes the type of authorization. In this case, we are looking at the `Basic` type==

==If the `Basic` authentication scheme is used, the `<credentials>` are constructed like this:==

- ==the username and the password are combined with a colon (`student:ilovetostudy`);==
- ==the resulting string is [base64](https://developer.mozilla.org/en-US/docs/Web/API/WindowBase64/Base64_encoding_and_decoding) encoded (`c3R1ZGVudDppbG92ZXRvc3R1ZHk=`).==

==Here is a valid example of an authorization header:==

==Authorization: Basic c3R1ZGVudDppbG92ZXRvc3R1ZHk=.==

The **base64** encoding is not a secure representation of credentials since it does not mean encryption or hashing. An encoded string can be easily decoded into the original form.

There are [sites](https://www.blitter.se/utils/basic-authentication-header-generator/) that can help you generate the `Authorization` header for your credentials.

##### Security and basic auth

In the **Basic auth** scheme, a client must send login and password every time they try to access a protected resource. Sending a non-encrypted password can be too dangerous (base64 is not an encryption), so it is better to use secure HTTP (HTTPS) with it.

There are more convenient and secure authorization methods which help to avoid the frequent sending of login and password. Understanding the principles of HTTP authorization will help you quickly understand the essence of working with more complex schemes of authorization.

##### Conclusion

Basic Auth scheme is a fundamental and fairly simple need for most current web services. And it is just the tip of the iceberg. There are other advanced and secure ways for user authorization. But, in order to understand them, you should first understand Basic HTTP authorization principles.