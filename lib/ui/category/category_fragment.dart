import 'package:flutter/material.dart';
import 'package:news_app/ui/category/category_item.dart';
import 'package:news_app/utils/color_resource%20.dart';

import '../../core/model/category_model.dart';

class CategoryFragment extends StatefulWidget {
  CategoryFragment({
    super.key,
    required this.onCategoryItemClick,
  });

  Function onCategoryItemClick;

  @override
  State<CategoryFragment> createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {
  var categoriesList = CategoryModel.getCategory();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pick your category\nof interest',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: ColorResources.blackText,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 25),
          Expanded(
              child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  widget.onCategoryItemClick(categoriesList[index]);
                },
                child: CategoryItem(
                  category: categoriesList[index],
                  index: index,
                ),
              );
            },
            itemCount: categoriesList.length,
          ))
        ],
      ),
    );
  }
}
