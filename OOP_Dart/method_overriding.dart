// Method overriding occurs when a subclass provides a specific implementation of a method that is already defined in its superclass. 
// It allows subclasses to tailor the behavior of inherited methods to suit their specific needs.

class Animal {
  void speak() {
    print('Animal speaks.');
  }
}

class Dog extends Animal {
  @override
  void speak() {
    print('Dog barks.');
  }
}

void main() {
  var dog = Dog();
  dog.speak(); // Output: Dog barks.
}