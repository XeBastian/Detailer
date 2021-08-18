import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng_user_input/screens/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HnUser',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.grey[800],
      ),
      home: MyHomePage(),
    );
  }
}
