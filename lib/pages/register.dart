import 'package:chatapp/customs/constants.dart';
import 'package:chatapp/pages/chatpage.dart';
import 'package:chatapp/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../customs/button.dart';
import '../customs/textfield.dart';

class Registerpage extends StatefulWidget {
  Registerpage({super.key});
  static String id = 'Registerpage';

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  String? Email;

  String? Password;

  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formkey,
              child: ListView(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Image.asset(
                    'asset/images/scholar.png',
                    height: 150,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Scholar Chat',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 34,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'REGISTER',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  customtextfeild(
                      onChanged: (data) {
                        Email = data;
                      },
                      hinttext: 'Email'),
                  SizedBox(
                    height: 10,
                  ),
                  customtextfeild(
                      secure: true,
                      onChanged: (data) {
                        Password = data;
                      },
                      hinttext: 'Password'),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    ontap: () async {
                      if (formkey.currentState!.validate()) {
                        isloading = true;
                        setState(() {});
                        try {
                          await RigisterUser();
                          Navigator.pushNamed(context, Chatpage.id);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            ShowSnackbar(context, 'weak-password');
                          } else if (e.code == 'email-already-in-use') {
                            ShowSnackbar(context, 'Email already exist');
                          }
                        } catch (e) {
                          ShowSnackbar(context, 'Erorr');
                        }
                        isloading = false;
                        setState(() {});
                        ShowSnackbar(context, 'Success');
                      } else {}
                    },
                    tex: 'RGISTER',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You have an account',
                        style: TextStyle(
                          color: Color(0xffc7ede6),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          '   Login',
                          style: TextStyle(color: Color(0xffc7ede6)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }

  void ShowSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> RigisterUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: Email!, password: Password!);
  }
}
