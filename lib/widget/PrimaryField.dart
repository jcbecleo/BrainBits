import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryField extends StatelessWidget {
  final String LabelText;
  final String hintText;
  final IconData iconData;
  final TextInputType textInputType;

  PrimaryField(
      {required this.LabelText,
      required this.hintText,
      required this.iconData,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(
          prefixIcon: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Icon(iconData),
          ),
          labelText: LabelText,
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)))),
    );
  }
}
