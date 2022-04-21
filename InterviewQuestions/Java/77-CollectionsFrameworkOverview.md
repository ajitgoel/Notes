## The Collections Framework overview

Java provides the **collections framework** which consists of classes and interfaces for commonly reusable data structures such as lists, dynamic arrays, sets, and so on. The framework has a unified architecture for representing and manipulating collections, enabling collections to be used independently of implementation details via its interfaces.

The framework includes:

- interfaces that represent different types of collections;
- primary implementations of the interfaces;
- legacy implementations from earlier releases (known as "old collections");
- special-purpose implementations (like immutable collections);
- algorithms represented by static methods that perform useful operations on collections.

In this topic, we will only consider the basic interfaces from the collections framework placed in the `java.util` package.

##### Commonly used interfaces

There are two root generic interfaces `Collection<E>` and `Map<K,V>`, and some more specific interfaces to represent different types of collections.

**![img](77-CollectionsFrameworkOverview.assets/7592c5a5-1adb-4f91-8a83-15e0c6dfbe4b.svg)**

The interface `Collection<E>` represents an abstract collection, which is a container for objects of the same type. It provides some common methods for all other types of collections.

The interfaces `List<E>`, `Set<E>`, `Queue<E>`, `SortedSet<E>`, and `Deque<E>` represent different types of collections. You cannot directly create an object of them since they are just interfaces. But each of them has several implementations. As an example, the `ArrayList` class, that represents a resizable array, is a primary representation of the `List<E>` interface. Other interfaces, as well as their implementations, will be considered in the following topics.

Another root interface is `Map<K,V>` that represents a map (or dictionary) for storing *key-value pairs* where `K` is the type of keys and `V` is the type of stored values. In the real world, a good example of a map is a phone book where keys are names of your friends and values are their phones. The `Map<K,V>` interface **is not** a subtype of the `Collection` interface, but maps are often considered as collections since they are part of the collection framework and have similar methods.

Note, the `Collection` and `Map` interfaces do not extend each other.

##### The Collection interface

Here are common methods provided by the `Collection` interface.

- `int size()` returns the number of elements in this collection;
- `boolean isEmpty()` returns `true` if this collection contains no elements;
- `boolean contains(Object o)` returns `true` if this collection contains the specified element;
- `boolean add(E e)` adds an element to the collection. Returns `true`, if the element was added, else returns `false`;
- `boolean remove(Object o)` removes a single instance of the specified element;
- `boolean removeAll(Collection<?> collection)` removes elements from this collection that are also contained in the specified collection;
- `void clear()` removes all elements from this collection.

It is possible to refer to any particular collection via this base interface since, as you know, the superclass can be used to refer to any subclass object derived from that superclass.

Let's create `languages` collection and add three elements to it:

```java
Collection<String> languages = new ArrayList<>();

languages.add("English");
languages.add("Deutsch");
languages.add("Français");

System.out.println(languages.size()); // 3
```

This approach allows you to replace the concrete collection at any time without changing the code that uses it. It also fosters software reuse by providing a standard interface for collections and algorithms to manipulate them. It may sound complicated now, but the more you work with collections, the more understandable it will become.

It is impossible to get an element by index via the `Collection` interface because it is very abstract and does not provide such a method. But if it doesn't matter for you which particular collection to use, you can work via this interface.

It is important to understand that the order of the elements in the `ArrayList` is still preserved. We simply cannot call the `get` method via the `Collection` interface.

Every collection can be cast to a string by using `toString` and compared with another collection using the `equals` method. These methods come from `Object` and their behavior depends on elements stored in the collection and the type of the collection itself.

##### Mutable and Immutable collections

All collections can be divided into two large groups: mutable and immutable. They both implement the `Collection<E>` interface, but immutable collections will throw `UnsupportedOperationException` when trying to invoke some methods which change them: for example, `add`, `remove`, `clear`.

In the next topics, we will consider how to create and when to use immutable collections. Now just remember that they are present here.

##### Iterating over collections

If you would like to iterate over all elements of *any* collection, you can use the *for-each* style loop. Let's return to our `languages` collection:

```java
for (String lang : languages) {
    System.out.println(lang);
}
```

This code prints all elements of this collection.

```java
English
Deutsch
Français
```

The order of elements when iterating depends on a type of particular collection that is actually being used.

If you are already familiar with method references or lambda expressions, you can use another style for iterations using the `forEach(Consumer<T> consumer)` method:

```java
languages.forEach(System.out::println); // with method reference
languages.forEach(elem -> System.out.println(elem)); // with lambda expression
```

This looks very readable but is optional for use.

##### Removing elements

It is also possible to remove elements from a mutable collection (like `ArrayList`).

```java
languages.remove("Deutsch");
System.out.println(languages.size()); // 2
```

Note, the `remove` as well as the `contains` methods rely on the method `equals` of the elements. If you store non-standard classes in the collection, `equals` together with `hashCode` should be overridden.

Again, if you are already familiar with lambda expressions, you can invoke the `removeIf` method to remove all of the elements that satisfy the given predicate:

```java
languages.removeIf(lang -> lang.startsWith("E")); // it removes English
System.out.println(languages.size()); // 1
```

Use any way you like.

##### Conclusion

Java collections framework provides a set of interfaces with common methods for different types of collections. We've considered the `Collection<E>` interface which is an abstract container for storing values of the same type. Any particular collection (excluding maps) can be used through it in a program and can be iterated through by using the *for-each* loop or the `forEach` method.

For now, we confine ourselves to this much. All other interfaces including `Map<K,V>` will be considered in the following topics.

## Build tools

##### What is a build tool?

A **build tool** is a program that automates the process of creating executable applications from source code. The build process includes compiling sources and linking and packaging the code into a usable or executable form.

In small projects (like projects for learning), developers can manually invoke the build process. However, this approach is not efficient for larger projects, when it is pretty hard to keep track of what needs to be built. Automating the build process minimizes the risk of human error. Additionally, an automated build tool typically runs faster than someone performing the same steps manually. As a consequence, an automated build process improves the quality of the product and saves time and money.

##### What can build tools do?

Modern build tools can perform a wide variety of tasks that software developers do in their day-to-day activities:

1. ==**Downloading and adding dependencies.**== This is especially convenient when your project depends on a large number of libraries.
2. ==**Compiling source code into bytecode**.== Build tools will invoke compiler for all the files in your project.
3. ==**Packaging compiled code.**== You will have a production-ready application archive like JAR, APK, or some other.
4. **==Running tests.==** For example, testing the application archive every time to check if it works correctly. It allows programmers to avoid bugs after modifying the application.
5. **==Deploying==** to a production environment.

This list of tasks is not complete and may be different depending on the particular build tool used. Some additional features might be available; for example, you can use some tools to generate documentation after the build.

##### Build tools for Java-based projects

There are three main build tools for Java-based projects: **Apache Ant**, **Apache Maven**, and **Gradle**.

**Apache Ant** was released in 2000. It is the oldest of these three build tools. Coders rarely use **Ant** in new projects but it still occurs in practice. You can use this tool together with **Apache Ivy** to manage dependencies.

**Apache Maven** was released in 2004, and now it is one of the most popular choices for Java developers (especially for server-side development). Many projects, both old and new, use Maven as a build tool because of its powerful dependency management possibilities.

**==Maven==** follows the *Convention Over Configuration* concept which means that a developer needs to specify only unconventional aspects of the application, and all standard aspects work by default.

**==Gradle==** is a new tool compared to Ant and Maven. It was released in 2007 and is now standard for Android applications. Also, developers use it for server and desktop development. **Gradle** aims to *“combine the power and flexibility of Ant with the dependency management and conventions of Maven into a more effective way to build.”*

All of these build tools are free and can be used in any operating system.

Note: **Apache Maven** and **Gradle** are more than simply build tools. They manage almost the entire lifecycle of an application.

There is also another build tool called **sbt** (*Scala Build Tool*). It is primarily used for Scala projects but you can use it for Java or Kotlin as well.

