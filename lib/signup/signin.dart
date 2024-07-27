import 'package:flutter/material.dart';
import 'signup.dart';
import '../listing.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signIn() {
    // Add sign-in logic here
    String email = _emailController.text;
    String password = _passwordController.text;
     Navigator.push( //fix later - just needed to see what listing page looked like
      context,
      MaterialPageRoute(builder: (context) => ListingPage()),
    );
    // Authenticate email and password
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Stack(
        children: [
          // Main content
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Left half with image and title
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/login.png',
                        width: 500,
                        height: 500,
                      ),
                      SizedBox(height: 20),
                      Text('QuickGigs', style: TextStyle(fontSize: 34)),
                    ],
                  ),
                ),
                // Right half with login elements
                Expanded(
                  child: Center(
                    child: Container(
                      width: 300, // Fixed width
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        borderRadius: BorderRadius.circular(12), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // Shadow position
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max, // Make column size minimal
                        mainAxisAlignment: MainAxisAlignment.center, // Center contents vertically
                        children: [
                          Text('Login', style: TextStyle(color: Colors.brown, fontSize: 40)),
                          SizedBox(height: 20),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                                borderSide: BorderSide(color: Colors.brown, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                                borderSide: BorderSide(color: Colors.green, width: 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                                borderSide: BorderSide(color: Colors.brown, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12), // Rounded corners
                                borderSide: BorderSide(color: Colors.green, width: 1),
                              ),
                            ),
                            obscureText: true,
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: _signIn,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightGreen.withOpacity(0.9),
                                    foregroundColor: Colors.brown,
                                  ),
                                  child: Text('Sign In'),
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignUpPage()),
                              );
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.brown,
                            ),
                            child: Text('New User? Sign up'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // House icon button at the top left corner
          Positioned(
            top: 16.0,
            left: 16.0,
            child: IconButton(
              icon: Icon(Icons.house, color: Colors.brown),
              onPressed: () {
                Navigator.pop(context); // Navigate to the main landing page
              },
            ),
          ),
        ],
      ),
    );
  }
}

