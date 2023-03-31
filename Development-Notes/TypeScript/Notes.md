**turn typescript object into json string:** 
npm install flatted
import {parse, stringify, toJSON, fromJSON} from 'flatted';
stringify(arr); 
or 
JSON.stringify(object)

###### Check variable is null or undefined
use `!value`
will evaluate to `true` if `value` is:
-   `null`
-   `undefined`
-   `NaN`
-   empty string `''`
-   `0`
-   `false`

###### typescript version in project**: package.json=> devDependencies => "typescript": "^2.4.0"
**Nullish Coalescing**: `let x = foo ?? bar()` instead of 
```javascript
let x = (foo !== null && foo !== undefined)?foo:bar();
```
**TypeScript 3.7 => Optional chaining, Nullish Coalescing:** `let x = foo?.bar.baz();` instead of 
```
if(foo != null && foo != undefined) {
   x = foo.bar.baz();
} 
```
**Type 'string | undefined' is not assignable to type 'string' Error**
**non-null assertion operator:** It tells TypeScript that even though something looks like it could be null, it can trust you that it's not:
```javascript
let name1:string = person.name!; 
//                            ^ note the exclamation mark here 
```