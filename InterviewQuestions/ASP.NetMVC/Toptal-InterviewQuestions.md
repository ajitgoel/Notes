**[ASP.NET MVC 5] What basic folders do we have in an ASP.NET project without Areas? What are they for? What subfolders do they have (if applicable)? Which folders are publicly accessible?**

- x`App_Data` can be used to store some application’s data.
- `App_Start` contains configuration classes: `RouteConfig`, `BundleConfig`, etc.
- `Content` is a publicly accessible folder for static files, such as CSS files, images, etc., but not scripts.
- `Controllers` is a default folder for application controllers.
- `Scripts` is a publicly accessible folder for JavaScript files.
- `Views`: The folder contains a folder for every controller, plus a special folder `Shared` for views used by multiple views/controllers. For example, if we have a controller called `HomeController`, we will have a `Home` subfolder here with all the views related to `HomeController`.

**[ASP.NET Core MVC] What basic folders do we have in an ASP.NET Core project using the MVC template without Areas? What are they for? What subfolders do they have (if applicable)? Which folders are publicly accessible?**

- `wwwroot`: The root folder of a site, publicly accessible, contains subfolders for static files (CSS, images, JS, etc.).
- `Controllers`: A default folder for application controllers
- `Views`: The folder contains a folder for every controller, plus a special folder `Shared` for views used by multiple views/controllers. For example, if we have a controller called `HomeController`, we will have a `Home` subfolder here with all the views related to `HomeController`.

**What does MVC mean?**

**M**odel-**V**iew-**C**ontroller is an architectural pattern.The main idea is to separate business logic from an application’s UI.

Application logic is located in controllers. Views are responsible for the rendering of the appropriate UI. Models are usually used to transfer data back and forth between controllers and views. Some people also use them for wrapping business logic, sharing the model with an ORM tool. But it’s better to use the model only for transfering data (as a data transfer object) and as a validation contract (by marking the model’s properties with data annotation attributes).

**You have a controller `CategoriesController` with actions `ShowAll`, `Add`, and `Delete`. You’ve got several requirements related to application URLs:**

| **URL**                    | **Action**  | **Method** |
| :------------------------- | :---------- | :--------- |
| **~/v2/Categories**        | **ShowAll** | **GET**    |
| **~/v2/Categories/Add**    | **Add**     | **POST**   |
| **~/v2/Categories/Delete** | **Delete**  | **DELETE** |

**What is the easiest way to achieve that?**

**In ASP.NET MVC 5:**

Use a custom route and attributes on action methods to restrict HTTP methods.

Step 1: We need to add a custom route to `RoutesCollection` (usually in `~/App_Start/RoutesConfig`) *before* the default one:

```csharp
routes.MapRoute(name: "v2", url: "v2/{controller}/{action}", defaults: new { action = "ShowAll" });
```

Step 2: To restrict HTTP methods for actions, we need to mark `CategoriesController`’s methods with the attributes `[HttpGet]`, `[HttpPost]`, and `[HttpDelete]` according to our requirements.

------

**In ASP.NET Core MVC:**

There are three ways to fulfill these requirements.

### Option #1: Add a custom global route and attributes on action methods to restrict HTTP methods.

Step 1: We need to add a custom global route (usually in `Startup.cs`) *before* the default one:

```csharp
routes.MapRoute(name: "v2", template: "v2/{controller}/{action=ShowAll}");
```

Step 2: To restrict HTTP methods for actions, we need to mark `CategoriesController`’s methods with the attributes `[HttpGet]`, `[HttpPost]`, and `[HttpDelete]` according to our requirements.

This is a good approach for applications without specific requirements for a URL scheme.

### Option #2: Configure routes at the action level.

Steps:

1. Mark actions with attributes to restrict allowed HTTP methods.
2. Specify route templates via attributes:

```csharp
        [HttpGet]
        [Route("v2/[controller]")]
        public IActionResult ShowAll()
        {
            return View();
        }
        [HttpPost]
        [Route("v2/[controller]/[action]")]
        public IActionResult Add()
        {
            return View();
        }
```

This is a good decision if you have specific requirements for a URL scheme, e.g., a REST API.

#### Option #3: Configure a base route on a controller level and relative routes on an action level.

Steps:

1. Specify a basic controller route template with an attribute.
2. Mark actions with attributes to restrict allowed HTTP methods.
3. Specify relative route templates via attributes:

```csharp
    [Route("v2/[controller]")]
    public class CategoriesController : Controller
    {
        [HttpGet]
        [Route("")]
        public IActionResult ShowAll()
        {
            return View();
        }
        [HttpPost]
        [Route("[action]")]
        public IActionResult Add()
        {
            return View();
        }
    // ...
```

This is also a good decision if you have specific requirements for a URL scheme. In fact, it can be a better option than the previous one if you always have a constant string or a controller name as a prefix for your routes.

