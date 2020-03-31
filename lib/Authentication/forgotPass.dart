import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vtop/Authentication/Login.dart';
import 'package:vtop/Authentication/Signup.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String _email = "";
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool validatAndSave()
  {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      return true;
    }
    return false;
  }
  @override
  Future<void> resetPassword(String email) async {
    if(validatAndSave())
      {
        try{
          await _auth.sendPasswordResetEmail(email: _email);
        }
        catch (e){
          print(e);
        }
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/void.jpg'),
                  fit: BoxFit.cover,
                  ),
                
                ),
          child: Stack(
             children: <Widget>[
               Container(
                 margin: EdgeInsets.only(top: 50, left:15),
                 child: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white, size: 30,), onPressed: (){
                   Navigator.pop(context);
                 }),
               ),
              
              Container(
                    margin: EdgeInsets.only(top: 200, left: 35),
                    child: Text(
                      "FORGOT PASSWORD",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                Container(
                    padding: EdgeInsets.only(left: 5, right: 10),
                    margin: EdgeInsets.only(top: 350, left: 10),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regex = new RegExp(pattern);
                        if (!(regex.hasMatch(value) && value.contains("vitap.ac.in")))
                         return "Please enter a valid Email-ID";
                        else
                          return null;
                      },
                      onSaved: (value) => _email = value.trim(),
                      obscureText: false,
                      autofocus: false,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.red),

                          // fillColor: Colors.white, filled: true,
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white, width: 2.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white, width: 2.0),
                          ),
                          border: const OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white, width: 2.0),
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                            size: 30,
                          ),
                          hintText: "Enter you Vit-AP Email ID",
                          hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                          labelText: "Email",
                          labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                   Container(
                    height: MediaQuery.of(context).size.height / 18,
                    width: 350,
                    // padding: EdgeInsets.only(left: 5, top:5, right:4),
                    margin: EdgeInsets.only(top: 520, left: 20),
                    child: RaisedButton(
                      
                      color: Colors.blue,
                      onPressed: () {
                        resetPassword(_email).whenComplete(() =>  setState(() {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          String errorMsg = "Password reset link sent to email id please check";
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    child: Text(errorMsg),
                                  ),
                                );
                              });
                        }));
                      },
                      child: Text(
                        "CONTINUE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                      elevation: 20,
                    ),
                  ),
                  Container(
                  margin: EdgeInsets.only(top: 650, left: 30),
                  child: RichText(
                    text: TextSpan(
                        text: "Remembered the Password ? here --> ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                        children: <TextSpan>[
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LoginScreen()));
                                },
                              text: 'Login',
                              style: TextStyle(
                                  shadows: <Shadow>[
                                    Shadow(
                                      color: Colors.blue,
                                      blurRadius: 10.0,
                                      offset: Offset(0.0, 0.0),
                                    )
                                  ],
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700))
                        ]),
                  )),
             ],
          ),
        ),
      ),
    );
  }
}