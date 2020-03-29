import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:vtop/Authentication/Signup.dart';
import 'package:vtop/Authentication/forgotPass.dart';
// import 'package:vtop/Authentication/Authentication.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vtop/UI/SplashScreen.dart';
import 'package:vtop/UI/firechanges.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = "";
  String _pass = "";
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

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
   validateAndLogin() async
  {
    if(validatAndSave()) {
      try {

        FirebaseUser user = (await _auth.signInWithEmailAndPassword(
            email: _email, password: _pass)).user;
        UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
        userUpdateInfo.displayName = _email;
        Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen()));
        print('Login successfull user id of user is  : ${user.uid}');
      } catch (error) {
        switch(error.code){
          case "ERROR_USER_NOT_FOUND":  {
            setState(() {
              String errorMsg = "No user found with this account";
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
                  image: AssetImage('assets/images/universe.jpg'),
                  fit: BoxFit.cover)),


          child: Stack(


            children: <Widget>[
              SizedBox(height: 120,),
              Container(
                margin: EdgeInsets.only(top: 150, left: 35),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),



              //EMAIL AND PASSWORD LOGIN FORM HERE BELOW
              Container(
                padding: EdgeInsets.only(left: 5, right: 10),
                margin: EdgeInsets.only(top: 270, left: 10),
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
                    errorStyle: TextStyle(color: Colors.white),
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
                margin: EdgeInsets.only(top: 370, left: 270),
                child: RichText(
                  text: TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                    },
                    text:"Forgot Password??",
                  style: TextStyle(
                    shadows: <Shadow>[
                                    Shadow(
                                      color: Colors.white,
                                      blurRadius: 10.0,
                                      offset: Offset(0.0, 0.0),
                                    )
                                  ],
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w900),)
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 10),
                margin: EdgeInsets.only(top: 400, left: 10),
                child: TextFormField(
                  
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value.length < 6) {
//                      Credentials();
                      return "Enter more than 6 Characters";
                    }
                    return null;
                  },
                  onSaved: (value) => _pass = value.trim(),
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  autofocus: false,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.white,),
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
                      hintText: "Ssshhh!!! its a secret",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 18,
                width: 350,
                // padding: EdgeInsets.only(left: 5, top:5, right:4),
                margin: EdgeInsets.only(top: 520, left: 20),
                child: RaisedButton(
                  color: Colors.pink,
                  onPressed: validateAndLogin,
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  elevation: 20,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 600, left: 30),
                  child: RichText(
                    text: TextSpan(
                        text: "Don't have an account ? Click here -->",
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
                                              SignupScreen()));
                                },
                              text: ' Sign up',
                              style: TextStyle(
                                  shadows: <Shadow>[
                                    Shadow(
                                      color: Colors.cyanAccent,
                                      blurRadius: 10.0,
                                      offset: Offset(0.0, 0.0),
                                    )
                                  ],
                                  color: Colors.cyanAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700))
                        ]),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 650, left: 170),
                  child: RichText(
                    text: TextSpan(
                      text: "OR ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  )),

// GOOGLE LOGIN BUTTON BELOW HERE

              Container(
                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width,
                  // padding: EdgeInsets.only(left: 5, top:5, right:4),
                  margin: EdgeInsets.only(top: 700, left: 20, right: 20),
                  child: InkWell(
                    splashColor: Colors.black,
                    onTap: () {},
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
                              image: DecorationImage(
                                image: AssetImage('assets/images/google.png'),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15, left: 10),
                            height: 50,
                            width: 130,
                            child: Text(
                              "Login with google",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
