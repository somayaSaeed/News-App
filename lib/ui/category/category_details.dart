import 'package:flutter/material.dart';
import 'package:news_app/core/model/category_model.dart';

import '../../core/model/SourceResponse.dart';
import '../../core/model/search.dart';
import '../../core/network/api_manage.dart';
import '../../utils/color_resource .dart';
import '../news_screen/tab_widget/tabs_widget.dart';

class CategoryDetails extends StatefulWidget {
   CategoryDetails({super.key , required this.category});
  CategoryModel category ;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future: ApiManager.getSource(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/opps.png',
                  width: 200,
                  height: 200,
                ),
                Text(
                  'Uh oh!',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Text('Something went wrong'),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(ColorResources.primaryColor),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    ApiManager.getSource(widget.category.id);
                    setState(() {});
                  },
                  child: Text(
                    'Try Again',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: ColorResources.white),
                  ),
                )
              ],
            ),
          );
        }
        // server (response) => success ,error
        if (snapshot.data?.status != 'ok') {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/opps.png',
                    width: 200,
                    height: 200,
                  ),
                  Text(
                    'Uh oh!',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    snapshot.data!.message!,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(ColorResources.primaryColor),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      ApiManager.getSource(widget.category.id);
                      setState(() {});
                    },
                    child: Text(
                      'Try Again',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: ColorResources.white),
                    ),
                  )
                ],
              ),
            ),
          );
        }
        var sourceList = snapshot.data!.sources!;

        return TabsWidget(
          sourcesList: sourceList,
        );
      },
    );
  }
}
