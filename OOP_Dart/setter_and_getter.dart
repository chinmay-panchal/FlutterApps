class Rectangle {
  double _width = 0; // Private variable
  double _height = 0; // Private variable

  // Getter for width
  double get width => _width;

  // alternative
  // double get width {
  //   return _width; // Logic to retrieve the value
  // }

  // Setter for width
  set width(double value) {
    if (value > 0) {
      _width = value;
    } else {
      print('Width must be positive.');
    }
  }

  // Getter for height
  double get height => _height;

  // Setter for height
  set height(double value) {
    if (value > 0) {
      _height = value;
    } else {
      print('Height must be positive.');
    }
  }

  // Calculate area using getters
  double get area => _width * _height;
}

void main() {
  var rect = Rectangle();

  // Setting width and height
  rect.width = 5;  // Calls the setter
  rect.height = 10; // Calls the setter

  // Getting width, height, and area
  print('Width: ${rect.width}');  // Calls the getter
  print('Height: ${rect.height}'); // Calls the getter
  print('Area: ${rect.area}');     // Getter for calculated property
}