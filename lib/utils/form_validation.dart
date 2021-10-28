class FormValidation {
  static String? emptyValidation(String? value) {
    if (value!.isEmpty) {
      return "This field cannot be empty";
    }
  }

  static String? typeValidation(String? value) {
    if (value!.isEmpty) {
      return "This field cannot be empty";
    } else if (double.tryParse(value) == null) {
      return "Please type a number";
    }
  }
}
