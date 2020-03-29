import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vtop/Authentication/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vtop/UI/firechanges.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String _email = "";
  String _password = "";
  String _cnfPass = "";
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController cnfPasswordController = new TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  bool validatAndSave()
  {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      return true;
    }
    return false;
  }
  validateAndSignup() async
  {
    if(validatAndSave()) {
      try {

        FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
            email: _email, password: _cnfPass)).user;
        UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
        userUpdateInfo.displayName = _email;

        print('Login successfull user id of user is  : ${user.uid}');
      } catch (error) {
        switch(error.code){
          case "ERROR_EMAIL_ALREADY_IN_USE":  {
            setState(() {
              String errorMsg = "Email-ID already exists";
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        child: Text(errorMsg),
                      ),
                    );
                  });
            });
          }
          break;
          case "ERROR_WRONG_PASSWORD":
            {
              setState(() {
                String errorMsg = "Password doesn\'t match your email.";


                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Container(
                          child: Text(errorMsg),
                        ),
                      );
                    });
              });
            }
            break;
          default:
            {
              setState(() {
                String errorMsg ="";
              });
            }
        }
      }
    } else
    {
      setState(() {
        bool _autovalidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
          child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage('assets/images/Space.png'),
                  fit: BoxFit.cover)),
          child: Stack(
            children: <Widget>[
              
              Container(
                margin: EdgeInsets.only(top:60, left: 15),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, 
                  size: 30,
                  color: Colors.white,), 
                onPressed: (){
                  Navigator.pop(context);
                },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 150, left: 35),
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 10),
                margin: EdgeInsets.only(top: 250, left: 10),
                child: TextFormField(
                  
                  // key: _emailKey,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                 validator: (value) {
                    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = new RegExp(pattern);
                    if (!(regex.hasMatch(value) && value.contains("vitap.ac.in")))
                    {
                      // CredentialManager();
                     return "Please use only VIT-AP Email-ID";
                    }
                    else
                      return null;
                  },
                  onSaved: (value) => _email = value.trim(),

                  style: TextStyle(color: Colors.white),
                  obscureText: false,
                  autofocus: false,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(color:Colors.white),
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
                padding: EdgeInsets.only(left: 5, right: 10),
                margin: EdgeInsets.only(top: 350, left: 10),
                child: TextFormField(
                  
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                 validator: (value) {
                    if (value.length < 6) {
                      // CredentialManager();
                      return "Enter more than 6 Characters";
                    }
                    return null;
                  },
                  onSaved: (value) => _password = value.trim(),
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  autofocus: false,
                  decoration: InputDecoration(
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
                        Icons.text_fields,
                        color: Colors.white,
                        size: 30,
                      ),
                      hintText: "Ssshhh!!! its a secret",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 10),
                margin: EdgeInsets.only(top: 450, left: 10),
                child: TextFormField(
                  controller: cnfPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value){
//                    CredentialManager();
                    if(value != passwordController.text)
                    {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                  onSaved: (value) => _cnfPass = value.trim(),
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  autofocus: false,
                  decoration: InputDecoration(
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
                        Icons.security,
                        color: Colors.white,
                        size: 30,
                      ),
                      hintText: "Mind Writing it again?",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 18,
                width: 350,
                // padding: EdgeInsets.only(left: 5, top:5, right:4),
                margin: EdgeInsets.only(top: 550, left: 20),
                child: RaisedButton(
                  color: Colors.pink,
                  onPressed: validateAndSignup,
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  elevation: 20,
                ),
              ),
             
                   Container(
                  margin: EdgeInsets.only(top: 630, left: 180),
                  child: RichText(
                    text: TextSpan(
                        text: "OR ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                        ),
                  )
                  ),
                  Container(
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.width,
                // padding: EdgeInsets.only(left: 5, top:5, right:4),
                margin: EdgeInsets.only(top: 670, left: 20, right: 20),
                child: InkWell(
                  splashColor: Colors.black,
                  onTap: (){

                  },
                   child: Card(
                    elevation: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                     Container(
                       padding: EdgeInsets.all(10),
                       height: 30,
                       width: 30,
                       decoration: BoxDecoration(
                       image:DecorationImage(
                         image: AssetImage('assets/images/google.png'),
                       ),
                     ),),


                      Container(
                       padding: EdgeInsets.only(top:15, left:10),
                       height: 50,
                       width: 130,
                       child: Text("Sign up with google",
                       style: TextStyle(
                         color:Colors.black, fontWeight: FontWeight.w900,
                          fontSize: 15,

                       ),),
                       ),
                     
                    ],),
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

