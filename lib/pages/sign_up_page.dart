import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rest_test/widgets/circle.dart';
import 'package:rest_test/widgets/input_text.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);


  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

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
                              SizedBox(height: 30),
                              Text('Bienvenido a esta APP \nRegistrate!!', textAlign: TextAlign.center, style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w300, color: Colors.white
                              )),
                              Container(
                                width: 150,
                                height: 150,
                                margin: EdgeInsets.only(top: size.width*0.3),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 25
                                    )
                                  ]
                                ),                     
                              ),

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
                                        label: "NOMBRE Y APELLIDO",
                                        validator: (String username) {
                                          if(username.length > 5) {
                                            return null;
                                          } else {
                                            return "Nombre Invalido";
                                          }                                          
                                        },
                                      ),
                                      SizedBox(height: 20),
                                      InputText(
                                        inputType: TextInputType.emailAddress,
                                        label: "EMAIL",
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
                                        label: "CONTRASEÑA",
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
                                  child: Text('Registrar', style: TextStyle(fontSize: 20)),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Ya tienes una cuenta', style: TextStyle(fontSize: 16, color: Colors.black54)),
                                  CupertinoButton(
                                    child: Text('Ingresa', style: TextStyle(fontSize: 16, color: Colors.pink)),
                                    onPressed: () => Navigator.pop(context),

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
              Positioned(
                left: 15,
                top: 5,
                child: SafeArea(
                  child: CupertinoButton(
                    child: Icon(Icons.arrow_back),
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(100),
                    padding: EdgeInsets.all(10),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              )

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