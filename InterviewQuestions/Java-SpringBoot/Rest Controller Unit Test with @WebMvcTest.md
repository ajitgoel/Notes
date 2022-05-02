==//@WebMvcTest disables full auto-configuration (@Component, @Service or @Repository beans will not be scanned) and apply only configuration relevant to the web layer (@Controller, @ControllerAdvice, //@JsonComponent, WebMvcConfigurer beans…).==

@WebMvcTest(TutorialController.class)==//only one TutorialController is instantiated==
public class TutorialControllerTests {
  ==@MockBean //to create and inject a mock of the `TutorialRepository`.==
  private TutorialRepository tutorialRepository;
  @Autowired
  ==private MockMvc mockMvc; //Used to fake HTTP requests. Spring Boot autoconfigures the MockMvc bean==.
  @Test
  void shouldDoSomething() throws Exception {
    // set expectation for TutorialRepository using Mockito
    when(tutorialRepository...).thenReturn(...);
    // perform HTTP request and set the expectations with MockMVC
    mockMvc.perform(...).andExpect(...).andExpect(...);
  }
}

------

https://spring.io/guides/gs/testing-web/

**<u>src/main/java/com/example/testingweb/TestingWebApplication.java</u>**
package com.example.testingweb;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
public class TestingWebApplication {
public static void main(String[] args) {
	SpringApplication.run(TestingWebApplication.class, args);
}
}

**<u>src/test/java/com/example/testingweb/TestingWebApplicationTest.java</u>**
==//simple sanity check test that will fail if the application context cannot start.==
package com.example.testingweb;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
@SpringBootTest ==//tells Spring Boot to look for a main configuration class (one with `@SpringBootApplication` and use that to start a Spring application context.==
public class TestingWebApplicationTests {
	@Autowired
	private HomeController controller;
@Test
public void contextLoads() throws Exception{
	assertThat(controller).isNotNull(); ==//  [AssertJ](https://joel-costigliola.github.io/assertj/) provides `assertThat()`. To convince yourself that the context is creating your controller, add an assertion==
}
}

package com.example.testingweb;
import org.springframework.stereotype.Service;
@Service
public class GreetingService {
	public String greet() {
		return "Hello, World";
               	}
}

**<u>src/main/java/com/example/testingweb/GreetingService.java:</u>**

package com.example.testingweb;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class GreetingController {
private final GreetingService service;
public GreetingController(GreetingService service) {
	this.service = service;
}
@RequestMapping("/greeting")
public @ResponseBody String greeting() {
	return service.greet();
}
}

**<u>src/test/java/com/example/testingweb/WebMockTest.java</u>**
package com.example.testingweb;
import static org.hamcrest.Matchers.containsString;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.Test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;

==@WebMvcTest(GreetingController.class)==
public class WebMockTest {
@Autowired
private MockMvc mockMvc;

==@MockBean==
private GreetingService service;==//use `@MockBean` to create and inject a mock for the `GreetingService` (if you do not do so, the application context cannot start)==

==@Test==
public void greetingShouldReturnMessageFromService() throws Exception {
	when(service.greet()).thenReturn("Hello, Mock"); ==//set expectations using `Mockito`==
	this.mockMvc.perform(get("/greeting")).andDo(print()).andExpect(status().isOk())
			.andExpect(content().string(containsString("Hello, Mock")));
}
}

**<u>src/test/java/com/example/testingweb/HttpRequestTest.java</u>**

@SpringBootTest(==webEnvironment = WebEnvironment.RANDOM_PORT==)
public class HttpRequestTest {
==@LocalServerPort==
private int port;
@Autowired
private TestRestTemplate restTemplate;
@Test
public void greetingShouldReturnDefaultMessage() throws Exception {
	assertThat(this.restTemplate.getForObject("http://localhost:" + port + "/",String.class)).contains("Hello, World");
}
}