import 'package:flutter/material.dart';
import 'package:rest_test/pages/login_page.dart';
import 'package:rest_test/pages/sign_up_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Material App',
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      routes: {
        "login" : (BuildContext context) => LoginPage(),
        "signup" : (BuildContext context) => SignUpPage(),
      },  
    );



  }

}