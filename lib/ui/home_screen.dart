import 'package:flutter/material.dart';
import 'package:news_app/core/model/category_model.dart';
import 'package:news_app/ui/category/category_details.dart';
import 'package:news_app/ui/news_screen/setting/setting_screen.dart';

import '../utils/color_resource .dart';
import 'category/category_fragment.dart';
import 'news_screen/drawer/drawer_screen.dart';
import 'news_screen/search_delegate/NewsSearchDelegate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'Home_Screen';

  static var selectedCategory;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: ColorResources.white,
        child: Image.asset(
          "assets/images/background.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height*0.08,

          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          centerTitle: true,
          title: Text(
            selectedSideMenuItem == DrawerScreen.settings
                ? 'Settings'
                : selectedCategory == null
                    ? 'News App'
                    : selectedCategory!.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            IconButton(
              onPressed: () => showSearch(context: context, delegate: NewsSearchDelegate()),
              icon: Icon(
                Icons.search_sharp,
                color: Colors.white,
              ),
            )
          ],
        ),
        drawer: Drawer(
          child: DrawerScreen(
            onSideMenuItem: onSideMenuItem,
          ),
        ),
        body: selectedSideMenuItem == DrawerScreen.settings
            ? const SettingScreen()
            : selectedCategory == null
                ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
                : CategoryDetails(
                    category: selectedCategory!,
                  ),
      ),
    ]);
  }

  CategoryModel? selectedCategory;

  void onCategoryItemClick(CategoryModel newCategory) {
    //todo: newCategory => user select
    selectedCategory = newCategory;
    setState(() {});
  }

  int selectedSideMenuItem = DrawerScreen.categories;
  void onSideMenuItem(int newSideMenuItem) {
    selectedSideMenuItem = newSideMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
