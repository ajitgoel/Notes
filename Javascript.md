###### string concatenation:

var username = 'craig';
console.log(`hello ${username}`);

###### Convert object instance to string:
const objectInstanceAsString=JSON.stringify(objectInstance);

###### Convert string to object instance:
const objectInstance=JSON.parse(objectInstanceAsString);

###### check variable is null or undefined:
a. if (some_variable === undefined || some_variable === null)
b. if (some_variable == null)