If you are interested, [here](https://en.wikipedia.org/wiki/List_of_build_automation_software) you can find a list of build tools for different languages.

##### Conclusion

In summary, a build tool is a software that creates executable applications from source code. Using a build tool minimizes the risk of human error, fastens the process, improves the quality of the product, and saves time and money. Modern build tools do plenty of jobs such as downloading and adding dependencies, compiling source code, packaging compiled code, running tests, deploying to a production environment. For Java-based projects, widely used build tools are "oldie" Apache Ant, popular Apache Maven, and a "new" Gradle.

## Gradle basics

**==Gradle==** is a modern automation tool that helps build and manage projects written in Java, Kotlin, Scala, and other JVM-based languages. It ==describes project dependencies and determines how to build a project.== Gradle uses a well-designed plugin system, that is why it is a highly extendable tool. You can use plugins for automatic versioning, automatic testing, reporting about the build, and so on.

==One of the best things about Gradle is its [Groovy-based](https://en.wikipedia.org/wiki/Apache_Groovy) domain-specific language (DSL) that gives developers a specific way to form custom build scripts.== The Kotlin developers are especially lucky since Gradle also started to support Kotlin for such scripts. So, ==there are two languages to write the Gradle build scripts (Groovy and Kotlin)== and you can choose any of them.

Please, note, that ==DSL is a computer language specialized to a particular application domain (like build automation).== This is in contrast to a general-purpose language (GPL), which is broadly applicable across domains.

Nowadays, Gradle is a de-facto standard for building Android applications. However, programmers use it for server-side and desktop development gradually replacing other build tools with it. Here is [the full list of features](https://gradle.org/features/), if you want to get more information on them.

##### The key concepts

The key features of Gradle are as follows:

- **Settings files.** Gradle uses several types of settings files to describe how to build a project.
- **Build-by-convention.** A programmer doesn't need to specify every building step that needs to be done. Instead, Gradle uses default settings and behavior. Although, every step of the default build process can be customized if necessary.
- **Dependency management.** Gradle automatically downloads specified external libraries and solves conflict cases with dependencies. You can declare as many dependencies as you need for a project.
- **Builds**. Gradle allows programmers to design well-structured and easily maintained comprehensible builds. It also supports complex cases such as multi-project or partial builds.
- **Ease of migration**. Gradle can easily adapt to any project structure you have. Therefore, you can always develop your project exactly the way you want.
- **DSL** (based on Groovy and Kotlin) for writing scripts in settings files.

##### Downloading and installing Gradle

You can download Gradle from [the official website](https://gradle.org/releases/) and unpack the archive somewhere on your computer. We recommend choosing version 5.0 or higher.

To install Gradle, follow [the installation instructions](https://gradle.org/releases/) for your operating system.

To verify that the installation has been completed correctly, run the following command:

```java
gradle -v
```

The result should look similar to:

```java
------------------------------------------------------------
Gradle 5.6.4
------------------------------------------------------------
```

Your version of Gradle may differ; the main thing is that the command should successfully work. If you have errors, try to google them, read the docs, or write us a comment describing your issue.

##### Conclusion

Even though it’s yet another build tool, Gradle builds are more neat and concise thanks to its DSL. It provides a rich infrastructure to build, test, automate, and deliver your project. Next, we will learn how to create the simplest Gradle project.

## Basic project with Gradle

In this topic, you will learn how to create a simple Gradle project and how Gradle manages it. We assume that you have already installed Gradle on your computer. Otherwise, follow [the installation instructions](https://gradle.org/install/). To verify that the installation has been successful, run the `gradle -v` command. If you get errors, try to google them, read the docs, or write us a comment describing the issue.

##### The key concepts of Gradle

Let's start with an introduction to the key concepts in Gradle: **projects** and **tasks**.

- ==A **project** might represent either **something to be built** (e.g. a JAR file or ZIP archive) or **a thing to do** (e.g. deploying the application). Every Gradle build contains one or more projects.==
- ==A **task** is a single piece of work that a build performs.== This can include compiling classes, running tests, generating docs, and so on. ==Every project is essentially a collection of one or several tasks.==

The following picture illustrates the relationships between these concepts:

![img](77-CollectionsFrameworkOverview.assets/2ad089d5-37be-4d25-af1e-b26138a4af76.svg)

In simple cases, a build will contain only a single project with several tasks. This will be a common situation in your learning process. Do not worry, if the concepts look a bit abstract. We will study a more specific example soon.

##### Initializing a basic project managed by Gradle

Let's initialize a new project with Gradle using a terminal in your OS.

In the future, you most likely will not have to do this manually since modern IDEs can do this for you automatically.

\1. Create a new directory to store files of your project and go to it.

```java
mkdir gradle-demo
cd gradle-demo
```

\2. Invoke ==the `gradle init` command== to generate a simple project. Modern versions of Gradle will ask you to fill several parameters in a dialogue form. To get acquainted with the process just choose `basic` as the type of project and `Groovy` as the build script DSL.

This command will produce the following output:

```java
> Task :init

BUILD SUCCESSFUL in 10s
2 actionable tasks: 2 executed
```

Gradle performed some tasks for you and now there is a simple project with the most basic structure:

```java
.
├── build.gradle
├── gradle
│   └── wrapper
│       ├── gradle-wrapper.jar
│       └── gradle-wrapper.properties
├── gradlew
├── gradlew.bat
└── settings.gradle
```

Here is brief info about all the generated files:

- The `build.gradle` file is a primary file that specifies the Gradle's project, including its tasks and external libraries. For now, this file doesn't contain anything useful, but in real projects it is often updated with new information.
- The files `gradle-wrapper.jar`, `gradle-wrapper.properties`, `gradlew` and `gradlew.bat` belong to Gradle Wrapper which allows you to run Gradle without its manual installation.
- The `settings.gradle` file specifies which projects to include in your build. This file is optional for a build that has only one project, but it is mandatory for a multi-project build.

Let's build our project invoking ==the `gradle build` command== from the same location where `build.gradle` resides. It will produce an output like this:

```java
> Task :buildEnvironment
------------------------------------------------------------
Root project
------------------------------------------------------------
...

BUILD SUCCESSFUL in 725ms
1 actionable task: 1 executed
```

So, the project was successfully built with one executed task.

You can also invoke `build` and other commands like `./gradlew build` for Unix-based systems and `gradlew.bat build` for Windows. It will automatically download Gradle and run the specified command. Using wrappers allows developers to start working with a Gradle-based project without having to install it manually.

##### Modifying the build file

Let's make our build more interesting by adding some properties and one task to the `build.gradle` file using Groovy DSL.

```java
description = "A basic Gradle project"

task helloGradle {
    doLast {
        println 'Hello, Gradle!'
    }
}
```

Here, we set the `description` property and define a simple task that prints a 'hello' message. There is an output after executing the task with ==the `gradle -q helloGradle` command==:

```java
> Task :buildEnvironment

------------------------------------------------------------
Root project - A basic Gradle project
------------------------------------------------------------

...

> Task :helloGradle
Hello, Gradle!

BUILD SUCCESSFUL in 831ms
2 actionable tasks: 2 executed
```

This build was completed with 2 tasks executed. Our new task printed the `Hello, Gradle!` message. In addition, we modified the description of the project in the build. The `-q` argument just simplifies the command output.

You can also use Kotlin as DSL inside the build file. To allow it, you need to specify Kotlin as DSL when creating a project. In this case, the name of the file will be `build.gradle.kts`.

##### The list of all the tasks

If you would like to see all the possible Gradle tasks to perform, just run ==the `gradle tasks --all` command.== The list will include our tasks as well:

```java
> Task :tasks

------------------------------------------------------------
Tasks runnable from root project - A basic Gradle project
------------------------------------------------------------

Build Setup tasks
-----------------
init - Initializes a new Gradle build.
wrapper - Generates Gradle wrapper files.

Help tasks
----------
buildEnvironment - Displays all buildscript dependencies declared in root project 'gradle-demo'.
...

Other tasks
-----------
helloGradle
```

In a real project, the list of tasks will be much larger, because, in addition to standard tasks, it will contain a lot of tasks from various plugins (like Java or Kotlin plugin).

We've considered all Gradle-related files from the generated simple project in isolation from any source code files.

##### Conclusion

You've learned the key concepts of Gradle projects and studied all the files from a simple generated project in isolation from any source code files. Now it's time to combine Gradle together with your favorite programming language!

## Building apps using Gradle

We hope you already got a basic understanding of what Gradle is and how to use it. In this topic, we will consider the basic structure of the `build.gradle` file, and then build and run a small application. The knowledge you obtain here can be used for any JVM-based programming language supported by Gradle (e.g. Java or Kotlin).

This article was written using **Gradle 6.8.1**. There may be some differences for other versions of Gradle. If you have troubles with this article, you can read the comments or just follow [official Gradle doc](https://docs.gradle.org/current/samples/sample_building_java_applications_multi_project.html) instead of this.

##### Initializing an application

We assume that you already have some experience with the terminal of your operating system and will interact with Gradle using it. First of all, create a new empty folder named what you want (e.g., `demo`). In this folder, you need to invoke the `gradle init` command to start initialising a new Gradle-based project. This command will show you a dialogue form to set up the project you need.

In this form, choose `application` as the type of the project; **Java** or **Kotlin** as the implementation language; and `org.hyperskill.gradleapp` as the project name if you would like to precisely follow our example (but it isn't required). For all other questions, you can choose their default options, since it doesn't matter now.

Below is an example of choosing options.

```java
Select type of project to generate:
  1: basic
  2: application
  3: library
  4: Gradle plugin
Enter selection (default: basic) [1..4] 2

Select implementation language:
  1: C++
  2: Groovy
  3: Java
  4: Kotlin
  5: Scala
  6: Swift
Enter selection (default: Java) [1..6] 3

Split functionality across multiple subprojects?:
  1: no - only one application project
  2: yes - application and library projects
Enter selection (default: no - only one application project) [1..2] 

Select build script DSL:
  1: Groovy
  2: Kotlin
Enter selection (default: Groovy) [1..2] 

Select test framework:
  1: JUnit 4
  2: TestNG
  3: Spock
  4: JUnit Jupiter
Enter selection (default: JUnit 4) [1..4]  

Project name (default: demo): org.hyperskill.gradleapp
Source package (default: org.hyperskill.gradleapp): 
```

After the initialisation is completed, the project structure will be the following:

```java
.
├── app
│   ├── build.gradle
│   └── src
│       ├── main
│       │   ├── java
│       │   │   └── org
│       │   │       └── hyperskill
│       │   │           └── gradleapp
│       │   │               └── App.java
│       │   └── resources
│       └── test
│           ├── java
│           │   └── org
│           │       └── hyperskill
│           │           └── gradleapp
│           │               └── AppTest.java
│           └── resources
├── gradle
│   └── wrapper
│       ├── gradle-wrapper.jar
│       └── gradle-wrapper.properties
├── gradlew
├── gradlew.bat
└── settings.gradle
```

This structure includes a lot of files we have already considered (`settings.gradle`, wrapper files, etc). The most important file called `build.gradle`, which contains tasks and external libraries, is located within the `app` directory. This folder exists because we've chosen `application` as the type of the project and the folder represents our application.

There is also the `src` directory inside `app`. It contains two sub-directories `main` and `test`. This is a quite standard project structure when using Gradle. In our case, the package `org.hyperskill.gradleapp` has some Java source code (`App.java`).

If you chose Kotlin as the implementation language, the project structure will be the same except for Kotlin source code files (`.kt` instead of `.java`) and `kotlin` folders instead of `java` ones.

Please note, it is a good practice for Java and Kotlin projects to include the name of your organization in the path to your source code files as a package name like `org.hyperskill`. We follow this recommendation too.

##### Running the application

If you look at the list of available tasks for managing the project using the command `gradle tasks --all`, you will see that the list is fairly long. Here is a shortened version of it:

```java
Application tasks
-----------------
run - Runs this project as a JVM application

Build tasks
-----------
assemble - Assembles the outputs of this project.
build - Assembles and tests this project.
...
```

There is the command `run` which can start the application. To do it, just invoke the `gradle run` command or use a Gradle wrapper script for your OS. This command will build and run the application. Here is an output example:

```java
> Task :app:run
Hello World!

BUILD SUCCESSFUL in 623ms
2 actionable tasks: 1 executed, 1 up-to-date
```

As you can see, the autogenerated application can already display a welcome string. If you get a similar result, it means that everything is OK: your application works and Gradle can manage it!

If you look at the project structure again, you will see that it has some new files, including files with bytecode (`App.class`, `AppTest.class`). Actually, Gradle built and started the `App.class` file when we invoked the `run` command.

Now, let's consider the build file (`build.gradle` for Groovy DSL or `build.gradle.kts` for Kotlin DSL) thanks to which we can build our application successfully and run it using Gradle. This file specifies project structure and adds some tasks and external libraries to the project. We will not present the entire file here, only its main parts.

##### Plugins

==The `plugins` section adds some plugins to extend the capabilities of the project: e.g., to add new tasks or properties.==

```java
plugins {
    // Apply the application plugin to add support for building a CLI application
    id("application")

    // Apply the plugin which adds support for Java
    id("java")

    // Apply the plugin which adds support for Kotlin/JVM
    id("org.jetbrains.kotlin.jvm")
}
```

Here, `id` is a globally unique identifier, or name, for plugins. Core Gradle plugins are special in that they provide short names, such as `"java"` or `"application"`.

Basically, plugins for Kotlin and Java know how to build, package, and run tests on the project. The `application` plugin facilitates creating an executable JVM application.

There is an alternative way to use a plugin in the project. It's more like a legacy way of applying plugins which is not widely used now, but just in case you see it somewhere, here it is:

```java
apply plugin: "application"   // for Groovy DSL
apply(plugin = "application") // for Kotlin DSL
```

There are many other plugins already available for you, and you can find them at the [official Gradle Plugins page](https://plugins.gradle.org/). A large project can use dozens and hundreds of them. Gradle does not limit the maximum number of plugins used in a project.

##### Repositories and dependencies

Usually you don't need to write your program from scratch – you use already written pieces of code, either yours or other developers'. This is where the dependency system comes in handy.

==The `repositories` section declares locations from which dependencies will be downloaded and added to the project.==

```java
repositories {
    jcenter()
}
```

==There are plenty of public repositories: **JCenter**, **Maven Central**, **Google** and others.== Usually, a description of a dependency says which repository contains it.

==The `dependencies` section is used to add external libraries to the project.== Gradle will automatically download them from the repositories and put in the archive with the application. Right now your `dependencies` section should contain at least a testing library like `JUnit` or something else, depending on your choice when the project was initialized.

```java
dependencies {
    // Use JUnit test framework.
    testImplementation 'junit:junit:4.13'
    // This dependency is used by the application.
    implementation 'com.google.guava:guava:29.0-jre'
}
```

We will take a closer look at repositories and dependencies in the next topics.

This is a standard Gradle build structure. You apply some plugins and specify dependencies for your project. This structure will be the same for any project managed by Gradle.

##### Configurations for the application plugin

The auto-generated `build.gradle(.kts)` file has a section which configures the `application` plugin thanks to which the application runs with the `gradle run` command as mentioned above.

```java
application {
    // Defines the main class for the application
    mainClassName = "org.hyperskill.gradleapp.App"
}
```

==The `mainClassName` property defines a class with the entry point of the application. It allows us to run the application invoking the `gradle run` command.==

##### Generating and running Jar archive

The classic way to run a JVM-based application is to use the `java -jar` command. This command can be run without Gradle, you only need to have a JAR beforehand.

So let's build the JAR file for our application:

```java
gradle jar

BUILD SUCCESSFUL in 748ms
2 actionable tasks: 2 executed
```

Now, the JAR file is in the `app/build/libs` directory.

If you want to clean the project folder from all generated artifacts, just run the `gradle clean` command.

However, if you now try to run our generated application using the classic approach, there will be a problem:

```java
java -jar app/build/libs/app.jar
no main manifest attribute, in app/build/libs/app.jar
```

The thing is that the application does not contain the `Main-Class` attribute in the `MANIFEST.MF` file. So, the JVM does not know the path to the entry point of the application.

To fix this we need to add the required attribute when generating an archive for the application. Just add the following declaration to the `build.gradle(.kts)` file:

```java
jar {
    manifest {
        attributes("Main-Class": "org.hyperskill.gradleapp.App")   // for Groovy DSL
        attributes("Main-Class" to "org.hyperskill.gradleapp.App") // for Kotlin DSL
    }
}
```

This code adds the `Main-Class` attribute to the manifest property of the jar task. See the manifest as a map of properties where we put our pair `Main-Class -> Main`.

So, now when we execute `gradle jar` followed by `java -jar app/build/libs/gradleapp.jar`, everything should work as planned and you will see the output line `Hello world!`. What is good about this way of running applications is that `java -jar` command can be run without Gradle, you only need to have a JAR beforehand.

##### Building the application

If you would like to generate a bundle of the application with all its dependencies and a script to start the application, ==use the `gradle build` command.==

```java
BUILD SUCCESSFUL in 1s
7 actionable tasks: 7 executed
```

If everything is OK, Gradle will have produced the archive in two formats for you: `app/build/distributions/app.tar` and `app/build/distributions/app.zip`. Now, you can distribute your application!

##### Conclusion

In this topic, you've learned how to generate Gradle-based applications with source code in Java or Kotlin as well as how to run this application using both `gradle run` and `java -jar` commands. You have also become familiar with the basic structure of the `build.gradle(.kts)` file and got initial information about plugins, repositories, and dependencies. You will learn more about these things further on.

## Dependency management

Small programs that you write when learning a language may not use any external libraries at all. When you need some functionality, you will find it in the standard library or create it yourself. However, it is quite difficult to develop a real application that doesn't use any libraries because they save tons of your time and provide solutions tested by millions of people around the world.

In this topic, we will learn how to add external libraries to our applications using Gradle.

##### How to add dependencies?

==In Gradle terminology, all external libraries are called **dependencies**. As a rule, they are packaged in JAR files.== Gradle can automatically download them and add them to the project. It saves a lot of time and solves possible conflicts between versions of libraries.

Where do we get these dependencies and how do we add them to a project? To use a class, you need to have it locally, and your JVM must know that you have it. If you want to do it manually, you need to find and download such jars on your own and add them to the classpath of your project. Sounds quite tedious, right?

Fortunately, dependency management is one of the key features of Gradle. You don’t even need a plugin for it. To add an external library to a project, you need to do exactly two steps:

1. **Define a repository** where to search for dependencies.
2. **Define a dependency** that you want to include in your project.

Now, let's consider these steps in more detail.

##### Repository definition

Repositories are just places where libraries are stored. Any project can use zero or more repositories.

There are different possible formats of repositories:

- a Maven compatible repository (e.g.: [Maven Central](https://mvnrepository.com/repos/central), [JCenter](https://bintray.com/bintray/jcenter), [Google](https://maven.google.com/web/index.html))
- an Ivy compatible repository;
- local (flat) directories.

It's possible to host repositories like **Maven** or **JCenter** locally in your organization, but that is out of the scope of this tutorial. We will only consider public online versions of them.

Gradle has four aliases that you can use when adding Maven compatible repositories to the project.

- `mavenCentral()`: fetches dependencies from the [Maven Central Repository](https://mvnrepository.com/repos/central).
- `jcenter()`: fetches dependencies from the [Bintray’s JCenter Maven repository](https://bintray.com/bintray/jcenter).
- `mavenLocal()`: fetches dependencies from the local Maven repository.
- `google()`: fetches dependencies from [Google Maven repository](https://maven.google.com/web/index.html).

Defining a repository in Gradle is a piece of cake. Just add this to your `build.gradle` file:

```java
repositories {
    mavenCentral()
    jcenter()
}
```

Also, you can just download the jars you need and place them into some directory on your computer, commonly in the `libs` folder of your project. This comes in handy when the jars you need are not available in public repositories.

```groovy
repositories {
    flatDir {
        dirs 'lib'
    }
}
```

The following picture demonstrates how to add dependencies from different repositories using Gradle.

![img](77-CollectionsFrameworkOverview.assets/8db83b02-505f-478c-a2a9-ba2a753c26c5.svg)

Now let's find out how to download dependencies from these repositories.

##### Dependencies definition

==To add a new dependency to your project, first, you need to identify it by the following attributes: `group`, `name` and `version`.== ==All these attributes are required when you use Maven compatible repositories.== If you use other repositories, some attributes might be optional. For example, a flat repository only needs a name and a version.

There are several ways to find these attributes. Some library maintainers are nice enough to list them on their website or git repository. Also, you can just search for them in your preferred repository.

![img](77-CollectionsFrameworkOverview.assets/b347cf3f-90ea-4944-b2b8-1b3e29849ff4.png)

Maven Central search example

All the dependencies are grouped into a named set of dependencies called **configurations**. Each of them has different characteristics and determines the following points:

- the availability of dependencies on building steps;
- the need to include dependencies in the final build artifact;
- the visibility of dependencies for programmers who use your project as a library.

The `'java'` and `'kotlin'` plugins add a number of these configurations to your project. There are four of them:

- `implementation` configuration means that the dependency is available at compile-time and it can't be exposed to people who use your compiled code as an external library in their own projects. This configuration is considered the default one.
- `compileOnly` configuration is used to define dependencies that should only be available at compile-time, but you do not need them at runtime.
- `runtimeOnly` is used to define dependencies that you need only during runtime, and not at compile time.
- `api` configuration is similar to `implementation`, but will be exposed to the programmers who use your compiled code as a library in their projects.

In an existing project, you may see `compile` and `runtime` configurations as well, but they are deprecated now. Consider using `implementation` and `runtimeOnly` instead.

There also exist the same configurations only with the `test` prefix (e.g. `testImplementation`). Since tests are compiled and run separately and are not included in the final JAR (as well as their dependencies), they have their own set of dependencies. It helps decrease the size of a JAR, which is especially useful in Android development.

Please, note, that at this moment, you do not need to understand everything about configurations. Usually, the type of dependency configuration is already specified when you copy dependency info from an online repository or a website. If you would like to read more about configurations, [see the official Gradle docs](https://docs.gradle.org/current/userguide/java_library_plugin.html#sec:java_library_configurations_graph).

When we decided on what dependencies we want and settled on their configurations, we are ready to add them to our `build.gradle`, which is as simple as adding repositories.

```java
dependencies {
    // This dependency is used by the application.
    implementation group: 'com.google.guava', name: 'guava', version: '28.0-jre'
    // Use JUnit test framework only for testing
    testImplementation 'junit:junit:4.12'
    // It is only needed to compile the application
    compileOnly 'org.projectlombok:lombok:1.18.4'
}
```

Here, we add these three dependencies as an example:

- **Guava** library, provides useful collections and utils for a project;
- **JUnit**, used for testing purposes;
- **Lombok**, modifies bytecode at compile time and isn't necessary anymore after compilation.

As you may have noticed, there are two ways of declaring dependencies: the one where we explicitly declare group, name, and version, and the one where we just list them separated by the colon. Both are perfectly fine and are up to your preferences. Note that Groovy syntax is flexible and you can use either single or double quotes for the dependency string and optionally enclose it in parentheses. ==All the following declarations are equally valid:==

```java
// 1
implementation("com.google.guava:guava:28.0-jre")
// 2
implementation "com.google.guava:guava:28.0-jre"
// 3
implementation 'com.google.guava:guava:28.0-jre'
// 4
def guava_version = "28.0-jre"
implementation "com.google.guava:guava:$guava_version"
```

After adding dependencies in the `build.gradle` file, you can use the libraries in your source code, but do not forget to import them. Gradle will automatically download the libraries from repositories when building the project.

##### Colorful world

As an example of using external libraries, we take a look at a program that prints colored text messages.

\1. In the **dependencies** section of the `build.gradle` file we need to include JCDP library:

```java
implementation group: 'com.diogonunes', name: 'JCDP', version: '2.0.3.1'
```

\2. And then import and use it inside the source code. Here are Java and Kotlin examples.

Java:

```java
package org.hyperskill.gradleapp;
import com.diogonunes.jcdp.color.ColoredPrinter;
import com.diogonunes.jcdp.color.api.Ansi;
public class App {
    public static void main(String[] args) {
        ColoredPrinter printer = new ColoredPrinter.Builder(1, false).build();
        printer.print("Hello, colorful world!", Ansi.Attribute.BOLD, Ansi.FColor.BLUE, Ansi.BColor.WHITE);
    }
}
```

Kotlin:

```kotlin
package com.hyperskill.gradleapp
import com.diogonunes.jcdp.color.ColoredPrinter
import com.diogonunes.jcdp.color.api.Ansi
fun main(args: Array<String>) {
    val printer = ColoredPrinter.Builder(1, false).build()
    printer.print("Hello, colorful world!",
            Ansi.Attribute.BOLD, Ansi.FColor.BLUE, Ansi.BColor.WHITE)
}
```

Both programs print the same colored message: **Hello, colorful world!**

##### Conclusion

You've learned only the basics of dependency management, but this is enough to write programs with external libraries. As you may have noticed, Gradle is a very flexible tool for managing dependencies. It allows you to choose repositories where to download them and also to configure when to use dependencies: during compile-time, during runtime, or when testing, and so on. As an example, we examined a program that prints colored messages using an external library.

## External resources

You have learned how to write simple lines of code. But chances are that eventually you’ll run into a problem that every developer faces from time to time: what should I do if my code doesn’t work at all, works too slowly, is badly written or I just don’t know what to do next?

The first thing that comes to mind is Google. Don’t be afraid to use it! Some people think that developers must know all about the tools they use, but in reality, no one can know and remember everything. Even the most skilled developers often google things they don’t know. Also, putting the problem into words usually helps you find a solution.

Now that you know googling is helpful, let us introduce you to some more specific resources that have saved many coders from nervous breakdowns and confusion. Note them down: you are sure to find them useful.

##### Documentation

Let’s face it: programming is complicated. Every programming language, framework, or technology has a lot of its own nuances. Moreover, technologies are always changing, with new versions replacing the old. So the first thing to do if you have chosen a specific language or technology is to look at the **documentation**. Technical documentation is a complete description of the technology which explains its functionality and how to use it. Programming language documentation usually also contains a description of syntax and language elements and even includes a simple tutorial.

No matter which language you are working with, documentation is easily available. Here is where you can find documentation for a few basic languages:

- Python 3: https://docs.python.org/3/
- Java: https://docs.oracle.com/en/java/javase/12/
- Kotlin: https://kotlinlang.org/docs/reference/

It is considered a good practice to write complete and readable documentation, so most of the programming tools’ docs are pretty comprehensive, with each function or method described, syntax nuances noted and examples included. Always look at the docs of the tool you are using, especially when you are not familiar with it: it will save you a lot of time.

However, reading the documentation can turn out to be hard. That is because documentation, albeit a very useful resource which contains everything about the technology, is written in dry technical language and is loaded with information. It’s like reading texts in a language you’re trying to learn: at first, it’s hard, but when you get used to it, it seems much easier. Moreover, finding the information you need in the documentation is a separate skill and takes practice and patience.
Don’t be afraid if you are finding it hard to read the documentation — it’s a challenge all of us face. But what if your question is so abstract or complicated that reading the docs won’t help? Here comes another powerful resource!

##### Stack Overflow

[stackoverflow.com](https://stackoverflow.com/) is the Bible of every developer, the largest question-and-answer site for programmers. Stack Overflow contains almost every question about programming ever asked. If you google some programming-related questions, it’s very likely that the first link will lead to this site. In fact, some programming environments even have the option “Search Stack Overflow” that pops every time you get an error!

You can improve your search query by using [Google advanced search operators.](https://ahrefs.com/blog/google-advanced-search-operators/)

Here's an example from [*Google Colaboratory*](https://colab.research.google.com/), a powerful programming environment:

![img](77-CollectionsFrameworkOverview.assets/ff2aa3da-927f-4e13-95dd-870a2db1e877.png)

(of course, the site contains questions and answers about almost every programming language, not only Python)

So, Stack Overflow is the first resource you can turn to if your code doesn’t work and reading the docs isn’t helping, after Google and your own brilliant mind, of course. If you haven’t found the answer to your problem, you can go ahead and ask a question, maybe you’ll be the first person who ever asked that! Community and peer help are a very important part of learning, so don’t be afraid to ask.

##### Geeksforgeeks

Enjoyed the [“algorithmic" section](https://hyperskill.org/knowledge-map/521) in our Knowledge map? Well, there is more computer science for you! And if you haven’t read it, definitely put it on your list; meanwhile, here’s a resource that would help you get a better grasp of computer science topics.

[GeeksForGeeks.org](https://www.geeksforgeeks.org/) is a portal devoted to computer science. It contains all the information about **algorithms and data structures**; it also touches on a lot of coding problems and questions that one can encounter at job interviews. Most information on this site is programming language-independent, related more to the math used in computer science than language-specific features. Solving problems and puzzles described on this site is a good way to get a better understanding of data structures and improve your coding and analytical skills. Also, if you’ve got a more theoretical question, there is a good chance that you will find an answer at GeeksForGeeks.

And again, if you don’t understand something, don’t be afraid to ask!

##### Conclusion

As you see, you don’t have to be alone with your code that won’t work for whatever reason: there are many great sources out there that can help. If you wonder how to handle exceptions in Java, try StackOverflow, but “how do I reverse a linked list” is a good question for GeeksForGeeks. The last fundamental advice is this: use your brain and don’t panic. Finding and correcting your errors might be frustrating, but once you get the hang of it, it becomes easier and starts seeming more like a routine than a catastrophe.

Remember: there is no such thing as “stupid question”, as any question brings you a bit closer to your goal. Learn, improve and benefit from the existing resources: it’s a smart move.

## Tags and attributes

HTML documents consist of words that contain instructions on how to display a web page properly. These instructions are called **tags**. They indicate which block to display.

When a browser receives an HTML document, it analyzes the tags and uses them to form elements that we can see and interact with. In other words, tags are the bricks that build a web page. The current HTML specification includes about 100 tags. Take a look at [the complete list](https://www.w3schools.com/tags/) of all existing tags by W3 Schools. It will take time to memorize them all!

Tag syntax is very simple. The name of an element is written between the `<` and `>` symbols. Tag names are case-insensitive, but it is considered good practice to write them in **lowercase**.

All tags in HTML language are divided into two main types: **paired** and **unpaired**. Let's consider them both in more detail.

You can use [CodePen](https://codepen.io/pen/) to try out all examples by yourself.

##### Paired tags

Paired HTML tags consist of two instructions — an **opening** tag (also called a **starting** tag) that marks the beginning of a block, and a **closing** tag that looks the same but with an additional slash `/`.

As an example, we will consider the `<p>` tag. It represents a text paragraph:

```html
<p>Some kind of a text</p>
```

Here, `<p>` is a starting tag, `Some kind of a text` is the content, and `</p>` is a closing tag.

The tags are basically containers where we can put (enclose) something. Paired HTML tags usually contain either other tags or some information, for instance, text.

##### Unpaired tags

Unpaired tags have **no content** inside. They form graphic HTML elements or symbols on a page. So, unpaired HTML tags have only an opening tag.

Here is an example of an unpaired tag:

```html
<hr>
```

A browser will draw a horizontal line once it detects this tag. Another example of an unpaired tag is `<br>` that defines a single line break.

##### Nested tags

Tags can be also nested:

```html
<p>You have learned HTML <b>tags</b> <br>Congratulations!</p>
```

Here, `<b>` is used to bold a word.

This HTML line is rendered as:

![img](77-CollectionsFrameworkOverview.assets/preview.png)

A nested tag must be closed before closing the initial one.

The outer tag is called a **parent element**, and the inner tag is a **child element**.

##### Tag attributes

To extend the capabilities of individual tags and manage them easier, we can use **attributes**. Attributes are clarifications for the browser on how to display a tag.

Each HTML attribute consists of **names** and **values**. The following example shows the syntax of attributes:

```html
<a href="https://hyperskill.org">The link</a>
```

Here, the `<a>` tag means a link, `href` is the name of an attribute, and `"https://hyperskill.org"` is the value. The attribute is assigned to a value with an equals sign `=`. HTML allows you to specify attribute values without quotes if they consist of one word. However, using quotes is a good practice. The value of an attribute can be enclosed in double or single quotes (`""` or `''`).

Another important feature of the HTML attribute syntax is that an attribute must be written in the angle brackets:

```html
<img src="image.png">
```

In this example, an image is added to a web page with the unpaired `<img>` tag. A link to the file is specified in the `src` attribute. The value of the attribute is the reference to the desired image.

There are many attributes out there. It can be worth your while [checking them out](https://www.w3schools.com/tags/ref_attributes.asp).

##### Conclusion

In this topic, we have covered several useful tags and some attributes. Tags provide information to the browser about the structure of a web page. Remember that the name of a tag is enclosed between `<` and `>` in lowercase. They are subdivided into opening and closing, paired and unpaired. Each subtype has its own purpose. Tag attributes also play a vital role. They refine tags and provide additional information about tags and help your browser. HTML comprises a good number of tags and attributes; some are common, some are not. But remember — practice makes perfect!

## Dynamic array

##### Introduction

Many programs need to store and process sequences of elements of the same type like numbers, strings, or even more complex objects. An **array** is a widely used structure to represent such data sequences since an element can be accessed in constant time by index. However, regular arrays suffer from a significant drawback – they have a fixed size. This does not allow one to create an array if the number of elements is unknown in advance. In such cases, using a **dynamic array** is a possible solution.

##### Essentials

A **dynamic array** is a linear data structure that is able to increase and, in some implementations, shrink when its size changes. As a rule, it has an internal regular array that actually stores data under the hood and provides some additional operations on top of it.

A dynamic array has two important properties:

- **size** – the number of elements already stored in it;
- **capacity** – a possible number of elements to be stored that corresponds to the size of the internal regular array.

Usually, there are two paths: either to specify a **capacity** for a new dynamic array or to set a constant default value (e.g. 10). In contrast to basic arrays, dynamic arrays have operations for adding/removing elements to or from any position. This way, we can add and remove elements one by one after a dynamic array has been created.

The picture below demonstrates a dynamic array to which we added four numbers. The actual size is 4 and the capacity is 10 (initial):

![img](77-CollectionsFrameworkOverview.assets/91dc0225-48f2-4abf-b5d7-5d835c1d33b2.png)

##### Scaling factor

If the number of elements exceeds the **capacity**, all elements will be copied to a new internal array of a bigger size. There are a number of different scaling strategies for the size of it. The most common ones are the multiplication of the initial capacity by 1.5 (Java) or 2 (C++, the GCC STL implementation). There are also more unique cases like the Golang dynamic array ("slice"), which doubles the size until 1024 elements (after that the ratio is 5/4).

It is a trade-off between time and space complexities. With a bigger growth factor, we have more insertions before we would have to extend an array, thus decreasing time complexity.

But what is the best scaling factor? That is, what value will have both time and space complexities? It turns out, that the value must be equal to the golden ratio, 1.618031.61803. As you may notice, 1.51.5 is as close to it as it can get. If you're curious to know more, you can [read it up there](https://stackoverflow.com/questions/1100311/what-is-the-ideal-growth-rate-for-a-dynamically-allocated-array).

It may also be necessary to support the shrinking of the internal array when removing elements to reduce the required size.

##### Common operations

==**Add an element to the end of the array.**== As discussed above, in the base case scenario where we just add an element to an array without specifying the index, we'll have these complexities:

- ==O(1)*O*(1) – in average cases, since we just insert an element to already allocated memory (less than capacity);==
- ==O(n)*O*(*n*) – in the worst case, where we ran out of space and need to allocate a new array and copy every element into it.==

The average estimate for adding an element to the end of the array is called amortized. Since it is rather difficult to tell from the first glance that it is O(1)*O*(1), we have to use a special analysis for that. If anyone is interested they can [read about it here](https://en.wikipedia.org/wiki/Amortized_analysis).

==**Add an element at the specified index**.== This operation is used when we want to add an element between some already placed elements. Its complexities ( both average and worst) would be ==O(n)*O*(*n*) since on each insertion we must move an element at the index we want and then move every element one index to the right.==

![img](77-CollectionsFrameworkOverview.assets/3eb17164-62f8-40a1-b3d2-68c6b9ddda62.png)

==**Update value at the specified index**.== This operation replaces the element at the specified index with the element. All this is done in constant time since it is just like the assignment in the basic array, so the complexities are both ==O(1)*O*(1).==

**Remove an element by value/index**. These methods either remove the first occurrence of an element specified or an element at the index specified. Both are similar to adding an element at the specified index in the sense that we would have to move some (or all) of the remaining elements one index to the left; therefore their complexities would also be ==O(n)*O*(*n*).==

![img](77-CollectionsFrameworkOverview.assets/86d2f01c-0a9a-41b9-a122-1b6c12fd2442.png)


**Clear**. Here we just want to remove every element from the array. Since insertion is done via computation on the current array size, we can just reset the size to zero and override the old elements during the following inserts. That would leave the elements hanging out in memory (so the garbage collector won't be able to collect them) until they are overridden. The simplest form would have complexities of O(1)*O*(1), but the right one would have O(n)*O*(*n*).

**Get element by index**. Since a dynamic array is basically just a normal array, we can access elements by their index in constant time, so complexities are O(1)*O*(1).

##### Conclusion

A dynamic array is just like a regular array, but the number of stored elements can be changed. If adding operations run out of space to store elements, a new bigger array is allocated, and every element of the old array is copied to the new one. The scaling factor is a trade-off between time (speed) and space. With a bigger factor we have fewer allocations and less copying, but higher chances of running out of memory. The most common factors are 1.5 and 2. In some implementations, a dynamic array can support shrinking to reduce the used memory after removing elements.

## ArrayList

[Theory](https://hyperskill.org/learn/step/3567)Practice

12% completed, 0 problems solved

##### Theory

 36 minutes reading

Verify to skipStart practicing

##### Resizable arrays

One of the most widely used classes of Java Class Library is a class named `ArrayList` that represents a resizable array of objects of a specified type. Unlike the standard array denoted as `[]`, it can dynamically grow after the addition and shrink after the removal of its elements. This behavior is very useful if you do not know the size of the array in advance or you need one that can change size over the lifetime of a program.

In fact, this class is built on top of a standard Java array, extending it with a set of convenient operations. Like a standard array, it allows getting the current number of elements (its size) as well as accessing its elements by their indexes.

There is only one restriction: `ArrayList`: being a generic class, it cannot store primitive types. However, it can store any reference types, including `String`'s, wrapper classes (like `Integer`'s), other `ArrayList`'s, and custom classes.

##### Creating an instance of ArrayList

To start using the class by its short name, make the following import:

```java
import java.util.ArrayList;
```

Let's consider several ways to create instances of this class.

\1) The simplest way is to use a no-argument constructor:

```java
ArrayList<String> list = new ArrayList<>();
```

The created list is empty, but its initial capacity is 10 (by default).

\2) We can also specify the initial capacity of it:

```java
ArrayList<String> list = new ArrayList<>(50);
```

This list is empty, but its initial capacity is set to 50.

\3) Or you can construct an `ArrayList` that consists of elements of another list:

```java
ArrayList<String> list = new ArrayList<>(anotherList);
```

Regardless of how you create an instance of `ArrayList`, its size will dynamically change. In this lesson, we will create a list with the default capacity like in the first example.



If you are an advanced user, you know that it is better to create and use an `ArrayList` via its `List` interface. We will do it in the next lessons after learning **inheritance**. We believe that the current approach is enough for now since it requires less knowledge to start using dynamic collections.



##### Basic methods

The collection has a set of convenient methods that emulate and extend the functionality of standard arrays. Let's discuss what they are. First, let's initialize some collection:

```java
ArrayList<String> names = new ArrayList<>(); // empty collection of strings
```

First of all, there's a method to determine the size of the collection `size` that returns the number of elements of the list. Let's try learning the size of ours:

```java
System.out.println(names.size()); // 0
```

As expected, it is empty and the result is zero. We also might want to learn the value of the specified position of the object. For that, collections have a `get(int index)` method that returns the object of the list which is present at the specified index.

Next, there are a bunch of methods to add elements and set values of a collection:

- `add(Object o)` adds a passed element to the last position of the collection;
- `add(int index, Object o)` adds a passed element to the specified position of the collection;
- `set(int index, Object o)` replaces the element present at the specified index with the object;

Let's add some names to our collection:

```java
names.add("Justin");      // [Justin]
names.add("Helen");       // [Justin, Helen]
names.add(1, "Joshua");   // [Justin, Joshua, Helen]
names.add(0, "Laura");    // [Laura, Justin, Joshua, Helen]
```

And replace one name with another:

```java
names.set(3, "Marie"); // now: [Laura, Justin, Joshua, Marie]
```

We can check that everything is as expected:

```java
System.out.println(names);        // [Laura, Justin, Joshua, Marie]
System.out.println(names.size()); // 4
System.out.println(names.get(0)); // the first element is "Laura"
System.out.println(names.get(3)); // the last element is "Marie"
```

Finally, there are methods for removing elements from the collection:

- `remove(Object o)` removes **the first occurrence** of the specified element from this list, if it is present;
- `remove(int index)` removes the element at the specified position in this list;
- `clear()` removes all elements from the collection.

Let's try removing elements by value and index:

```java
names.remove("Justin"); // [Laura, Joshua, Marie]
names.remove(1);        // [Laura, Marie]
names.clear();          // []
```



Important: indexes of elements start with 0 just like for standard arrays



Try to play with this code by yourself and enjoy the power of `ArrayList` .

##### More ArrayList methods

We've illustrated the possibilities of basic methods for collections in Java applied to an `ArrayList` object. But this class has some more methods of its own. First, let's create another `ArrayList`:

```java
/* an ArrayList of Integers, not ints */
ArrayList<Integer> numbers = new ArrayList<>();

numbers.add(1);
numbers.add(2);
numbers.add(3);
numbers.add(1);
```

There's also an `addAll(Collection c)` method for adding the whole collection to an `ArrayList`. It appends elements of the provided collection to the end of the list:

```java
ArrayList<Integer> numbers2 = new ArrayList<>();    // creating another list of Integers
numbers2.add(100);
numbers2.addAll(numbers); // [100, 1, 2, 3, 1]
```

The class also has a method called `contains` that checks whether a list contains a value or not, and two methods `indexOf `and`lastIndexOf` that find the index of the first and the last occurrences of an element, respectively. They return `-1` if there is no such index.

Let's see:

```java
System.out.println(numbers.contains(2));    // true
System.out.println(numbers.contains(4));    // false
System.out.println(numbers.indexOf(1));     // 0
System.out.println(numbers.lastIndexOf(1)); // 3
System.out.println(numbers.lastIndexOf(4)); // -1
```

As you see, this class provides a rich set of methods to work with elements. You do not have to write them by yourself, as you do for standard arrays.

##### Iterating over ArrayList

It is possible to iterate over elements of an instance of the class. It is done in the same way as iterating over an array. In the following example, we use *for* and *for-each* loops to add the five first powers of ten in a list and then print the numbers to the standard output.

```java
ArrayList<Long> powersOfTen = new ArrayList<>();

int count = 5;
for (int i = 0; i < count; i++) {
    long power = (long) Math.pow(10, i);
    powersOfTen.add(power);
}

for (Long value : powersOfTen) {
    System.out.print(value + " ");
}
```

The code prints the following:

```java
1 10 100 1000 10000 
```

It is not harder than using a standard array.

##### Conclusion

We've considered the `ArrayList` class from the `java.util` package. This class is similar to standard Java arrays but has the possibility to dynamically change its size. It has methods to get the size, add, remove and access elements by their indexes. In addition, `ArrayList` provides a set of useful methods that check whether an element is present in the array and find it. A regular array does not have such methods built-in.

## The List interface

As you know, lists are the closest type to arrays, except their size can be changed dynamically while an array's size is constrained. Moreover, lists provide more advanced behavior than arrays. In this topic, you will deepen your knowledge of lists and their relationship with the Collections Framework.

A list is an *ordered* collection of elements. It means that each element has a position in the list specified by an integer index like in regular arrays.

##### The List interface

The `List<E>` interface represents a list as an abstract data type. It extends the `Collection<E>` interface acquiring its methods and adds some new methods:

- `E set(int index, E element)` replaces the element at the specified position in this list with the specified element and returns the element that was replaced;
- `E get(int index)` returns the element at the specified position in the list;
- `int indexOf(Object obj)` returns the index of the first occurrence of the element in the list or `-1` if there is no such element;
- `int lastIndexOf(Object obj)` returns the index of the last occurrence of the element in the list or `-1` if there is no such element;
- `List<E> subList(int fromIndex, int toIndex)` returns a sublist of this list from `fromIndex` included to`toIndex` excluded.

As you can see, the methods presume that a list is an ordered collection.

You cannot create an instance of the `List` interface, but you can create an instance of one of its implementations: `ArrayList` or `LinkedList` or an *immutable* list, and then use it through the common `List` interface. You will have access to all methods declared in both `List<E>` and `Collection<E>` interfaces.

Working with lists through the `List` interface is considered good practice in programming since your code will not depend on the internal mechanisms of a specific implementation.

##### Immutable lists

The simplest way to create a list is to invoke the `of` method of the `List` interface.

```java
List<String> emptyList = List.of(); // 0 elements
List<String> names = List.of("Larry", "Kenny", "Sabrina"); // 3 elements
List<Integer> numbers = List.of(0, 1, 1, 2, 3, 5, 8, 13);  // 8 elements
```

It returns an **immutable** list containing either all the passed elements or an empty list. Using this method is convenient when creating list constants or testing some code.

Let's perform some operations:

```java
List<String> daysOfWeek = List.of(
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday"
);
System.out.println(daysOfWeek.size()); // 7
System.out.println(daysOfWeek.get(1)); // Tuesday
System.out.println(daysOfWeek.indexOf("Sunday")); // 6
List<String> weekDays = daysOfWeek.subList(0, 5);
System.out.println(weekDays); // [Monday, Tuesday, Wednesday, Thursday, Friday]
```

Since it is **immutable,** only methods that do not change the elements in the list will work. Others will throw an exception.

```java
daysOfWeek.set(0, "Funday"); // throws UnsupportedOperationException
daysOfWeek.add("Holiday");   // throws UnsupportedOperationException
```

This situation clearly demonstrates when immutable lists are needed. It's hard to imagine that someone renames a day or adds another one!

Be careful when working with immutable lists. Sometimes even experienced developers get `UnsupportedOperationException`.

Prior to Java 9, another way to create unmodifiable lists was the following:

```java
List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5);
```

To use it, the class `java.util.Arrays` must be imported.

##### Mutable lists

When you need to use a mutable list, you can take one of two commonly used mutable implementations of the `List` interface.

One of them is familiar to you: the `ArrayList<E>` class. It represents a resizable array. In addition to implementing the `List` interface, it provides methods to manipulate the size of the array that is used internally. These methods are not needed in programs often, so it is better to use an object of this class through the `List` interface.

```java
List<Integer> numbers = new ArrayList<>();
numbers.add(15);
numbers.add(10);
numbers.add(20);
System.out.println(numbers); // [15, 10, 20]
numbers.set(0, 30); // no exceptions here
System.out.println(numbers); // [30, 10, 20]
```

If you have an immutable list, you can take the mutable version from it using the following code:

```java
List<String> immutableList = Arrays.asList("one", "two", "three");
List<String> mutableList = new ArrayList<>(immutableList); 
```

Another mutable implementation of the `List` interface is the `LinkedList` class. It represents a **doubly-linked list** based on connected nodes. All operations that index into the list will traverse the list from the beginning or from the end, whichever is closer to the specified index.

```java
List<Integer> numbers = new LinkedList<>();
numbers.add(10);
numbers.add(20);
numbers.add(30);
System.out.println(numbers); // [10, 20, 30]
```

Access to the first and the last element of the list is always carried out in constant time `O(1)` because links are permanently stored in the first and the last element, so adding an item to the end of the list does not mean that you have to iterate the whole list in search of the last element. But accessing/setting an element by its index takes `O(n)` time for a linked list.

In the general case, `LinkedList` loses to `ArrayList` in memory consumption and speed of operations. But it depends on the problem you are trying to solve.

##### Iterating over a list

There are no problems to iterate over elements of a list.

```java
List<String> names = List.of("Larry", "Kenny", "Sabrina");
```

\1) Using the "for-each" loop:

```java
// print every name
for (String name : names) {
    System.out.println(name);
}
```

\2) Using indexes and the `size()` method:

```java
// print every second name
for (int i = 0; i < names.size(); i += 2) {
    System.out.println(names.get(i));
}
```

When you need to go through all elements of a list, we recommend choosing the first way to iterate. The second way is good when you need to skip some elements based on their positions in the list.

##### List equality

The final question is how lists are compared. Two lists are equal when they contain the same elements in the same order. The equality does not depend on the types of the lists themselves (`ArrayList`, `LinkedList` or something else).

```java
Objects.equals(List.of(1, 2, 3), List.of(1, 2, 3));    // true
Objects.equals(List.of(1, 2, 3), List.of(1, 3, 2));    // false
Objects.equals(List.of(1, 2, 3), List.of(1, 2, 3, 1)); // false
List<Integer> numbers = new ArrayList<>();
numbers.add(1);
numbers.add(2);
numbers.add(3);
Objects.equals(numbers, List.of(1, 2, 3)); // true
```

With this, we have finished our discussion of the `List` interface and common features for all lists. There was a lot of theory. If there's something you do not yet understand, try to practice and go back to the theory when questions arise.

## The Set interface

When you need to keep only unique elements within a collection, to get rid of duplicates in a sequence, or if you intend to perform some mathematical operations, you may use a **set**.

A **set** is a collection of unique elements like a mathematical set. A set is significantly different from an array or a list since it's impossible to get an element by its index.

In this topic, we will consider **mutable** and **immutable** sets and their differences. All our examples will use strings and numbers, since storing objects of custom classes as elements has some significant points. It will be considered in other topics.

##### The Set interface

*The Collections framework* provides the `Set<E>` interface to represent a **set** as an abstract data type. It inherits all the methods from the `Collection<E>` interface but doesn't add any new ones. The most widely used methods include `contains`, `add`, `addAll`, `remove`, `removeAll`, `size,` and others we've considered in the earlier topic on the Collections framework.

The `add` and `addAll` methods add elements to the set only if those elements are not already in the set. A set always contains only unique elements.

One method is worth special attention when talking about `Set<E>` interface, as it is often used with sets: `retainAll(Collection<E> coll)`. It retains only those set elements that are contained in the specified collection.

To start using a set, you need to instantiate one of its implementations: `HashSet`, `TreeSet`, and `LinkedHashSet`. These are mutable sets and they use different rules for ordering elements and have some additional methods. They are also optimized for different types of operations. There are also **immutable** sets, whose names are not important for programmers. They also implement the `Set<E>` interface.

As an addition, there is a high-performance implementation `EnumSet` for `enum` types. We will not consider it in this topic.

##### Immutable sets

The simplest way to create a **set** is to invoke the `of` method of the `Set` interface.

```java
Set<String> emptySet = Set.of();
Set<String> persons = Set.of("Larry", "Kenny", "Sabrina");
Set<Integer> numbers = Set.of(100, 200, 300, 400);
```

It returns an **immutable** set containing either all the passed elements or an empty set. Using the `of` method is convenient when creating set constants or testing some code.

The order of elements of **immutable** sets is not fixed:

```java
System.out.println(emptySet); // []
System.out.println(persons);  // [Kenny, Larry, Sabrina] or another order
System.out.println(numbers);  // [400, 200, 300, 100] or another order
```

One of the most widely used set operations is checking whether a set contains an element. Here is an example:

```java
System.out.println(emptySet.contains("hello")); // false
System.out.println(persons.contains("Sabrina")); // true
System.out.println(persons.contains("John")); // false
System.out.println(numbers.contains(300)); // true
```

For **immutable** sets, it's only possible to invoke `contains`, `size`, and `isEmpty` methods. All others will throw `UnsupportedOperationException` since they try to change the set. If you'd like to add / remove elements, use one of `HashSet`, `TreeSet` or `LinkedHashSet`.

Next, we will consider three primary **mutable** implementations of the `Set` interface.

##### HashSet

The `HashSet` class represents a set backed by a **hash table**. It uses hash codes of elements to effectively store them. It makes no guarantees as to the iteration order of the set; in particular, it does not guarantee that the order will remain constant over time.

The following example demonstrates creating a `HashSet` and adding countries to it (with a duplicate). The output result does not contain duplicates.

```java
Set<String> countries = new HashSet<>();

countries.add("India");
countries.add("Japan");
countries.add("Switzerland");
countries.add("Japan");
countries.add("Brazil");

System.out.println(countries); // [Japan, Brazil, Switzerland, India]
System.out.println(countries.contains("Switzerland")); // true
```

Although technically the order of `HashSet` is somewhat determined by `hashCode`, it is a bad practice to rely on such features, since the dependency is quite complicated. `HashSet` should be treated as an unordered set.

You must not rely on the order of elements in this set even with the **for-each** loop.

The `HashSet` class offers constant time `O(1)` performance for the basic operations (`add`, `remove`, and `contains`), assuming the hash function disperses the elements properly among the buckets.

In practice, sets are often used to check whether some elements belong to them. The `HashSet` class is especially recommended for such cases since its `contains` operation is highly optimized.

##### TreeSet

==The `TreeSet` class represents a set that gives us guarantees on the order of the elements.== It corresponds to the sorting order of the elements determined either by their natural order (if they implement the `Comparable` interface) or by specific `Comparator` implementation.

The order in which the elements would be sorted is the same as if you used a sort algorithm on an array or list containing these elements.

The `TreeSet` class implements the `SortedSet` interface which extends the base `Set` interface. The `SortedSet` interface provides some new methods related to comparisons of elements:

- `Comparator<? super E> comparator()` returns the **comparator** used to order elements in the set or `null` if the set uses the natural ordering of its elements;
- `SortedSet<E> headSet(E toElement)` returns a subset containing elements that are strictly less than `toElement`;
- `SortedSet<E> tailSet(E fromElement)` returns a subset containing elements that are greater than or equal to `fromElement`;
- `SortedSet<E> subSet(E fromElement, E toElement)` returns a subset containing elements in the range `fromElement` (inclusive) `toElement` (exclusive);
- `E first()` returns the first (lowest) element in the set;
- `E last()` returns the last (highest) element in the set.

The following example demonstrates some of the listed methods:

```java
SortedSet<Integer> sortedSet = new TreeSet<>();

sortedSet.add(10);
sortedSet.add(15);
sortedSet.add(13);
sortedSet.add(21);
sortedSet.add(17);

System.out.println(sortedSet); // [10, 13, 15, 17, 21]

System.out.println(sortedSet.headSet(15)); // [10, 13]
System.out.println(sortedSet.tailSet(15)); // [15, 17, 21]
 
System.out.println(sortedSet.subSet(13,17)); // [13, 15] 

System.out.println(sortedSet.first()); // minimum is 10
System.out.println(sortedSet.last());  // maximum is 21
```

Note, while `HashSet` is much faster than `TreeSet`: constant-time versus log-time for most operations, it offers no ordering guarantees. If you need to use the operations from the `SortedSet` interface or if the value-ordered iteration is required, use `TreeSet`; otherwise, `HashSet` would be a better choice.

##### LinkedHashSet

The `LinkedHashSet` class represents a set with linked elements. It differs from `HashSet` by guaranteeing that the order of the elements is the same as the order they were inserted to the set. Reinserting an element that is already in the `LinkedHashSet` does not change this order.

In some sense, `LinkedHashSet` is something intermediate between `HashSet` and `TreeSet`. Implemented as a hash table with a linked list running through it, this set provides *insertion-ordered* iteration and runs nearly as fast as `HashSet`.

The following example demonstrates this.

```java
Set<Character> characters = new LinkedHashSet<>();

for (char c = 'a'; c <= 'k'; c++) {
    characters.add(c);
}
        
System.out.println(characters); // [a, b, c, d, e, f, g, h, i, j, k]
```

In this code, the order of characters is always the same and matches the order in which they are inserted into the set.

The `LinkedHashSet` implementation spares its clients from the chaotic ordering provided by `HashSet` without incurring the increased time cost of operations associated with `TreeSet`. But `LinkedHashSet` requires more memory for storing elements.

##### Set operations

You have already seen some operations on sets. Now let's look at operations that are usually called as **set theoretic operations** that come from math. It's funny that in Java they are common for all collections, not only for sets.

Here is an example of such operations. First of all, we create a mutable set. Then, we apply operations to it, changing the elements.

```java
// getting a mutable set from an immutable one
Set<String> countries = new HashSet<>(List.of("India", "Japan", "Switzerland"));

countries.addAll(List.of("India", "Germany", "Algeria"));
System.out.println(countries); // [Japan, Algeria, Switzerland, Germany, India]

countries.retainAll(List.of("Italy", "Japan", "India", "Germany"));
System.out.println(countries); // [Japan, Germany, India]

countries.removeAll(List.of("Japan", "Germany", "USA"));
System.out.println(countries); // [India]
```

After performing `addAll`, the set `countries` does not contain duplicate countries. The `retainAll` and `removeAll` operations affect only those elements which are specified in the passed sets. It is also possible to use any class that implements the `Collection` interface for these methods (e.g. `ArrayList`).

In math and other programming languages, the demonstrated set operations are known as **union** (`addAll`), **intersection** (`retainAll`) and **difference** (`removeAll`).

There is also a method that allows us to check whether a set is a subset of (i.e. contained in) another set.

```java
Set<String> countries = new HashSet<>(List.of("India", "Japan", "Algeria"));

System.out.println(countries.containsAll(Set.of())); // true
System.out.println(countries.containsAll(Set.of("India", "Japan")));   // true
System.out.println(countries.containsAll(Set.of("India", "Germany"))); // false
System.out.println(countries.containsAll(Set.of("Algeria", "India", "Japan"))); // true
```

As you can see, this method returns `true` even for an empty set and a set that is fully equal to the initial set.

##### Set equality

Last but not least is how sets are compared. Two sets are equal when they contain the same elements. Equality does not depend on the types of sets themselves.

```java
Objects.equals(Set.of(1, 2, 3), Set.of(1, 3));    // false
Objects.equals(Set.of(1, 2, 3), Set.of(1, 2, 3)); // true
Objects.equals(Set.of(1, 2, 3), Set.of(1, 3, 2)); // true

Set<Integer> numbers = new HashSet<>();

numbers.add(1);
numbers.add(2);
numbers.add(3);

Objects.equals(numbers, Set.of(1, 2, 3)); // true
```

We assume that the given examples do not need any comments.

##### Summary

We finished the consideration of the `Set` interface and common features for all sets. Remember, there are immutable and mutable sets. They can be both unordered and ordered and never contain duplicates. The `HashSet` is highly optimized for some operations by effectively storing elements, but it does not guarantee their order. `TreeSet` guarantees the order of elements based on their value, but the time cost of operations is higher. `LinkedHashSet` keeps the order of the elements as they were inserted and requires more memory for storing. Each type of set is best suitable for a specific purpose. We hope you get the basic understanding of how to use them effectively.

## Introduction to Spring boot

##### The Spring Framework

**Spring** is one of the most popular application development frameworks for the Java Platform. First of all, we use it to develop web applications, but we can also apply it to the desktop and even to the command-line applications. In a way, Spring is a framework of frameworks that work together providing standard functionality to applications. That's why we sometimes call Spring a platform meaning it's more than just a framework.

**Spring's logo**

Spring is huge, and it can do a lot of useful things. Here is just a small list of some parts of Spring providing services necessary to most of the real-world applications:

- **component container** for managing the life cycle of objects inside the application;
- **data access framework** for working with different types of databases;
- **web framework** for building web applications with a web server;
- **security framework** for supporting user authentication and authorization processes;
- **testing framework** for writing tests for all parts of the application.

Despite its popularity and all its features, Spring is not a perfect framework, and its creators understand it. One of the main issues is that the configuration of the Spring-based applications is very complex. This slows down the development process and creates extra complexity for the beginners.

Fortunately, Spring developers realized that it was possible to automate much of this work, so they developed a new framework called **Spring Boot**. This framework solves many configuration problems and makes Spring one of the most successful and convenient web development platforms among all.

##### What is Spring Boot?

**Spring Boot** is a part of Spring platform that allows the developers to create stand-alone production-grade Spring-based applications that you can "just run".

This framework has greatly simplified the configuration of applications by applying the **convention over configuration** approach. This means a programmer does not need to configure everything; instead, the framework defines some default components, behaviors, and automatic configurations for each of the major use cases in Spring. At the same time, when using it, you still have access to all the features of the Spring Framework together with the acquired ease of development.

**Spring Boot's logo**

Spring Boot also provides a few additional cool features, here are some of them:

- command-line interface;
- monitoring the status of your running applications (health/metrics);
- embedded application server for running your application.

We hope that you find this interesting and soon will see all the simplicity and fun when developing an application with the Spring Boot! We tried not to bore you with history in this topic. If you would like to read some history and philosophy of the Spring framework and Spring Boot, you can visit [the official documentation](https://docs.spring.io/spring/docs/current/spring-framework-reference/overview.html) and then come back to their application.

## Getting started with Spring Boot

In this topic, you will learn how to create your first Spring Boot application. This application is quite simple and does nothing useful, but still, it will demonstrate the basic structure of any Spring Boot project.

##### Generating a Spring Boot application

It is often hard to start a new project from scratch, especially for a beginner. You need to set up the basic structure, create configurations and manage all external dependencies. Fortunately, there is a special web site called [Spring Initializr](https://start.spring.io/) that can generate the basic Spring Boot project based on your wishes.

![img](77-CollectionsFrameworkOverview.assets/ee590132-603e-4359-87ba-c081951545af.png)

This site may look slightly different, but the general idea remains the same. There are several important options you need to specify before generating a project:

- the build tool: Maven or Gradle
- one of the possible JVM-based languages: Java (8, 11 or higher), Kotlin, Groovy
- a version of Spring Boot framework (e.g, the last released version without `SNAPSHOT`, `M` and other suffixes).
- metadata like `group`, `artifact`, `description` and `package name`
- external dependencies (other frameworks and libraries)

If you are interested in the naming rules for Spring Boot versions and the meaning of the diverse suffixes, you can read [this short article](https://www.baeldung.com/spring-projects-version-naming).

In our example, we've chosen Gradle as the build tool and Java 11 as the language. You can choose a more recent version if you'd like. Our application is named `demo`.

By default, the packaging type for Spring Boot is **Jar.** It means that your application should be packed in a `.jar` file that contains all the required dependencies. This type of file is more simple to use than a `.war` file, which should be deployed on an external application server.

After you've chosen all the necessary settings and dependencies, just click **Generate Project** to get the project's archive. This archive contains the basic structure of a typical Spring Boot application without application logic; it is just a template, you need to write some logic there.

Note that another way to generate a Spring Boot application is to use an [IDE like IntelliJ IDEA](https://www.javadevjournal.com/spring-boot/spring-boot-application-intellij/).

##### Running the application

Although the generated application is useless at the moment, it is a good template to start with.

Let's run it! First, unpack the application and then visit the project's directory. In our examples, we will use Gradle as it is a common build automation system.

First, we should build the application:

```bash
./gradlew build
```

It creates a `.jar` file using Gradle Wrapper and puts it in the `build/libs/` directory. Gradle automatically downloads all the necessary dependencies while building.

When finished, it should print:

```bash
BUILD SUCCESSFUL in 1s
```

Now, it is time to run the program represented as a `.jar` file.

```bash
java -jar build/libs/*.jar
```

After running, this application just prints the Spring logo and several log lines that we skipped.

```bash
  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::                (v2.4.4)
```

You may also build and start an application using a single line:

```bash
./gradlew build && java -jar build/libs/*.jar
```

Congratulations! You've just created and started your first application using the Spring Boot framework even without a single line of code, except for a pair of commands.

## Synchronous, asynchronous, parallel

When we are considering some complex process, let's call it **workflow**, various parts of it may run differently. Sometimes actions go one by one, sometimes they go in random order overlapping each other, and sometimes things go simultaneously and in parallel. The workflow can evolve differently. There are three sorts of workflow executions sequence: synchronous, asynchronous, and parallel.

Many terms related to computer program processing are not just technical ones. They describe a wide variety of real-world phenomena. In some sense, the processes taking place inside a computer are not that different from those in real life. Moreover, on some level of abstraction, they are practically identical. So, let's try to use them and explore their base concepts using a real-life example.

An appropriate example of a complex process is customer service. Let's use it to study some basic types of workflow from the point of view of the sequence of execution.

##### Synchronous workflow

There are many models to manage customer flows. The simplest approach is one shop with one seller. The seller deals with each client from the beginning to the end of each sale *and* performs all the roles from storekeeper to cashier.

![img](77-CollectionsFrameworkOverview.assets/5fca818c-3761-4ea4-a99a-1935cc0ad363.svg)

When there are many customers at the same time, this approach is very far from perfect as the seller can deal only with one client per time, while others have to wait in the line. They serve each client separately one by one which means starting to serve the next client only after finishing with the current. We name this type of action a **synchronous** one.

Synchronous workflows are very common. Most of the activities should go synchronously if their goal is to achieve some specific results. The number of examples is enormous. Scenes in a movie plot, car assembling, words in a sentence, cooking, you name it.

##### Asynchronous workflow

Let's imagine our old shop becomes fancier, this is a pizza shop now. After the first client has ordered their pizza, they need to wait for it to be cooked. At this point, the seller leaves the first customer alone for a while, and now the second one can make their order, then the third and so on.

![img](77-CollectionsFrameworkOverview.assets/5086826e-012d-46f8-af0b-a5518ae1f91b.svg)

When the first client's pizza is ready, the seller returns to them to complete the sale. That's how this story will be repeating again and again.

Our old friend seller can serve several customers simultaneously in overlapping periods. We call such behavior **asynchronous**.

Operations of this kind often emerge when there is a need for waiting. Imagine you are reading on an aircraft while flying, or you do the dishes while something is cooking; those pairs of activities are asynchronous.

##### Parallel processing

As the pizza shop sales are growing, now one worker is not enough for the whole business. So, we should hire several. If each seller has a separate compact oven for preparing exactly one pizza at a time, then we can divide the queue of buyers among the sellers.

![img](77-CollectionsFrameworkOverview.assets/35cd849a-0bf0-4e0a-8cab-528a56ba70ef.svg)

Now each of them works independently, and this is a case of **parallel** processing. Each task in parallel processing is running in a continuous period as a whole unit process. The parallel execution is possible only if there is more than one executor. Cashiers in a supermarket are one of the examples of parallel processing in everyday life, as well as highways.

##### Conclusion

So, there are three types of workflow processing. The first is synchronous, the second is asynchronous, and the third is parallel.

- Synchronous: one task at a time, the next starts when the previous is done.
- Asynchronous: multiple tasks at the same time in overlapping periods, executing by little parts.
- Parallel: multiple or one task split into parts being executed continuously by different executors in parallel.

## Processes and threads

Imagine that you come to a food court at lunchtime and see a line of pizza shops there. Each shop's mission is to sell pizza and each of them has several workers. Their purpose is to sell pizza too, but they can't sell it by themselves without the equipment provided by the shop. On the other hand, any pizza shop can't sell anything without its staff. There has to be at least one worker to do the job.

It's similar to how a computer runs applications and manages multitasking and parallel execution. To understand it better, let's consider such concepts as *processes* and *threads*, as well as some similarities between these notions of computer science and the properties of a pizza shop.

![img](77-CollectionsFrameworkOverview.assets/4d69da91-a52e-4dd8-97ce-a7727050a6b1.svg)

##### Process

==The **process** is the self-contained unit of execution that has all the things necessary to accomplish the mission.== In short, the process is the container for its threads, all necessities for their work, and their shared resources. It’s cheaper to arrange access to shared resources once than to do it every time you spawn a new thread. The process has to have at least one thread as they do all the work. There is no such thing as a thread without its process or a process without at least one thread.

![img](77-CollectionsFrameworkOverview.assets/f04e7530-7872-46af-bfbd-b4700fcd0983.svg)

If we look at the pizza business, a single pizza shop would serve as an analogy for the process. It has all the environment and equipment required for a worker to do the job. Equipment is expensive, so it's cheaper and more efficient when workers share it. There is no need for each worker to acquire personal equipment. On the other hand, the shop can't do anything without the workers. It is essential to have at least one worker because without them all the equipment would be useless. Altogether, these things form a process of making and selling pizza.

##### Thread

In computer science, the **thread** of execution is a stream of instructions inside a process that can be scheduled and run independently. Each thread has its executor, and this executor can perform only one thread at a time. Several threads inside the same process can run concurrently or in parallel.

To understand what the term *thread* means, think about employees in a pizzeria. They work according to their job descriptions. They complete various tasks according to the rules stated by the shop using shared resources granted by the shop.

Workers in a pizzeria play the role of thread executors. Tasks that workers accomplish are the threads in the pizza shop "process".

##### Internal or lightweight concurrency

Workers can play different roles during the process of selling pizza. Each of them can concurrently be a vendor, a cashier, or a cook at different points of the process. This concurrency is not among the workers but among the roles each worker plays. An important thing about these roles is that their tasks are typically fast enough and don't require a considerable amount of time and shared resources. They are **lightweight**.

If tasks are lightweight and don't require access to any shared resources except the executor's time and attention, there's no need to run them in different threads. It's cheaper to arrange their concurrent execution with time-slicing *inside one thread*. The concurrency of this sort is called internal for obvious reasons. Often it is also called lightweight because the tasks inside such a thread are typically small and quick.

The following image represents an example of a possible worker's thread with lightweight concurrency using time-slicing:

![img](77-CollectionsFrameworkOverview.assets/a9f562af-eeee-4851-b420-73fe1a2d8328.svg)

##### Conclusion

- ==Processes are some sort of containers for workers' threads, shared resources, and parameters united by a common goal. Each of them always has at least one thread.==
- ==Threads are independent execution units inside a process; they can run concurrently or in parallel with each other.==
- ==Concurrent tasks that compete only for executor's time and don't require a lot of resources to be completed can run concurrently inside the same thread. These tasks are called lightweight, and this type of concurrency is called an internal or lightweight one. The execution inside threads can be synchronous or asynchronous but never parallel.==

## Threads as objects

##### Threads in Java

Java was originally designed with built-in multithreading support. Threads are supported at the level of JVM, at the level of language by special keywords and at the level of the standard library. Every Java program has at least one thread, that is called **main,** created automatically by the JVM process to execute statements inside the `main` method. Any Java program has some other default threads as well (for example, a separate thread for the garbage collector).

Throughout all stages of development of the Java language, the approach to multithreading has changed from the using of low-level threads to some high-level abstractions. However, understanding the fundamental base remains very important for a good developer.

##### A class for threads

Each thread is represented by an object that is an instance of the `java.lang.Thread` class (or its subclass). This class has a static method named `currentThread` to obtain a reference to the currently executing thread object:

```java
Thread thread = Thread.currentThread(); // the current thread
```

Any thread has a name, an identifier (`long`), a priority, and some other characteristics that can be obtained through its methods.

##### The information about the main thread

The example below demonstrates how to obtain the characteristics of the **main** thread by making reference to it through an object of the `Thread`class.

```java
public class MainThreadDemo {
    public static void main(String[] args) {
        Thread t = Thread.currentThread(); // main thread

        System.out.println("Name: " + t.getName());
        System.out.println("ID: " + t.getId());
        System.out.println("Alive: " + t.isAlive());
        System.out.println("Priority: " + t.getPriority());
        System.out.println("Daemon: " + t.isDaemon());

        t.setName("my-thread");
        System.out.println("New name: " + t.getName());
    }
}
```

All statements in this program are executed by the **main** thread.
The invocation `t.isAlive()` returns whether the thread has been started and hasn't died yet. Every thread has a **priority**, and the `getPriority()` method returns the priority of a given thread. Threads with a higher priority are executed in preference to threads with lower priorities. The invocation `t.isDaemon()` checks whether the thread is a **daemon**. ==A daemon thread (comes from UNIX terminology) is a low priority thread that runs in the background to perform tasks such as garbage collection and so on.== JVM does not wait for daemon threads before exiting while it waits for non-daemon threads.

The output of the program will look like:

```java
Name: main
ID: 1
Alive: true
Priority: 5
Daemon: false
New name: my-thread
```

The same code can be applied to any current thread, not just **main**.

## Custom threads

The **main** thread is a starting place from which you may spawn new threads to perform your tasks. To do that you have to write code to be executed in a separated thread and then start it.

##### Create custom threads

==Java has two primary ways to create a new thread that performs a task you need.==

- ==by extending the `Thread` class and overriding its `run` method;==

```java
class HelloThread extends Thread {
    @Override
    public void run() {
        String helloMsg = String.format("Hello, i'm %s", getName());
        System.out.println(helloMsg);
    }
}
```

- ==by implementing the `Runnable` interface and passing the implementation to the constructor of the `Thread` class.==

```java
class HelloRunnable implements Runnable {
    @Override
    public void run() {
        String threadName = Thread.currentThread().getName();
        String helloMsg = String.format("Hello, i'm %s", threadName);
        System.out.println(helloMsg);
    }
}
```

In both cases, you should override the `run` method, which is a regular Java method and contains code to perform a task. What approach to choose depends on the task and on your preferences. If you extend the `Thread` class, you can accept fields and methods of the base class, but you cannot extend other classes since Java doesn't have multiple-inheritance of classes.

Here are two objects obtained by the approaches described above accordingly:

```java
Thread t1 = new HelloThread(); // a subclass of Thread

Thread t2 = new Thread(new HelloRunnable()); // passing runnable
```

And here's another way to specify a name of your thread by passing it to the constructor:

```java
Thread myThread = new Thread(new HelloRunnable(), "my-thread");
```

If you are already familiar with lambda expressions, you may do the whole thing like this:

```java
Thread t3 = new Thread(() -> {
    System.out.println(String.format("Hello, i'm %s", Thread.currentThread().getName()));
});
```

Now you've created objects for threads, but you're not done yet. To perform the tasks you need, you'll have to start them.

##### Starting threads

The class `Thread` has a method called `start()` that is used to start a thread. At some point after you invoke this method, the method `run` will be invoked automatically, but it'll not happen immediately.

Let's suppose that inside the **main** method you create an object of `HelloThread` named `t` and start it.

```java
Thread t = new HelloThread(); // an object representing a thread
t.start();
```

Eventually, it prints something like:

```no-highlight
Hello, i'm Thread-0
```

Here's a picture that explains how a thread actually starts and why it is not happening immediately.



![img](77-CollectionsFrameworkOverview.assets/9dfe86a1-1880-4e14-9635-015d0091c70c.png)



As you may see, there is some delay between starting a thread and the moment when it really starts working (running).

By default, a new thread is running in **non-daemon** mode. Reminder: the difference between the **daemon** and the **non-daemon** mode is that JVM will not terminate the running program while there're still **non-daemon** threads left, while the **daemon** threads won't prevent JVM from terminating.

==Do not confuse methods `run` and `start`. You must invoke `start` if you'd like to execute your code inside `run` in a separate thread. If you invoke `run` directly, the code will be executed in the same thread.==

If you try to start a thread more than once, the `start` throws `IllegalThreadStateException`.

Despite the fact that within a single thread all statements are executed sequentially, it is impossible to determine the relative order of statements between multiple threads without additional measures that we will not consider in this lesson.

Consider the following code:

```java
public class StartingMultipleThreads {

    public static void main(String[] args) {
        Thread t1 = new HelloThread();
        Thread t2 = new HelloThread();
        t1.start();
        t2.start();
        System.out.println("Finished");
    }
}
```

The order of displaying messages may be different. Here is one of them:

```no-highlight
Hello, i'm Thread-1
Finished
Hello, i'm Thread-0
```

It is even possible that all threads may print their text after the **main** thread prints **"Finished":**

```no-highlight
Finished
Hello, i'm Thread-0
Hello, i'm Thread-1
```

This means that even though we call the `start` method sequentially for each thread, we do not know when the `run` method will be actually called.

Do not rely on the order of execution of statements between different threads, unless you've taken special measures.

##### A simple multithreaded program

Let's consider a simple multithreaded program with two threads. The first thread reads numbers from the standard input and prints out their squares. At the same time, the **main** thread occasionally prints messages to the standard output. Both threads work simultaneously.

Here is a thread that reads numbers in a loop and squares them. It has a break statement to stop the loop if the given number is 0.

```java
class SquareWorkerThread extends Thread {
    private final Scanner scanner = new Scanner(System.in);
    public SquareWorkerThread(String name) {
        super(name);
    }
    @Override
    public void run() {
        while (true) {
            int number = scanner.nextInt();
            if (number == 0) {
                break;
            }
            System.out.println(number * number);
        }
        System.out.println(String.format("%s finished", getName()));
    }
}
```

Inside the `main` method, the program starts an object of `SquareWorkerThread` class that writes messages to the standard output from the **main** thread.

```java
public class SimpleMultithreadedProgram {

    public static void main(String[] args) {
        Thread worker = new SquareWorkerThread("square-worker");
        worker.start(); // start a worker (not run!)

        for (long i = 0; i < 5_555_555_543L; i++) {
            if (i % 1_000_000_000 == 0) {
                System.out.println("Hello from the main!");
            }
        }
    }
}
```

Here is an example of inputs and outputs with comments:

```java
Hello from the main!   // the program outputs it
2                      // the program reads it
4                      // the program outputs it
Hello from the main!   // outputs it
3                      // reads it
9                      // outputs it
5                      // reads it
Hello from the main!   // outputs it
25                     // outputs it
0                      // reads it
square-worker finished // outputs it
Hello from the main!   // outputs it
Hello from the main!   // outputs it

Process finished with exit code 0
```

As you can see, this program performs two tasks **"at the same time"**: one in the **main** thread and another one in the **worker** thread. It may not be **"the same time"** in the physical sense, however, both tasks are given some time to be executed.