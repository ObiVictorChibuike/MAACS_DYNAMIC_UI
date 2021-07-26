import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:maacs_app/Constants/ColorPallete.dart';
import 'package:maacs_app/Models/Category.dart';

class AllCategoryTabBarViewScreen extends StatefulWidget {
  final Function() callBack;
  const AllCategoryTabBarViewScreen({Key key, this.callBack}) : super(key: key);

  @override
  _AllCategoryTabBarViewScreenState createState() => _AllCategoryTabBarViewScreenState();
}

class _AllCategoryTabBarViewScreenState extends State<AllCategoryTabBarViewScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this);
    super.initState();
  }


  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return GridView(
              padding: const EdgeInsets.all(5),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: List<Widget>.generate(
                Category.allCategoryTabBarView.length,
                    (int index) {
                  final int count = Category.allCategoryTabBarView.length;
                  final Animation<double> animation =
                  Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animationController,
                      curve: Interval((1 / count) * index, 1.0,
                          curve: Curves.fastOutSlowIn),
                    ),
                  );
                  animationController.forward();
                  return ServiceCategoryViewTile(
                    callback: widget.callBack,
                    category: Category.allCategoryTabBarView[index],
                    animation: animation,
                    animationController: animationController,
                  );
                },
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 25.0,
                crossAxisSpacing: 20.0,
                childAspectRatio: 0.8,
              ),
            );
          }
        },
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
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: callback,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: HexColor('#F8FAFB'),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(16.0)),
                              // border: new Border.all(
                              //     color: DesignCourseAppTheme.notWhite),
                            ),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top:10,left: 7, right: 7),
                                          child: Text(
                                            category.topRatedDoctorsField,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10,
                                                letterSpacing: 0.27,
                                                color: HomeAppTheme
                                                    .darkerText,
                                                fontFamily: 'Poppins'),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  '${category.rating}',
                                                  textAlign:
                                                  TextAlign.left,
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w200,
                                                      fontSize: 10,
                                                      letterSpacing: 0.27,
                                                      color:
                                                      HomeAppTheme
                                                          .grey,
                                                      fontFamily:
                                                      'Poppins'),
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 8,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 8,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 8,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 8,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 8,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              bottom: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                '${category.topRatedDoctorsExperience} Experience',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.w200,
                                                    fontSize: 10,
                                                    letterSpacing: 0.27,
                                                    color:
                                                    HomeAppTheme
                                                        .grey,
                                                    fontFamily: 'Poppins'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 48,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding:
                      const EdgeInsets.only(top: 12, right: 16, left: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.green.withOpacity(0.5),
                                offset: const Offset(0.0, 0.0), blurRadius: 6.0)],
                        ),
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                          child: AspectRatio(
                              aspectRatio: 1.28,
                              child: Image.asset(category.imagePath)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
