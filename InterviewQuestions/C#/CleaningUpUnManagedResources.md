# Cleaning up unmanaged resources

For the majority of the objects that your app creates, you can rely on the [.NET garbage collector](https://docs.microsoft.com/en-us/dotnet/standard/garbage-collection/) to handle memory management. However, when you create objects that include unmanaged resources, you must explicitly release those resources when you finish using them. The most common types of unmanaged resources are objects that wrap operating system resources, such as files, windows, network connections, or database connections. Although the garbage collector is able to track the lifetime of an object that encapsulates an unmanaged resource, it doesn't know how to release and clean up the unmanaged resource.

If your types use unmanaged resources, you should do the following:

- Implement the [dispose pattern](https://docs.microsoft.com/en-us/dotnet/standard/garbage-collection/implementing-dispose). This requires that you provide an [IDisposable.Dispose](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable.dispose) implementation to enable the deterministic release of unmanaged resources. A consumer of your type calls [Dispose](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable.dispose) when the object (and the resources it uses) are no longer needed. The [Dispose](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable.dispose) method immediately releases the unmanaged resources.

- ==In the event that a consumer of your type forgets to call [Dispose](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable.dispose), provide a way for your unmanaged resources to be released.== There are two ways to do this:

  - ==Use a safe handle to wrap your unmanaged resource. This is the recommended technique. Safe handles are derived from the [System.Runtime.InteropServices.SafeHandle](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.interopservices.safehandle) abstract class and include a robust [Finalize](https://docs.microsoft.com/en-us/dotnet/api/system.object.finalize) method. When you use a safe handle, you simply implement the [IDisposable](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable) interface and call your safe handle's [Dispose](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.interopservices.safehandle.dispose) method in your [IDisposable.Dispose](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable.dispose) implementation. The safe handle's finalizer is called automatically by the garbage collector if its [Dispose](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable.dispose) method is not called.==

    —**or**—

  - Override the [Object.Finalize](https://docs.microsoft.com/en-us/dotnet/api/system.object.finalize) method. Finalization enables the non-deterministic release of unmanaged resources when the consumer of a type fails to call [IDisposable.Dispose](https://docs.microsoft.com/en-us/dotnet/api/system.idisposable.dispose) to dispose of them deterministically. Define a [finalizer](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/destructors) by overriding the [Object.Finalize](https://docs.microsoft.com/en-us/dotnet/api/system.object.finalize) method.

   Warning

  However, because object finalization can be a complex and an error-prone operation, ==we recommend that you use a safe handle instead of providing your own finalizer.==

