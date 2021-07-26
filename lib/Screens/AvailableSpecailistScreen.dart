import 'package:flutter/material.dart';
import 'package:maacs_app/Constants/commons.dart';
import 'package:maacs_app/Screens/SpecialistInfoScreen.dart';
import 'package:maacs_app/Widgets/customAllCategoryTabBarView.dart';

class AvailableSpecialist extends StatefulWidget {
  const AvailableSpecialist({Key key}) : super(key: key);

  @override
  _AvailableSpecialistState createState() =>
      _AvailableSpecialistState();
}

class _AvailableSpecialistState extends State<AvailableSpecialist> {
  void moveTo() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => ServiceInfoScreen(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: white,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          backgroundColor: green.withOpacity(0.5),
          title: Text('Available Specialist', style: TextStyle(
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
              fontFamily: 'Poppins'),
          ),
          centerTitle: true,
          bottom: TabBar(
            physics: BouncingScrollPhysics(),
            indicatorColor: white,
            isScrollable: true,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
              fontFamily: 'Poppins',
            ),
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Oncologist'),
              Tab(text: 'Urologist'),
              Tab(text: 'Neurosurgeon'),
              Tab(text: 'Cardiologist'),
              Tab(text: 'Dentist'),],
          ),
        ),
        body: TabBarView(
          children: [
            AllCategoryTabBarViewScreen(callBack: (){moveTo();},),
            AllCategoryTabBarViewScreen(callBack: (){moveTo();},),
            AllCategoryTabBarViewScreen(callBack: (){moveTo();},),
            AllCategoryTabBarViewScreen(callBack: (){moveTo();},),
            AllCategoryTabBarViewScreen(callBack: (){moveTo();},),
            AllCategoryTabBarViewScreen(callBack: (){moveTo();},),
          ],
        ),
      ),
    );
  }
}
