import 'package:flutter/cupertino.dart';
import 'package:news_app/core/model/category_model.dart';
import 'package:news_app/utils/color_resource%20.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({
    super.key,
    required this.category,
    required this.index,
  });
  CategoryModel category;
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topRight: const Radius.circular(20),
          topLeft: const Radius.circular(20),
          bottomLeft: Radius.circular(
            index % 2 == 0 ? 20 : 0,
          ),
          bottomRight: Radius.circular(
            index % 2 != 0 ? 20 : 0,
          ),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Image.asset(category.imgPath),
          ),
          const SizedBox(height: 10,),
          Expanded(
            flex: 2,
            child: Text(category.title ,
            style: TextStyle(
              fontFamily:'Exo' ,
              fontWeight: FontWeight.w400,
              fontSize: 22,
              color: ColorResources.white
            ),),
          ),
        ],
      ),
    );
  }
}
