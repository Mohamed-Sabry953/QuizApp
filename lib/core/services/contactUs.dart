import 'package:url_launcher/url_launcher.dart';

class ContactUs{
  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
  static Future<void> sendMail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'mohamedsabryelsayad2211@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'ملاحظة عن تكاتف التعليمية',
      }),
    );

    launchUrl(emailLaunchUri);
  }
}