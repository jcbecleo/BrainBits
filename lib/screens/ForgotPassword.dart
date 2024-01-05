import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  static const String routeName = "forgotPassword";
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color.fromARGB(255, 225, 247, 255),
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Caption
            Text(
              "Please enter the email address associated with your account to receive a password reset link.",
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 16),

            // Email Input Field
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
              ),
            ),

            SizedBox(height: 16),

            // Send Reset Link Button
            ElevatedButton(
              onPressed: () {
                // Handle sending reset link logic
              },
              child: Text("Send Reset Link"),
            ),

            SizedBox(height: 16),

            // Back Button for Navigation
            TextButton(
              onPressed: () {
                // Navigate back to the previous screen
                Navigator.pop(context);
              },
              child: Text("Back to Login"),
            ),
          ],
        ),
      ),
    );
  }
}
