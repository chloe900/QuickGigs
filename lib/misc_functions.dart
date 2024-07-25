import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Section extends StatelessWidget {
  final String title;
  final Color color;
  final String content;
  final Widget? image;
  final bool textBox;
  final bool imageOnLeft; // New parameter to control alignment

  const Section({
    Key? key,
    required this.title,
    required this.color,
    required this.content,
    this.image,
    this.textBox = false,
    this.imageOnLeft = false, // Default to false if not specified
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> rowChildren = [
      Flexible(
        flex: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(content, style: TextStyle(fontSize: 16)),
            if (textBox) ...[
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your text here',
                ),
              ),
            ],
          ],
        ),
      ),
      if (image != null) ...[
        SizedBox(width: 16),
        Flexible(
          flex: 2,
          child: image!,
        ),
      ],
    ];

    if (imageOnLeft) {
      rowChildren = rowChildren.reversed.toList();
    }

    return Container(
      color: color,
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: rowChildren,
      ),
    );
  }
}

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


