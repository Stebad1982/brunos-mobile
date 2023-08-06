enum Screens {
  home("Home"),
  profile("Profile"),
  forgetPassword("ForgetPassword"),
  registerUser("RegisterUser")
  ;

  const Screens(this.text);

  final String text;
}

enum Plans {
  transitional("Transitional"),
  monthly("Monthly"),
  oneTime("OneTime");

  const Plans(this.text);

  final String text;
}

enum AddressLabel {
  home("Home"),
  office("Office"),
  other("Other");

  const AddressLabel(this.text);

  final String text;
}


enum SharedPreferencesKeys {
  authToken("auth_token");

  const SharedPreferencesKeys(this.text);

  final String text;
}

enum EndPoints {
  signIn('login'),
  signUp(''),
  forgotPassword('forgot-password');

  final String url;

  const EndPoints(this.url);
}