By default, you have the master page in your application `~/Views/Shared/_Layout.cshtml` and you’ve created a new one `~/Views/Shared/_LayoutV2.cshtml`. How do you apply the new master page to the whole application, except pages with a non-default layout?

In both ASP.NET MVC 5 and ASP.NET Core MVC, you have to adjust the file `~/Views/_ViewStart.cshtml`.

**In ASP.NET MVC 5:**

```csharp
@{
    Layout = "~/Views/Shared/_LayoutV2.cshtml";
}
```

------

**In ASP.NET Core MVC:**

```csharp
@{
    Layout = "_LayoutV2";
}
```

**What is the recommended approach for ASP.NET MVC to globally intercept exceptions? What other functionality can be implemented with the approach?**

You can create a custom exception filter to intercept and log unhandled exceptions.

==**In ASP.NET MVC 5:**==

==To intercept exceptions globally, the filter should be registered in `GlobalFilterCollection` (usually in `~/App_Start/FilterConfig`).== Authentication, authorization, custom action filters, logging, and action result transformation can be done with the same approach.

------

**In ASP.NET Core MVC:**

To intercept exceptions globally, the filter should be registered in `Startup.ConfigureServices()` as shown below:

```csharp
services.AddMvc(options => { options.Filters.Add(new ApiExceptionFilter()); });
```

Authorization, custom action filters (sync and async), and action result transformation can be done with the same approach.

**What are the advantages of using IoC containers in an application?**

The main advantages are:

- The lifetime of every object can be managed externally.
- Objects are not responsible for creating services and providing dependencies.
- Changes to a dependency list won’t affect an object using the service.
- The same instance can be shared by several unrelated consumers.
- Services provide contracts, so implementation can be changed in the future.

**What is the most appropriate lifetime for a database connection/ORM context in an ASP.NET MVC application?**

The lifetime should be the same as the request, because usually requests don’t live very long. Where it’s possible to wrap the whole request in one transaction, this can help comply with ACID principles.

**What is an ORM, and why would you use one instead of plain old ADO.NET?**

An ORM is an object relational mapping framework. Such a framework can help to reduce the amount of handwritten code in a typical web application. ORM can be used when there are no extreme requirements for performance in an application, but there are some frameworks (e.g., Dapper) which can be used even in high-load systems.

==**[ASP.NET MVC 5] Is that OK to place a `log.txt` file in the `~/bin/` folder of an ASP.NET MVC application? Will it affect the app?**==

==It is not a good idea to put log files in the `bin` folder of an application, because every change will cause a pool restart.== You will face performance problems and unless you already know this, it will be difficult to track down the reason.

**[ASP.NET Core MVC] You have a `CategoriesController` and an `Add` action with the next signature looking like this:**

```csharp
[HttpPost]
public IActionResult Add(NewCategoryModel model)
```

**You have to explicitly specify that the parameter `model` should be extracted from a request body. How would you achieve that?**

==Add `[FromBody]` like so:==

```csharp
[HttpPost]
public IActionResult Add([FromBody]NewCategoryModel model)
```

**[ASP.NET MVC 5] You have an ASP.NET MVC application where you need to use ASP.NET session state and support running across several servers. What additional configuration can you perform without writing custom code?**

==In the `Web.config` file ([in the root folder of your application](https://msdn.microsoft.com/en-us/library/ms178581.aspx)) set `sessionState` to `StateServer` for shared in-memory storage or `SQLServer` for shared durable storage.==

**[ASP.NET Core MVC] You have an ASP.NET Core MVC application where you need to use some cache solution and support running across several servers. What are your steps?**

There are several answers, because ASP.NET Core is a new platform and supports several approaches. The candidate has to stress that, in the project, we need to use some kind of distributed cache—for example, Redis. Also, Microsoft provides several packages to help with this. In the case of Redis, [Microsoft.Extensions.Caching.Redis](https://www.nuget.org/packages/Microsoft.Extensions.Caching.Redis/) provides the middleware and implements [IDistributedCache](https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.caching.distributed.idistributedcache) to provide a standardized way to work with it.

**[ASP.NET MVC 5] You have a page with Razor C# syntax. What is the difference between these two methods, `RenderAction` and `RenderPartial`? What will they do?**

```csharp
@{
    Html.RenderAction("Add");
    Html.RenderPartial("Add");
}
```

==RenderAction` will call an action method of the current controller and render a result inline. In contrast, `RenderPartial` will render the specified view inline without calling any action method.==

**What is the difference between asynchronous and synchronous actions? When would you use asynchronous actions?**

Asynchronous actions won’t block the executing thread if it waits for an I/O operation. Using asynchronous actions can increase the throughput of a system if you use such a pattern for I/O operations, but it won’t help with CPU-bound operations.