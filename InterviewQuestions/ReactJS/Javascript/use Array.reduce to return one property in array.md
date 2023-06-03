```
interface Person {id: number;name: string;age: number;}
const people: Person[] = [{id:1,name: 'John', age: 25 },{ id: 2, name: 'Jane', age: 30 },{ id: 3, name: 'Alex', age: 40 },];
const names: string[] = people.reduce((result: string[], person: Person) => {
  result.push(person.name);
  return result;
}, []);
console.log(names);
```