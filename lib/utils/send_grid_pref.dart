import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/utils/enums.dart';
import 'package:brunos_kitchen/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:sendgrid_mailer/sendgrid_mailer.dart';

class SendGridPref{
static const String sender = 'brunoskitchen0@gmail.com';
static const String key = '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';

Future <void> sendEmail ({required String emailSubject, required String emailDescription})async {
  final mailer = Mailer(key);
  final toAddress = Address('waleedaahmedd@gmail.com');
  final fromAddress = Address(sender);
  final content = Content('text/plain', emailDescription);
  final subject = emailSubject;
  final personalization = Personalization([toAddress]);
  final email =
  Email([personalization], fromAddress, subject, content: [content]);
  mailer.send(email).then((result) {
    print(result.isValue);
    // ...
  });
}

}