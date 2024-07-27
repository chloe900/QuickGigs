import 'package:flutter/material.dart';
import 'package:quick_gigs/payment/payment.dart';
import 'signup/signup.dart';
import 'signup/signin.dart';
import 'misc_functions.dart';
import 'review/review.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Gigs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito', // Set default font family
      ),
        home: LandingPage(), // Set the landing page as the home screen
      // home: Payment(),
      //home: Review(),

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
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpPage()),
              );
            },
            child: Text('Sign up', style: TextStyle(color: Colors.white)),
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
               ContactUs.launchEmail(
                email: 'chloetdube@gmail.com',
                subject: 'Contact Us Inquiry',
              );
              
            },
            child: Text('Contact', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Section(
              image: Image.asset(
                'images/howitworks.png',
                width: 500,
                height: 500,
                alignment: Alignment(-0.5,-0.5),
              ),
              title: 'How It Works',
              color: const Color.fromRGBO(255, 249, 196, 1),
              content: 'Learn how our app works and get started quickly.',
              imageOnLeft: true, 
            ),
          ),
          Flexible(
            flex: 2,
            child: Section(
              title: 'Why Choose Us',
              color: Colors.lightGreen,
              content: 'Discover the benefits of using our app and why we stand out.',
              image: Image.asset(
                'images/whychooseus.png',
                width: 500,
                height: 500,
                alignment: Alignment(2.0, 2.0),
              ),
            ),
          ),
          Flexible(
            flex: 2,
           child: Section(
              image: Image.asset(
                'images/getstarted.png',
                width: 500,
                height: 500,
                alignment: Alignment(-0.5,-0.5),
              ),
              title: 'Get Started',
              color: const Color.fromRGBO(255, 249, 196, 1),
              content: 'Join QuickGigs and earn some extra coin.',
              imageOnLeft: true, 
            ),
          ),
          Container(
            color: Colors.brown,
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  'QuickGigs ©',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8), // Spacing between text elements
              ],
            ),
          ),
        ],
      ),
    );
  }
}

