###### string concatenation:
var username = 'craig';
console.log(`hello ${username}`);

###### Convert Array of Objects into Comma Separated String extracting only one property
let result=Array.prototype.map.call(arrayObjects, function(item) { return item.name; }).join(",");

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

###### Remove elements that have are a "" string:
let arrayResult = array.filter(function(item){return item!==''});

###### Remove duplicate array elements
let arrayResult = array1.filter(function(item, index){return array1.indexOf(item) === index});

###### change object array to comma seperated string, for a property in the object
let resultString = Array.prototype.map.call(objectArray, function(item) { return item.specificProperty; }).join(",");

###### find first element of object array matching a boolean condition
###### Notes: Array.find() return the first matching element, undefined if it finds nothing, Array.filter returns a new array containing all matching elements, [] if it matches nothing.
let element=array.find(function (item) {return item.specificProperty === propertyValue;});