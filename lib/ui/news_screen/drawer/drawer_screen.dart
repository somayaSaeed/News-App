import 'package:flutter/material.dart';

import '../../../utils/color_resource .dart';

class DrawerScreen extends StatelessWidget {
   DrawerScreen({super.key , required this.onSideMenuItem});
  Function onSideMenuItem ;
  static const int categories = 1;
   static const int settings = 2;


   @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.08,
          ),
          width: MediaQuery.of(context).size.width,
          color: ColorResources.primaryColor,
          child: Text(
            "News App!",
            textAlign: TextAlign.center,
            style:TextStyle(

              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ColorResources.white,
              fontFamily: 'Poppins',

            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              onSideMenuItem(DrawerScreen.categories);

            },
            child: Row(
              children: [
                Icon(
                  Icons.menu_rounded,
                  color: ColorResources.black,
                ),
                const SizedBox(width: 20),
                Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorResources.black,
                    fontFamily: 'Poppins',
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              onSideMenuItem(DrawerScreen.settings);

            },
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  color: ColorResources.black,
                ),
                const SizedBox(width: 20),
                Text(
                  "Setting",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorResources.black,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
