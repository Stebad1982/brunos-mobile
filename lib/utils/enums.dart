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

enum NotificationDataType {
  accepted("accepted"),
  start("start"),
  stop("stop"),
  moving("moving"),
  reached("reached"),
  cancel("cancel");

  const NotificationDataType(this.text);

  final String text;
}

enum Gender {
  male('Male'),
  female('Female');

  const Gender(this.text);

  final String text;
}

enum JobType {
  instant("Instant"),
  schedule("Schedule");

  const JobType(this.text);

  final String text;
}

enum JobFlowSteps {
  onTheWay("On The Way"),
  working("working"),
  details("details"),
  invoice("Invoice");

  const JobFlowSteps(this.text);

  final String text;
}

enum SharedPreferencesKeys {
  authToken("auth_token");

  const SharedPreferencesKeys(this.text);

  final String text;
}

enum EndPoints {
  signIn('login'),
  signUp('register'),
  logOut('help-link/logout'),
  categoryDetail('help-link/category/'),
  splashScreen('help-link/splash-user'),
  allCategories('help-link/category'),
  updateAddress('help-link/address/update'),
  createAddress('help-link/address/create'),
  allAddresses('help-link/address/'),
  allCards('help-link/card'),
  addCards('help-link/card/add'),
  deleteCard('help-link/card/delete/'),
  setCardPrimary('help-link/card/primary/'),
  deleteAddress('help-link/address/delete/'),
  jobConfirmation('help-link/job/confirmation'),
  jobDetail('help-link/job/detail/'),
  showInvoice('help-link/job/invoice'),
  cancelService('help-link/job/cancel-service'),
  cancelReasons('help-link/job/reasons'),
  allNotifications('help-link/notification'),
  walletDetail('help-link/wallet/balance'),
  addMoreServiceDetail('help-link/job/add-services'),
  addMoreService('help-link/job/add-more-services'),
  cancelJoB('help-link/job/cancel-job'),
  readNotifications('help-link/notification/read/'),
  updateProfile('help-link/profile/update'),
  changePassword('help-link/profile/change-password'),
  jobAlert('help-link/job/job-alert/'),
  forgotPassword('forget-password'),
  cancelUnattendedJob('help-link/job/unattended-job-cancel/'),
  allRequests('help-link/job/all/');

  final String url;

  const EndPoints(this.url);
}
