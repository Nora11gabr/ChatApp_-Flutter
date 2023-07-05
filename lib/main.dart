import 'package:chatapp/customs/textfield.dart';
import 'package:chatapp/pages/chatpage.dart';
import 'package:chatapp/pages/login.dart';
import 'package:chatapp/pages/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      Chatpage.id: (context) => Chatpage(),
      Loginpage.id: (context) => Loginpage(),
      Registerpage.id: (context) => Registerpage(),
    }, initialRoute: Loginpage.id);
  }
}
