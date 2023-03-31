**Class and Interface declarations:**
https://www.oracle.com/java/technologies/javase/codeconventions-fileorganization.html

![[Pasted image 20221203212014.png]]

--------

**Tip 1:**
If the system is unable to detect unit tests on the clouddesktop, then it could be because Cloud Desktop does not support Junit 4. To change all the added unit tests to Junit 5, turn on the following setting
![[Pasted image 20221014140712.png]]
Then click option + return button on mac=> popup=> Change tests from Junit 4 to 5. 

-------

**Object to JSON string:**
```java
Gson gson = new Gson();
String json = gson.toJson(obj);
```

**The try-with-resources Statement**
https://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html

==The `try`-with-resources statement is a `try` statement that declares one or more resources. A _resource_ is an object that must be closed after the program is finished with it. The `try`-with-resources statement ensures that each resource is closed at the end of the statement. Any object that implements `java.lang.AutoCloseable`, which includes all objects which implement `java.io.Closeable`, can be used as a resource.==
The following example reads the first line from a file. It uses an instance of `FileReader` and `BufferedReader` to read data from the file. `FileReader` and `BufferedReader` are resources that must be closed after the program is finished with it:
	static String readFirstLineFromFile(String path) throws IOException {
	    **try (FileReader fr = new FileReader(path);
	         BufferedReader br = new BufferedReader(fr))** {
	        return br.readLine();
	    }
	}	
In this example, the resources declared in the `try`-with-resources statement are a `FileReader` and a `BufferedReader`. The declaration statements of these resources appear within parentheses immediately after the `try` keyword. The classes `FileReader` and `BufferedReader`, in Java SE 7 and later, implement the interface `java.lang.AutoCloseable`. ==Because the `FileReader` and `BufferedReader` instances are declared in a `try`-with-resource statement, they will be closed regardless of whether the `try` statement completes normally or abruptly (as a result of the method `BufferedReader.readLine` throwing an `IOException`).==