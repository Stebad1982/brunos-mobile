enum Screens {
  home("Home"),
  profile("Profile"),
  forgetPassword("ForgetPassword"),
  registerUser("RegisterUser"),
  login("Login"),
  ;

  const Screens(this.text);

  final String text;
}

enum Plans {
  transitional("Transitional"),
  monthly("Monthly"),
  //oneTime("OneTime"),
  product("Product");

  const Plans(this.text);

  final String text;
}

enum ProductCategories {
  standardRecipes("Standard Recipes"),
  clothing("Clothing"),
  toys("Toys");

  const ProductCategories(this.text);

  final String text;
}


enum Puppy {
  boy("boy"),
  girl("girl"),
  active('active'),
  veryActive('veryActive'),
  lessActive('lessActive');

  const Puppy(this.text);

  final String text;
}

enum PuppyWeight {
  idealWeight(10),
  overweight(20),
  underweight(5);
  final int value;
  const PuppyWeight(this.value);
}

enum AddressLabels {
  home("Home"),
  work("Work"),
  partner('Partner'),
  other('Other');

  const AddressLabels(this.text);

  final String text;
}

enum FeaturedRecipeType {
  adult("Adult"),
  puppy('Puppy');

  const FeaturedRecipeType(this.text);

  final String text;
}




enum SharedPreferencesKeys {
  authToken("auth_token");

  const SharedPreferencesKeys(this.text);

  final String text;
}

enum EndPoints {
  signIn('auth/login'),
  signUp('auth/'),
  guest('auth/guest'),
  allBlogsAndNews('news-FAQ/type/newsAndBlog'),
  allFaqs('news-FAQ/type/FAQ'),
  addFeedback('news-FAQ/'),
  forgotPassword('auth/forgot-password'),
  splash('user/'),
  editUserProfile('user/'),
  socialLogin('auth/social-login'),
  checkPhoneNumber('auth/phoneNumber?'),
  breeds('pet/breeds'),
  addBreeds('pet/breed'),
  puppies('pet/user'),
  registerPuppy('pet/'),
  allAddresses('user/locations'),
  allRecipes('recipe/'),
  addAddress('user/location'),
  defaultAddress('user/default/location/'),
  defaultCard('card/default/'),
  defaultPuppy('pet/default/'),
  createOrder('order/'),
  allOrder('order/'),
  addCard('card/'),
  deleteCard('card/'),
  allCards('card'),
  promoIsValid('promo-code/name/'),
  deleteAddress('user/location/');


  final String url;

  const EndPoints(this.url);
}
