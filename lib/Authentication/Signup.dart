import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:vtop/Authentication/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vtop/Authentication/Login.dart';
import 'package:vtop/UI/SplashScreen.dart';
//import 'package:vtop/UI/firechanges.dart';
// import 'package:vtop/UI/firechanges.dart';
import 'package:vtop/UI/HomeScreen.dart';

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
  FirebaseUser user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    return 'signInWithGoogle succeeded: $user';
  }



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
    if (validatAndSave()) {
      try {
        FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
            email: _email, password: _cnfPass)).user;
        user.sendEmailVerification();
        setState(() {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        });
        showDialog(context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Container(
                  child: Text("Please check your VIT-AP Email-ID for verifiation"),

                ),
              );
            }
        );
        print('Login successfull user id of user is  : ${user.uid}');
      } catch (error) {
        switch (error.code) {
          case "ERROR_EMAIL_ALREADY_IN_USE":
            {
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
                String errorMsg = "";
              });
            }
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/images/Space.png'),
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.37), BlendMode.darken),
            fit: BoxFit.cover
          )
        ),
        child:Form(
          key: _formKey,
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05, left: MediaQuery.of(context).size.width*0.03),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, 
                    size: 30,
                    color: Colors.white,
                  ), 
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.15, left: MediaQuery.of(context).size.width*0.1),
                child: Text("SIGN UP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3, left: MediaQuery.of(context).size.width*0.05, right: MediaQuery.of(context).size.width*0.05),
                child: TextFormField(
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
                            const BorderSide(color: Colors.white, width: 1.75),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.75),
                      ),
                      border: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.75),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                        size: 25,
                      ),
                      hintText: "Enter your VIT-AP Email ID",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4, left: MediaQuery.of(context).size.width*0.05, right: MediaQuery.of(context).size.width*0.05),
                child: TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                 validator: (value) {
                    if (value.length < 6) {
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
                            const BorderSide(color: Colors.white, width: 1.75),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.75),
                      ),
                      border: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.75),
                      ),
                      prefixIcon: Icon(
                        Icons.text_fields,
                        color: Colors.white,
                        size: 25,
                      ),
                      hintText: "Ssshhh!!! its a secret",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5, left: MediaQuery.of(context).size.width*0.05, right: MediaQuery.of(context).size.width*0.05),
                child: TextFormField(
                  controller: cnfPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value){
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
                            const BorderSide(color: Colors.white, width: 1.75),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.75),
                      ),
                      border: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.75),
                      ),
                      prefixIcon: Icon(
                        Icons.security,
                        color: Colors.white,
                        size: 25,
                      ),
                      hintText: "Mind Writing it again?",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height*0.07,
                  width: MediaQuery.of(context).size.width*0.9,
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.655, left: MediaQuery.of(context).size.width*0.05, right: MediaQuery.of(context).size.width*0.05),
                  child: RaisedButton(
                    color: Colors.pink,
                    onPressed: validateAndSignup,
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                    elevation: 25,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.74, left: MediaQuery.of(context).size.width*0.48),
                  child: RichText(
                    text: TextSpan(
                        text: "OR ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    )
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.07,
                  width: MediaQuery.of(context).size.width*0.9,
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.78, left: MediaQuery.of(context).size.width*0.05, right: MediaQuery.of(context).size.width*0.05),
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: (){
                      signInWithGoogle().whenComplete(() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ExtendedHome())));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/google.png'),
                            )
                          ),
                        ),
                        Container(
                          child: Text('Sign Up with Google',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 15
                            ),
                          ),
                        )
                      ],
                    ),
                    elevation: 20,
                  )
                ),
            ],
          ),
        ),
      ),
    );
  }
}

