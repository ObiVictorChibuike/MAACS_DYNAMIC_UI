import 'package:flutter/material.dart';
import 'package:maacs_app/Constants/commons.dart';
import 'package:maacs_app/Helpers/Clipper.dart';
import 'package:maacs_app/Screens/Login.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  Widget _resetpasswordform1() {
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
            labelText: "Email",
            labelStyle:
            TextStyle(color: black, fontSize: 14, fontFamily: 'Poppins')),
        obscureText: true,
        cursorColor: green,
        validator: (value) => (value.isEmpty ? "Please enter Email" : null),
      ),
    );
  }

  // Widget _resetpasswordform2() {
  //   return Padding(
  //     padding: const EdgeInsets.all(10.0),
  //     child: TextFormField(
  //       textInputAction: TextInputAction.done,
  //       keyboardType: TextInputType.visiblePassword,
  //       decoration: InputDecoration(
  //           enabledBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(5)),
  //               borderSide: BorderSide(color: green, width: 0.7)),
  //           focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(5)),
  //               borderSide: BorderSide(color: green, width: 0.7)),
  //           prefixIcon: Icon(Icons.lock_outlined, size: 18, color: green),
  //           suffixIcon: Icon(Icons.remove_red_eye, size: 18, color: green),
  //           isDense: true,
  //           contentPadding: EdgeInsets.all(15),
  //           labelText: "Confirm Password",
  //           labelStyle:
  //               TextStyle(color: black, fontSize: 14, fontFamily: 'Poppins')),
  //       obscureText: true,
  //       cursorColor: green,
  //       validator: (value) => (value.isEmpty ? "Please enter password" : null),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext ctx) => LoginScreen()));
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
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Reset Password",
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
                                'Insert And Confirm Your New Password',
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
                ],
              ),
              Positioned(
                top: 100,
                bottom: 0,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Stack(children: [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: white,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                _resetpasswordform1(),
                                //_resetpasswordform2(),
                                Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width * .5,
                                  child: ElevatedButton(
                                      child: Text(
                                        "RESET PASSWORD",
                                        style: TextStyle(fontFamily: 'Poppins'),
                                      ),
                                      onPressed: () {}),
                                ),
                              ],
                            ),
                          ),
                        ],
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
