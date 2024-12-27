// Method overloading refers to the ability to define multiple methods with the same name but with different parameters.
// Dart does not support method overloading directly, but you can achieve similar functionality using optional parameters or named parameters.

// class Calculator {
//   int add(int a, int b) {
//     return a + b;
//   }

//   double add({double a, double b}) { // it shows an error
//     return a + b;
//   }
// }

// void main() {
//   var calc = Calculator();
//   print(calc.add(2, 3)); // Output: 5
//   print(calc.add(2.5, 3.5)); // Output: 6.0
// }

// sol:
// You can use the dynamic type to allow the method to handle both int and double.

class Calculator {
  num add({required num a, required num b}) {
    return a + b;
  }
}

void main() {
  var calc = Calculator();
  print(calc.add(a: 2, b: 3));     // Output: 5
  print(calc.add(a: 2.5, b: 3.5)); // Output: 6.0
}

