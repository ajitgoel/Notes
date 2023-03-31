**Fundamentals:**
HandlerInterceptorAdapter


https://docs.spring.io/spring-javaconfig/docs/1.0.0.M4/reference/html/ch02s02.html
## 2.2. `@Bean`
`@Bean` is a method-level annotation and a direct analog of the XML `<bean/>` element. The annotation supports most of the attributes offered by `<bean/>`, such as: `[init-method](http://static.springframework.org/spring/docs/2.5.x/reference/beans.html#beans-factory-lifecycle-initializingbean)`, `[destroy-method](http://static.springframework.org/spring/docs/2.5.x/reference/beans.html#beans-factory-lifecycle-disposablebean)`, `[autowiring](http://static.springframework.org/spring/docs/2.5.x/reference/beans.html#beans-factory-autowire)`, `[lazy-init](http://static.springframework.org/spring/docs/2.5.x/reference/beans.html#beans-factory-lazy-init)`, `[dependency-check](http://static.springframework.org/spring/docs/2.5.x/reference/beans.html#beans-factory-dependencies)`, `[depends-on](http://static.springframework.org/spring/docs/2.5.x/reference/beans.html#beans-factory-dependson)` and `[scope](http://static.springframework.org/spring/docs/2.5.x/reference/beans.html#beans-factory-scopes)`.

### 2.2.1. Declaring a bean

==To declare a bean, simply annotate a method with the `@Bean` annotation. When JavaConfig encounters such a method, it will execute that method and register the return value as a bean within a `BeanFactory`.== By default, the bean name will be the same as the method name (see [bean naming](https://docs.spring.io/spring-javaconfig/docs/1.0.0.M4/reference/html/ch02s02.html) for details on how to customize this behavior). The following is a simple example of a `@Bean` method declaration:

@Configuration
public class AppConfig {
    @Bean
    public TransferService transferService() {
        return new TransferServiceImpl();
    }
}
                

For comparison sake, the configuration above is exactly equivalent to the following Spring XML:

```
<beans>
    <bean name="transferService" class="com.acme.TransferServiceImpl"/>
</beans>
```

Both will result in a bean named `transferService` being available in the `BeanFactory` / `ApplicationContext`, bound to an object instance of type `TransferServiceImpl`:
transferService -> com.acme.TransferServiceImpl

### 2.2.2. Injecting dependencies

When `@Bean`s have dependencies on one another, expressing that dependency is as simple as having one bean method call another:
@Configuration
public class AppConfig {
    @Bean
    public Foo foo() {
        return new Foo(bar());
    }
    @Bean
    public Bar bar() {
        return new Bar();
    }
}
                
In the example above, the `foo` bean recevies a reference to `bar` via constructor injection.

-----------
### What is the difference between @Component and @ComponentScan?
@Component and @ComponentScan are for different purposes.
-   ==@Component indicates that a class might be a candidate for creating a bean. Its like putting a hand up.==
-   ==@ComponentScan is searching packages for Components. Trying to find out who all put their hands up.==

### Component Scan in a Spring Boot Project
Executive Summary
-   If your other packages hierarchies are below your main app with the @SpringBootApplication annotation, you’re covered by implicit components scan.
-   If there are beans/components in other packages which are not sub packages of the main package, you should manually add them as @ComponentScan
 
####### Detailed Example

Consider the class below:

```
package com.in28minutes.springboot.basics.springbootin10steps;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
@SpringBootApplication
public class SpringbootIn10StepsApplication {
	public static void main(String[] args) {
		ApplicationContext applicationContext = 
				SpringApplication.run(SpringbootIn10StepsApplication.class, args);
		
		for (String name : applicationContext.getBeanDefinitionNames()) {
			System.out.println(name);
		}
	}
}
```

`@SpringBootApplication` is defined on `SpringbootIn10StepsApplication class` which is package `com.in28minutes.springboot.basics.springbootin10steps.`

`@SpringBootApplication` defines an automatic component scan on package `com.in28minutes.springboot.basics.springbootin10steps`.
You are fine if all your components are defined in the above package or a sub-package of it.
However, let’s say one of the components is defined in a package `com.in28minutes.springboot.somethingelse`
In this case, you would need add the new package into component scan.
Two Options
-   Define @ComponentScan(“com.in28minutes.springboot”)
    -   This would scan the entire parent tree of com.in28minutes.springboot.
-   Or Define two specific Component Scans by using an array.
-   @ComponentScan({“com.in28minutes.springboot.basics.springbootin10steps”,”com.in28minutes.springboot.somethingelse”})

Option 1
```
@ComponentScan(“com.in28minutes.springboot”)
@SpringBootApplication
public class SpringbootIn10StepsApplication {
```

Option 2
```
@ComponentScan({"com.in28minutes.springboot.basics.springbootin10steps","com.in28minutes.springboot.somethingelse"})
@SpringBootApplication
public class SpringbootIn10StepsApplication {
```
----------------------
### Spring boot @ComponentScan vs @Import
https://stackoverflow.com/questions/61153698/spring-boot-componentscan-vs-import

`@Import` is used to import Java configuration classes marked with `@Configuration/@Component` typically. So if you have a bean inside this component, Spring will load it into Application Context. You can just put the name of the component or class and Spring will pull it up for you.
However, by using `@ComponentScan`, you tell the application which packages to scan for java classes are annotated with `@Configuration/@Component` (or any of `@Component's` sub-annotations like `@Service` or `@Repository` etc) and load all of them up in Application Context so they can be autowired when required. If there are inner instances that need to be populated, Spring will take care of it.