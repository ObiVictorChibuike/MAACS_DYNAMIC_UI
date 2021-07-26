import 'package:flutter/material.dart';
import 'package:maacs_app/Constants/commons.dart';
import 'package:maacs_app/Helpers/Clipper.dart';
import 'package:maacs_app/Screens/HomePageFragement.dart';
import 'package:maacs_app/Widgets/CustomCarousel.dart';

List<CarouselDisplayItems>  cdi = const <CarouselDisplayItems> [

  const CarouselDisplayItems (imagePath: 'https://images.unsplash.com/photo-1618498082410-b4aa22193b38?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
      headings: 'Book An Appointment With a Specialist'),
  CarouselDisplayItems(imagePath: 'https://images.unsplash.com/photo-1579684453423-f84349ef60b0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1368&q=80',
    headings:  'Antenatal Services',
  ),
  CarouselDisplayItems(imagePath: 'https://images.unsplash.com/photo-1576765608535-5f04d1e3f289?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1357&q=80',
      headings:   'Best Hospital Service'),
  CarouselDisplayItems(imagePath: 'https://images.unsplash.com/photo-1567427362138-e33c5022aafa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
      headings:  'Standard Hospitals with comfort'),
  CarouselDisplayItems(imagePath: 'https://images.unsplash.com/photo-1610401162696-dad858f5b16d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1353&q=80',
      headings: 'Get a family doctor'),
  CarouselDisplayItems(imagePath: 'https://images.unsplash.com/photo-1534179490021-a8261bbbed30?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
      headings: 'Get a Prescription from Pharmacist'),
];

class CarouselDisplayItems {
  const CarouselDisplayItems({this.imagePath, this.headings});

  final String imagePath;

  final String headings;
}



class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Widget _gridView() {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, right: 14.0),
      child: Container(
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.green.shade50, Colors.white]),
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 80,
                    child: Icon(
                      Icons.settings,
                      size: 40,
                      color: green,
                    ),
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.green.shade50, Colors.white]),
              ),
              child: Column(children: [
                Container(
                  height: 50,
                  width: 80,
                  child: IconButton(
                    alignment: Alignment.center,
                    icon: Icon(Icons.home),
                    color: green,
                    iconSize: 40,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>HomeFragment()));
                    },
                  ),
                ),
                Text(
                  "Home",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: black),
                ),
              ]),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.green.shade50, Colors.white]),
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 80,
                    child: Icon(
                      Icons.call,
                      size: 40,
                      color: green,
                    ),
                  ),
                  Text(
                    "Call",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gridView1() {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, right: 14.0),
      child: Container(
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.green.shade50, Colors.white]),
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 80,
                    child: Icon(
                      Icons.people_alt,
                      size: 40,
                      color: green,
                    ),
                  ),
                  Text(
                    "People",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.green.shade50, Colors.white]),
              ),
              child: Column(children: [
                Container(
                  height: 50,
                  width: 80,
                  child: Icon(
                    Icons.add_alert,
                    size: 40,
                    color: green,
                  ),
                ),
                Text(
                  "Emergency",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: black),
                ),
              ]),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.green.shade50, Colors.white]),
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 80,
                    child: Icon(
                      Icons.email_outlined,
                      size: 40,
                      color: green,
                    ),
                  ),
                  Text(
                    "Messenger",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gridView2() {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, right: 14.0),
      child: Container(
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.green.shade50, Colors.white]),
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 80,
                    child: Icon(
                      Icons.medical_services,
                      size: 40,
                      color: green,
                    ),
                  ),
                  Text(
                    "Medical Service",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.green.shade50, Colors.white]),
              ),
              child: Column(children: [
                Container(
                  height: 50,
                  width: 80,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: green,
                  ),
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: black),
                ),
              ]),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.green.shade50, Colors.white]),
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 80,
                    child: Icon(
                      Icons.error,
                      size: 40,
                      color: green,
                    ),
                  ),
                  Text(
                    "About",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Container(),
        centerTitle: true,
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
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(10),
                        )),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0.0,
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Stack(children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "WELCOME ABOARD!",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      color: white),
                                ),
                                Text(
                                  'Get Connected now!\nHigh Standard Medical Personnel\nMedical services to your door Step',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Poppins',
                                      color: white),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 45, right: 45),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: white,
                          ),
                          child: TextFormField(
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                prefixIcon:
                                Icon(Icons.search, size: 18, color: green),
                                suffixIcon: Icon(Icons.view_headline_rounded,
                                    size: 18, color: green),
                                isDense: true,
                                contentPadding: EdgeInsets.all(15),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Search",
                                labelStyle: TextStyle(
                                    color: black,
                                    fontSize: 14,
                                    fontFamily: 'Poppins')),
                            obscureText: true,
                            cursorColor: green,
                            cursorHeight: 20,
                            validator: (value) =>
                            (value.isEmpty ? "Please enter password" : null),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: Column(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                  color: white,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 10,),
                                    _gridView(),
                                    Divider(color: green,),
                                    _gridView1(),
                                    Divider(color: green,),
                                    _gridView2(),
                                    SizedBox(height: 10,)
                                  ],
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(20)),
                          color: Colors.green.shade50,
                        ),
                        margin: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Divider(color: green,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
                                  child: Text('Explore Hospital Services as we bring Wonderful\nServices to your Door Step', style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.normal,color: green,fontSize: 13,letterSpacing: 0.5),),
                                ),
                              ],
                            ),
                            Divider(color: green,),
                            CarouselWithDots(),
                            Divider(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
