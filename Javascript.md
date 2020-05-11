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

###### compare strings:
var username = 'craig';
if(username === 'craig')
###### case insensitive string comparison:
var areEqual = string1.toUpperCase() === string2.toUpperCase();
###### Convert Array to Object:
function toObject(arr) 
{
  var rv = {};
  for (var i = 0; i < arr.length; ++i)
  {
    if (arr[i] !== undefined) 
    {
      rv[i] = arr[i];
    }
  }  
  return rv;
}

###### Convert Object to an Array:
const zoo = {lion: '🦁',panda: '🐼',};
Object.keys(zoo);
// ['lion', 'panda']
Object.values(zoo);
// ['🦁', '🐼']
Object.entries(zoo);
// [ ['lion', '🦁'], ['panda', '🐼'] ]

###### array to string with newline after each element:
var arr = ['apple','banana','mango'];
arr.join('<br/>')
###### string (with elements seperated by divider) to string with newline after each element:
var str = "apple,banana,mango";
str.split(',').join("\r\n")