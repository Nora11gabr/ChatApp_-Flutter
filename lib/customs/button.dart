import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.ontap, required this.tex});
  String? tex;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap!,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
        ),
        child: Text(
          tex!,
          style: TextStyle(color: Color(0xff2b475e), fontSize: 16),
        ),
      ),
    );
  }
}
