ASP.NET MVC Page Life Cycle:
According to MSDN the following are the main steps involved in asp.net mvc page life cycle:

**1) Routing** routes url to its controller and action In ASP.NET application each asp.net page implements the IHTTPHandler interface. This interface has a ProcessRequest() method that gets called when you request the page. The ProcessRequest() method is responsible for processing the request and generating the response. So in ASP.NET application it is simple, you request for a page in the url like //mysite1\default.aspx and then it search for that page on the disk and execute the processrequest method and generate the response.However in MVC application it doesn’t work in that way. There is no physical page exist for a particular request. All the requests are routed to a special class called Controller. The controller is responsible for generating the response and sending the content back to the browser.

**2)Url Routing Module intercepts the Request:** Whenever you make a request against an ASP.NET MVC application, the request is intercepted by the UrlRoutingModule HTTP Module. When the UrlRoutingModule intercepts a request, the first thing the module does is to wrap up the current HttpContext in an HttpContextWrapper object. The HttpContextWrapper object derives from HTTPContextBase class.

**3)MVC Handler Executes** MVCHandler also inherit from the IHTTPAsyncHandler. When MVC Handler executes it will call the BeginProcessRequest method of the httpAsyncHandler asynchronously. When the process request method is called a new controller gets created. The controller is created from a ControllerFactory. There is a ControllerBuilder Class which will set the ControllerFactory. You can create your own ControllerFactory as well but by default it will be DefaultControllerFactory. The RequestContext and the name of the Contoller will be passed to the method CreateController Method to get the particular Contoller.

**4) Controller Executes** controller is called and its action called requested by user. The Execute() method starts by creating the TempData object. TempData is a dictionary derived from TempDataDictionary class and stored in short lives session and it is a string key and object value. The Execute() method gets the Action from the RouteData based on the URL.The Controller Class then call the ContollerActionInvoker that builds a list of parameters from the request. These parameters, extracted from the request parameters, will act as method parameters.The parameters will be passed to whatever controller method gets executed. Finally It will call the InvokeAction method to execute the Action.

**5)Render View Method Called**at last when we call return View() Render View method is called and puts reponse on the page to be displayed. The Controller typically either executes either the RedirectToAction Method or the RenderView Method. When you call a controller’s RenderView() method,the call is delegated to the current ViewEngine’s RenderView() method. The WebFormViewEngine.RenderView() method uses a class named the ViewLocator class to find the view. Next, it uses a BuildManager to create an instance of a ViewPage class from its path. Next, if the page has a master page, the location of the master page is set If the page has ViewData, the ViewData is set. Finally, the RenderView() method is called on the ViewPage.

**ASP.NET MVC Action Results:**
The ASP.NET MVC framework supports several types of action results including:
\1. ViewResult – Represents HTML and markup.
\2. EmptyResult – Represents no result.
\3. RedirectResult – Represents a redirection to a new URL.
\4. JsonResult – Represents a JavaScript Object Notation result that can be used in an AJAX application.
\5. JavaScriptResult – Represents a JavaScript script.
\6. ContentResult – Represents a text result.
\7. FileContentResult – Represents a downloadable file (with the binary content).
\8. FilePathResult – Represents a downloadable file (with a path).
\9. FileStreamResult – Represents a downloadable file (with a file stream).

