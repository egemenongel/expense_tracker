String? validation(String? value) {
  if (value!.isEmpty) {
    return "This field cannot be empty";
  }
}

String? costValidation(String? value) {
  if (value!.isEmpty) {
    return "This field cannot be empty";
  } else if (double.tryParse(value) == null) {
    return "Please type a number";
  }
}
