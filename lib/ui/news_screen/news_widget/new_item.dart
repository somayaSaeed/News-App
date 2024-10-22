import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/utils/color_resource%20.dart';
import '../../../core/model/NewsResponse.dart';
import 'news_details.dart';

class NewDetails extends StatelessWidget {
  const NewDetails({super.key, required this.news});
  final News news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            NewsDetails.routeName,
            arguments: news,
          );
        },
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: CachedNetworkImage(
                  imageUrl: news.urlToImage ?? '',
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
              padding: const EdgeInsets.all(8.0),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
}
