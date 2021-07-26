import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:maacs_app/Constants/ColorPallete.dart';
import 'package:maacs_app/Constants/commons.dart';
import 'package:maacs_app/Models/Category.dart';

class ServiceCategoryListView extends StatefulWidget {
  final Function() callBack;
  const ServiceCategoryListView({Key key,this.callBack}) : super(key: key);

  @override
  _ServiceCategoryListViewState createState() => _ServiceCategoryListViewState();
}

class _ServiceCategoryListViewState extends State<ServiceCategoryListView> with TickerProviderStateMixin{
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Container(
        height: 134,
        width: double.infinity,
        child: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                itemCount: Category.serviceCategory.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count = Category.serviceCategory.length > 10
                      ? 10
                      : Category.serviceCategory.length;
                  final Animation<double> animation =
                  Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                          parent: animationController,
                          curve: Interval((1 / count) * index, 1.0,
                              curve: Curves.fastOutSlowIn)));
                  animationController.forward();

                  return ServiceCategoryViewTile(
                    category: Category.serviceCategory[index],
                    animation: animation,
                    animationController: animationController,
                    callback: widget.callBack,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class ServiceCategoryViewTile extends StatelessWidget {
  const ServiceCategoryViewTile(
      {Key key,
        this.category,
        this.animationController,
        this.animation,
        this.callback})
      : super(key: key);

  final VoidCallback callback;
  final Category category;
  final AnimationController animationController;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - animation.value), 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: callback,
              child: SizedBox(
                width: 230,
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 48,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor('#F8FAFB'),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16.0)),
                              ),
                              child: Row(
                                children: <Widget>[
                                  const SizedBox(
                                    width: 10 + 24.0,
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(top: 10),
                                            child: Text(
                                              category.title,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  letterSpacing: 0.27,
                                                  color: HomeAppTheme
                                                      .darkerText,
                                                  fontFamily: 'Poppins'
                                              ),
                                            ),
                                          ),
                                          const Expanded(
                                            child: SizedBox(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 16, bottom: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${category.lessonCount} Hospitals',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w200,
                                                      fontSize: 12,
                                                      letterSpacing: 0.27,
                                                      color: HomeAppTheme
                                                          .grey,
                                                      fontFamily: 'Poppins'
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        '${category.rating}',
                                                        textAlign:
                                                        TextAlign.left,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w200,
                                                            fontSize: 14,
                                                            letterSpacing: 0.27,
                                                            color: HomeAppTheme
                                                                .grey,
                                                            fontFamily: 'Poppins'
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color: green,
                                                        size: 16,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  height: 23,
                                                  width: 90,
                                                  decoration: BoxDecoration(
                                                      color: green,
                                                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                                      border: Border.all(color: green)),
                                                  child: Center(
                                                    child:  Text(
                                                      'Register Now!',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 11,
                                                        letterSpacing: 0.23,
                                                        color: white,
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.green.shade200,
                                                    borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(
                                                            8.0)),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(
                                                        4.0),
                                                    child: Icon(
                                                      Icons.add,
                                                      color: HomeAppTheme
                                                          .nearlyWhite,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 24, bottom: 35,left: 10),
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(16.0)),
                              child: AspectRatio(
                                  aspectRatio: 1.0,
                                  child: Image.asset(category.imagePath)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

