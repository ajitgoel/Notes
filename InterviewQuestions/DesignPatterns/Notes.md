## using Decorator pattern over inheritance

==The Decorator design pattern is used to *wrap* one object with another object.== The point of wrapping one object with another object is ==so that the original object’s behavior can be modified. The wrapper object can be used as a substitute for the original object because of the fact that both objects either share the same abstract class or implement the same interface.==

## ~~Inheritance vs the Decorator Pattern~~

~~The thing that both inheritance and the decorator pattern have in common is the fact that they both allow you to change how an object behaves. But how they achieve this change in behavior is where inheritance and the decorator pattern are different.~~

## ~~The Decorator pattern makes run-time object changes easier~~

~~With inheritance, dynamically changing the behavior of an object can be a burdensome process. Suppose that you want to dynamically change the behavior of an object using inheritance. Since we are dealing with inheritance, you will need to use a *child* class and then create an object of that child class in order to get the desired effect. After you create the child class object you will then need to copy the state from the current object into the new child class object – because you will presumably want to still save the state of the current object. And finally, after you are done copying the state, you will want to discard the old object since you no longer need it. This is obviously a long process that can be quite a pain to implement over and over again.~~

~~But if we use the Decorator pattern instead, it is a lot easier to dynamically change the behavior of the object. All we have to do is wrap the current object with another object that contains the extra behavior that is desired.~~

## ~~The Decorator Pattern makes multiple behavior modifications easier~~

~~Suppose that you have many different changes that you would like to implement for a given class. And, also assume that those changes do not conflict with one another, so you can combine those modifications in any order without having to worry about potential conflicts. In this scenario, using the Decorator pattern can be very advantageous over inheritance. Let’s go over an example to understand this concept further.~~

==As our example, let’s say that we have a Car class. This class could have many different behaviors like Automatic, Manual, Convertible, etc. We could have these behaviors implemented using inheritance. So, we could create classes called AutomaticCar, ManualCar, or ConvertibleCar that all derive from the Car class. While this is just fine for a reasonable number of child classes, for more behaviors (like LuxuryCar, SedanCar, etc) this process of creating more and more child classes can quickly become very messy. But, by using the Decorator pattern instead of inheritance, we can avoid this problem of having far too many child classes. This is because with the Decorator pattern, each and every behavior is described by just one Decorator class. And, you can specify whatever behaviors you want by applying the desired set of decorations.==

==if you do not need to dynamically change the way an object behaves, then inheritance is the better option because you then do not need to deal with the complexity of the Decorator pattern.==

------

## Adapter Pattern with a twist

One of my friends recently went to an interview to a very well known startup company. It is supposed to hire only the very best people in the industry.  One of the problem that he was asked to white board was:

You have a robot that can turn left and right. It can also move forward and backwards. You have a legacy robot that can only turn right and move forward. You want the legacy robot to turn left and to move backwards. Design a adapter class that would allow the legacy robot to turn right and to move backwards.

**Solution**

![[Pasted image 20230225154458.png]]

using System;
using System.Collections.Generic;
using System.Linq;
public interface IRobot
{
    void GoFront(int noOfSteps);
    void GoBack(int noOfSteps);
    void TurnRight(int degrees);
    void TurnLeft(int degrees);
}
public class LegacyRobot
{
    public void GoFront(int noOfSteps)
    {
    }
    public void TurnRight(int degrees)
    {
    }
}
public class Robot : IRobot
{
    public void GoFront(int noOfSteps)
    {
    }
    public void GoBack(int noOfSteps)
    {
    }
    public void TurnRight(int degrees)
    {
    }
    public void TurnLeft(int degrees)
    {
    }
}
public class LegacyRobotAdapter : IRobot
{
    LegacyRobot legacyRobot;
    public LegacyRobotAdapter(LegacyRobot legacyRobot)
    {
        this.legacyRobot = legacyRobot;
    }
    public void GoFront(int noOfSteps)
    {
        this.legacyRobot.GoFront(noOfSteps);
    }
   /*The legacy robot can go back by turning right by 180 degrees then going front by the number of steps requested by the client then turning right by 180 degrees to be facing from where the robot started from*/
    public void GoBack(int noOfSteps)
    {
        this.legacyRobot.TurnRight(180);
        this.legacyRobot.GoFront(noOfSteps);
        this.legacyRobot.TurnRight(180);
    }
    public void TurnRight(int degrees)
    {
        this.legacyRobot.TurnRight(degrees);
    }
	/*The legacy robot can turn left by turning right by 360 degrees minus the client requested degrees to turn*/
    public void TurnLeft(int degrees)
    {
        this.legacyRobot.TurnRight(360 - degrees);
    }
}

