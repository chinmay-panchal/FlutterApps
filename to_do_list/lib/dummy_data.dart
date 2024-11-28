class DummyData {
  String text; // Non-nullable
  bool isChecked;

  DummyData({
    required this.text,
    this.isChecked = false, // Defaults to unchecked
  });
}