import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:maacs_app/Constants/ColorPallete.dart';
import 'package:maacs_app/Screens/LandingPage.dart';

class CarouselWithDots extends StatefulWidget {
  final CarouselDisplayItems cdi;
  CarouselWithDots({Key key, this.cdi}) : super(key: key);

  @override
  _CarouselWithDotsState createState() => _CarouselWithDotsState();
}

class _CarouselWithDotsState extends State<CarouselWithDots> {

  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: cdi.map((cdi) =>
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: cdi.imagePath,
                        placeholder: (context, url) => Image.asset("assets/Loading_image.gif"),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.fill,
                        fadeInCurve: Curves.easeIn ,
                        fadeInDuration: Duration(seconds: 5),
                        fadeOutCurve: Curves.easeOut,
                        fadeOutDuration: Duration(seconds: 5),
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              )
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: Text(cdi.headings,style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 10,
                              letterSpacing: 0.27,
                              color: HomeAppTheme.nearlyWhite,
                              fontFamily: 'Poppins'
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ).toList(),
          options: CarouselOptions(
              height: 165,
              autoPlay: true,
              pauseAutoPlayOnTouch: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12,top: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            cdi.map((content){
              int index = cdi.indexOf(content);
              return Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index ? Color.fromRGBO(0, 0, 0, 0.9) : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),

          ),
        ),
      ],
    );
  }
}
