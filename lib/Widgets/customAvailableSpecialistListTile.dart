import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:maacs_app/Constants/commons.dart';
import 'package:maacs_app/Models/Category.dart';

class AvailableSpecialistListView extends StatefulWidget {
  final VoidCallback callback;
  final Category category;
  const AvailableSpecialistListView({Key key, this.callback, this.category})
      : super(key: key);

  @override
  _AvailableSpecialistListViewState createState() =>
      _AvailableSpecialistListViewState();
}

class _AvailableSpecialistListViewState extends State<AvailableSpecialistListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: Category.topRatedDoctors.length,
        separatorBuilder: (BuildContext context, int index) => Divider(
          indent: 16,
        ),
        itemBuilder: (BuildContext context, int index) => AvailableSpecialistListTile(
          category: Category.topRatedDoctors[index],
          callback: widget.callback,
        ),
      ),
    );
  }
}

class AvailableSpecialistListTile extends StatelessWidget {
  const AvailableSpecialistListTile({Key key, this.callback, this.category})
      : super(key: key);
  final VoidCallback callback;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: HexColor('#F8FAFB'),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 77,
            width: 90,
            decoration: BoxDecoration(
              borderRadius:
              const BorderRadius.all(Radius.circular(16.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.green.withOpacity(0.5),
                    offset: const Offset(0.0, 0.0), blurRadius: 6.0)],
            ),
            child: Image.asset(category.topRatedDoctorsImage),
          ),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(category.topRatedDoctorSRating.toString(),
                    style: TextStyle(
                      color: black,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 4,),
                  Icon(Icons.star,size: 10,color: Colors.red,),
                  Icon(Icons.star,size: 10,color: Colors.red,),
                  Icon(Icons.star,size: 10,color: Colors.red,),
                  Icon(Icons.star,size: 10,color: Colors.red,),
                  Icon(Icons.star,size: 10,color: Colors.red,),
                ],
              ),
              Text(category.topRatedDoctorsName,
                style: TextStyle(
                  color: black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20,),
              Text(
                category.topRatedDoctorsField,
                style: TextStyle(
                  color: black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.3,
                ),
              ),
              SizedBox(height: 5,),
              Text(
                'LivingWord Hospital',
                style: TextStyle(
                  color: black,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45.0,top: 11),
            child: Column(
              children: [
                Text(
                  category.topRatedDoctorsExperience+'\nExperience',
                  style: TextStyle(
                    color: black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 30,),
                Text(
                  category.topRatedDoctorsPatients,
                  style: TextStyle(
                    color: black,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
