// Polymorphism allows objects of different classes to be treated as objects of a common superclass. This enables flexibility and extensibility in code.

class Animal {
  void speak() {
    print('Animal makes a sound.');
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

// Subclass 3
class Lion extends Animal {
  @override
  void speak() {
    print('Lion Roars.');
  }
}

void main() {
  // List of animals, using the base class type
  List<Animal> animals = [Dog(), Cat(), Lion()];

  // Polymorphic behavior
  for (var animal in animals) {
    animal.speak(); // Calls the appropriate subclass method
  }
}
