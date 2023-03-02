# JavaScript ES6 Tutorial: A complete crash course on modern JS

In June 2015, there was a significant update to JavaScript, ushering in tons of new features including arrow functions, class destruction, and template strings, and more. Over the past years, these features continue to be updated to make your work with JS easier.

We don’t want you to be left behind with old ES5 code, so today let’s walk you through the most important updates to JavaScript since 2015 with an introduction on how to use each feature.

**Here is what we will cover today:**

- [Part 1: Overview of JavaScript Updates](https://www.educative.io/blog/javascript-es6-tutorial-a-complete-crash-course#overview)
- [Part 2: The Most Important ES6 Updates](https://www.educative.io/blog/javascript-es6-tutorial-a-complete-crash-course#ES6)
- [Part 3: The Most Important ES2016 Updates](https://www.educative.io/blog/javascript-es6-tutorial-a-complete-crash-course#ES2016)
- [Part 4: The Most Important ES2017 Updates](https://www.educative.io/blog/javascript-es6-tutorial-a-complete-crash-course#ES2017)
- [Part 5: The Most Important ES2018 Updates](https://www.educative.io/blog/javascript-es6-tutorial-a-complete-crash-course#ES2018)
- [Part 6: The Most Important ES2019 Updates](https://www.educative.io/blog/ES2019)

#### **Get up-to-speed with all the newest JS features**Get hands-on practice with all the newest features you’ll need to land a JavaScript interview**[The Complete Guide to Modern JavaScript](https://www.educative.io/courses/complete-guide-to-modern-javascript)**

## Part 1: Overview of JavaScript Updates

**JavaScript (JS)** is a lightweight, object-oriented, interpreted programming language. In 1996, Netscape submitted JS to ECMA International to be standardized, which lead to a new version of the language called ECMAScript.

It took nearly 15 years for ECMAScript to see major changes, and since then, it has been updated regularly. Let’s briefly outline the history of ECMAScript updates over the past decade.

### ECMAScript 2

The first standardized version of ECMAScript was released in 1997. ECMAScript 2 followed a year later, bringing minor changes to modernize the language with ISO standards.

### ECMAScript 3

ECMAScript 3 was released in 1999 and ushered in many new popular features, including expression, try/catch exception handling, and more. After ECMAScript 3, no changes were made to the official standard for many years.

### ECMAScript 4

ECMAScript 4 was proposed as a significant upgrade in the mid-2000s. There was some controversy over these updates, and ES4 was scrapped.

### ECMAScript 5

ECMAScript 5 (ES5) came along in 2009 with subtle changes to ES3 so that JavaScript could be supported in all browsers. The desire for a more robust update began around 2012 when there was a stronger push to abandon support for Internet Explorer.

### ECMAScript 6

The next big update occurred in 2015 when **ECMAScript 6 (ES6)** or **ECMAScript 2015 (ES2015)** was officially released. ES6 features modernized JavaScript.

### And beyond

There have been four more updates since that time: **ECMAScript 2016, 2017, 2018, and 2019**. The name ES.Next is given to the upcoming version, which is still in revision and proposal.

> In general, ECMAScript is the title used to refer to the formal standardized language, while JS is used when programmers discuss the language in practice.

Now that you have a sense of the evolving history of JavaScript, let’s jump right into the changes and additions we have seen over the years since 2015.

## Part 2: The Most Important ES6 Updates

### Block-Scoped Let and Const

ES6 introduced the keywords `let` and `const` that enable us to declare variables much easier. Previously, variables declared with `var` are function scoped, so if we declare them inside a `for` loop they will be available outside of the loop.

==Variables declared with `let` and `const` are block-scoped, which means they are only accessible within the block where they were declared. So, if we declare a variable with `let`, it does not change its value in the outer scope. `Const` is similar, but the value of variables declared with this keyword cannot change through reassignment.==

// using `let`
let x = "global";
if (x === "global") {
 let x = "block-scoped";
 console.log(x);
 // expected output: block-scoped
}
console.log(x);
// expected output: global
// using `var`
var y = "global";
if (y === "global") {
 var y= "block-scoped";
 console.log(y);
 // expected output: block-scoped
}
console.log(y);
// expected output: block-scoped

There is no hard-and-fast rule about when to use which variables. Here are two different opinions from popular JavaScript developers on how to use these three variables.

> **From Mathias Bynes:** Use `const` by default and `let` if rebinding is needed. `var` should never be used in ES6.

> **From Kyle Simpson:** Use `var` for top-level variables that are shared across many scopes. Use `let` for smaller scopes.

### Arrow functions

==ES6 introduced arrows (`=>`) as a shorthand way to **declare functions**.== This update has three notable advantages:

- You no longer have to use `.bind( )` method
- Code is much cleaner and less verbose
- You can skip the explicit `return`

> There are some cases where you will want to avoid using arrow functions. You need to be careful when using it alongside the `this` keyword. ==Now, when you use the arrow function, the `this` keyword is inherited from the parent scope.==

Here is an example of the new syntax.
var greeting = (name) => {
 console.log(`hello ${name}`);
}

### Classes

The updates to classes in ES6 do not introduce a new OO inheritance model. Instead, these classes are “syntactical sugar” to support prototype inheritance. This update is useful because it simplified your code without changing the basic model of JavaScript. It’s essentially a nicer, cleaner way of doing inheritance. You can create a class in two ways:

- `class` declaration
- `class` expression

You will need the method `constructor` to create a `class`. Let’s take a look.

==class Person {==

 ==constructor(name,age){==

  this.name = name;

  this.age = age;

 }

 greet(){

  console.log(`My name is ${this.name} and I am ${this.age} years old` );

 } // no commas in between methods

}

const sarah = new Person("Sarah",35);

sarah.greet();

### Template Literals

==ES6 implemented the useful feature of template strings, now called template literals. This allows you to easily implement variables with a very simple syntax (`${ }`) and embed expressions.==

It’s particularly useful for constructing API requests and nesting templates.

- The template literal syntax is enclosed in backticks.
- The syntax placeholders in template literals use `${expression}`

Take a look at an example below to see how template literals work:

let name = "Sarah";

const greeting = `Hello my name is ${name}`;

console.log(greeting);

### Other updates with ES6

- Additional String Methods
- Destructuring
- Array Improvements
- Symbols
- Promises
- Default function arguments i.e. default parameters and default values
- Generator
- Proxies
- Object literal updates
- Sets, WeakSets, Maps, and WeakMaps

## Part 3: The Most Important ES2016 Updates

ECMAScript 2016 or ES7 brought with it two important updates to ES6 that are important to being a modern JavaScript programmer.

### Array.prototype.includes( )

The `.includes( )` method makes it easier for you to check if particular values are stored in an array. In the past, JavaScript developers had to use `indexOf` and create a new function. But `.include( )` will return `true` if an array includes an element and `false` if it does not. Take a look below to see it in action.

let array = [1,3,5,9];

console.log(array.includes(2));

// true

console.log(array.includes(3));

// false

### The exponential operator

The exponential operator simplifies the way we do math in JavaScript. In the past, we had to use `loop`, recursive functions, or `Math.pow( )`, which could get pretty messy with each concatenation. But now, our code looks like this:

console.log(Math.pow(2,2));

console.log(Math.pow(2,3));

## Part 4: The Most Important ES2017 Updates

### Object.entires( ) and Object.values( )

These are two new ways of accessing our objects, resolving some of the limitations of `Object.keys( )`, which return only the keys of the object. Now, `Object.values( )` enables us to return an array of all the values of our Object, and `Object.entries( )` returns an array that contains both keys and values.

const family = {

 father: "John Smith",

 mother: "Martha Smith",

 daughter: "Sarah Kent",

}

console.log(Object.values(family));

console.log(Object.entries(family));

// ["father", "John Smith"]

// ["mother", "Martha Smith"]

// ["daughter", "Sarah Smith"]

### Async and Await

This ES8 update offers an alternative to callbacks and Promise and uses much more manageable syntax. ==The Async function allows us to define an asynchronous function and return a Promise. The `.await( )` operator waits for a Promise inside the async function.== Take a look at the new way of writing this code.

function resolveAfter2Seconds() {

 return new Promise(resolve => {

  setTimeout(() => {resolve('resolved');}, 2000);

 });

}

==async== function asyncCall() {

 console.log('calling');

 ==const result = await resolveAfter2Seconds();==

 console.log(result);

}

asyncCall();

**Let’s discuss the new code a bit more.**

- We make an async function with the `async` keyword
- This will return a Promise
- If we specify to return `non-promise`, it returns a value wrapped inside a Promise
- The await keyword only works inside an async function

### Other changes from ES8:

- String Padding
- Shared memory and atomics
- `Object.getOwnPropertyDescriptors( )`
- Trailing commas in function parameter lists and calls

## Part 5: The Most Important ES2018 Updates

### Rest / Spread for Objects

This feature builds off of updates from ES6 so we can use rest/spread syntax for objects. ==The spread operator enables us to create a clone of an `Object` so we can modify the original more easily.==

This feature should not be used at the end, or it will result in an error. Take a look at the code below to see how it works.

let myObj = { a:1, b:3, c:5, d:8,}

==// we use the rest operator to grab everything else left in the object.==

==let { a, b, ...z } = myObj;==

console.log(a);   // 1

console.log(b);   // 3

console.log(z);   // {c: 5, d: 8}

==// using the spread syntax we cloned our Object==

==let clone = { ...myObj };==

console.log(clone);

// {a: 1, b: 3, c: 5, d: 8}

myObj.e = 15;

console.log(clone)

// {a: 1, b: 3, c: 5, d: 8}

console.log(myObj)

// {a: 1, b: 3, c: 5, d: 8, e: 15}

### Asynchronous Iteration

This update enables you to use `await` to declare asynchronous loops if the data comes from an asynchronous source. We use the `for-await-of` to convert the iterables to a [Promise](https://www.educative.io/blog/javascript-promises-tutorial).

The GitHub documentation explains that “an async iterator is much like an iterator, except that its `next()` method returns a promise for a `{ value, done }` pair.” Take a look at the code below to see this in action.

const iterables = [1,2,3];

async function test() {

  for await (const value of iterables) {

​    console.log(value);

  }

}

test();

// 1

// 2

// 3

### Other ES9 Features:

- Lifting template literals restriction
- RegExp features
- `Promise.prototype.finally ( )`

## Part 6: The Most Important ES2019 Updates

The most recent updates of JavaScript add a few small but important features that you should know to be a modern JavaScript programmer.

### Array.prototype.flat

This feature essentially flattens an array recursively up to a pre-specified depth. The flat() method makes a new array containing all sub-array elements. `Infinity` is used to flatten nested arrays. Take a look at the code below to see it in action.

const letters = ['a', 'b', ['c', 'd', ['e', 'f']]];

// default depth of 1

console.log(letters.flat());

// ['a', 'b', 'c', 'd', ['e', 'f']]

// depth of 2

console.log(letters.flat(2));

// ['a', 'b', 'c', 'd', 'e', 'f']

// which is the same as executing flat with depth of 1 twice

console.log(letters.flat().flat());

// ['a', 'b', 'c', 'd', 'e', 'f']

// Flattens recursively until the array contains no nested arrays

console.log(letters.flat(Infinity));

// ['a', 'b', 'c', 'd', 'e', 'f']

### Symbol.prototype.description

The method `.description` allows you to return an optional description of a `Symbol` object. `Symbol` objects can have an optional description used for debugging purposes, and this new update enables you to read that description but does not contain the enclosing `Symbol ( )` string.

const me = Symbol("Sarah");

console.log(me.description);

// "Sarah"

console.log(me.toString());

// "Symbol(Sarah)"

### Changes to Object.fromEntries

This method transforms your list of key-value pairs into objects, and we can pass any iterable as an argument of `Object.fromEntries`. Take a look at the code below.

const keyValueArray = [

 ['key1', 'value1'],

 ['key2', 'value2']

]

const obj = Object.fromEntries(keyValueArray);

console.log(obj);

// {key1: "value1", key2: "value2"}

Code from Educative's Guide to Modern JavaScript course

### Other updates include:

- `String.prototype.trimStart( )`/ `trimEnd( )`
- Changes to `Array.sort`
- `Function.prototype.toString( )`
- Optional Catch Binding

## Wrapping up

Now you have been brought up to speed on all the JavaScript updates of the last years! There is still a lot to learn to get proficient with these new features and tools, so be sure to put them into practice and keep your eye out for more updates as the years go on.

If you’re interested in jumping right in, check out Educative’s course, [**The Complete Guide to Modern JavaScript**](https://www.educative.io/collection/5021873521819648/5278579631849472). This course walks you through all the need-to-know information to master modern JavaScript with embedded coding environments, quizzes, and more.