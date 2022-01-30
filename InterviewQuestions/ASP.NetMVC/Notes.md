**<u>ASP.NET MVC Page Life Cycle:</u>**

1. ## Routing

   Asp.net Routing is the first step in MVC request cycle. Basically it is a pattern matching system that matches the request’s URL against the registered URL patterns in the Route Table. When a matching pattern found in the Route Table, the Routing engine forwards the request to the corresponding IRouteHandler for that request. The default one calls the `MvcHandler`. The routing engine returns a 404 HTTP status code against that request if the patterns is not found in the Route Table.

   ![img](https://web.archive.org/web/20160819080355im_/http://www.dotnet-tricks.com/Content/images/mvc/mvcrequestcycle.png)

   When application starts at first time, it registers one or more patterns to the Route Table to tell the routing system what to do with any requests that match these patterns. An application has only one Route Table and this is setup in the Global.asax file of the application.

   ```c
    public static void RegisterRoutes(RouteCollection routes)
    { 
   routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
    routes.MapRoute( "Default", // Route name
    "{controller}/{action}/{id}", // URL with parameters
    new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
    ); 
   } 
   ```

   

2. ## MvcHandler

   The MvcHandler is responsible for initiating the real processing inside ASP.NET MVC. MVC handler implements IHttpHandler interface and further process the request by using `ProcessRequest` method as shown below:

   ```c
   protected internal virtual void ProcessRequest(HttpContextBase httpContext)
   {
    SecurityUtil.ProcessInApplicationTrust(delegate {
    IController controller;
    IControllerFactory factory;
    this.ProcessRequestInit(httpContext, out controller, out factory);
    try
    {
    controller.Execute(this.RequestContext);
    }
    finally
    {
    factory.ReleaseController(controller);
    }
    });
   }
   ```

3. ## Controller

   As shown in above code, MvcHandler uses the IControllerFactory instance and tries to get a IController instance. If successful, the Execute method is called. The IControllerFactory could be the default controller factory or a custom factory initialized at the `Application_Start` event, as shown below:

   ```c
   protected void Application_Start()
   {
    AreaRegistration.RegisterAllAreas();
    RegisterRoutes(RouteTable.Routes);
    ControllerBuilder.Current.SetControllerFactory(new CustomControllerFactory());
   }
   ```

4. ## Action Execution

   Once the controller has been instantiated, Controller's ActionInvoker determines which specific action to invoke on the controller. Action to be execute is chosen based on attributes `ActionNameSelectorAttribute` (by default method which have the same name as the action is chosen) and `ActionMethodSelectorAttribute`(If more than one method found, the correct one is chosen with the help of this attribute).

5. ## View Result

   The action method receives user input, prepares the appropriate response data, and then executes the result by returning a result type. The result type can be ViewResult, RedirectToRouteResult, RedirectResult, ContentResult, JsonResult, FileResult, and EmptyResult.

6. ## View Engine

   The first step in the execution of the View Result involves the selection of the appropriate View Engine to render the View Result. It is handled by `IViewEngine` interface of the view engine. By default Asp.Net MVC uses `WebForm` and `Razor` view engines. You can also register your own custom view engine to your Asp.Net MVC application as shown below:

   ```c
   protected void Application_Start() 
   { 
    //Remove All View Engine including Webform and Razor
    ViewEngines.Engines.Clear();
    //Register Your Custom View Engine
    ViewEngines.Engines.Add(new CustomViewEngine());
    //Other code is removed for clarity
   } 
   ```

7. ## View

   Action method may returns a text string,a binary file or a Json formatted data. The most important Action Result is the ViewResult, which renders and returns an HTML page to the browser by using the current view engine.

------

**<u>ASP.NET MVC Page Life Cycle:</u>**
According to MSDN the following are the main steps involved in asp.net mvc page life cycle:

**1) Routing** routes url to its controller and action In ASP.NET application each asp.net page implements the IHTTPHandler interface. This interface has a ProcessRequest() method that gets called when you request the page. The ProcessRequest() method is responsible for processing the request and generating the response. So in ASP.NET application it is simple, you request for a page in the url like //mysite1\default.aspx and then it search for that page on the disk and execute the processrequest method and generate the response.However in MVC application it doesn’t work in that way. There is no physical page exist for a particular request. All the requests are routed to a special class called Controller. The controller is responsible for generating the response and sending the content back to the browser.

**2)Url Routing Module intercepts the Request:** Whenever you make a request against an ASP.NET MVC application, the request is intercepted by the UrlRoutingModule HTTP Module. When the UrlRoutingModule intercepts a request, the first thing the module does is to wrap up the current HttpContext in an HttpContextWrapper object. The HttpContextWrapper object derives from HTTPContextBase class.

**3)MVC Handler Executes** MVCHandler also inherit from the IHTTPAsyncHandler. When MVC Handler executes it will call the BeginProcessRequest method of the httpAsyncHandler asynchronously. When the process request method is called a new controller gets created. The controller is created from a ControllerFactory. There is a ControllerBuilder Class which will set the ControllerFactory. You can create your own ControllerFactory as well but by default it will be DefaultControllerFactory. The RequestContext and the name of the Contoller will be passed to the method CreateController Method to get the particular Contoller.

**4) Controller Executes** controller is called and its action called requested by user. The Execute() method starts by creating the TempData object. TempData is a dictionary derived from TempDataDictionary class and stored in short lives session and it is a string key and object value. The Execute() method gets the Action from the RouteData based on the URL.The Controller Class then call the ContollerActionInvoker that builds a list of parameters from the request. These parameters, extracted from the request parameters, will act as method parameters.The parameters will be passed to whatever controller method gets executed. Finally It will call the InvokeAction method to execute the Action.

**5)Render View Method Called **at last when we call return View() Render View method is called and puts reponse on the page to be displayed. The Controller typically either executes either the RedirectToAction Method or the RenderView Method. When you call a controller’s RenderView() method,the call is delegated to the current ViewEngine’s RenderView() method. The WebFormViewEngine.RenderView() method uses a class named the ViewLocator class to find the view. Next, it uses a BuildManager to create an instance of a ViewPage class from its path. Next, if the page has a master page, the location of the master page is set If the page has ViewData, the ViewData is set. Finally, the RenderView() method is called on the ViewPage.

**ASP.NET MVC Action Results:**
The ASP.NET MVC framework supports several types of action results including:
ViewResult – Represents HTML and markup. 
EmptyResult – Represents no result.
RedirectResult – Represents a redirection to a new URL.
JsonResult – Represents a JavaScript Object Notation result that can be used in an AJAX application.
JavaScriptResult – Represents a JavaScript script.
ContentResult – Represents a text result.
FileContentResult – Represents a downloadable file (with the binary content).
FilePathResult – Represents a downloadable file (with a path).
FileStreamResult – Represents a downloadable file (with a file stream).

