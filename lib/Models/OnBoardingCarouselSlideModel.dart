import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;

  Slide({
    @required this.imageUrl,
    @required this.title,
  });
}

final slideListModel = [
  Slide(
    imageUrl: 'assets/Onboarding1.png',
    title: 'Medical Services at\nYour Door Step',
  ),

  Slide(
    imageUrl: 'assets/Onboarding2.png',
    title: 'Good Health Treatment\nHigh Standard Medical Staff\nMonthly And Annual Health Service',
  ),

  Slide(
    imageUrl: 'assets/Onboarding3.png',
    title: 'Do You have a Family Doctor?\n How Often Do You Go For Check Up?',
  ),
  Slide(
    imageUrl: 'assets/Onboarding4.png',
    title: "Distance A Barrier?\nDon't Worry We Got You Covered\n As we Bring Get you connected to Hospitals of your Choice From your Convenience",
  ),
];
