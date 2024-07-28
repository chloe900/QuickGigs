import 'package:flutter/material.dart';
import 'signup/signup.dart';
import 'signup/signin.dart';
import 'misc_functions.dart';
import 'amplifyconfiguration.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    try {
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
      print('Successfully configured');
    } on Exception catch (e) {
      print('Error configuring Amplify: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Gigs',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Nunito',
      ),
      home: LandingPage(),
    );
  }
}

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
              // Actions
            },
            child: Text('Home', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
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
                alignment: Alignment(-0.5, -0.5),
              ),
              title: 'How It Works',
              color: const Color.fromRGBO(255, 249, 196, 1),
              content: 'Jobs best suited for you show up on your home page. Or you can post jobs for others to do.',
              imageOnLeft: true,
            ),
          ),
          Flexible(
            flex: 2,
            child: Section(
              title: 'Why Choose Us',
              color: Colors.lightGreen,
              content: 'QuickGigs connects you to jobs in near you that you can do for a quick buck.',
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
                alignment: Alignment(-0.5, -0.5),
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
