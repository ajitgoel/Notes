**Functional programming**: writing programs that pass functions around as first-class values.
**Predicate** is function-like that takes a value for an argument and returns true or false.  

**Microservice problems and thier solutions:**

If one microservice stops responding, its clients might get into problems as well and stop responding to requests from their clients. This is especially common in cases where synchronous requests are executed using blocking I/O. **circuit breaker** prevents new outgoing requests from a caller if it detects a problem with the service it calls. 

**Spring Cloud Stream** provides a streaming abstraction over messaging, based on the publish and subscribe integration pattern.
**Message**: A data structure that's used to describe data sent to and received from a messaging system.
**Publisher**: Sends messages to the messaging system
**Subscriber**: Receives messages from the messaging system
**Destination**: Used to communicate with the messaging system. Publishers use output destinations and subscribers use input destinations. Destinations are mapped by the specific binders to queues and topics in the underlying messaging system.
**binder** provides the actual integration with a specific messaging system

**Spring Boot Actuator** enables a number of valuable endpoints for management and monitoring.
**Spring WebFlux** supports the development of **reactive**,  that is, non-blocking, HTTP clients and services.
If we want to switch from Netty to Tomcat as our embedded web server, we can  override the default configuration by excluding Netty from the starter dependency and adding the starter dependency for Tomcat:  
implementation('org.springframework.boot:spring-boot-starter-webflux')  
{  
==exclude group==: 'org.springframework.boot', module: 'spring-bootstarter-reactor-netty'  
}  
implementation('org.springframework.boot:spring-boot-starter-tomcat')
**JPA** stands for Java Persistence API and is a Java specification about how to handle relational data.
 **entity** describes the data that will be stored by Spring Data.
**Repositories** are used to store and access data from different types of database. The base interface, **CrudRepository**, provides us with standard methods for create, read, update, and delete operations.
```
import org.springframework.data.repository.CrudRepository;  
public interface ReviewRepository extends CrudRepository<ReviewEntity, ReviewEntityPK> {  
Collection<ReviewEntity> findByProductId(int productId);  
}
```

Spring Data provides a reactive base interface, **ReactiveCrudRepository**, which enables reactive repositories. The methods in this interface return Mono and Flux objects. **reactive streams** that are capable of returning either 0...1 or 0...m entities as they become available on the stream. The reactive-based  
interface can only be used by Spring Data subprojects that support reactive database drivers; that is, they are based on non-blocking I/O. The **Spring Data MongoDB** subproject supports reactive repositories, while Spring Data JPA does not.

```
import org.springframework.data.repository.reactive.ReactiveCrudRepository;  
import reactor.core.publisher.Flux;  
public interface RecommendationRepository ==extends ReactiveCrudRepository==<RecommendationEntity, String> { 
**==Flux==**<RecommendationEntity> findByProductId(int productId); 
}
```

**Using Streams:**
**Streams API** provides a different way to process data in comparison to the **Collections API**. ==Using a collection, you’re managing the iteration process yourself. You need to iterate through the elements one by one using a foreach loop processing them in turn. using the Streams API, the data processing happens internally inside the library.==

```
import static java.util.stream.Collectors.groupingBy; 
Map<Currency, List<Transaction>> transactionsByCurrencies = transactions.stream() 
.filter((Transaction t) -> t.getPrice() > 1000)  //Filters expensive transactions
.collect(groupingBy(Transaction::getCurrency));//Groups them by currency
```

**Using Functions:**
a. Instead of 
```
File[] hiddenFiles = new File(".").listFiles(new FileFilter() {public boolean accept(File file) {
return file.isHidden();}});//Filtering hidden files! 
```
Do:
```
File[] hiddenFiles = new File(".").listFiles(File::isHidden);//:: means “use this function as a value”  
```

b. Instead of 
```
public interface Predicate<T>{boolean test(T t);}//Included for clarity (normally imported from java.util.function)
static List<Apple> filterApples(List<Apple> inventory, Predicate<Apple> p) {// method is passed as a Predicate parameter named p
List<Apple> result = new ArrayList<>();
for (Apple apple: inventory){
	if (p.test(apple)) {//Does the apple match the condition represented by p? 
			result.add(apple);
		}
	}
	return result;
}
```

Do:
```
filterApples(inventory, (Apple a) -> a.getWeight() < 80 || RED.equals(a.getColor()) );  
or: filter(inventory, (Apple a) -> a.getWeight() < 80 || RED.equals(a.getColor()) );//pass methods to lambdas
```

**Using Optional instead of null:**

**Instead of:**
```
public int readDuration(Properties props, String name) {
	String value = props.getProperty(name);
	if (value != null) {
		try {
			int i = Integer.parseInt(value);
			if (i > 0) {
				return i;
			}
		} 
		catch (NumberFormatException nfe) { }
	}
	return 0;
}  
```

**use:**
```
public int readDuration(Properties props, String name) {
	return Optional.ofNullable(props.getProperty(name))
	.flatMap(OptionalUtility::stringToInt)
	.filter(i -> i > 0)
	.orElse(0);
}```  