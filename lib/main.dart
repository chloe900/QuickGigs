import 'package:flutter/material.dart';
import 'package:quick_gigs/payment/payment.dart';
import 'signup/signup.dart';
import 'signup/signin.dart';
import 'payment/payment.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landing Page Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito', // Set default font family
      ),
      home: Payment(), // Set the landing page as the home screen
    );
  }
}

// Main landing page
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('QuickGigs', style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {
              //actions
            },
            child: Text('Home', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              //actions
            },
            child: Text('How it works', style: TextStyle(color: Colors.white)),
          ),
           TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInPage()),
              );
            },
            child: Text('Login', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              // Handle navigation or other actions
            },
            child: Text('Contact', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Section(
              title: 'How It Works',
              color: const Color.fromRGBO(255, 249, 196, 1),
              content: 'Learn how our app works and get started quickly.',
            ),
          ),
          Expanded(
            child: Section(
              title: 'Why Choose Us',
              color: Colors.lightGreen,
              content: 'Discover the benefits of using our app and why we stand out.',
            ),
          ),
          Expanded(
            child: Section(
              title: 'Get Started',
              color: Color.fromARGB(255, 228, 177, 159),
              content: 'Sign up now and begin your journey with us.',
            ),
          ),
        ],
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
    return Container(
      color: color,
      width: double.infinity, // Ensures the container fills the horizontal space
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch, // Makes text and content stretch to fill horizontal space
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center, // Centers text horizontally
          ),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            textAlign: TextAlign.center, // Centers text horizontally
          ),
        ],
      ),
    );
  }
}