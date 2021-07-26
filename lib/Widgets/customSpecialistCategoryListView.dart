import 'package:flutter/material.dart';
import 'package:maacs_app/Constants/commons.dart';
import 'package:maacs_app/Models/Category.dart';


class SpecialistCategories extends StatefulWidget {
  final VoidCallback callback;
  final Category category;
  const SpecialistCategories({Key key, this.callback, this.category}) : super(key: key);

  @override
  _SpecialistCategoriesState createState() => _SpecialistCategoriesState();
}

class _SpecialistCategoriesState extends State<SpecialistCategories> {
  @override
  Widget build(BuildContext context) {
    return         SizedBox(
      height: 100,
      child: ListView.separated(

        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: Category.doctorCategories.length,
        separatorBuilder: (BuildContext context, int index) => Divider(indent: 16,),
        itemBuilder: (BuildContext context, int index) => SpecialCategoryListTile(
          category: Category.doctorCategories[index],
          callback: widget.callback,
        ),
      ),
    );
  }
}

class SpecialCategoryListTile extends StatelessWidget {
  const SpecialCategoryListTile({Key key, this.callback, this.category}) : super(key: key);
  final VoidCallback callback;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            colors: [Colors.green.shade200, Colors.green.shade100]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(category.categoryImage,height: 50,width: 50,),
                SizedBox(height: 8,),
                Text(category.doctorCategoryTitle, style: TextStyle(color: white, fontWeight: FontWeight.w700,fontSize: 14,fontFamily: 'Poppins',),),
                Text('Specialists', style: TextStyle(color: white,fontFamily: 'Poppins'),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

