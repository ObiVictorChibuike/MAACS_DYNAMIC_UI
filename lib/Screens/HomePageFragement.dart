import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:maacs_app/Constants/ColorPallete.dart';
import 'package:maacs_app/Constants/commons.dart';
import 'package:maacs_app/Helpers/CustomPaintPathpainter.dart';
import 'package:maacs_app/Helpers/HomeClipper2.dart';
import 'package:maacs_app/Helpers/HomeClippers.dart';
import 'package:maacs_app/Helpers/HoveringImageAnimation.dart';
import 'package:maacs_app/Models/Category.dart';
import 'package:maacs_app/Screens/AvailableSpecailistScreen.dart';
import 'package:maacs_app/Screens/SpecialistInfoScreen.dart';
import 'package:maacs_app/Widgets/HospitalListView.dart';
import 'package:maacs_app/Widgets/ServicesGridView.dart';
import 'package:maacs_app/Widgets/customAvailableSpecialistListTile.dart';
import 'package:maacs_app/Widgets/customServiceGridView.dart';
import 'package:maacs_app/Widgets/customServicesListView.dart';
import 'package:maacs_app/Widgets/customSpecialistCategoryListView.dart';
import 'package:maacs_app/Widgets/customSpecialistListView.dart';
import 'package:maacs_app/Widgets/custom_animated_bottom_bar.dart';
import 'package:marquee/marquee.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key key, this.callBack}) : super(key: key);
  final Function() callBack;

  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  int selectedIndex = 0;
  final _inactiveColor = Colors.grey;
  bool _light = true;



  Widget _buildBottomBar() {
    return CustomAnimatedBottomBar(
      containerHeight: 55,
      backgroundColor: Colors.white,
      selectedIndex: selectedIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => selectedIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.apps),
          title: Text('Home'),
          activeColor: Colors.green,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.favorite),
          title: Text('Services'),
          //activeColor: Colors.purpleAccent,
          activeColor: Colors.green,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.people),
          title: Text(
            'Specialists',
          ),
          //activeColor: Colors.pink,
          activeColor: Colors.green,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
          //activeColor: Colors.blue,
          activeColor: Colors.green,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget getHomeBody() {
    return Container(
      child: Stack(
        children: [
          Container(
            child:   AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
                color: black,
              ),
            ),
          ),
          Positioned(
            top: 70,
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.transparent,
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width / 0.3,
                    child: AnimatedImage(),
                  ),
                  SizedBox(height: 10,),
                  Stack(children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: <Widget>[
                          Padding(padding: const EdgeInsets.only(left: 30,), child: getSearchBarUI(),),
                          getServiceCategoryUI(),
                          Flexible(
                            child: getPopularServicesUI(),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getHospitalsAndServices() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HomeAppTheme.nearlyWhite,
      body: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: CustomPaint(
                painter: pathPainter(),
              )
          ),
          Stack(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: IconButton(
                        icon: Icon(Icons.menu,
                          color: black,
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(left: 30), child: getSearchBarUI()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Text('Choose a Hospital of Your Choice to access their relative services',style: TextStyle(fontSize: 17,fontFamily: 'poppins',fontWeight: FontWeight.w400),),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.34,
                            child: Column(
                              children: [
                                SizedBox(height: 10,),
                                Text(
                                  'Hospitals',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18,
                                      letterSpacing: 0.3,
                                      color: black,
                                      fontFamily: 'Poppins'),
                                ),
                                Expanded(
                                  child: HospitalListView(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.66,
                            child: Column(
                              children: [
                                SizedBox(height: 10,),
                                Text(
                                  'Services',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      letterSpacing: 0.3,
                                      color: green,
                                      fontFamily: 'Poppins'),
                                ),
                                Flexible(
                                  child: HospitalandServices(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  //
  // Widget buildAnimatedText(String text){
  //   return Marquee(
  //     pauseAfterRound: Duration(seconds: 3),
  //     blankSpace: 30,
  //     text: text,
  //     style: TextStyle(
  //         fontWeight: FontWeight.w600,
  //         fontSize: 18,
  //         letterSpacing: 0.3,
  //         color: green,
  //         fontFamily: 'Poppins'),
  //   );
  // }

  Widget getSpecialist() {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade100,
        body: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: CustomPaint(
                  painter: pathPainter(),
                )
            ),
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        leading: IconButton(
                          icon: Icon(Icons.menu,
                            color: black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 75,
                  bottom: 0.0,
                  right: 0.0,
                  left: 0.0,
                  child: Container(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 14,right: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      getSearchBarUI(),
                                      SizedBox(height: 5,),
                                      Text('Find a doctor and Book an Appointment',style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Poppins',
                                        fontSize: 20,
                                        letterSpacing: 0.5,
                                      ),),
                                      SizedBox(height: 15,),
                                      Text('Top Rated Specialist',style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        letterSpacing: 0.2,
                                        color: black,
                                      ),),
                                    ],
                                  ),
                                ),
                                SpecialistListView(
                                  callBack: (){
                                    moveToAvailableSpecialistScreen();
                                  },
                                ),
                                SizedBox(
                                  height: 10  ,
                                ),
                                _categorySection(),
                                availableSpecialist(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
    );
  }

  _categorySection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Specialist Categories',
              style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  letterSpacing: 0.2
              ),
            ),
            Text('See All',
              style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  letterSpacing: 0.2
              ),
            ),
          ],
        ),
        SizedBox(
          height: 32,
        ),
        SpecialistCategories(
        ),
      ],
    );
  }

  Widget availableSpecialist(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Available Specialists',
              style: TextStyle(
                color: black,
                letterSpacing: 0.2,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            TextButton(child: Text('See All',
              style: TextStyle(
                color: black,
                letterSpacing: 0.2,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),),
              onPressed: (){
                moveToAvailableSpecialistScreen();
              },
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(child: AvailableSpecialistListView(),onTap: (){
          moveTo();
        },),
        SizedBox(height: 3,),
      ],
    );
  }


  Widget getSettingsFragment(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: green,
        title: Text(
          'Settings',
          style: TextStyle(fontFamily: 'Poppins',fontSize: 20),
        ),
        leading: Icon(Icons.arrow_back_ios),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.transparent,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 260.0),
                child: Text('PROFILE',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Poppins", color: HomeAppTheme.darkText,fontSize: 20),),
              ),
              Divider(),
              Container(
                color: HomeAppTheme.notWhite,
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                          border: Border.all(color: black)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          child: Icon(Icons.person,color: black,size: 55,),
                          radius: 40,
                          backgroundColor: Colors.grey.shade400,
                        ),
                      ),
                    ),
                    Text('Victor Banks', style: TextStyle(fontSize: 20,fontFamily: 'Poppins',color: HomeAppTheme.darkText,fontWeight: FontWeight.w300,)),
                    Text('+234 9026896420', style: TextStyle(fontSize: 12,fontFamily: 'Poppins',color: HomeAppTheme.darkText,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(right: 260.0),
                child: Text('GENERAL',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Poppins", color: HomeAppTheme.darkText,fontSize: 20),),
              ),
              Container(
                color: HomeAppTheme.notWhite,
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Divider(),
                    ListTile(
                      leading: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Colors.green.shade200,
                            shape: BoxShape.circle
                        ),
                        child: Icon(Icons.nightlight_round,size: 20,),
                      ),
                      title: Text('Night Mode',style: TextStyle(fontSize: 15,fontFamily: 'Poppins'),),
                      trailing: CupertinoSwitch(
                        value: _light,
                        onChanged: (bool value) { setState(() { _light = value; }); },
                      ),
                      onTap: () { setState(() { _light = !_light; }); },
                    ),
                    Divider(),
                    ListTile(
                      leading: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Colors.green.shade200,
                            shape: BoxShape.circle
                        ),
                        child: Icon(Icons.lock,size: 20,),
                      ),
                      title: Text('Change Password',style: TextStyle(fontSize: 15,fontFamily: 'Poppins'),),
                    ),
                    Divider(),
                    ListTile(
                      leading: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Colors.green.shade200,
                            shape: BoxShape.circle
                        ),
                        child: Icon(Icons.delete_rounded,size: 20,),
                      ),
                      title: Text('Delete Account',style: TextStyle(fontSize: 15,fontFamily: 'Poppins'),),
                    ),
                    Divider(),
                    ListTile(
                      leading: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Colors.green.shade200,
                            shape: BoxShape.circle
                        ),
                        child: Icon(Icons.bug_report,size: 20,),
                      ),
                      title: Text('Report A Bug',style: TextStyle(fontSize: 15,fontFamily: 'Poppins'),),
                    ),
                    Divider(),
                    ListTile(
                      leading: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Colors.green.shade200,
                            shape: BoxShape.circle
                        ),
                        child: Icon(Icons.logout,size: 20,),
                      ),
                      title: Text('Logout',style: TextStyle(fontSize: 15,fontFamily: 'Poppins'),),
                    ),Divider(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getwidget() {
    if (selectedIndex == 0) {
      return getHomeBody();
    } else if (selectedIndex == 1) {
      return getHospitalsAndServices();
    }
    if (selectedIndex == 2) {
      return getSpecialist();
    }
    if (selectedIndex == 3) {
      return getSettingsFragment(context);
    }
  }


  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor('#F8FAFB'),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(13.0),
                    bottomLeft: Radius.circular(13.0),
                    topLeft: Radius.circular(13.0),
                    topRight: Radius.circular(13.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16,bottom: 3),
                        child: TextFormField(
                          cursorColor: Colors.green,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: HomeAppTheme.nearlyBlue,
                          ),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Search for Services',
                            //labelText: 'Search for services',
                            border: InputBorder.none,
                            helperStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: HexColor('#B9BABC'),
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.2,
                              color: HexColor('#B9BABC'),
                            ),
                          ),
                          onEditingComplete: () {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Container(
                        width: 25,
                        height: 25,
                        child: InkWell(
                          child: Image.asset('assets/search.png'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          )
        ],
      ),
    );
  }

  Widget getPopularServicesUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, left: 18, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Popular Services',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                letterSpacing: 0.3,
                color: HomeAppTheme.darkerText,
                fontFamily: 'Poppins'),
          ),
          Flexible(
            child: CustomGridView(),
          ),
        ],
      ),
    );
  }

  Widget getServiceCategoryUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only( top: 5.0, left: 18, right: 16,bottom: 5),
          child: Text(
            'Service Categories',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                letterSpacing: 0.3,
                color: HomeAppTheme.darkerText,
                fontFamily: 'Poppins'),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: <Widget>[
              getButtonUI(),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(),
            ],
          ),
        ),
        ServiceCategoryListView(),
      ],
    );
  }

  void moveToAvailableSpecialistScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => AvailableSpecialist(),
      ),
    );
  }

  void moveTo() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => ServiceInfoScreen(),
      ),
    );
  }

  Widget getButtonUI() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            border: Border.all(color: Colors.green.shade400,)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  'Services',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: green,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: HomeAppTheme.nearlyWhite,
        child: Stack(children: [
          Column(
            children: [
              ClipPath(
                clipper: HomeClippers2(),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7,
                  color: Colors.grey.shade400.withOpacity(0.2),
                  child: Column(
                    children: [
                      ClipPath(
                        clipper: HomeClippers(),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.51,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.green.shade100, Colors.white]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          getwidget(),
        ]),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }
}
