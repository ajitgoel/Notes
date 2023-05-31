==Higher-Order Components (HOCs) are a design pattern in React that allow you to enhance the functionality of a component by wrapping it with another component. HOCs take a component as input and return a new component with additional capabilities.==
```
import React, { useEffect } from 'react';
//takes WrappedComponent comp as input & returns new WithLogger function comp that adds logging //functionality.
function withLogger(WrappedComponent) {
  return function WithLogger(props) {
    useEffect(() => {
      console.log('Component rendered:', WrappedComponent.name);
      return () => {
        console.log('Component unmounted:', WrappedComponent.name);
      };
    }, []);
//`WithLogger` comp renders WrappedComponent & passes all props to it using spread operator (`{...props}`).
    return <WrappedComponent {...props} />;
  };
}
// Component to be wrapped with the HOC
function MyComponent({ name }) {
  return <div>Hello, {name}!</div>;
}
// Wrap the component using the HOC
const EnhancedComponent = withLogger(MyComponent);
// Usage example
function App() {
  return <EnhancedComponent name="John" />;
}

```

In this example, we define a Higher-Order Component called `withLogger`. It takes a component (in this case, `WrappedComponent`) as input and returns a new function component (`WithLogger`) that adds logging functionality.
The `WithLogger` component uses the `useEffect` hook to log a message when the component is rendered and unmounted. Inside the `useEffect` hook, we log the name of the `WrappedComponent` using `WrappedComponent.name`.
The `WithLogger` component then renders the `WrappedComponent` and passes all the props to it using the spread operator (`{...props}`).
To use the HOC, we wrap the `MyComponent` component with the `withLogger` function, creating a new component called `EnhancedComponent`.
In the `App` component, we use the `EnhancedComponent`, which is the wrapped version of `MyComponent`. The `EnhancedComponent` will have the logging functionality provided by the `withLogger` HOC.
==By using Higher-Order Components, you can enhance the functionality of components by encapsulating common logic or behavior in a reusable wrapper component. This pattern promotes code reuse and allows you to add additional capabilities to multiple components without duplicating code.==