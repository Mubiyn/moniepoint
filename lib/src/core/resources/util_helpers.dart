class UtilsHelpers {
  UtilsHelpers._();

  static String? validateRequiredFields(String? value,
      {required String label}) {
    if (value!.trim().isEmpty || value.trim().length > 70) {
      return '$label Field cannot be empty';
    }
    return null;
  }
}
