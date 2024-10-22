import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/model/NewsResponse.dart';
import '../../../utils/color_resource .dart';

class NewsDetails extends StatefulWidget {
  const NewsDetails({
    super.key,
  });

  static const String routeName = "NewsDetails";

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)?.settings.arguments as News;

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
          backgroundColor: ColorResources.primaryColor,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          centerTitle: true,
          title: Text(
            'News Details',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CachedNetworkImage(
                    imageUrl: news.urlToImage ?? 'No Image Available ',
                    placeholder: (context, url) => Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.grey[300],
                        ),
                    errorWidget: (context, url, error) => Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.broken_image,
                            size: 100,
                          ),
                        )),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      news.author ?? 'Unknown Author',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      news.title ?? 'No Title',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: ColorResources.blackText),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _formatDate(news.publishedAt),
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorResources.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ReadMoreText(
                            news.description ?? 'No Content Available',


                            trimMode: TrimMode.Line,
                            trimLines: 5,
                            colorClickableText: ColorResources.primaryColor,
                            trimCollapsedText: '\nShow more',
                            trimExpandedText: '\nShow less',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w300, fontSize: 13),
                          ),
                          const SizedBox(height: 15),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              onTap: () {
                                _launchUrl(news.url??'');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'View Full Article',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: ColorResources.black,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
  
}

String _formatDate(String? dateString) {
  if (dateString == null || dateString.isEmpty) return 'No Date';

  try {
    final dateTime = DateTime.parse(dateString);
    return DateFormat('dd MMM yyyy').format(dateTime);
  } catch (e) {
    return 'Invalid Date';
  }
}

Future<void> _launchUrl(newsUrl) async {
  final Uri _url = Uri.parse(newsUrl);
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
