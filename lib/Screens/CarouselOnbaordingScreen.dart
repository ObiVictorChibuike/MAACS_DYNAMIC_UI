import 'dart:async';
import 'package:flutter/material.dart';
import 'package:maacs_app/Helpers/OnBoardingCarouselDots.dart';
import 'package:maacs_app/Models/OnBoardingCarouselSlideModel.dart';
import 'package:maacs_app/Widgets/OnBoardingCarouselSlideItems.dart';

class CarouselOnboardingScreen extends StatefulWidget {
  @override
  _CarouselOnboardingScreenState createState() => _CarouselOnboardingScreenState();
}

class _CarouselOnboardingScreenState extends State<CarouselOnboardingScreen> {

  int _currentPage = 0;
  final PageController _pageController = PageController(
      initialPage: 0
  );
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if(_currentPage < 2){
        _currentPage++;
      }
      else {
        _currentPage = 0;
      }
      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 300 ),
          curve: Curves.easeIn);
    }
    );
  }

  _onPageChanged(int index){
    setState(() {
      _currentPage = index;
    });
  }
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red),
      home: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: slideListModel.length,
              itemBuilder: (ctx, i) => OnboardingSlideImages(i),
            ),
            Positioned(
              bottom: 90.0,
              right: 0.0,
              left: 0.0,
              child: Align(
                alignment: Alignment.center,
                child:
                Container(
                  margin: const EdgeInsets.only(bottom: 35),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      for(int i = 0; i < slideListModel.length; i++)
                        if(i == _currentPage)
                          SlideDots(isActive: true,)
                        else
                          SlideDots(isActive: false,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
