import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trivia_app/routes.dart';
import 'package:trivia_app/screens/BottomNavigation.dart';
import 'package:trivia_app/screens/ForgotPassword.dart';
import 'package:trivia_app/screens/Registration.dart';
import 'package:trivia_app/widget/PasswordField.dart';
import 'package:trivia_app/widget/PrimaryButton.dart';
import 'package:trivia_app/widget/PrimaryField.dart';
import 'package:trivia_app/widget/SecondaryButton.dart';

void main() {
  runApp(MaterialApp(
    title: 'Trivia App Ecleo',
    home: Login(),
    routes: routes,
  ));
}

class Login extends StatefulWidget {
  static const String routeName = "login";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 225, 247, 255),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Icon(
                Icons.lightbulb, // Lightbulb icon
                size: 100,
                color: Colors.blue[900],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "BrainBits",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36, color: Colors.blue[900]),
                textAlign: TextAlign.center,
                
              ),
              SizedBox(
                height: 30,
              ),
              PrimaryField(
                  LabelText: "Email",
                  hintText: "Enter Valid Email",
                  iconData: Icons.email,
                  textInputType: TextInputType.emailAddress),
              SizedBox(
                height: 20,
              ),
              PasswordField(
                  iconData: Icons.password,
                  LabelText: "Password",
                  hintText: "Enter your Password",
                  obscureText: obscureText,
                  onTap: setPasswordVisibility),
              SizedBox(
                height: 20,
              ),
              PrimaryButton(
                  text: "Enter the Vault of Knowledge",
                  iconData: Icons.lightbulb,
                  onPressed: login),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SecondaryButton(
                      text: "New User? Register", onPressed: register),
                  SecondaryButton(
                      text: "Reset Password", onPressed: forgotPassword)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    Navigator.pushReplacementNamed(context, BottomNavigator.routeName);
  }

  void register() {
    Navigator.pushNamed(context, Registration.routeName);
  }

  void forgotPassword() {
    Navigator.pushNamed(context, ForgotPassword.routeName);
  }

  void setPasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
