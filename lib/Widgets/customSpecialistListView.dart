import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:maacs_app/Constants/commons.dart';
import 'package:maacs_app/Models/Category.dart';


class SpecialistListView extends StatefulWidget {
  final Function() callBack;
  const SpecialistListView({Key key,this.callBack}) : super(key: key);

  @override
  _SpecialistListViewState createState() => _SpecialistListViewState();
}

class _SpecialistListViewState extends State<SpecialistListView> with TickerProviderStateMixin{
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
        height: 170,
        width: double.infinity,
        child: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Container(
                height: 185,
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => Divider(indent: 16,),
                  primary: false,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: Category.doctorCredentials.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final int count = Category.doctorCredentials.length > 10
                        ? 10
                        : Category.doctorCredentials.length;
                    final Animation<double> animation =
                    Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: animationController,
                            curve: Interval((1 / count) * index, 1.0,
                                curve: Curves.fastOutSlowIn)));
                    animationController.forward();
                    return ServiceCategoryViewTile(
                      category: Category.doctorCredentials[index],
                      animation: animation,
                      animationController: animationController,
                      callback: widget.callBack,
                    );
                  },
                ),
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
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  width: 280,
                  height: 199,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        colors: [Colors.green.shade800, Colors.green.shade100]),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 16,
                          right: 16,
                          child: SizedBox(
                            width: 162,
                            height: 139,
                            // child: Image(
                            //   image: AssetImage('assets/flame-1012.png'),
                            // ),
                            child: Container(
                              color: Colors.transparent,
                            ),
                          )),
                      Positioned(
                          top: 10,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: Text(
                                  'Dr.',
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 20,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    category.doctorFirstName,
                                    style: TextStyle(
                                      color: white,
                                      fontSize: 16,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    category.doctorLastName,
                                    style: TextStyle(
                                      color: white,
                                      fontSize: 16,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                category.specialistType + '\tSpecialist',
                                style: TextStyle(
                                  color: white,
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              Text(
                                category.hospitalName+'\tHospitals',
                                style: TextStyle(
                                  color: white,
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          )),
                      Positioned(
                        left: 0.0,
                        bottom: 0.0,
                        child: Container(
                          width: 77,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.tealAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(32)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: Row(
                              children: [
                                Text(
                                  '${category.specialistRating}',
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 14,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Icon(
                                  Icons.star,
                                  color: white,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          right: 16,
                          bottom: 0,
                          child: SizedBox(
                            width: 120,
                            height: 173,
                            child: Hero(
                                tag: category.doctorFirstName +
                                    category.doctorLastName,
                                child: Image(
                                  filterQuality: FilterQuality.high,
                                  image: AssetImage(category.specialistImage),
                                )),
                          )),
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}
