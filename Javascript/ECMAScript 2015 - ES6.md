ECMAScript 6, also known as ES6 and ECMAScript 2015, was the second major revision to JavaScript.

This chapter describes the most important features of ES6.

## New Features in ES6

- [The `let` keyword](https://www.w3schools.com/js/js_es6.asp#mark_let)
- [The `const` keyword](https://www.w3schools.com/js/js_es6.asp#mark_const)
- [JavaScript Arrow Functions](https://www.w3schools.com/js/js_es6.asp#mark_arrow)
- [JavaScript Class](https://www.w3schools.com/js/js_es6.asp#mark_class)
- [JavaScript Promise](https://www.w3schools.com/js/js_es6.asp#mark_promise)
- [JavaScript Symbol](https://www.w3schools.com/js/js_es6.asp#mark_symbol)
- [Default Parameter Values](https://www.w3schools.com/js/js_es6.asp#mark_param)
- [Function Rest Parameter](https://www.w3schools.com/js/js_es6.asp#mark_rest)
- [`Array.find()`](https://www.w3schools.com/js/js_es6.asp#mark_array_find)
- [`Array.findIndex()`](https://www.w3schools.com/js/js_es6.asp#mark_array_findIndex)
- [New Number Properties](https://www.w3schools.com/js/js_es6.asp#mark_number_properties)
- [New Number Methods](https://www.w3schools.com/js/js_es6.asp#mark_number_methods)
- [New Global Methods](https://www.w3schools.com/js/js_es6.asp#mark_global_methods)

------

## Browser Support for ES6 (ECMAScript 2015)

Safari 10 and Edge 14 were the first browsers to fully support ES6:

|           |          |            |           |          |
| --------- | -------- | ---------- | --------- | -------- |
| Chrome 58 | Edge 14  | Firefox 54 | Safari 10 | Opera 55 |
| Jan 2017  | Aug 2016 | Mar 2017   | Jul 2016  | Aug 2018 |

------



## JavaScript let

The `let` keyword allows you to declare a variable with block scope.

### Example

var x = 10;
// Here x is 10
{
 let x = 2;
 // Here x is 2
}
// Here x is 10

[](https://www.w3schools.com/js/tryit.asp?filename=tryjs_es6_let)

Read more about `let` in the chapter: [JavaScript Let](https://www.w3schools.com/js/js_let.asp).

------



## JavaScript const

The `const` keyword allows you to declare a constant (a JavaScript variable with a constant value).

Constants are similar to let variables, except that the value cannot be changed.

### Example

var x = 10;
// Here x is 10
{
 const x = 2;
 // Here x is 2
}
// Here x is 10

[](https://www.w3schools.com/js/tryit.asp?filename=tryjs_es6_const)

Read more about `const` in the chapter: [JavaScript Const](https://www.w3schools.com/js/js_const.asp).

------

------



## Arrow Functions

Arrow functions allows a short syntax for writing function expressions.

You don't need the `function` keyword, the `return` keyword, and the **curly brackets**.

### Example

// ES5
var x = function(x, y) {
  return x * y;
}

// ES6
const x = (x, y) => x * y;

[](https://www.w3schools.com/js/tryit.asp?filename=tryjs_es6_arrow)

Arrow functions do not have their own `this`. They are not well suited for defining **object methods**.

Arrow functions are not hoisted. They must be defined **before** they are used.

Using `const` is safer than using `var`, because a function expression is always a constant value.

You can only omit the `return` keyword and the curly brackets if the function is a single statement. Because of this, it might be a good habit to always keep them:

### Example

const x = (x, y) => { return x * y };

[](https://www.w3schools.com/js/tryit.asp?filename=tryjs_es6_arrow_safe)

Learn more about Arrow Functions in the chapter: [JavaScript Arrow Function](https://www.w3schools.com/js/js_arrow_function.asp).

------



## JavaScript Classes

JavaScript Classes are templates for JavaScript Objects.

Use the keyword `class` to create a class.

Always add a method named `constructor()`:

### Syntax

class ClassName {
 constructor() { ... }
}

### Example

class Car {
 constructor(name, year) {
  this.name = name;
  this.year = year;
 }
}

The example above creates a class named "Car".

The class has two initial properties: "name" and "year".

A JavaScript class is **not** an object.

It is a **template** for JavaScript objects.

------

## Using a Class

When you have a class, you can use the class to create objects:

### Example

let myCar1 = new Car("Ford", 2014);
let myCar2 = new Car("Audi", 2019);

[](https://www.w3schools.com/js/tryit.asp?filename=tryjs_class_init)

Learn more about classes in the the chapter: [JavaScript Classes](https://www.w3schools.com/js/js_classes.asp).

------



## JavaScript Promise Object

A Promise is a JavaScript object that links "Producing Code" and "Consuming Code".

"Producing Code" can take some time and "Consuming Code" must wait for the result.

### Promise Syntax

let myPromise = new Promise(function(myResolve, myReject) {
// "Producing Code" (May take some time)

 myResolve(); // when successful
 myReject();  // when error
});

// "Consuming Code" (Must wait for a fulfilled Promise).
myPromise.then(
 function(value) { /* code if successful */ },
 function(error) { /* code if some error */ }
);

### Example Using a Promise

let myPromise = new Promise(function(myResolve, myReject) {
 setTimeout(function() { myResolve("I love You !!"); }, 3000);
});

myPromise.then(function(value) {
 document.getElementById("demo").innerHTML = value;
});

[](https://www.w3schools.com/js/tryit.asp?filename=tryjs_promise3)

Learn more about Promises in the the chapter: [JavaScript Promises](https://www.w3schools.com/js/js_promise.asp).

------



## The Symbol Type

A JavaScript Symbol is a primitive datatype just like Number, String, or Boolean.

It represents a unique "hidden" identifier that no other code can accidentally access.

For instace, if different coders want to add a person.id property to a person object belonging to a third-party code, they could mix each others values.

Using Symbol() to create a unique identifiers, solves this problem:

### Example

const person = {
 firstName: "John",
 lastName: "Doe",
 age: 50,
 eyeColor: "blue"
};

let id = Symbol('id');
person.id = 140353;

[](https://www.w3schools.com/js/tryit.asp?filename=tryjs_symbol)

Symbols are always unique.

If you create two symbols with the same description they will have different values.

Symbol("id") == Symbol("id") // false

------
## Default Parameter Values
ES6 allows function parameters to have default values.
### Example
function myFunction(x, y = 10) {
 // y is 10 if not passed or undefined
 return x + y;
}
myFunction(5); // will return 15

[](https://www.w3schools.com/js/tryit.asp?filename=tryjs_es6_default)

------
## Function Rest Parameter
==The rest parameter (...) allows a function to treat an indefinite number of arguments as an array:==
### Example
function sum(==...args==) {
 let sum = 0;
 for (let arg of args) sum += arg;
 return sum;
}
let x = sum(4, 9, 16, 25, 29, 100, 66, 77);

------

## Array.find()
==The `find()` method returns the value of the first array element that passes a test function.==
This example finds (returns the value of ) the first element that is larger than 18:
### Example
var numbers = [4, 9, 16, 25, 29];
var first = numbers.find(myFunction);
==function myFunction(value, index, array) {
 return value > 18;
}==
Note that ==the function takes 3 arguments:==
- ==The item value==
- ==The item index==
- ==The array itself==

## Array.findIndex()

==The `findIndex()` method returns the index of the first array element that passes a test function.==

This example finds the index of the first element that is larger than 18:

### Example

var numbers = [4, 9, 16, 25, 29];
var first = numbers.findIndex(myFunction);

function myFunction(value, index, array) {
 return value > 18;
}

Note that the function takes 3 arguments:

- The item value
- The item index
- The array itself

## New Number Properties

ES6 added the following properties to the Number object:

- `EPSILON`
- `MIN_SAFE_INTEGER`
- `MAX_SAFE_INTEGER`

### Example

var x = Number.EPSILON;

### Example

var x = Number.MIN_SAFE_INTEGER;

### Example

var x = Number.MAX_SAFE_INTEGER;

## New Number Methods

ES6 added 2 new methods to the Number object:

- `Number.isInteger()`
- `Number.isSafeInteger()`

## The Number.isInteger() Method

The `Number.isInteger()` method returns `true` if the argument is an integer.

### Example

Number.isInteger(10);    // returns true
Number.isInteger(10.5);   // returns false

## The Number.isSafeInteger() Method

A safe integer is an integer that can be exactly represented as a double precision number.

The `Number.isSafeInteger()` method returns `true` if the argument is a safe integer.

### Example

Number.isSafeInteger(10);  // returns true
Number.isSafeInteger(12345678901234567890); // returns false

[](https://www.w3schools.com/js/tryit.asp?filename=tryjs_es6_issafeinteger)

Safe integers are all integers from -(253 - 1) to +(253 - 1).
This is safe: 9007199254740991. This is not safe: 9007199254740992.

------



## New Global Methods

ES6 added 2 new global number methods:

- `isFinite()`
- `isNaN()`

------

## The isFinite() Method

The global `isFinite()` method returns `false` if the argument is `Infinity` or `NaN`.

Otherwise it returns `true`:

### Example

isFinite(10/0);    // returns false
isFinite(10/1);    // returns true

[](https://www.w3schools.com/js/tryit.asp?filename=tryjs_es6_isfinite)

------

## The isNaN() Method

The global `isNaN()` method returns `true` if the argument is `NaN`. Otherwise it returns `false`:

### Example

isNaN("Hello");    // returns true