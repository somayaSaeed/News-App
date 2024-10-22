import 'package:flutter/material.dart';

import '../../../core/model/NewsResponse.dart';
import '../../../core/network/api_manage.dart';
import '../../../utils/color_resource .dart';
import '../news_widget/new_item.dart';

class NewsSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => showResults(context),
        icon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null) // Closing the search delegate

      ,
      icon: const Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text('Please enter a search query.'));
    }

    return FutureBuilder<NewsResponse?>(
      future: ApiManager.searchNews(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.green),
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
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(ColorResources.primaryColor),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    ApiManager.searchNews(query);
                  },
                  child: Text(
                    'Try Again',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: ColorResources.white),
                  ),
                ),
              ],
            ),
          );
        }

        // Check if snapshot.data is null
        if (snapshot.data == null) {
          return const Center(child: Text('No data received.'));
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
                    snapshot.data!.message ?? 'Unknown error',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(ColorResources.primaryColor),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      ApiManager.searchNews(query);
                    },
                    child: Text(
                      'Try Again',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: ColorResources.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        // Check if articles are null or empty
        var newsList = snapshot.data!.articles;
        if (newsList == null || newsList.isEmpty) {
          return const Center(child: Text('No articles found.'));
        }

        return ListView.builder(
          itemBuilder: (context, index) {
            return NewDetails(news: newsList[index]);
          },
          itemCount: newsList.length,
        );
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: ColorResources.primaryColor,
      appBarTheme: AppBarTheme(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        backgroundColor: ColorResources.primaryColor,
        centerTitle: true,
      ),
      inputDecorationTheme: InputDecorationTheme(
        activeIndicatorBorder: BorderSide.none,
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 19,
        ),
        fillColor: ColorResources.lightGreen,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        constraints: const BoxConstraints(
          maxHeight: 50.0,
          maxWidth: double.infinity,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      textTheme: TextTheme(
        titleMedium: TextStyle(
          color: ColorResources.white,
        ),
      ),
    );
  }

  @override
  TextStyle? get searchFieldStyle {
    return const TextStyle(
      color: Colors.black87,
      fontSize: 18,
    );
  }
}
