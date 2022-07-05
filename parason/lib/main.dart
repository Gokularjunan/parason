import 'package:flutter/material.dart';

// import 'pages/home.dart';
import 'screens/login.dart';
// import 'screens/welcome.dart';
// import 'package:chat_app/screens/welcomepage.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PARASON',
        theme: ThemeData(
          
          // primarySwatch: Color.fromARGB(255, 45, 84, 155),
                  primaryColor: Color.fromARGB(255, 214, 228, 216),

        ),
        home: LoginPage());
  }}