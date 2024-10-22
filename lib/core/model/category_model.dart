import 'dart:ui';
import '../../utils/color_resource .dart';

class CategoryModel {
  String id;
  String title;
  String imgPath;
  Color color;

  CategoryModel(
      {required this.id,
        required this.title,
        required this.imgPath,
        required this.color});
  /*
  business
  entertainment
  general
  health
  science
  sports
   */
  static List<CategoryModel> getCategory() {
    return [
      CategoryModel(
          id: 'sports',
          title: 'Sports',
          imgPath: 'assets/images/sports.png',
          color: ColorResources.sportsCard),
      CategoryModel(
          id: 'business',
          title: 'Business',
          imgPath: 'assets/images/bussines.png',
          color: ColorResources.businessCard),
      CategoryModel(
          id: 'entertainment',
          title: 'Entertainment',
          imgPath: 'assets/images/environment.png',
          color: ColorResources.enviromentCard),
      CategoryModel(
          id: 'health',
          title: 'Health',
          imgPath: 'assets/images/health.png',
          color: ColorResources.healthsCard),
      CategoryModel(
          id: 'science',
          title: 'Science',
          imgPath: 'assets/images/science.png',
          color: ColorResources.scienceCard),
      CategoryModel(
          id: 'technology',
          title: 'Technology',
          imgPath: 'assets/images/technology.png',
          color: ColorResources.politicsCard),
    ];
  }
}