JS Tools:

- Node and npm
- Packages galore
- ES6
- Task runners
- Transpilers
- Module loaders

Vue instances consist of **three main parts**:

- `el`: This will be the CSS selector for the area you want Vue to attach itself to
- `data`: These will be all your data variables needed for your app
- `methods`: All the functions and functionality your app needs

## [Interpolation](https://scotch.io/courses/getting-started-with-vuejs/vue-basics#toc-interpolation)

Once we have our Vue instance, data, and methods, we'll need to be able to show that information in our HTML templates. To do that, interpolation (injecting a piece of content into another) will be used.

```html
<div id="app">
    <h1 class="title">{{ myTitle }}</h1>
</div>
var app = new Vue({
    el: '#app',

    data: {
        myTitle: 'Hello World!'
    }
});
```

## [Binding Attributes](https://scotch.io/courses/getting-started-with-vuejs/vue-basics#toc-binding-attributes)

While interpolation works well for binding to text spots, we often need to bind information to an HTML attribute like `src` or `title` or `href`. We can use what's called `directives` to affect our HTML.

```html
<div id="app">
    <img width="300" height="300" v-bind:src="avatar">

    <!-- or with the shorthand -->
    <img width="300" height="300" :src="avatar">
</div>
```

## [Handling Events](https://scotch.io/courses/getting-started-with-vuejs/vue-basics#toc-handling-events)

Listening for events is an easy task in Vue using the `v-on` directive. We can listen for any of the [native HTML DOM events](https://www.w3schools.com/jsref/dom_obj_event.asp) in addition to custom ones we can make ourselves.

```html
<a v-on:click="incrementCounter">Increment Button</a>

<form v-on:submit="processForm"></form>

<input @keyup="updateText">
```