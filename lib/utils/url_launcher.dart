import 'package:url_launcher/url_launcher.dart';

import 'enums.dart';

final Uri webUrl = Uri.parse(Contact.webUrl.text);
final Uri termAndConditionUrl = Uri.parse(Contact.termAndConditionUrl.text);
final Uri privacyPolicyUrl = Uri.parse(Contact.privacyPolicyUrl.text);
final Uri agreementUrl = Uri.parse(Contact.agreementUrl.text);
final Uri addressLocation = Uri.parse(Contact.location.text);

Future<void> urlLauncher({required Uri url}) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
