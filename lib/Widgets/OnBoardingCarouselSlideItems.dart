import 'package:flutter/material.dart';
import 'package:maacs_app/Constants/commons.dart';
import 'package:maacs_app/Models/OnBoardingCarouselSlideModel.dart';
import 'package:maacs_app/Screens/SignUp.dart';

class OnboardingSlideImages extends StatelessWidget {
  final int index;
  OnboardingSlideImages(this.index);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red),
      home: Scaffold(
          body: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget> [
                Container(
                  child: ShaderMask(
                    shaderCallback: (rect) => LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors:[Colors.black.withOpacity(0.3),Colors.transparent]
                    ).createShader(rect),
                    blendMode: BlendMode.darken,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(slideListModel[index].imageUrl),
                            fit: BoxFit.scaleDown,
                            colorFilter: ColorFilter.mode(Colors.white, BlendMode.dstOver)
                        ),
                        gradient: LinearGradient(
                            colors: [Colors.white, Colors.white]),
                      ),
                    ),
                  ),
                ),

                Align(alignment: Alignment.topCenter, //margin: EdgeInsets.only(top: 115),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Text("MAACS",style: Theme.of(context).primaryTextTheme.headline2.copyWith(fontFamily: 'Poppins',fontSize: 60,fontWeight: FontWeight.bold,color: Colors.green)),
                      ),
                      Spacer(flex:3,),
                      Text(slideListModel[index].title,
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.white,fontFamily: 'Poppins'),),
                      SizedBox(height: 120,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0.0, 25, 0.0),
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                              color: green,
                              borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                              border: Border.all(color: green)),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.white24,
                              borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx)=>SignUpScreen()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 12, bottom: 12, left: 18, right: 18),
                                child: Center(
                                  child: Text(
                                    'GET STARTED HERE',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        letterSpacing: 0.27,
                                        color: white,
                                        fontFamily: 'Poppins'
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 65,)
                    ],
                  ),
                )
              ]
          )
      ),
    );
  }
}
