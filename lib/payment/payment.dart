import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentIntegrationState createState() => _PaymentIntegrationState();
}

class _PaymentIntegrationState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7BC67B),
        title: Text(
          'Payment',
          style: TextStyle(fontFamily: 'Nunito'),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 235, 246, 235),
      body: Center( // Center to align horizontally
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30.0),
            Expanded(
              child: Section(
                title: 'Credit or Debit Card',
                color: const Color(0xFF6b8c42),
                content: '.',
              ),
            ),
            Expanded(
              child: Section(
                title: 'Apple Pay',
                color: const Color(0xFF6b8c42),
                content: '.',
              ),
            ),
            Expanded(
              child: Section(
                title: 'Google Pay',
                color: const Color(0xFF6b8c42),
                content: '.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Section extends StatelessWidget {
  final String title;
  final Color color;
  final String content;

  Section({
    required this.title,
    required this.color,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1 / 3,
      heightFactor: 1/2,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.0), // Change radius of corners
        ),
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              content,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
