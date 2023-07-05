import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/message.dart';
import 'constants.dart';

class chatbuble extends StatelessWidget {
  const chatbuble({
    required this.msg,
    super.key,
  });
  final message msg;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Text(
          msg.msg,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class chatbubleforfriend extends StatelessWidget {
  const chatbubleforfriend({
    required this.msg,
    super.key,
  });
  final message msg;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xff006d84),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Text(
          msg.msg,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
