class ValidationMixin {
  String validateEmail(String value) {
    if (!value.contains('@') && !value.contains('.com')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length < 6) {
      return 'Password must be atleast 6 characters';
    }
    return null;
  }
}
