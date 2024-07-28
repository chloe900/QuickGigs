import 'package:flutter/material.dart';
import 'package:quick_gigs/signup/signin.dart';
import '../main.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _verificationCodeController = TextEditingController();

  bool _isVerificationCodeSent = false;
  String _errorMessage = '';

  Future<void> _signUp() async {
    try {
      Map<AuthUserAttributeKey, String> userAttributes = {
        AuthUserAttributeKey.email: _emailController.text,
        AuthUserAttributeKey.name: _nameController.text,
        AuthUserAttributeKey.familyName: _surnameController.text,
      };

      SignUpResult result = await Amplify.Auth.signUp(
        username: _emailController.text,
        password: _passwordController.text,
        options: SignUpOptions(userAttributes: userAttributes),
      );

      if (result.isSignUpComplete) {
        print('Sign up successful');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignInPage()),
        );
      } else {
        setState(() {
          _isVerificationCodeSent = true;
        });
        print('Sign up not complete, verification code sent');
      }
    } on AuthException catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
      print('Error signing up: $e');
    }
  }

  Future<void> _confirmSignUp() async {
    try {
      SignUpResult result = await Amplify.Auth.confirmSignUp(
        username: _emailController.text,
        confirmationCode: _verificationCodeController.text,
      );

      if (result.isSignUpComplete) {
        print('Sign up confirmation successful');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignInPage()),
        );
      } else {
        print('Sign up confirmation not complete');
      }
    } on AuthException catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
      print('Error confirming sign up: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
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
                Expanded(
                  child: Center(
                    child: Container(
                      width: 300,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Sign Up', style: TextStyle(color: Colors.brown, fontSize: 40)),
                          SizedBox(height: 20),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.brown, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
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
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.brown, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.green, width: 1),
                              ),
                            ),
                            obscureText: true,
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.brown, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.green, width: 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: _surnameController,
                            decoration: InputDecoration(
                              labelText: 'Surname',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.brown, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.green, width: 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          if (_isVerificationCodeSent) ...[
                            TextField(
                              controller: _verificationCodeController,
                              decoration: InputDecoration(
                                labelText: 'Verification Code',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.brown, width: 2),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.green, width: 1),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: _confirmSignUp,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.lightGreen.withOpacity(0.9),
                                      foregroundColor: Colors.brown,
                                    ),
                                    child: Text('Confirm'),
                                  ),
                                ),
                              ],
                            ),
                          ] else ...[
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: _signUp,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.lightGreen.withOpacity(0.9),
                                      foregroundColor: Colors.brown,
                                    ),
                                    child: Text('Sign Up'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.brown,
                            ),
                            child: Text('Already have an account? Sign in'),
                          ),
                          if (_errorMessage.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                _errorMessage,
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16.0,
            left: 16.0,
            child: IconButton(
              icon: Icon(Icons.house, color: Colors.brown),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}