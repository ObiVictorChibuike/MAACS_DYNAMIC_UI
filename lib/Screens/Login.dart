import 'package:flutter/material.dart';
import 'package:maacs_app/Constants/commons.dart';
import 'package:maacs_app/Helpers/Clipper.dart';
import 'package:maacs_app/Screens/ForgetPassword.dart';
import 'package:maacs_app/Screens/LandingPage.dart';
import 'package:maacs_app/Screens/SignUp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget _emailform() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: green, width: 0.7)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: green, width: 0.7)),
            prefixIcon: Icon(Icons.email_outlined, size: 18, color: green),
            isDense: true,
            contentPadding: EdgeInsets.all(15),
            labelText: "Email",
            labelStyle:
            TextStyle(color: black, fontSize: 14, fontFamily: 'Poppins')),
        cursorColor: green,
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter email address';
          } else
            return null;
        },
      ),
    );
  }

  Widget _passwordform() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: green, width: 0.7)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: green, width: 0.7)),
            prefixIcon: Icon(Icons.lock_outlined, size: 18, color: green),
            suffixIcon: Icon(Icons.remove_red_eye, size: 18, color: green),
            isDense: true,
            contentPadding: EdgeInsets.all(15),
            labelText: "Password",
            labelStyle:
            TextStyle(color: black, fontSize: 14, fontFamily: 'Poppins')),
        obscureText: true,
        cursorColor: green,
        validator: (value) => (value.isEmpty ? "Please enter password" : null),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop(true);
              }),
          elevation: 0,
          backgroundColor: green,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.green.shade500, Colors.white]),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  ClipPath(
                    clipper: ClippingClass(),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.32,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: green,
                          borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  fontFamily: 'poppins',
                                  color: white),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Login To Your Account using Your Email Address',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  color: white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 100,
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Stack(children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: white,
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(children: [
                          _emailform(),
                          _passwordform(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: green,
                            ),
                            height: 40,
                            width: MediaQuery.of(context).size.width * .5,
                            child: ElevatedButton(
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(fontFamily: 'Poppins'),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext ctx) =>
                                              LandingPage()));
                                }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child: RichText(
                                    text: TextSpan(
                                        text: "Don't Have An Account?",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: black,
                                          fontFamily: 'Poppins',
                                        ),
                                        children: [
                                          TextSpan(
                                              text: "Sign Up",
                                              style: TextStyle(
                                                fontSize: 11,
                                                letterSpacing: .5,
                                                color: green,
                                                fontFamily: 'Poppins',
                                                decoration: TextDecoration.underline,
                                              ))
                                        ])),
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext ctx) =>
                                              SignUpScreen()));
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 30,),
                          Column(
                            children: [
                              InkWell(
                                child: RichText(
                                  text: TextSpan(
                                    text: "Forget Password?",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: black,
                                      fontFamily: 'Poppins',
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                onTap: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext ctx) => ResetPasswordScreen()));
                                },
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
