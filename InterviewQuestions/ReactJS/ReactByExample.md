### What’s React?

> A JavaScript library for building user interfaces
> 
> — [React docs](https://reactjs.org/)

-   declarative
    -   declare the view, React does the rest
-   component-based
    -   helps with encapsulation
-   learn once, write anywhere
    -   mobile/desktop apps with React native
-   open source / MIT

### Why React?

-   pros:
    -   easy to learn
    -   very popular (249311 Stack Overflow questions tagged react, 13591 commits)
    -   many ready made component libraries ([material](https://material-ui.com/), [bootstrap](https://react-bootstrap.github.io/), etc…)
    -   typed templates (with typescript)
    -   relatively small bundle size (39.39 KB gzip)
-   cons:
    -   batteries not included
    -   unopinionated
    -   only 1-way data binding

### Start a New App

-   use [`create-react-app`](https://create-react-app.dev/) to start a new app

```
npx create-react-app my-awesome-react-app --template typescript
cd my-awesome-react-app
npm start
```

### Hello world!

-   React just takes a bit of “HTML” and renders it somewhere in DOM

```
import React from 'react'
import ReactDOM from 'react-dom'

ReactDOM.render(<p>Hello world!</p>, document.getElementById('root'))
```

Hello world!

[](https://codesandbox.io/s/2yvqw?file=/src/index.tsx "edit on CodeSandbox")

### Current Time

-   can interpolate values into “HTML”
-   “HTML” can be passed around as data

```
import React from 'react'
import ReactDOM from 'react-dom'

const app = () => <div>the time is {new Date().toLocaleTimeString()}</div>
ReactDOM.render(app(), document.getElementById('root'))
```

the time is 8:01:25 PM

[](https://codesandbox.io/s/fo4wf?file=/src/index.tsx "edit on CodeSandbox")

### Clock

-   “HTML” can be dynamic

```
import React from 'react'
import ReactDOM from 'react-dom'

const app = () => <div>the time is {new Date().toLocaleTimeString()}</div>
setInterval(() => {
  ReactDOM.render(app(), document.getElementById('root'))
}, 1000)
```

the time is 8:04:46 PM

[](https://codesandbox.io/s/woetg?file=/src/index.tsx "edit on CodeSandbox")

> this is a simple demo, please don’t update using `setInterval`

## About JSX

-   “HTML” that you can write in JavaScript

### JSX

> JSX is an XML-like syntax extension to ECMAScript without any defined semantics.
> 
> — [JSX spec](https://facebook.github.io/jsx/)

-   has to be transpiled to JavaScript
-   not coupled to React!
-   other implementations: [vue](https://vuejs.org/), [preact](https://preactjs.com/), [inferno](https://infernojs.org/), [stencil](https://stenciljs.com/), [marko](https://markojs.com/), etc…

### Examples

-   examples of JSX and what it transpiles to under the hood

#### Simple

-   elements become calls to [`React.createElement()`](https://reactjs.org/docs/react-api.html#createelement)
-   first argument: type of element
-   third argument: the subtree (aka. [children](https://reactjs.org/docs/jsx-in-depth.html#children-in-jsx))

```
import React from 'react'

export default <p>Hello world!</p>
export const transpiledTo = React.createElement('p', {}, 'Hello world!')
```

Hello world!

[](https://codesandbox.io/s/olp5r?file=/src/example.tsx "edit on CodeSandbox")

#### Props

-   second argument: attributes (aka. [props](https://reactjs.org/docs/components-and-props.html)) as key-value pairs

```
import React from 'react'

export default <a href="https://reactjs.org/">React</a>
export const transpiledTo = React.createElement(
  'a',
  { href: 'https://reactjs.org/' },
  'React',
)
```

[React](https://reactjs.org/)

[](https://codesandbox.io/s/etrju?file=/src/example.tsx "edit on CodeSandbox")

#### Prop Types

-   props can be of any type, not just strings

```
import React from 'react'

export default (
  <button type="button" onClick={() => alert('clicked')} tabIndex={-1}>
    <i>the button</i>
  </button>
)
export const transpiledTo = React.createElement(
  'button',
  { type: 'button', onClick: () => alert('clicked'), tabIndex: -1 },
  // note the nested `createElement` call
  React.createElement('i', {}, 'the button'),
)
```

[](https://codesandbox.io/s/y9v4h?file=/src/example.tsx "edit on CodeSandbox")

#### Spread Props

-   objects can be spread on elements
-   applies all keys in the object as props

```
import React from 'react'

const propsToSpread = {
  onClick: () => alert(`please don't click me`),
}

export default (
  <button type="button" {...propsToSpread}>
    click me
  </button>
)
export const transpiledTo = React.createElement(
  'button',
  { type: 'button', ...propsToSpread },
  'click me',
)
```

[](https://codesandbox.io/s/ulkz9?file=/src/example.tsx "edit on CodeSandbox")

#### Interpolate

-   values can be interpolated using `{value}`
-   usually renders as `String(value)`
-   `true`, `false`, `undefined`, `null` never render; allows for [short-circuit logic](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Logical_AND#Short-circuit_evaluation)
-   `<></>` is a [fragment](https://reactjs.org/docs/fragments.html); allows for rendering multiple elements where one is expected

```
import React from 'react'

const hi = 'hi'
const canYouSeeMe = false
export default (
  <>
    string: {hi} <br />
    number: {42} <br />
    boolean: {true} {false} <br />
    short-circuit: {canYouSeeMe && <p>sure you can</p>} <br />
    nullish: {undefined} {null} <br />
  </>
)
```

string: hi  
number: 42  
boolean:  
short-circuit:  
nullish:  

[](https://codesandbox.io/s/fq5nj?file=/src/example.tsx "edit on CodeSandbox")

#### Repeat

-   use `array.map()` to “loop” over values
-   use the special [`key` prop](https://reactjs.org/docs/lists-and-keys.html) to distinguish elements in the array

```
import React from 'react'

const fruits = ['apple', 'orange', 'strawberry']
export default (
  <ul>
    {fruits.map((fruit) => (
      <li key={fruit}>{fruit}</li>
    ))}
  </ul>
)
```

-   apple
-   orange
-   strawberry

## Function Components

### Stateless Components

-   pure function that takes children and props and outputs JSX
-   pure means no side-effects
-   children are the component’s subtree
-   props are attributes
-   type: `React.FunctionComponent`, `FC` for short

```
import React, { FC } from 'react'

export const Button: FC = ({ children }) => (
  <button type="button">{children}</button>
)

export default <Button>Hello world!</Button>
```

[](https://codesandbox.io/s/5hsl5?file=/src/example.tsx "edit on CodeSandbox")

### Stateful Components

-   a function component that uses [React hooks](https://reactjs.org/docs/hooks-reference.html)
-   can have state and side-effects

```
import React, { FC, useState } from 'react'

export const Pizza: FC = () => {
  const [topping, setTopping] = useState('none')
  return (
    <div>
      <p>Choose a pizza topping:</p>
      <div>
        <button type="button" onClick={() => setTopping('tomato sauce')}>
          tomato sauce
        </button>
        <button type="button" onClick={() => setTopping('bbq sauce')}>
          bbq sauce
        </button>
        <button type="button" onClick={() => setTopping('garlic sauce')}>
          garlic sauce
        </button>
      </div>
      <p>Chosen topping: {topping}</p>
    </div>
  )
}

export default <Pizza />
```

Choose a pizza topping:

Chosen topping: none

## Hooks

-   allows state and side-effects in function components
-   simple to use, but follow the [rules](https://reactbyexample.github.io/hooks#rules)
-   create custom hooks, great for encapsulating common functionality

### Rules

-   only call hooks at the top level
    -   don’t call hooks inside loops, conditions, or nested functions
    -   rationale:
        -   same hook can be used multiple times
        -   they must be called in the same order _every time_, otherwise React does not know which hook is which
-   only call hooks from React functions
    -   don’t call hooks from regular JavaScript functions
    -   rationale:
        -   hook state is bound to the _component instance_ that is being rendered
-   (convention) custom hooks start with `use`

-   [more details](https://reactjs.org/docs/hooks-rules.html)
-   rules are enforceable [`eslint-plugin-react-hooks`](https://www.npmjs.com/package/eslint-plugin-react-hooks)

### `useState`

-   `const [currentState, setNextStateFn] = useState(initialValue?)`
-   use for internal state that affects DOM
-   takes initial value; returns a tuple of the current value and a function to update it
-   [docs](https://reactjs.org/docs/hooks-reference.html#usestate)

```
import React, { FC, useState } from 'react'

export const Counter: FC = () => {
  const [value, setValue] = useState(0)

  return (
    <>
      <button type="button" onClick={() => setValue(value - 1)}>
        -
      </button>
      <span> {value} </span>
      <button type="button" onClick={() => setValue(value + 1)}>
        +
      </button>
    </>
  )
}

export default <Counter />
```

0[](https://codesandbox.io/s/wokhg?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/0ju3x?file=/src/example.tsx "test on CodeSandbox")

### `useRef`

-   `const ref = useRef(initialValue?)`
-   use for referencing elements, e.g. to use their methods
-   [docs](https://reactjs.org/docs/hooks-reference.html#useref)

```
import React, { FC, useRef } from 'react'

export const PlayPause: FC = () => {
  const videoRef = useRef<HTMLVideoElement>(null)
  const playPause = async () => {
    const video = videoRef.current as HTMLVideoElement
    if (video.paused) {
      await video.play()
    } else {
      video.pause()
    }
  }

  return (
    <>
      <video
        ref={videoRef}
        autoPlay
        loop
        src="https://media.tenor.com/videos/632c96bbc411d8baa3f7f43692474808/webm"
        aria-label="video"
      />
      <br />
      <button type="button" onClick={playPause}>
        ⏯
      </button>
    </>
  )
}

export default <PlayPause />
```

  

[](https://codesandbox.io/s/em8oi?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/n8fl9?file=/src/example.tsx "test on CodeSandbox")

-   use for internal state that _does not_ affect DOM, e.g. timer handles

```
import React, { FC, useRef, useState } from 'react'

export const SelfDestruct: FC = () => {
  const [destroyed, setDestroyed] = useState(false)
  const timeoutRef = useRef<number>()

  const cancel = () => {
    window.clearTimeout(timeoutRef.current)
    timeoutRef.current = undefined
  }
  const start = () => {
    cancel()
    timeoutRef.current = window.setTimeout(() => {
      setDestroyed(true)
    }, 2000)
  }

  return destroyed ? null : (
    <>
      <button type="button" onClick={start}>
        start self-destruct sequence
      </button>
      <button type="button" onClick={cancel}>
        cancel self-destruct sequence
      </button>
      <p>this message will destroy itself in 2 seconds</p>
    </>
  )
}

export default <SelfDestruct />
```

this message will destroy itself in 2 seconds

[](https://codesandbox.io/s/qnjl9?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/2mt3f?file=/src/example.tsx "test on CodeSandbox")

### `useEffect`

-   `useEffect(effectFn, deps?)`
-   use for side-effects
-   `effectFn`: function that can have side-effects; optionally return cleanup function
-   `deps`: a list of values that the side-effect depends on (optional)
-   when dependencies change, the effect is cleaned up and ran again
-   if no dependencies are given, then the effect runs on every render
-   [docs](https://reactjs.org/docs/hooks-reference.html#useeffect)

```
import React, { FC, useEffect, useState } from 'react'

export const LocaleClock: FC<{ locale?: string }> = ({ locale = 'en-US' }) => {
  const [timeString, setTimeString] = useState<string>()
  useEffect(() => {
    const update = () => {
      setTimeString(new Date().toLocaleTimeString(locale))
    }
    update()

    const interval = window.setInterval(update, 500)

    return () => {
      window.clearInterval(interval)
    }
  }, [locale])

  return <p>{timeString}</p>
}

export const ToggleLocale: FC = () => {
  const [locale, setLocale] = useState('en-GB')
  const toggleLocale = () => {
    setLocale(locale === 'en-GB' ? 'th-TH-u-nu-thai' : 'en-GB')
  }

  return (
    <>
      <button type="button" onClick={toggleLocale}>
        toggle locale
      </button>
      <LocaleClock locale={locale} />
    </>
  )
}

export default <ToggleLocale />
```

## Styling

> React does not have an opinion about how styles are defined; if in doubt, a good starting point is to define your styles in a separate `*.css` file as usual and refer to them using `className`.
> 
> — [React docs](https://reactjs.org/docs/faq-styling.html#what-is-css-in-js)

### Global CSS

![the ol' reliable](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2F4dFgGp8Bfoo%2Fhqdefault.jpg)

-   just import some CSS
-   no scoping
-   have to use [BEM](http://getbem.com)

```
import React, { FC, useState } from 'react'
import './global.css'
import { Slider } from './slider'

export const Global: FC = () => {
  const [value, setValue] = useState(100)

  return (
    <div className="global__wrapper">
      <Slider value={value} onChange={setValue} />
      <div className="global__circle" style={{ fontSize: `${value * 0.01}em` }}>
        awesome circle
      </div>
    </div>
  )
}

export default <Global />
```

100

awesome circle

[](https://codesandbox.io/s/9u83b?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/y38sd?file=/src/example.tsx "test on CodeSandbox")

### CSS Modules

-   just import some CSS
-   must be named `*.module.css`
-   classes automatically scoped, worry free naming
-   CSS bundled with component
-   short class names in production
-   less dead CSS

```
import React, { FC, useState } from 'react'
import classes from './example.module.css'
import { Slider } from './slider'

export const Module: FC = () => {
  const [value, setValue] = useState(100)

  return (
    <div className={classes.wrapper}>
      <Slider value={value} onChange={setValue} />
      <div className={classes.circle} style={{ fontSize: `${value * 0.01}em` }}>
        awesome circle
      </div>
    </div>
  )
}

export default <Module />
```

100

awesome circle

[](https://codesandbox.io/s/surpq?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/qndql?file=/src/example.tsx "test on CodeSandbox")

-   note that both CSS approaches have to use the [`style`](https://reactjs.org/docs/dom-elements.html#style) prop for dynamic styles

### CSS in JS

-   common pattern in React apps **provided by libraries**
    
-   [`styled-components`](https://styled-components.com) most popular
    
    > -   Automatic critical CSS
    > -   No class name bugs
    > -   Easier deletion of CSS
    > -   Simple dynamic styling
    > -   Painless maintenance
    > -   Automatic vendor prefixing
    
-   fantastic for dynamic styling
    
-   component fully contained in single file
    
-   needs [extension](https://github.com/styled-components/vscode-styled-components) for syntax highlighting
    

```
import React, { FC, useState } from 'react'
import styled from 'styled-components'
import { Slider } from './slider'

const Wrapper = styled.div`
  min-height: 250px;
  min-width: 250px;
`

const Circle = styled.div<{ fontSize: number }>`
  align-items: center;
  background-color: dodgerblue;
  border-radius: 99999px;
  color: aliceblue;
  display: flex;
  flex-direction: column;
  font-family: Arial, Helvetica, sans-serif;
  font-size: ${(props) => props.fontSize}em;
  height: 10em;
  justify-content: center;
  transition: all 0.5s cubic-bezier(0.68, -0.55, 0.265, 1.55);
  width: 10em;
`

export const Styled: FC = () => {
  const [value, setValue] = useState(100)

  return (
    <Wrapper>
      <Slider value={value} onChange={setValue} />
      <Circle fontSize={value * 0.01}>awesome circle</Circle>
    </Wrapper>
  )
}

export default <Styled />
```

100

awesome circle

[](https://codesandbox.io/s/2jsp3?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/zxmrv?file=/src/example.tsx "test on CodeSandbox")

### P.S.

-   it doesn’t matter which approach you use, but don’t mix them

## Events & Forms

### Events

-   handlers are props
-   `onSomeEvent={event => console.log(event.target)}`
-   events are [“synthetic”](https://reactjs.org/docs/events.html), normalized between browsers
-   [supported events](https://reactjs.org/docs/events.html#supported-events)

```
import React, { FC, useState } from 'react'

export const Events: FC = () => {
  const [lastEvent, setLastEvent] = useState('N/A')
  return (
    <div>
      <input
        aria-label="try copy/pasting"
        defaultValue="try copy/pasting"
        onFocus={() => setLastEvent('onFocus')}
        onBlur={() => setLastEvent('onBlur')}
        onCopy={() => setLastEvent('onCopy')}
        onCut={() => setLastEvent('onCut')}
        onPaste={() => setLastEvent('onPaste')}
        onKeyDown={() => setLastEvent('onKeyDown')}
        onKeyUp={() => setLastEvent('onKeyUp')}
      />
      <pre>last event: {lastEvent}</pre>
    </div>
  )
}

export default <Events />
```

last event: N/A

[](https://codesandbox.io/s/4jzp8?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/pziz4?file=/src/example.tsx "test on CodeSandbox")

### Forms

-   use `value` & `onChange` props to control form items

```
import React, { ChangeEvent, FC, useState } from 'react'

export const SimpleInput: FC = () => {
  const [value, setValue] = useState('default value')
  const onChange = (event: ChangeEvent<HTMLInputElement>) => {
    setValue(event.target.value)
  }

  return (
    <div>
      <label>
        simple input
        <input type="text" value={value} onChange={onChange} />
      </label>
      <pre>{value}</pre>
      <button type="button" onClick={() => setValue('new value')}>
        change to `new value`
      </button>
    </div>
  )
}

export default <SimpleInput />
```

simple input

default value

[](https://codesandbox.io/s/03o98?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/zw0sh?file=/src/example.tsx "test on CodeSandbox")

-   with multiple form items

```
import React, { FC, useState } from 'react'
import { UserAPI } from './user-api'

export const SimpleForm: FC = () => {
  const [username, setUsername] = useState('')
  const [password, setPassword] = useState('')
  const [terms, setTerms] = useState(false)
  const [submitted, setSubmitted] = useState(false)

  return (
    <form
      aria-label="registration form"
      onSubmit={async (event) => {
        event.preventDefault()
        setSubmitted(true)
        try {
          await UserAPI.register({ username, password })
          // redirect to profile
        } catch {
          // show error
        }
      }}
    >
      <div>
        <label>
          Username
          <input
            type="text"
            name="username"
            value={username}
            onChange={(event) => setUsername(event.target.value)}
          />
        </label>
      </div>
      <div>
        <label>
          Password
          <input
            type="password"
            name="password"
            value={password}
            onChange={(event) => setPassword(event.target.value)}
          />
        </label>
      </div>
      <div>
        <label>
          <input
            type="checkbox"
            name="terms"
            checked={terms}
            onChange={(event) => setTerms(event.target.checked)}
          />
          <span>I have read the Terms and Conditions</span>
        </label>
      </div>
      <button type="submit">Register</button>
      <pre>
        {JSON.stringify({ username, password, terms, submitted }, null, '  ')}
      </pre>
    </form>
  )
}

export default <SimpleForm />
```

Username

Password

I have read the Terms and Conditions

{
  "username": "",
  "password": "",
  "terms": false,
  "submitted": false
}

[](https://codesandbox.io/s/ur5hb?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/7r8pi?file=/src/example.tsx "test on CodeSandbox")

-   using plain React to handle complex forms doesn’t scale well
-   use [formik](https://jaredpalmer.com/formik/) ([recommended by React](https://reactjs.org/docs/forms.html#fully-fledged-solutions)), or other form library

```
import { Field, FieldProps, Form, Formik } from 'formik'
import React, { FC } from 'react'
import { UserAPI } from './user-api'

export const SimpleFormik: FC = () => {
  return (
    <Formik
      initialValues={{
        username: '',
        password: '',
        terms: false,
        submitted: false,
      }}
      onSubmit={async ({ username, password }, { setFieldValue }) => {
        setFieldValue('submitted', true)
        try {
          await UserAPI.register({ username, password })
          // redirect to profile
        } catch {
          // show error
        }
      }}
    >
      <Form aria-label="registration form">
        <div>
          <label>
            Username
            <Field name="username" />
          </label>
        </div>
        <div>
          <label>
            Password
            <Field type="password" name="password" />
          </label>
        </div>
        <div>
          <label>
            <Field type="checkbox" name="terms" />
            <span>I have read the Terms and Conditions</span>
          </label>
        </div>
        <button type="submit">Register</button>
        <Field>
          {({ form }: FieldProps) => (
            <pre>{JSON.stringify(form.values, null, '  ')}</pre>
          )}
        </Field>
      </Form>
    </Formik>
  )
}

export default <SimpleFormik />
```

Username

Password

I have read the Terms and Conditions

{
  "username": "",
  "password": "",
  "terms": false,
  "submitted": false
}

## Testing

-   [Arrange-Act-Assert](https://duckduckgo.com/?q=arrange+act+assert) pattern works great with React

```
// pseudo tests using AAA, read it as prose

describe('wrap everything in a describe', () => {
  /* 1 */ beforeEach(() => {
    // setup needed for every test
    // ARRANGE
  })

  describe('group main functionality in 1st level of describes', () => {
    /* 2 */ beforeEach(() => {
      // do something to change the state
      // use a `beforeEach` even if there is only one `it`
      // it will be easier to extend later
      // ARRANGE & ACT
    })

    it('should respond to the change', () => {
      // test the outcome
      // ASSERT
    })

    describe('use nested describes to dive into branches', () => {
      /* 3 */ beforeEach(() => {
        // do something that changes the state further
        // ARRANGE & ACT
      })

      it('should respond to the change', () => {
        // assertion given that 1, 2, 3 executed
        // ASSERT
      })

      it('should follow the structure of your code', () => {
        // it should be easy to find where new tests need to go
        // ASSERT
      })
    })
  })

  // #region events
  describe('example events', () => {
    describe('when the user types', () => {
      beforeEach(() => {
        // find input element
        // ARRANGE
        // fire change event so that it is invalid
        // ACT
      })

      it('should validate input', () => {
        // find error
        // match text in error
        // ASSERT
      })

      describe('when the input is valid', () => {
        beforeEach(() => {
          // fire a change event so that the input is valid
          // ACT
        })

        it('should validate input', () => {
          // find error
          // expect that there are none
          // ASSERT
        })

        describe('when the user submits', () => {
          beforeEach(() => {
            // find submit button
            // click it
            // ARRANGE & ACT
          })

          it('should call api', () => {
            // expect mock to have been called with form data
            // ASSERT
          })
        })
      })
    })
  })
  // #endregion

  // #region a11y
  describe('example a11y', () => {
    describe('when the accordion is closed', () => {
      beforeEach(() => {
        // find the toggle button
        // ARRANGE
      })

      it('should have aria-expanded=false', () => {
        // expect the toggle button to have the attribute
        // ASSERT
      })

      describe('when the accordion is open', () => {
        beforeEach(() => {
          // click the toggle
          // ACT
        })

        it('should have aria-expanded=true', () => {
          // expect the toggle button to have the attribute
          // ASSERT
        })

        describe('when the accordion is closed', () => {
          beforeEach(() => {
            // click the toggle
            // ACT
          })

          it('should have aria-expanded=false', () => {
            // expect the toggle button to have the attribute
            // ASSERT
          })
        })
      })
    })
  })
  // #endregion

  // #region non-happy
  describe('example non-happy paths', () => {
    describe('when the api times out', () => {
      beforeEach(() => {
        // use mock timers
        // set mock to return unresolved promise
        // ARRANGE
        // action that calls into api
        // ACT
      })

      it('should show spinner', () => {
        // find spinner
        // expect that it exists
        // ASSERT
      })

      describe('when request times out', () => {
        beforeEach(() => {
          // run timers
          // ACT
        })

        it('should show error', () => {
          // find error
          // match text
          // ASSERT
        })
      })
    })

    describe('when api errors', () => {
      beforeEach(() => {
        // set mock to return unresolved promise
        // ARRANGE
        // action that calls into api
        // ACT
      })

      it('should show error', () => {
        // find error
        // match text
        // ASSERT
      })
    })
  })
  // #endregion
})

export const dummy = null
```

[](https://codesandbox.io/s/63edz?file=/src/index.test.ts "test on CodeSandbox")

### `GifFinder`

-   let’s test a component that uses state & effects to find gifs

```
import React, { FC, useEffect, useState } from 'react'
import classes from './example.module.css'
import { TenorAPI } from './tenor-api'

export interface GifFinderProps {
  onFound?(url: string): void
}

export const GifFinder: FC<GifFinderProps> = ({ onFound }) => {
  const [query, setQuery] = useState('')
  const [results, setResults] = useState<string[] | null>(null)

  useEffect(() => {
    let shouldUpdate = true

    if (query) {
      TenorAPI.search(query).then((newResults) => {
        if (shouldUpdate) setResults(newResults)
      })
    }

    return () => {
      shouldUpdate = false
    }
  }, [query])

  return (
    <section>
      <label>
        find a gif
        <input
          placeholder="query"
          value={query}
          onChange={(event) => setQuery(event.target.value)}
        />
      </label>
      {results && (
        <div className={classes.grid}>
          {results.map((result) => (
            <button
              type="button"
              key={result}
              className={classes.button}
              onClick={() => onFound && onFound(result)}
              aria-label="gif"
            >
              <img className={classes.image} src={result} alt="gif" />
            </button>
          ))}
        </div>
      )}
    </section>
  )
}

export const Example: FC = () => {
  const [gif, setGif] = useState<string | null>(null)

  return gif ? (
    <div>
      <img src={gif} alt="gif" />
      <p>found gif</p>
      <button type="button" onClick={() => setGif(null)}>
        find new gif
      </button>
    </div>
  ) : (
    <GifFinder onFound={setGif} />
  )
}

export default <Example />
```

find a gif

[](https://codesandbox.io/s/mo1ln?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/3wm7o?file=/src/example.tsx "test on CodeSandbox")

### Testing `GifFinder`

> The more your tests resemble the way your software is used, the more confidence they can give you.
> 
> — [`@testing-library`](https://testing-library.com/)

-   [`create-react-app`](https://create-react-app.dev/) comes with [`@testing-library`](https://testing-library.com/)
-   works with [angular](https://testing-library.com/docs/angular-testing-library/intro), [vue](https://testing-library.com/docs/vue-testing-library/intro), [plain DOM](https://testing-library.com/docs/dom-testing-library/intro), etc…
-   no selectors, [forcing](https://coderefinery.nz/2020/10/21/forcing-functions-in-software-development/) you to write accessible components
-   alternatively, use [enzyme](https://github.com/enzymejs/enzyme)

```
import {
  act,
  cleanup,
  fireEvent,
  render,
  RenderResult,
} from '@testing-library/react'
import React from 'react'
import { GifFinder } from './example'
import { TenorAPI } from './tenor-api'

describe('GifFinder', () => {
  let component: RenderResult
  let onFound: jest.Mock

  beforeEach(() => {
    onFound = jest.fn()
    component = render(<GifFinder onFound={onFound} />)
  })

  afterEach(() => {
    cleanup()
  })

  it('should snapshot', () => {
    expect(component.container).toMatchSnapshot()
  })

  describe('when searching', () => {
    let queryInput: HTMLElement
    let searchSpy: jest.SpyInstance

    beforeEach(async () => {
      const searchPromise = Promise.resolve(['gif1', 'gif2', 'gif3'])
      searchSpy = jest.spyOn(TenorAPI, 'search').mockReturnValue(searchPromise)
      queryInput = component.getByLabelText('find a gif')
      fireEvent.input(queryInput, { target: { value: 'react' } })
      await act(async () => {
        await searchPromise
      })
    })

    afterEach(() => {
      searchSpy.mockRestore()
    })

    it('should start a search', () => {
      expect(searchSpy).toHaveBeenCalledWith('react')
      expect(searchSpy).toHaveBeenCalledTimes(1)
    })

    it('should render the gifs', () => {
      expect(component.container).toMatchSnapshot()
    })

    describe('when clicking a gif', () => {
      beforeEach(() => {
        const [, gif2] = component.getAllByLabelText('gif')
        fireEvent.click(gif2)
      })

      it('should call onFound', () => {
        expect(onFound).toHaveBeenCalledWith('gif2')
        expect(onFound).toHaveBeenCalledTimes(1)
      })
    })
  })
})
```

## Context

> Context is designed to share data that can be considered “global” for a tree of React components
> 
> — [React](https://reactjs.org/docs/context.html#when-to-use-context)

-   e.g. current user, theme, language, settings
-   props that need to be passed thru layers of components
-   parent to child communication
-   can be nested, [closest](https://developer.mozilla.org/en-US/docs/Web/API/Element/closest) value wins

### How?

-   [declare the context](https://reactjs.org/docs/context.html#reactcreatecontext)
-   `const ThemeCtx = createContext(defaultTheme)`
-   [provide a value](https://reactjs.org/docs/context.html#contextprovider)
-   `<ThemeCtx.Provider value={dark}>…</ThemeCtx.Provider>`
-   [use the value](https://reactjs.org/docs/hooks-reference.html#usecontext)
-   `const currentTheme = useContext(ThemeCtx)`

```
import React, { createContext, FC, useContext } from 'react'
import classes from './example.module.css'

const Box: FC<{ color: string; dashed?: boolean }> = ({
  color,
  dashed,
  children,
}) => (
  <div
    className={classes.box}
    style={{ borderColor: color, borderStyle: dashed ? 'dashed' : 'solid' }}
  >
    {children}
  </div>
)

const GreenDashedBox: FC = ({ children }) => (
  <Box color="#50fa7b" dashed>
    {children}
  </Box>
)

const Context = createContext<string>('default')
const ProvidesContext: FC<{ color: string }> = ({ color, children }) => (
  <Box color={color}>
    <pre>providing value: `{color}`</pre>
    <Context.Provider value={color}>{children}</Context.Provider>
  </Box>
)
const RendersContext: FC = () => {
  const value = useContext(Context)
  return <pre>using value: `{value}`</pre>
}

export default (
  <>
    <p>default value is used when there is no provider</p>
    <RendersContext />
    {/* default */}

    <ProvidesContext color="#ff5555">
      <RendersContext />
      {/* #ff5555 */}

      <GreenDashedBox>
        <p>value pierces component boundaries</p>
        <RendersContext />
        {/* #ff5555 */}

        <ProvidesContext color="#8be9fd">
          <p>providers can be nested</p>
          <p>closest value is used</p>
          <RendersContext />
          {/* #8be9fd */}
        </ProvidesContext>
      </GreenDashedBox>
    </ProvidesContext>
  </>
)
```

default value is used when there is no provider

using value: `default`

providing value: `#ff5555`

using value: `#ff5555`

value pierces component boundaries

using value: `#ff5555`

providing value: `#8be9fd`

providers can be nested

closest value is used

using value: `#8be9fd`

[](https://codesandbox.io/s/n3854?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/qv13r?file=/src/example.tsx "test on CodeSandbox")

### Dynamic Theme

```
import React, { createContext, FC, useContext, useState } from 'react'
import defaultClasses from './button.default.module.css'
import greenClasses from './button.green.module.css'
import redClasses from './button.red.module.css'

export type ThemeContextType = 'default' | 'red' | 'green'
export const ThemeContext = createContext<ThemeContextType>('default')

export const Button: FC = () => {
  const theme = useContext(ThemeContext)
  const classes = {
    default: defaultClasses,
    red: redClasses,
    green: greenClasses,
  }[theme]

  return (
    <button type="button" className={classes.button}>
      themed button
    </button>
  )
}

export const ThemeSwitcher: FC = ({ children }) => {
  const [theme, setTheme] = useState('default')

  return (
    <>
      <label>
        theme
        <select value={theme} onChange={(e) => setTheme(e.target.value)}>
          <option>default</option>
          <option>red</option>
          <option>green</option>
        </select>
      </label>
      <br />
      <ThemeContext.Provider value={theme as ThemeContextType}>
        {children}
      </ThemeContext.Provider>
    </>
  )
}

export default (
  <ThemeSwitcher>
    <Button />
  </ThemeSwitcher>
)
```

theme

## Advanced Hooks

-   remember the [rules](https://reactbyexample.github.io/hooks#rules)

### `useCallback`

-   `const memoizedFn = useCallback(fn, deps)`
-   `<button onClick={() => ...} />` triggers unnecessary re-renders
-   because `(() => ...) !== (() => ...)`
-   every event handler should be wrapped with `useCallback`
-   [docs](https://reactjs.org/docs/hooks-reference.html#usecallback)

### `useMemo`

-   `const memoizedValue = useMemo(computeValueFn, deps)`
-   `useMemo` will only recompute `memoizedValue` when one of `deps` have changed
-   wrap expensive computations to improve render performance
-   [docs](https://reactjs.org/docs/hooks-reference.html#usememo)

```
import React, { FC, useMemo } from 'react'

const fib = (n: number): number => {
  if (n <= 2) return 1

  return fib(n - 1) + fib(n - 2)
}

export const Fib: FC<{ n: number }> = ({ n }) => {
  const f = useMemo(() => fib(n), [n])

  return (
    <pre>
      {n}-th fibonacci number: {f}
    </pre>
  )
}

export default <Fib n={10} />
```

10-th fibonacci number: 55

[](https://codesandbox.io/s/4lil0?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/g7jpz?file=/src/example.tsx "test on CodeSandbox")

### `useReducer`

-   `const [currentState, dispatchFn] = useReducer(reducerFn, initialState)`
-   use for
    -   complex state
    -   distributed state updates
    -   migrating from [redux](https://redux.js.org/)
-   if possible, use multiple [`useState`](https://reactbyexample.github.io/hooks#usestate)s instead
-   [docs](https://reactjs.org/docs/hooks-reference.html#usereducer)

```
import React, { FC, Reducer, useCallback, useReducer } from 'react'
interface State {
  count: number
}
interface IncrementAction {
  type: 'increment'
}
interface DecrementAction {
  type: 'decrement'
}
type Action = IncrementAction | DecrementAction
const reducer: Reducer<State, Action> = (state, action) => {
  switch (action.type) {
    case 'increment':
      return { count: state.count + 1 }
    case 'decrement':
      return { count: state.count - 1 }
    default:
      throw new Error()
  }
}
export const Counter: FC = () => {
  const [state, dispatch] = useReducer(reducer, { count: 0 })
  const decrement = useCallback(() => dispatch({ type: 'decrement' }), [])
  const increment = useCallback(() => dispatch({ type: 'increment' }), [])
  return (
    <>
      Count: {state.count}
      <button type="button" onClick={decrement}>
        -
      </button>
      <button type="button" onClick={increment}>
        +
      </button>
    </>
  )
}
export default <Counter />
```

Count: 0

[](https://codesandbox.io/s/d29tn?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/rj21r?file=/src/example.tsx "test on CodeSandbox")

### `useLayoutEffect`

-   same as [`useEffect`](https://reactbyexample.github.io/hooks#useeffect) but runs synchronously, immediately after rendering
-   use for
    -   DOM manipulation
    -   when relying on order of effects
-   prefer [`useEffect`](https://reactbyexample.github.io/hooks#useeffect)
-   [docs](https://reactjs.org/docs/hooks-reference.html#uselayouteffect)

### `useImperativeHandle`

-   `useImperativeHandle(ref, createRefValueFn, deps?)`
-   use for
    -   exposing an imperative API
    -   syncing two refs
-   [docs](https://reactjs.org/docs/hooks-reference.html#useimperativehandle)

```
import React, {
  FC,
  Ref,
  RefObject,
  useCallback,
  useImperativeHandle,
  useRef,
} from 'react'

export interface Focusable {
  focus(): void
}

export const FocusableInput: FC<{ focusable?: Ref<Focusable> }> = ({
  focusable,
}) => {
  const inputRef = useRef<HTMLInputElement>(null)
  const focus = useCallback(() => {
    inputRef.current?.focus()
  }, [])
  useImperativeHandle(focusable, () => ({ focus }), [focus])

  return (
    <div>
      <label>
        focusable input
        <input ref={inputRef} placeholder="required" />
      </label>
    </div>
  )
}

export const Error: FC<{ target: RefObject<Focusable> }> = ({
  target,
  children,
}) => {
  const onClick = useCallback(() => {
    target.current?.focus()
  }, [target])
  return (
    <div>
      {children}
      <button type="button" onClick={onClick}>
        focus field
      </button>
    </div>
  )
}

const Example: FC = () => {
  const focusableRef = useRef<Focusable>(null)

  return (
    <>
      <FocusableInput focusable={focusableRef} />
      <Error target={focusableRef}>this field is required</Error>
    </>
  )
}

export default <Example />
```

focusable input

this field is required

## Custom Hooks

-   shorthand for a series of built-in hook calls
-   follow the [rules](https://reactbyexample.github.io/hooks#rules)
-   **ALWAYS** test by implementing in a component
-   when using effects **ALWAYS** test unmounting
-   when returning functions **ALWAYS** use [`useCallback`](https://reactbyexample.github.io/advanced-hooks#usecallback)

### Build-Your-Own Formik

-   still use [formik](https://formik.org/), this just shows that it’s not _✨magic✨_
-   cf. [basic formik](https://formik.org/docs/examples/basic)

```
import React, {
  ChangeEventHandler,
  createContext,
  FC,
  InputHTMLAttributes,
  SelectHTMLAttributes,
  useCallback,
  useContext,
  useState,
} from 'react'

// #region context
export interface FormContextType {
  state: Record<string, string>
  setState: (newState: Record<string, string>) => void
}

export const FormContext = createContext<FormContextType>(null!)

export const DebugForm: FC = () => {
  const form = useContext(FormContext)
  return <pre>{JSON.stringify(form.state, null, '  ')}</pre>
}
// #endregion

//

// #region form
export interface FormProps {
  initialValues: Record<string, string>
}

export const Form: FC<FormProps> = ({ children, initialValues }) => {
  const [state, setState] = useState(initialValues)

  const context: FormContextType = {
    state,
    setState: useCallback(
      (partial) => setState((current) => ({ ...current, ...partial })),
      [],
    ),
  }

  return (
    <FormContext.Provider value={context}>
      <form>{children}</form>
    </FormContext.Provider>
  )
}
// #endregion

//

// #region custom hook
export interface UseForm<Element extends { value: string }> {
  value: string
  onChange: ChangeEventHandler<Element>
}

export const useForm = <Element extends { value: string }>(
  name: string,
): UseForm<Element> => {
  const form = useContext(FormContext)

  const value = form.state[name]
  const onChange: ChangeEventHandler<Element> = useCallback(
    (event) => {
      form.setState({ [name]: event.target.value })
    },
    [form, name],
  )

  return { value, onChange }
}
// #endregion

//

// #region form items using custom hook
export interface InputProps extends InputHTMLAttributes<HTMLInputElement> {
  name: string
}
export const Input: FC<InputProps> = ({ name, ...props }) => {
  return <input {...useForm(name)} {...props} />
}

export interface SelectProps extends SelectHTMLAttributes<HTMLSelectElement> {
  name: string
}
export const Select: FC<SelectProps> = ({ name, children, ...props }) => {
  return (
    <select {...useForm(name)} {...props}>
      {children}
    </select>
  )
}
// #endregion

//

export default (
  <Form initialValues={{ title: 'mr', first: 'Steve', last: 'Buscemi' }}>
    <label>
      title
      <Select name="title">
        <option value="mr">Mr</option>
        <option value="mrs">Mrs</option>
        <option value="ms">Ms</option>
        <option value="dr">Dr</option>
        <option value="lord">Lord</option>
        <option value="prof">Prof</option>
        <option value="esq">Esq</option>
        <option value="dame">Dame</option>
        <option value="na">N/A</option>
      </Select>
    </label>
    <br />
    <label>
      first name
      <Input name="first" />
    </label>
    <br />
    <label>
      last name
      <Input name="last" />
    </label>
    <DebugForm />
  </Form>
)
```

title

  
first name

  
last name

{
  "title": "mr",
  "first": "Steve",
  "last": "Buscemi"
}

[](https://codesandbox.io/s/nnw3b?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/mbqpo?file=/src/example.tsx "test on CodeSandbox")

### On Click Out Event

-   a custom hook can return props in an object that can be spread
-   short, expressive & reusable
-   `<div {...useClickOut(() => setOpen(false))}>…</div>`
-   can cause issues, [use](https://reactjs.org/docs/jsx-in-depth.html#spread-attributes) [sparingly](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-props-no-spreading.md)

```
import React, {
  FC,
  MutableRefObject,
  Ref,
  useCallback,
  useEffect,
  useRef,
  useState,
} from 'react'
import classes from './example.module.css'

// #region custom hook
export interface UseClickOut<T extends HTMLElement> {
  ref: Ref<T>
}

export const useClickOut = <T extends HTMLElement>(
  eventHandler: (event: MouseEvent) => void,
): UseClickOut<T> => {
  const elementRef = useRef() as MutableRefObject<T>

  // as ref to avoid spamming `useEffect`
  const handlerRef = useRef<typeof eventHandler>(eventHandler)
  handlerRef.current = eventHandler

  useEffect(() => {
    const filteredHandler = (event: MouseEvent) => {
      const clickTarget = event.target as Node
      const isTargetInsideElement = elementRef.current.contains(clickTarget)
      if (!isTargetInsideElement) handlerRef.current(event)
    }

    document.addEventListener('click', filteredHandler)

    return () => {
      document.removeEventListener('click', filteredHandler)
    }
  }, [])

  return { ref: elementRef }
}
// #endregion

//

// #region using custom hook
interface DropdownProps {
  title: string
}

export const Dropdown: FC<DropdownProps> = ({ children, title }) => {
  const [open, setOpen] = useState(false)
  const toggle = useCallback(() => setOpen((o) => !o), [])

  return (
    <div className={classes.container} {...useClickOut(() => setOpen(false))}>
      <button type="button" className={classes.toggle} onClick={toggle}>
        {title} {open ? '🔽' : '🔼'}
      </button>
      {open && <div className={classes.content}>{children}</div>}
    </div>
  )
}
// #endregion

//

export default (
  <div>
    before dropdown
    <Dropdown title="toggle dropdown">
      <p>try clicking outside</p>
      <button type="button">in dropdown</button>
    </Dropdown>
    after dropdown
  </div>
)
```

before dropdown

after dropdown

[](https://codesandbox.io/s/rnund?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/pwv8p?file=/src/example.tsx "test on CodeSandbox")

### Keyboard Navigation

-   keyboard navigation is a common requirement for [accessible](https://www.w3.org/TR/wai-aria-practices/#keyboard-interaction) [components](https://www.w3.org/TR/wai-aria-practices/#keyboard-interaction-19)
-   using [context](https://reactbyexample.github.io/context) and custom hooks makes it possible to reuse this logic

```
import React, {
  createContext,
  FC,
  KeyboardEventHandler,
  MutableRefObject,
  Ref,
  useCallback,
  useContext,
  useLayoutEffect,
  useRef,
} from 'react'

// #region context
type RefsType = HTMLElement[]
export interface NavigationContextType {
  refs: MutableRefObject<RefsType>
  register: (el: HTMLElement) => void
}

export const NavigationContext = createContext<NavigationContextType>(null!)

export const NavigationContextProvider: FC = ({ children }) => {
  const refs = useRef<RefsType>([])
  const next = useRef<RefsType>([])

  // collect focusable elements
  const register = useCallback((el: HTMLElement) => {
    next.current.push(el)
  }, [])

  // once all elements are collected, publish on context
  useLayoutEffect(() => {
    refs.current = next.current
    next.current = []
  })

  return (
    <NavigationContext.Provider value={{ refs, register }}>
      {children}
    </NavigationContext.Provider>
  )
}
// #endregion

//

// #region custom hook
export interface UseNavigation<T extends HTMLElement> {
  ref: Ref<T>
  onKeyDown: KeyboardEventHandler<T>
}

export const useNavigation = <T extends HTMLElement>(): UseNavigation<T> => {
  const { refs, register } = useContext(NavigationContext)
  const ref = useRef<T>() as MutableRefObject<T>

  // ON EVERY RENDER, register element as focusable
  useLayoutEffect(() => {
    register(ref.current)
  })

  const onKeyDown = useCallback<KeyboardEventHandler<T>>(
    (event) => {
      const { length } = refs.current
      const currentIndex = refs.current.indexOf(event.target as HTMLElement)

      const navigationMap = {
        ArrowLeft: currentIndex - 1,
        ArrowUp: currentIndex - 1,
        ArrowRight: currentIndex + 1,
        ArrowDown: currentIndex + 1,
        Home: 0,
        PageUp: 0,
        End: length - 1,
        PageDown: length - 1,
      } as Record<string, number>

      const nextIndexCandidate = navigationMap[event.key]

      if (nextIndexCandidate == null) return

      event.preventDefault()

      const nextIndex = (length + nextIndexCandidate) % length

      const el = refs.current[nextIndex]
      el.focus()
    },
    [refs],
  )

  return { ref, onKeyDown }
}
// #endregion
```

[](https://codesandbox.io/s/57fen?file=/src/navigation.tsx "edit on CodeSandbox")

[](https://codesandbox.io/s/4q6vd?file=/src/navigation.tsx "test on CodeSandbox")

#### Tabs With Keyboard Navigation

```
import React, { FC, ReactNode, useCallback, useState } from 'react'
import classes from './example.module.css'
import { NavigationContextProvider, useNavigation } from './navigation'

export interface Tab {
  id: string
  title: string
  content: ReactNode
}

interface InternalTabButtonProps {
  activeTabId: string
  setActiveTabId: (id: string) => void
  tab: Tab
}
const InternalTabButton: FC<InternalTabButtonProps> = ({
  activeTabId,
  setActiveTabId,
  tab: { id, title },
}) => {
  const isActive = activeTabId === id

  return (
    <button
      type="button"
      className={classes.button}
      onClick={useCallback(() => setActiveTabId(id), [setActiveTabId, id])}
      {...useNavigation()}
    >
      {isActive ? '> ' : ''}
      {title}
    </button>
  )
}

export interface TabsProps {
  defaultTabId?: string
  tabs: Tab[]
}

export const Tabs: FC<TabsProps> = ({ defaultTabId, tabs }) => {
  const [{ id: firstTabId }] = tabs
  const [activeTabId, setActiveTabId] = useState(defaultTabId ?? firstTabId)

  const tabButtons = tabs.map((tab) => (
    <InternalTabButton
      key={tab.id}
      activeTabId={activeTabId}
      setActiveTabId={setActiveTabId}
      tab={tab}
    />
  ))

  const [activeTab] = tabs.filter(({ id }) => id === activeTabId)

  return (
    <div>
      <div>
        <NavigationContextProvider>{tabButtons}</NavigationContextProvider>
      </div>
      <div>{activeTab.content}</div>
    </div>
  )
}

const tabs = [
  { id: 'hello', title: 'Hello', content: <p>hello</p> },
  { id: 'world', title: 'World', content: <p>world</p> },
  { id: 'tabs', title: 'Tabs', content: <p>tabs</p> },
  { id: 'example', title: 'Example', content: <p>example</p> },
]
export default (
  <>
    <label>
      focus a tab, then use arrow keys to navigate between them
      <br />
      <input placeholder="focus this, press tab" />
    </label>
    <Tabs defaultTabId="tabs" tabs={tabs} />
  </>
)
```

focus a tab, then use arrow keys to navigate between them  

tabs

[](https://codesandbox.io/s/57fen?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/4q6vd?file=/src/example.tsx "test on CodeSandbox")

#### Accordion With Keyboard Navigation

```
import React, { FC, ReactNode, useCallback, useState } from 'react'
import classes from './example.module.css'
import { NavigationContextProvider, useNavigation } from './navigation'

export interface AccordionItem {
  id: string
  title: string
  content: ReactNode
}

interface InternalAccordionItemProps {
  activeItemIds: Set<string>
  toggle: (id: string) => void
  item: AccordionItem
}

const InternalAccordionItem: FC<InternalAccordionItemProps> = ({
  activeItemIds,
  toggle,
  item: { id, title, content },
}) => {
  const isActive = activeItemIds.has(id)
  return (
    <div>
      <button
        type="button"
        className={classes.button}
        onClick={useCallback(() => toggle(id), [toggle, id])}
        {...useNavigation()}
      >
        {isActive ? '🔽' : '🔼'} {title}
      </button>
      {isActive && <div>{content}</div>}
    </div>
  )
}

export interface AccordionProps {
  items: AccordionItem[]
}

export const Accordion: FC<AccordionProps> = ({ items }) => {
  const [activeItemIds, setActiveItemIds] = useState(new Set<string>())

  const toggle = useCallback((id: string) => {
    setActiveItemIds((current) => {
      const nextItemIds = new Set(current)
      if (nextItemIds.has(id)) {
        nextItemIds.delete(id)
      } else {
        nextItemIds.add(id)
      }
      return nextItemIds
    })
  }, [])

  return (
    <div>
      <NavigationContextProvider>
        {items.map((item) => (
          <InternalAccordionItem
            key={item.id}
            activeItemIds={activeItemIds}
            toggle={toggle}
            item={item}
          />
        ))}
      </NavigationContextProvider>
    </div>
  )
}

const items = [
  { id: 'hello', title: 'Hello', content: <p>hello</p> },
  { id: 'world', title: 'World', content: <p>world</p> },
  { id: 'accordion', title: 'Accordion', content: <p>accordion</p> },
  { id: 'example', title: 'Example', content: <p>example</p> },
]
export default (
  <>
    <label>
      use arrow keys to navigate between items
      <br />
      <input placeholder="focus this, press tab" />
    </label>
    <Accordion items={items} />
  </>
)
```

use arrow keys to navigate between items

## Routing

### Why?

-   navigating makes the page reload
-   without caching it can be slow
-   avoid page reloads by using a router

### How?

-   no official way, but many libraries
-   [`react-router`](https://github.com/ReactTraining/react-router) is the most popular
-   [other libraries to consider](https://github.com/enaqx/awesome-react#react-routing)
-   [`navi`](https://github.com/frontarm/navi) promising up-and-comer

### Using `react-router`

-   the following is just an overview, the [docs](https://reacttraining.com/react-router/) are more detailed

#### `Router`

-   [docs](https://reactrouter.com/core/api/Router)
-   at top-level
-   `BrowserRouter` for browser [docs](https://reactrouter.com/web/api/BrowserRouter)
-   `StaticRouter` for [server-side rendering](https://reactjs.org/docs/react-dom-server.html#rendertostring) [docs](https://reactrouter.com/core/api/StaticRouter)
-   `MemoryRouter` for testing [docs](https://reactrouter.com/core/api/MemoryRouter)

> examples use a custom `Router` based on `MemoryRouter`

#### `Route`

-   [docs](https://reactrouter.com/web/api/Route)
-   matches `path` to components
-   multiple can be active
-   can be nested, side-by-side
-   fully dynamic
-   can have params `/some/route/:param`

#### `Switch`

-   [docs](https://reactrouter.com/web/api/Switch)
-   ensures that only one `Route` is active at a time
-   use for fallback (404) routes

#### `Link`

-   [docs](https://reactrouter.com/web/api/Link)
-   replaces `a` tags to avoid reloads
-   `NavLink` can be used to apply “active styles” [docs](https://reactrouter.com/web/api/NavLink)

#### `Redirect`

-   [docs](https://reactrouter.com/web/api/Redirect)
-   when rendered, redirect to `to` prop
-   use it to keep old links working

#### `useParams`

-   [docs](https://reactrouter.com/core/api/Hooks/useparams)
-   get hold of params in your components

### Simple

```
import React, { FC } from 'react'
import { Route, Switch } from 'react-router'
import { Link } from 'react-router-dom'

export const Simple: FC = () => {
  return (
    <Switch>
      <Route path="/lorem">lorem</Route>
      <Route path="/ipsum">ipsum</Route>
      <Route path="/dolor">dolor</Route>
      <Route path="/">
        <h1>Home</h1>
        <ul>
          <li>
            <Link to="/lorem">lorem</Link>
          </li>
          <li>
            <Link to="/ipsum">ipsum</Link>
          </li>
          <li>
            <Link to="/dolor">dolor</Link>
          </li>
        </ul>
      </Route>
    </Switch>
  )
}

export default <Simple />
```

# Home

-   [lorem](https://reactbyexample.github.io/lorem)
-   [ipsum](https://reactbyexample.github.io/ipsum)
-   [dolor](https://reactbyexample.github.io/dolor)

[](https://codesandbox.io/s/ol8l5?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/p4v0t?file=/src/example.tsx "test on CodeSandbox")

### 404 Page

```
import React, { FC } from 'react'
import { NavLink, Route, Switch } from 'react-router-dom'
import classes from './example.module.css'

export const NavBar: FC = () => {
  return (
    <nav>
      <NavLink to="/" exact activeClassName={classes.activeLink}>
        home
      </NavLink>
      {' '}
      <NavLink to="/pricing" activeClassName={classes.activeLink}>
        pricing
      </NavLink>
      {' '}
      <NavLink to="/about" activeClassName={classes.activeLink}>
        about
      </NavLink>
      {' '}
      <NavLink
        to="/this-page-does-not-exist"
        activeClassName={classes.activeLink}
      >
        broken link
      </NavLink>
    </nav>
  )
}

export const Example: FC = () => {
  return (
    <div>
      <NavBar />
      <article>
        <Switch>
          <Route path="/pricing">pricing page</Route>
          <Route path="/about">about page</Route>
          <Route path="/" exact>
            home page
          </Route>
          <Route path="/">404 page</Route>
        </Switch>
      </article>
    </div>
  )
}

export default <Example />
```

[home](https://reactbyexample.github.io/) [pricing](https://reactbyexample.github.io/pricing) [about](https://reactbyexample.github.io/about) [broken link](https://reactbyexample.github.io/this-page-does-not-exist)

home page

[](https://codesandbox.io/s/1dvnv?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/4mh8t?file=/src/example.tsx "test on CodeSandbox")

### Using Params

```
import React, { FC } from 'react'
import { Redirect, Route, Switch, useParams } from 'react-router'
import { Link } from 'react-router-dom'
import { Database } from './database'

export const Article: FC = () => {
  const { articleId } = useParams<{ articleId: string }>()
  const article = Database.getArticleById(Number(articleId))
  const user = article && Database.getUserById(article.owner)

  return (
    <div>
      {user && article ? (
        <div>
          <h1>{article.title}</h1>
          <p>{article.content}</p>
          <Link to={`/user/${user.id}`}>
            <i>by {user.name}</i>
          </Link>
        </div>
      ) : (
        <h1>Cannot find article</h1>
      )}
    </div>
  )
}

export const User: FC = () => {
  const { userId } = useParams<{ userId: string }>()
  const user = Database.getUserById(userId)
  const articles = user ? user.articles.map(Database.getArticleById) : []

  return (
    <div>
      {user ? (
        <div>
          <h1>Posts from {user.name}</h1>
          {articles.length ? (
            <ul>
              {articles.map((article) => {
                if (!article) throw new Error()
                const { title, id } = article
                return (
                  <li key={id}>
                    <Link to={`/article/${id}`}>{title}</Link>
                  </li>
                )
              })}
            </ul>
          ) : (
            <p>{user.name} has no articles</p>
          )}
        </div>
      ) : (
        <h1>Cannot find user with id {userId}</h1>
      )}
    </div>
  )
}

export const Users: FC = () => {
  const users = Database.getUsers()
  return (
    <div>
      <h1>Users</h1>
      <ul>
        {users.map(({ id, name }) => (
          <li key={id}>
            <Link to={`/user/${id}`}>{name}</Link>
          </li>
        ))}
      </ul>
    </div>
  )
}

export const Params: FC = () => {
  return (
    <Switch>
      <Route path="/users">
        <Users />
      </Route>
      <Route path="/user/:userId">
        <User />
      </Route>
      <Route path="/article/:articleId">
        <Article />
      </Route>
      <Route path="/">
        <Redirect to="/users" />
      </Route>
    </Switch>
  )
}

export default <Params />
```

# Users

-   [Alice](https://reactbyexample.github.io/user/alice)
-   [Bob](https://reactbyexample.github.io/user/bob)
-   [Carol](https://reactbyexample.github.io/user/carol)

## Class Components

### What?

-   class components used to be the first class citizens
-   has state, props, and lifecycle methods
-   error prone, unless dead simple

### Why?

-   legacy, mainly
-   please use `FC` whenever possible
-   migrate class components to `FC` if possible

### How?

-   use [arrow functions](https://reactjs.org/docs/faq-functions.html#class-properties-stage-3-proposal) instead of methods [(docs)](https://reactjs.org/docs/faq-functions.html#why-is-binding-necessary-at-all)

#### `render`

-   examine `state` and `props` -> return JSX
-   MUST BE PURE
-   can’t use hooks 😞

```
import React, { Component, ReactNode } from 'react'

export interface CounterProps {
  defaultValue: number
}

interface CounterState {
  value: number
}

export class Counter extends Component<CounterProps, CounterState> {
  static defaultProps = { defaultValue: 0 }

  state = { value: this.props.defaultValue }

  decrement = (): void => this.setState(({ value }) => ({ value: value - 1 }))

  increment = (): void => this.setState(({ value }) => ({ value: value + 1 }))

  badIncrement(): void {
    // `this` is not bound
    this.setState(({ value }) => ({ value: value + 1 }))
  }

  render = (): ReactNode => {
    const { value } = this.state

    return (
      <div>
        <button type="button" onClick={this.decrement}>
          -
        </button>
        <span> {value} </span>
        <button type="button" onClick={this.increment}>
          +
        </button>
      </div>
    )
  }
}

export default (
  <>
    <Counter />
    <Counter defaultValue={5} />
  </>
)
```

0 5[](https://codesandbox.io/s/8k6ih?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/p5428?file=/src/example.tsx "test on CodeSandbox")

#### `componentDidMount`

-   after component rendered to DOM
-   use for:
    -   data fetching
    -   manipulating DOM

#### `componentDidUpdate`

-   after `state` or `props` update
-   usually a copy of `componentDidMount`

#### `setState`

-   triggers render
-   multiple calls are [batched](https://reactjs.org/docs/state-and-lifecycle.html#state-updates-may-be-asynchronous)
-   always use `setState` to update state
-   `this.state.something = 'bad'`

#### `componentWillUnmount`

-   before removing component from DOM
-   use for:
    -   freeing resources
    -   canceling requests

#### Other lifecycle methods

-   [docs](https://reactjs.org/docs/react-component.html)
-   [lifecycle methods cheat sheet](https://projects.wojtekmaj.pl/react-lifecycle-methods-diagram/)

### Bitcoin Price

```
import React, { Component, ReactNode } from 'react'
import { BitcoinAPI } from './bitcoin-api'

export interface BitcoinProps {}

interface BitcoinState {
  price: number | null
  fiat: 'gbp' | 'usd'
}

export class Bitcoin extends Component<BitcoinProps, BitcoinState> {
  state = { price: null, fiat: 'gbp' } as const

  mounted = false

  componentDidMount = (): void => {
    this.mounted = true
    this.updatePrice()
  }

  componentDidUpdate = (
    prevProps: BitcoinProps,
    prevState: BitcoinState,
  ): void => {
    const { fiat } = this.state
    if (prevState.fiat !== fiat) {
      this.updatePrice()
    }
  }

  componentWillUnmount = (): void => {
    this.mounted = false
  }

  private setGbp = () => this.setState({ fiat: 'gbp' })

  private setUsd = () => this.setState({ fiat: 'usd' })

  private getSymbol = () => ({ gbp: '£', usd: '$' }[this.state.fiat])

  private updatePrice = async () => {
    this.setState({ price: null })

    const { fiat } = this.state
    const value = await BitcoinAPI.getPrice(fiat).catch(() => NaN)

    if (this.mounted) this.setState({ fiat, price: value })
  }

  render = (): ReactNode => {
    const { price } = this.state

    return (
      <div>
        <button type="button" onClick={this.setGbp}>
          £
        </button>
        <button type="button" onClick={this.setUsd}>
          $
        </button>
        <br />
        {price == null ? (
          <span>loading price...</span>
        ) : (
          <span>
            {this.getSymbol()}
            {price}
          </span>
        )}
      </div>
    )
  }
}

export default <Bitcoin />
```

  
£23229

[](https://codesandbox.io/s/gtrww?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/2j79n?file=/src/example.tsx "test on CodeSandbox")

-   there is a subtle race-condition above; hard to resolve elegantly
-   cf. `FC` style below; shorter, simpler & race-condition free

```
import React, { FC, useCallback, useEffect, useMemo, useState } from 'react'
import { BitcoinAPI } from './bitcoin-api'

export const Bitcoin: FC = () => {
  const [fiat, setFiat] = useState<'gbp' | 'usd'>('gbp')
  const setGbp = useCallback(() => setFiat('gbp'), [])
  const setUsd = useCallback(() => setFiat('usd'), [])

  const [price, setPrice] = useState<number | null>(null)
  useEffect(() => {
    let shouldUpdate = true

    setPrice(null)
    BitcoinAPI.getPrice(fiat)
      .then((v) => shouldUpdate && setPrice(v))
      .catch(() => shouldUpdate && setPrice(NaN))

    return () => {
      shouldUpdate = false
    }
  }, [fiat])

  const symbol = useMemo(() => ({ gbp: '£', usd: '$' }[fiat]), [fiat])

  return (
    <div>
      <button type="button" onClick={setGbp}>
        £
      </button>
      <button type="button" onClick={setUsd}>
        $
      </button>
      <br />
      {price == null ? (
        <span>loading price...</span>
      ) : (
        <span>
          {symbol}
          {price}
        </span>
      )}
    </div>
  )
}

export default <Bitcoin />
```

  
£23229

## Higher Order Components

### Higher Order Functions

> A higher-order function is a function that does at least one of the following:
> 
> -   takes one or more functions as arguments
> -   returns a function as its result
> 
> — [Wikipedia](https://en.wikipedia.org/wiki/Higher-order_function)

### What?

> A higher-order component is a function that takes a component and returns a new component.
> 
> — [React docs](https://reactjs.org/docs/higher-order-components.html)

-   `const ComponentWithFeature = withFeature(InternalComponent)`
-   usually for injecting props in the wrapped component

### Why?

-   [code sharing](https://en.wikipedia.org/wiki/Cross-cutting_concern) for class components (and `FC`s)
-   `FC`s should always use [hooks](https://reactbyexample.github.io/custom-hooks)
-   HOCs can be [composed](https://reactjs.org/docs/higher-order-components.html#convention-maximizing-composability)

### `withTheme`

-   `withTheme` is a HOC that encapsulates `ThemeContext`
-   note the [`displayName` convention](https://reactjs.org/docs/higher-order-components.html#convention-wrap-the-display-name-for-easy-debugging)

```
import React, { Component, ComponentType, ReactNode } from 'react'
import { ThemeContext, ThemeContextType } from './internal/theme-context'

export interface PropsWithTheme {
  theme: ThemeContextType
}
export type PropsWithoutTheme<T> = Omit<T, 'theme'>

export const withTheme = <TProps extends PropsWithTheme>(
  WrappedComponent: ComponentType<TProps>,
): ComponentType<PropsWithoutTheme<TProps>> => {
  type WithThemeComponentProps = PropsWithoutTheme<TProps>

  return class WithThemeComponent extends Component<WithThemeComponentProps> {
    static displayName = `withTheme(${
      WrappedComponent.displayName || WrappedComponent.name || 'Component'
    })`

    private themeContextConsumer = (theme: ThemeContextType): ReactNode => {
      const props = { ...this.props, theme } as TProps
      return <WrappedComponent {...props} />
    }

    render = (): ReactNode => {
      return (
        <ThemeContext.Consumer>
          {this.themeContextConsumer}
        </ThemeContext.Consumer>
      )
    }
  }
}
```

[](https://codesandbox.io/s/be3z1?file=/src/theme-library/with-theme.tsx "edit on CodeSandbox")

[](https://codesandbox.io/s/9gj5o?file=/src/theme-library/with-theme.tsx "test on CodeSandbox")

-   injected `theme` prop can be used outside of render (cf. [`Context.Consumer`](https://reactjs.org/docs/context.html#contextconsumer))

```
import React, { Component, FC, ReactNode } from 'react'
import {
  DarkTheme,
  LightTheme,
  PropsWithTheme,
  withTheme,
} from './theme-library'

interface InternalThemedParagraphProps extends PropsWithTheme {
  children: ReactNode
}
class InternalThemedParagraph extends Component<InternalThemedParagraphProps> {
  componentDidMount = () => {
    // eslint-disable-next-line no-console
    console.log(this.props.theme)
  }

  render = () => {
    const {
      theme: {
        color: { foreground },
      },
      children,
    } = this.props
    return <p style={{ color: foreground }}>{children}</p>
  }
}
export const ThemedParagraph = withTheme(InternalThemedParagraph)

interface InternalThemedCardProps extends PropsWithTheme {
  children: ReactNode
}
const InternalThemedCard: FC<InternalThemedCardProps> = ({
  theme: {
    color: { background },
  },
  children,
}) => {
  return <div style={{ backgroundColor: background }}>{children}</div>
}
export const ThemedCard = withTheme(InternalThemedCard)

export default (
  <>
    <DarkTheme>
      <ThemedCard>
        <ThemedParagraph>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta ipsum
          sapiente ut pariatur. Aliquam suscipit consequuntur similique repellat
          praesentium eos odit. Ad ipsum voluptatibus natus dignissimos rerum.
          Laborum, molestias temporibus?
        </ThemedParagraph>
        <ThemedParagraph>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta ipsum
          sapiente ut pariatur. Aliquam suscipit consequuntur similique repellat
          praesentium eos odit. Ad ipsum voluptatibus natus dignissimos rerum.
          Laborum, molestias temporibus?
        </ThemedParagraph>
      </ThemedCard>
    </DarkTheme>
    <LightTheme>
      <ThemedCard>
        <ThemedParagraph>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta ipsum
          sapiente ut pariatur. Aliquam suscipit consequuntur similique repellat
          praesentium eos odit. Ad ipsum voluptatibus natus dignissimos rerum.
          Laborum, molestias temporibus?
        </ThemedParagraph>
        <ThemedParagraph>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta ipsum
          sapiente ut pariatur. Aliquam suscipit consequuntur similique repellat
          praesentium eos odit. Ad ipsum voluptatibus natus dignissimos rerum.
          Laborum, molestias temporibus?
        </ThemedParagraph>
      </ThemedCard>
    </LightTheme>
  </>
)
```

Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta ipsum sapiente ut pariatur. Aliquam suscipit consequuntur similique repellat praesentium eos odit. Ad ipsum voluptatibus natus dignissimos rerum. Laborum, molestias temporibus?

Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta ipsum sapiente ut pariatur. Aliquam suscipit consequuntur similique repellat praesentium eos odit. Ad ipsum voluptatibus natus dignissimos rerum. Laborum, molestias temporibus?

Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta ipsum sapiente ut pariatur. Aliquam suscipit consequuntur similique repellat praesentium eos odit. Ad ipsum voluptatibus natus dignissimos rerum. Laborum, molestias temporibus?

Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta ipsum sapiente ut pariatur. Aliquam suscipit consequuntur similique repellat praesentium eos odit. Ad ipsum voluptatibus natus dignissimos rerum. Laborum, molestias temporibus?

## Best Practices

> obviously opinionated, apply as appropriate

### Tools

-   [`typescript`](https://github.com/Microsoft/TypeScript)
    -   typed templates are awesome
    -   1000x better than [`propTypes`](https://reactjs.org/docs/typechecking-with-proptypes.html)
-   [`eslint`](https://github.com/eslint/eslint)
    -   automated code review
-   [`prettier`](https://github.com/prettier/prettier)
    -   never worry about about whitespace again
-   [`jest`](https://github.com/facebook/jest)
    -   unit testing never felt this good
-   [`husky`](https://github.com/typicode/husky) & [`lint-staged`](https://github.com/okonet/lint-staged)
    -   enforce linting rules on everyone
    -   less failed builds
-   [`create-react-app`](https://github.com/facebook/create-react-app)
    -   baked in with most of these

### Components

-   prefer `FC`
    -   [compare](https://reactbyexample.github.io/class-components#bitcoin-price)
    -   smaller the better
-   prefer primitive state/props over objects/arrays
    -   React can [optimize](https://reactjs.org/docs/hooks-reference.html#bailing-out-of-a-state-update) away updates

```
import React, { FC } from 'react'

export const BadFlexBox: FC<{
  place?: { align?: string; justify?: string }
}> = () => <></>

export const badFlexBox = (
  <BadFlexBox place={{ align: 'center' }}>children</BadFlexBox>
)

export const GoodFlexBox: FC<{
  align?: string
  justify?: string
}> = () => <></>

export const goodFlexBox = <GoodFlexBox align="center">children</GoodFlexBox>

export const Select: FC<{ options: string[] }> = () => <></>

const constantOptions = ['hello', 'world']
export const goodSelect = <Select options={constantOptions} />
export const badSelect = <Select options={['hello', 'world']} />
```

[](https://codesandbox.io/s/y31mj?file=/src/example.tsx "edit on CodeSandbox")

-   [custom hook](https://reactbyexample.github.io/custom-hooks) all the things
    -   even if it’s not (yet) shared
    -   easier testing, can be mocked
-   props
    -   use [destructuring](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment#Default_values_2) to set defaults
    -   [spread](https://reactbyexample.github.io/about-jsx#spread-props) unused props [(contentious)](https://reactjs.org/docs/jsx-in-depth.html#spread-attributes)

```
import React, { FC, InputHTMLAttributes } from 'react'

export const ClosedInput: FC<{ type?: 'text' | 'tel' }> = ({
  type = 'text',
}) => <input type={type} />

export const typeText = <ClosedInput />
export const typeTel = <ClosedInput type="tel" />
// export const cannotAddEvents = <ClosedInput onKeyDown={() => {}} />

export const OpenInput: FC<InputHTMLAttributes<HTMLInputElement>> = ({
  type = 'text',
  ...props
}) => <input type={type} {...props} />

export const canAddEvents = <OpenInput onKeyDown={() => {}} />
```

[](https://codesandbox.io/s/fw4tt?file=/src/example.tsx "edit on CodeSandbox")

-   parent-child communication & global state via context
    -   don’t [`cloneElement`](https://reactjs.org/docs/react-api.html#cloneelement)

```
import React, {
  createContext,
  CSSProperties,
  FC,
  ReactNode,
  useContext,
  useMemo,
} from 'react'

// #region global
export interface GlobalContextType {
  theme: 'dark' | 'light'
}
export const GlobalContext = createContext<GlobalContextType>({ theme: 'dark' })

export const WithGlobal: FC = () => {
  const { theme } = useContext(GlobalContext)
  const style = useMemo(
    (): CSSProperties => ({ color: theme === 'dark' ? '#f8f8f2' : '#282a36' }),
    [theme],
  )
  return <div style={style}>children</div>
}
// #endregion

//

// #region local
export const LocalContext = createContext<{ index: number }>(null!)

export const List: FC<{ items: ReactNode[] }> = ({ items }) => {
  return (
    <ul>
      {items.map((item, index) => (
        <LocalContext.Provider key={Math.random()} value={{ index }}>
          {item}
        </LocalContext.Provider>
      ))}
    </ul>
  )
}

export const NumberedItem: FC = ({ children }) => {
  const { index } = useContext(LocalContext)
  return (
    <li>
      ({index + 1}) {children}
    </li>
  )
}

export const UnnumberedItem: FC = ({ children }) => {
  return <li>{children}</li>
}

const items = [
  <UnnumberedItem>hello</UnnumberedItem>,
  <UnnumberedItem>world</UnnumberedItem>,
  <NumberedItem>hello</NumberedItem>,
  <NumberedItem>world</NumberedItem>,
]
export default <List items={items} />
// #endregion
```

-   hello
-   world
-   (3) hello
-   (4) world

[](https://codesandbox.io/s/90pvu?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/4kglc?file=/src/example.tsx "test on CodeSandbox")

### Performance

-   [`useCallback`](https://reactbyexample.github.io/advanced-hooks#usecallback) every event handler
-   [`useMemo`](https://reactbyexample.github.io/advanced-hooks#usememo) expensive computations
-   [`memo`](https://reactjs.org/docs/react-api.html#reactmemo) “don’t render this component unless props changed since the last render”
-   [`PureComponent`](https://reactjs.org/docs/react-api.html#reactpurecomponent) is [`memo`](https://reactjs.org/docs/react-api.html#reactmemo) for class components
-   test with [DevTools](https://github.com/facebook/react/tree/master/packages/react-devtools-extensions) and/or [why-did-you-render](https://github.com/welldone-software/why-did-you-render)
-   respect the [change detector](https://reactjs.org/docs/hooks-reference.html#bailing-out-of-a-state-update) ([`Object.is()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/is))

```
import React, {
  ChangeEventHandler,
  FC,
  memo,
  useCallback,
  useMemo,
  useState,
} from 'react'

const words = [
  'Lorem',
  'ipsum',
  'dolor',
  'sit',
  'amet',
  'consectetur',
  'adipiscing',
  'elit',
]

export const Slower: FC = () => {
  const [filter, setFilter] = useState('')

  return (
    <>
      <input
        aria-label="filter"
        placeholder="filter"
        value={filter}
        onChange={(event) => setFilter(event.target.value)}
      />
      <ul>
        {words
          .filter((word) => word.toLowerCase().includes(filter.toLowerCase()))
          .map((word) => (
            <li key={word}>{word}</li>
          ))}
      </ul>
    </>
  )
}

export const ProbablyFaster: FC = memo(() => {
  const [filter, setFilter] = useState('')
  const onChange = useCallback<ChangeEventHandler<HTMLInputElement>>(
    (event) => setFilter(event.target.value),
    [],
  )
  const filteredWords = useMemo(
    () =>
      words.filter((word) => word.toLowerCase().includes(filter.toLowerCase())),
    [filter],
  )

  return (
    <>
      <input
        aria-label="filter"
        placeholder="filter"
        value={filter}
        onChange={onChange}
      />
      <ul>
        {filteredWords.map((word) => (
          <li key={word}>{word}</li>
        ))}
      </ul>
    </>
  )
})

export default <ProbablyFaster />
```

-   Lorem
-   ipsum
-   dolor
-   sit
-   amet
-   consectetur
-   adipiscing
-   elit

[](https://codesandbox.io/s/ufwkn?file=/src/example.tsx "edit on CodeSandbox")[](https://codesandbox.io/s/xs3mt?file=/src/example.tsx "test on CodeSandbox")

### Organization

-   1 feature per directory
-   1 component per file
-   helper & tightly coupled components / hooks can be in same directory
-   keep business logic out of components

```
import React, { FC, useEffect, useState } from 'react'

// #region tangled business logic
export const WithBusiness: FC = () => {
  const [result, setResult] = useState(null)
  useEffect(() => {
    fetch('my-business/api/resource.json', {
      headers: { that: 'a', component: 'should', not: 'worry', about: '!' },
    })
      .then((r) => r.json()) // untyped interface
      .then(setResult)
    // no error handling
  }, [])
  return <>display {result} here</>
}

/**
 * @example tests
 * ```
 * describe('WithBusiness', () => {
 *   beforeEach(() => {
 *     // no no
 *     jest.spyOn(window, 'fetch').mockRejectedValue(new Error())
 *   })
 * })
 * ```
 */

// #endregion

//

// #region separate business logic
// #region my-api.ts
export interface Resource {
  defined: 'interface'
}
class MyAPIImpl {
  getResource(): Promise<Resource> {
    throw new Error('not implemented')
  }
}
export const MyAPI = new MyAPIImpl()

/**
 * @example tests
 * ```
 * describe('MyApi', () => {
 *   beforeEach(() => {
 *     // the only place where this has to be done
 *     jest.spyOn(window, 'fetch').mockRejectedValue(new Error())
 *   })
 * })
 * ```
 */
// #endregion

// #region use-my-resource.ts
export const useMyAPIResource = (): [null | unknown, Resource | null] => {
  const [result, setResult] = useState<Resource | null>(null) // typed
  const [error, setError] = useState<null | unknown>(null)
  useEffect(() => {
    let shouldUpdate = true
    MyAPI.getResource()
      .then((r) => shouldUpdate && setResult(r))
      .catch((e) => shouldUpdate && setError(e)) // unified error handling
    return () => {
      shouldUpdate = false
    }
  }, [])

  return [error, result] // clear interface that forces error handling
}
// #endregion

// #region my-resource.tsx
export const WithoutBusiness: FC = () => {
  const [error, resource] = useMyAPIResource()

  if (error) return <>oh no</>

  if (resource) return <>here it is {resource.defined}</>

  return <>loading</>
}

// it is much easier to mock either hook or api (don't mock both)
/**
 * @example tests
 * ```
 * jest.mock('./use-my-api-resource')
 * const useMyAPIResourceMock = useMyAPIResource as jest.MockedFunction<
 *   typeof useMyAPIResource
 * >
 * describe('WithoutBusiness', () => {
 *   beforeEach(() => {
 *     useMyAPIResourceMock.mockReturnValue([null, { defined: 'interface' }])
 *   })
 * })
 * ```
 */
// #endregion
// #endregion
```

[](https://codesandbox.io/s/8z9ip?file=/src/example.tsx "edit on CodeSandbox")

### Forms

-   see [Events & Forms](https://reactbyexample.github.io/events-forms)
-   [pick](https://github.com/enaqx/awesome-react#forms) and use a [form library](https://github.com/formium/formik)
-   when implementing form controls use [`value` & `onChange`](https://reactjs.org/docs/forms.html#controlled-components)
# Final Words[#](https://reactbyexample.github.io/final-words#final-words)

-   well done for making it this far

## What next?

-   build stuff
    -   todo app
    -   [7guis](https://eugenkiss.github.io/7guis/)
    -   [hacker news progressive web app](https://hnpwa.com/)
    -   [project ideas from React](https://reactjs.org/community/examples.html)

## Get in touch

-   [star this on GitHub](https://github.com/reactbyexample/react-by-example)
-   [found a bug? have a better example? suggestions for new topics?](https://github.com/reactbyexample/react-by-example/issues)
-   [buy me a beer](https://monzo.me/barnabasforgo/3)
-   [ask a question? hire me?](mailto:react-by-example@outlook.com)

