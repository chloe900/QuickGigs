import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs {
  static Future<void> launchEmail({required String email, required String subject}) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': subject
      },
    );
    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not launch $emailUri';
    }
  }
}
