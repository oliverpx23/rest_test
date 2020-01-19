import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rest_test/widgets/circle.dart';
import 'package:rest_test/widgets/input_text.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() { 
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  @override
  Widget build(BuildContext context) {


    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: <Widget>[

              Positioned(
                right: -size.width*0.12,
                top: -size.width*0.36,
                child: Circle(
                  radius: size.width*0.45,
                  colors: <Color> [
                    Colors.pink,
                    Colors.pinkAccent
                  ],
                ),
              ),
              Positioned(
                left: -size.width*0.15,
                top: -size.width*0.34,
                child: Circle(
                  radius: size.width*0.35,
                  colors: <Color> [
                    Colors.orange,
                    Colors.deepOrange
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                    width: size.width,
                    height: size.height,
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                width: 90,
                                height: 90,
                                margin: EdgeInsets.only(top: size.width*0.3),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 25
                                    )
                                  ]
                                ),                     
                              ),
                              SizedBox(height: 20),
                              Text('Hello again \nWelcome back', textAlign: TextAlign.center, style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w300
                              )),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 300,
                                  minWidth: 300
                                ),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: <Widget>[
                                      InputText(
                                        inputType: TextInputType.emailAddress,
                                        label: "EMAIL ADDRESS",
                                        validator: (String user) {
                                          if(user.contains("@")) {
                                            return null;
                                          } else {
                                            return "Email Invalido";
                                          }                                          
                                        },
                                      ),
                                      SizedBox(height: 20),
                                      InputText(
                                        isSecure: true,
                                        label: "PASSWORD",
                                        validator: (String password) {
                                          if(password.isNotEmpty && password.length > 5) {
                                            return null;
                                          } else {
                                            return "Contraseña incorrecta";
                                          }
                                        },
                                      ),
                                      SizedBox(height: 20)
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 350,
                                  minWidth: 350
                                ),
                                child: CupertinoButton(
                                  padding: EdgeInsets.symmetric(vertical: 17),
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.pinkAccent,
                                  onPressed: _submit,
                                  child: Text('Sing In', style: TextStyle(fontSize: 20)),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('New to Friendly Design?', style: TextStyle(fontSize: 16, color: Colors.black54)),
                                  CupertinoButton(
                                    child: Text('Sing Up', style: TextStyle(fontSize: 16, color: Colors.pink)),
                                    onPressed: () => Navigator.pushNamed(context, "signup"),

                                  )
                                ],
                              ),
                              SizedBox(height: size.height*0.08)                           
                            ],
                          ),
                        ],
                      ),
                    )
                  ),
              ),
            ],
          ),

        ),
      ),
    );


  }

  _submit() {
    _formKey.currentState.validate();
  }
}