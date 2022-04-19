##  Type casting
Implicit casting is done automatically by Java (converting a smaller type to a larger type size): byte -> short -> char -> int -> long -> float -> double Explicit casting should be done manually (converting a larger type to a smaller size type): double -> float -> long -> int -> char -> short -> byte
Remember 1 casting rule, implicit casting only work for larger type direction-->-->-->--> When you're trying to insert big into small, you need to do explicit casting<--(explicit)<--

Q: Select all lines where explicit casting is required.
long lo = Integer.MAX_VALUE; // (1)
==int i = lo; // (2)
char ch = i; // (3)==
double d = ch; // (4)
==float f = d; // (5)==

The combination of the name of the method and the list of its parameters is known as a method signature.

Q: Given a variable **str** of the type **String**.
 Select one or more options from the list
==**str.substring(0, 5)** returns a substring from 0 to 4 indexes (inclusive) of the string.==
**str[n]** returns a character that has the index n.
**str.get(n)** returns a character that has the index n.
**str.substring(0, 3)** returns a substring from 0 to 3 indexes (inclusive) of the string.
==**str.charAt(n)** returns a character that has the index n.==

## Arrays as parameters
##### Varargs and other parameters
If a method has more than one parameter, the `vararg` parameter must be the last one in the declaration of the method.

Q: You are given a method with the following declaration:
public static int method(int[] array, int... vararg) { return 1; }
Select all correct ways to invoke this method.
 ==method(new int[] { 1, 2, 3 });
method(new int[] { 1, 2, 3 }, 4, 5);==
method(1, 2, 3);
method();
==method(new int[] { 1, 2, 3 }, new int[] { 4, 5, 6 });==

## Final variables
Find two lines in the code that will cause compile errors.
final Scanner scanner = new Scanner(System.in); // 1
final int a;                                    // 2
==final int b = scanner.nextInt() + a;            // 3==
final int c = 0;                                // 4
==c = b;                                          // 5==
System.out.println(c + 1);                      // 6

## Write, compile, and run
Select all correct statements.
 ==The JVM understands bytecode.==
A computer understands source code.
==To run a compiled Java program, a JVM must be installed on the computer.
The JVM provides platform independence for Java programs.==

## Package
You have the following public classes:
org.demo.A
org.demo.mypackage.B
org.demo.mypackage.C
In the body of the class org.demo.mypackage.B you'd like to use other classes for writing fields:
package org.demo.mypackage;
public class B {
    C c1 = new C();  // (1)
    C c2 = new org.demo.mypackage.C(); // (2)
    mypackage.C c3 = new org.demo.mypackage.C(); // (3)
    org.demo.A a = new org.demo.A(); // (4)
    A a1 = new A(); // (5)
}
Select all correct lines (see the number in comments).
==Just remember that if two classes are in the same package you can use them without import. And to access class without importing package you have to use full name==
 Select one or more options from the list
==1
2==
3
==4==
5

Which of the following is a correct statement about default packages in Java?
 Select one option from the list
Import statement can't import a class from a named package into a java file inside the default package.
Classes inside the default package are invisible to each other.
==Import statement can't import a class from the default package into a java file inside a named package.==