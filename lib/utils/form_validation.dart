class FormValidation {
  static String? empty(String? value) {
    if (value!.isEmpty) {
      return "This field cannot be empty";
    }
  }

  static String? type(String? value) {
    if (value!.isEmpty) {
      return "This field cannot be empty";
    } else if (double.tryParse(value) == null) {
      return "Please type a number";
    }
  }
}
