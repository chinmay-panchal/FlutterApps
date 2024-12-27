/*
Inheritance is a mechanism that allows a class (subclass) to inherit properties and methods from another class (superclass). 
This promotes code reuse and establishes a hierarchical relationship between classes.
*/

class Animal {
  void speak() {
    print('Animal speaks.');
  }

  void eat() {
    print('Animal eats');
  }
}

class Dog extends Animal {
  @override
  void speak() {
    print('Dog Barks');
  }
}

void main() {
  var dog1 = Animal();
  Animal Dog1 = Dog();
  var dog2 = Dog();

  dog1.speak(); // specific to dog
  Dog1.speak(); // specific to dog
  dog2.speak(); // specific to dog
  dog2.eat(); // inherited from animal
}
