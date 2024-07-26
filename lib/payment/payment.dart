import 'package:flutter/material.dart';
import 'package:quick_gigs/misc_functions.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentIntegrationState createState() => _PaymentIntegrationState();
}

  


class _PaymentIntegrationState extends State<Payment> {
  String _selectedPaymentMethod = '';

  void _onPaymentMethodChanged(String method) {
    setState(() {
      _selectedPaymentMethod = method;
    });
  }
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
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
                        'images/payment.png',
                        width: 500,
                        height: 500,
                      ),
                      SizedBox(height: 10),
                      Text('Online Payments', style: TextStyle(fontSize: 34)),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      width: 300,
                      height: 500,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFF4CAF50).withOpacity(0.2), // Background color
                        borderRadius: BorderRadius.circular(12), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF4CAF50).withOpacity(0.2),
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
                          Text('Select payment method', style: TextStyle(color: Colors.brown, fontSize: 25)),
                          SizedBox(height: 40),
                           CheckboxListTile(
                            title: Text('Credit or Debit Card'),
                            value: _selectedPaymentMethod == 'Credit or Debit Card',
                            activeColor: Colors.brown, // Change the active color
                            checkColor: Colors.white, // Change the check (tick) color
                            onChanged: (bool? value) {
                              if (value != null && value) {
                                _onPaymentMethodChanged('Credit or Debit Card');
                              }
                              
                            },
                            
                            
                          ),
                         

                          
                          SizedBox(height: 30),
                           CheckboxListTile(
                            title: Text('Apple Pay'),
                            value: _selectedPaymentMethod == 'Apple Pay',
                            activeColor: Colors.brown, // Change the active color
                            checkColor: Colors.white,
                            onChanged: (bool? value) {
                              if (value != null && value) {
                                _onPaymentMethodChanged('Apple Pay');
                              }
                            },
                          ),
                          
                          SizedBox(height:30),

                           CheckboxListTile(
                            title: Text('Google Pay'),
                            value: _selectedPaymentMethod == 'Google Pay',
                            activeColor: Colors.brown, // Change the active color
                            checkColor: Colors.white,
                            onChanged: (bool? value) {
                              if (value != null && value) {
                                _onPaymentMethodChanged('Google Pay');
                              }
                            },
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
                Navigator.pop(context); // Navigate to the main landing page
              },
            ),
          ),
        ],
      ),
    );
  }
}