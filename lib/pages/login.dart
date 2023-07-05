import 'package:chatapp/customs/button.dart';
import 'package:chatapp/customs/constants.dart';
import 'package:chatapp/customs/textfield.dart';
import 'package:chatapp/pages/chatpage.dart';
import 'package:chatapp/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});
  static String id = 'Loginpage';
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
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
                        'LOGIN',
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
                    height: 20,
                  ),
                  CustomButton(
                    ontap: () async {
                      if (formkey.currentState!.validate()) {
                        isloading = true;
                        setState(() {});
                        try {
                          await LoginUser();
                          Navigator.pushNamed(context, Chatpage.id,
                              arguments: Email);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'wrong-password') {
                            ShowSnackbar(context, 'wrong password');
                          } else if (e.code == 'user-not-found') {
                            ShowSnackbar(context, 'Email not found');
                          }
                        } catch (e) {
                          ShowSnackbar(context, 'Erorr');
                        }
                        isloading = false;
                        setState(() {});
                        ShowSnackbar(context, 'Success');
                      } else {}
                    },
                    tex: 'LOGIN',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account',
                        style: TextStyle(
                          color: Color(0xffc7ede6),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Registerpage.id);
                        },
                        child: Text(
                          '   Register',
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
  }

  void ShowSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> LoginUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
        email: Email!, password: Password!);
  }
}
