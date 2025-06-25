String? validateHeight(String value) {
  final height = int.tryParse(value);
  if (height == null || height < 1) {
    return "Invalid height";
  }
  return null;
}

String? validateWeight(String value) {
  final weight = int.tryParse(value);
  if (weight == null || weight < 1) {
    return "Invalid weight";
  }
  return null;
}

