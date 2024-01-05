import 'package:flutter/material.dart';
import 'package:trivia_app/widget/PrimaryButton.dart';
import 'package:trivia_app/widget/PrimaryField.dart';

class Registration extends StatefulWidget {
  static const String routeName = "registration";
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 225, 247, 255),
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Register Now",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            PrimaryField(
                LabelText: "Username",
                hintText: "Enter Username",
                iconData: Icons.person,
                textInputType: TextInputType.name),
            SizedBox(height: 20),
            PrimaryField(
                LabelText: "Email",
                hintText: "Enter Valid Email",
                iconData: Icons.email,
                textInputType: TextInputType.emailAddress),
            SizedBox(height: 20),
            PrimaryField(
                LabelText: "Password",
                hintText: "Enter Password",
                iconData: Icons.password,
                textInputType: TextInputType.visiblePassword),
            SizedBox(height: 40),
            PrimaryButton(
                text: "Enter the Vault of Knowledge",
                iconData: Icons.lightbulb,
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }

  // void login() {
  //   Navigator.pushNamed(context, Login.routeName);
  // }
}
