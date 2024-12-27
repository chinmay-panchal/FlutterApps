// Abstract class
abstract class Animal {
  void speak(); // Abstract method (no implementation)
  void eat() {
    // Concrete method (with implementation)
    print('Animal is eating.');
  }
}

// Subclass 1
class Dog extends Animal {
  @override
  void speak() {
    print('Dog barks.');
  }
}

// Subclass 2
class Cat extends Animal {
  @override
  void speak() {
    print('Cat meows.');
  }
}

void main() {
  // var animal = Animal(); // Error: Cannot instantiate an abstract class

  Animal dog = Dog(); // Polymorphism in action
  Animal cat = Cat();

  dog.speak(); // Calls Dog's implementation
  dog.eat();   // Calls the inherited implementation from Animal

  cat.speak(); // Calls Cat's implementation
  cat.eat();   // Calls the inherited implementation from Animal
}
