==React's `useRef` hook is primarily used to access and store mutable values that persist across render cycles of a functional component. It allows you to create a reference to a specific element or value, and this reference remains consistent throughout the component's lifecycle.==
Here's an example to illustrate the use of `useRef`:
```
import React, { useRef, useEffect } from 'react';
function ExampleComponent() {
  const inputRef = useRef(null);
  useEffect(() => {
    // Focus the input element when the component mounts
    inputRef.current.focus();
  }, []);
  const handleSubmit = () => {
    // Get the value from the input element using the ref
    const value = inputRef.current.value;
    console.log(value);
  };
  return (
    <div>
      <input type="text" ref={inputRef} />
      <button onClick={handleSubmit}>Submit</button>
    </div>
  );
}
```
In this example, we create a `ref` called `inputRef` using the `useRef` hook. We then assign this `ref` to the `ref` prop of the input element. This allows us to access the DOM node of the input element via `inputRef.current`. In the `useEffect` hook, we use `inputRef.current.focus()` to automatically focus on the input element when the component mounts.
Later, when the "Submit" button is clicked, we retrieve the value of the input element using `inputRef.current.value`. The `ref` allows us to access the input element's value without needing to rely on state or event handlers.
==`useRef` can also be used to store any mutable value that needs to persist across renders,== not just DOM elements. Here's another example:
```
import React, { useRef } from 'react';
function ExampleComponent() {
  const counterRef = useRef(0);
  const incrementCounter = () => {
    counterRef.current += 1;
    console.log(counterRef.current);
  };
  return (
    <div>
      <p>Counter: {counterRef.current}</p>
      <button onClick={incrementCounter}>Increment</button>
    </div>
  );
}
```
In this example, we create a `ref` called `counterRef` and initialize it with a value of 0 using `useRef(0)`. Every time the "Increment" button is clicked, we update the value of `counterRef.current` directly, and the updated value is displayed in the paragraph element. Since the `ref` value persists across renders, the counter value will be preserved even if the component re-renders due to other state or prop changes.
To summarize, ==`useRef` is useful for accessing and storing mutable values across render cycles. It can be used to reference DOM elements or store any other value that needs to persist without triggering a re-render.==