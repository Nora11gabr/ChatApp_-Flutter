import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class customtextfeild extends StatelessWidget {
  customtextfeild(
      {this.onChanged, required this.hinttext, this.secure = false});
  String? hinttext;
  bool secure = false;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secure,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Erorr';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
