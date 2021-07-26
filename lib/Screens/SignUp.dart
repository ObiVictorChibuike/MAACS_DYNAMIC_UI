import 'package:flutter/material.dart';
import 'package:maacs_app/Constants/commons.dart';
import 'package:maacs_app/Helpers/Clipper.dart';
import 'package:maacs_app/Screens/Login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Widget _usernameform() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: green, width: 0.7)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: green, width: 0.7)),
            prefixIcon: Icon(Icons.person_outlined, size: 18, color: green),
            isDense: true,
            contentPadding: EdgeInsets.all(15),
            labelText: "Username",
            labelStyle:
            TextStyle(color: black, fontSize: 14, fontFamily: 'Poppins')),
        cursorColor: green,
        validator: (value) => (value.isEmpty ? "Please enter username" : null),
      ),
    );
  }

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

  Widget _phoneNumberform() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: green, width: 0.7)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: green, width: 0.7)),
            prefixIcon:
            Icon(Icons.phone_android_outlined, size: 18, color: green),
            isDense: true,
            contentPadding: EdgeInsets.all(15),
            labelText: "Phone Number",
            labelStyle:
            TextStyle(color: black, fontSize: 14, fontFamily: 'Poppins')),
        cursorColor: green,
        validator: (value) =>
        (value.isEmpty ? "Please enter phone number" : null),
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
        appBar: AppBar(elevation: 0),
        backgroundColor: white,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.green.shade500, Colors.white]),
          ),
          child: Stack(
            children: [
              Column(children: [
                ClipPath(
                  clipper: ClippingClass(),
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.32,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(10),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Glad To Meet \n You",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  color: white),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Create Your New Account for Future Uses.',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Poppins',
                                  color: white),
                            )
                          ],
                        ),
                      )),
                ),
              ]),
              Positioned(
                top: 120,
                bottom: 0,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Stack(children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: white,
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            _usernameform(),
                            _emailform(),
                            _phoneNumberform(),
                            _passwordform(),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * .5,
                              child: ElevatedButton(
                                  child: Text(
                                    "REGISTER",
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext ctx) =>
                                                LoginScreen()));
                                  }),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                                color: white,
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    child: RichText(
                                        text: TextSpan(
                                            text: "Already Have An Account?",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: black,
                                              fontFamily: 'Poppins',
                                            ),
                                            children: [
                                              TextSpan(
                                                  text: "Login Here",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      letterSpacing: .5,
                                                      color: green,
                                                      fontFamily: 'Poppins',
                                                      decoration:
                                                      TextDecoration.underline))
                                            ])),
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext ctx) =>
                                                  LoginScreen()));
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
