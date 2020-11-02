**Type Checking: typeof, GetType, or is?**
All are different.
==•typeof takes a type name (which you specify at compile time).
•GetType gets the runtime type of an instance.
•is returns true if an instance is in the inheritance tree.==
Example
class Animal { }
class Dog : Animal { }
void PrintTypes(Animal a) 
{
	==print(a.GetType() == typeof(Animal)) // false
	print(a is Animal) // true
	print(a.GetType() == typeof(Dog)) // true==
}
Dog spot = new Dog();
PrintTypes(spot);

What about typeof(T)? Is it also resolved at compile time?
Yes. T is always what the type of the expression is. Remember, a generic method is basically a whole bunch of methods
with the appropriate type. Example:
string Foo<T>(T object) { return typeof(T).Name; }
Animal probably_a_dog = new Dog();
Dog definitely_a_dog = new Dog();
Foo(probably_a_dog); // this calls Foo<Animal> and returns "Animal"
Foo<Animal>(probably_a_dog); // this is exactly the same as above
Foo<Dog>(probably_a_dog); // !!! This will not compile. The parameter expects a Dog, you cannot pass in an Animal.
Foo(definitely_a_dog); // this calls Foo<Dog> and returns "Dog"
Foo<Dog>(definitely_a_dog); // this is exactly the same as above.
Foo<Animal>(definitely_a_dog); // this calls Foo<Animal> and returns "Animal".
Foo((Animal)definitely_a_dog); // this does the same as above, returns "Animal "