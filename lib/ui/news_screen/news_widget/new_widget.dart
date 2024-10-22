import 'package:flutter/material.dart';
import 'package:news_app/core/model/NewsResponse.dart';
import 'package:news_app/core/model/SourceResponse.dart';
import 'package:news_app/core/network/api_manage.dart';
import 'package:news_app/ui/news_screen/news_widget/new_item.dart';

import '../../../core/model/search.dart';
import '../../../utils/color_resource .dart';

class NewWidget extends StatefulWidget {
  Source source;

  NewWidget({super.key, required this.source });

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(widget.source.id!??''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          } else if (snapshot.hasError) {
            Center(
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
                      ApiManager.getNewsBySourceId(widget.source.id ?? '');
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
          if (snapshot.data!.status != 'ok') {
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
                        backgroundColor: WidgetStateProperty.all(
                            ColorResources.primaryColor),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        ApiManager.getNewsBySourceId(widget.source.id ?? '');
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
          var newsList = snapshot.data!.articles!;
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewDetails(news: newsList[index] , );
            },
            itemCount: newsList.length,
          );
        });
  }
}