------

# Design Pattern - Factory Pattern

Factory pattern is one of the most used design patterns in Java. This type of design pattern comes under creational pattern as this pattern provides one of the best ways to create an object.

In Factory pattern, we create object without exposing the creation logic to the client and refer to newly created object using a common interface.

## Step 1

Create an interface.

*Shape.java*

```
public interface Shape {
   void draw();
}
```

## Step 2

Create concrete classes implementing the same interface.

*Rectangle.java*

```
public class Rectangle implements Shape {
   @Override
   public void draw() {
      System.out.println("Inside Rectangle::draw() method.");
   }
}
```

*Square.java*

```
public class Square implements Shape {
   @Override
   public void draw() {
      System.out.println("Inside Square::draw() method.");
   }
}
```

*Circle.java*

```
public class Circle implements Shape {
   @Override
   public void draw() {
      System.out.println("Inside Circle::draw() method.");
   }
}
```

## Step 3

Create a Factory to generate object of concrete class based on given information.

*ShapeFactory.java*

```
public class ShapeFactory {	
   //use getShape method to get object of type shape 
   public Shape getShape(String shapeType){
      if(shapeType == null){
         return null;
      }		
      if(shapeType.equalsIgnoreCase("CIRCLE")){
         return new Circle();         
      } else if(shapeType.equalsIgnoreCase("RECTANGLE")){
         return new Rectangle();
         
      } else if(shapeType.equalsIgnoreCase("SQUARE")){
         return new Square();
      }    
      return null;
   }
}
```

## Step 4

Use the Factory to get object of concrete class by passing an information such as type.

*FactoryPatternDemo.java*

```
public class FactoryPatternDemo {
   public static void main(String[] args) {
      ShapeFactory shapeFactory = new ShapeFactory();
      //get an object of Circle and call its draw method.
      Shape shape1 = shapeFactory.getShape("CIRCLE");
      //call draw method of Circle
      shape1.draw();
      //get an object of Rectangle and call its draw method.
      Shape shape2 = shapeFactory.getShape("RECTANGLE");
      //call draw method of Rectangle
      shape2.draw();
      //get an object of Square and call its draw method.
      Shape shape3 = shapeFactory.getShape("SQUARE");
      //call draw method of square
      shape3.draw();
   }
}
```

## Step 5

Verify the output.

```
Inside Circle::draw() method.
Inside Rectangle::draw() method.
Inside Square::draw() method.
```

------

## Convert the interface of a class into another interface that the clients expects(Adapter Pattern)

![[Pasted image 20230301211354.png]]

**Adapter pattern:**

class Program
{
    static IExpectedInterface dependency = new Adapter(new TargetClass());
    static void Main(string[] args)
    {
        dependency.MethodA();
    }
}
public interface IExpectedInterface
{
    void MethodA();
}
public class Adapter : IExpectedInterface
{
    public Adapter(TargetClass target)
    {
        this.target = target;
    }
    public void MethodA()
    {
        target.MethodB();
    }
    private TargetClass target;
}
public class TargetClass
{
    public void MethodB()
    {
    }
}

*Advantages of using a Adaptor pattern:**

- Adapter pattern lets classes work together that couldn’t otherwise because of incompatible interfaces.
- The code is more maintainable.
- most of the applications using third party libraries use adapters as a middle layer between the application and the 3rd party library to decouple the application from the library. If another library has to be used only an adapter for the new library is required without having to change the application code.