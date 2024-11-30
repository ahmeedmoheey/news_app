import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_styles.dart';
import '../../../data/api/model/articles_response/articles.dart';
import 'details_screen.dart';


class ArticleItemWidget extends StatelessWidget {
  ArticleItemWidget({super.key, required this.article});

  Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailsScreen(article: article),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? '',
                placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              article.source?.name ?? '',
              style: AppStyles.sourceName,
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(article.title ?? '', style: AppStyles.articleTitle),
            SizedBox(
              height: 4.h,
            ),
            Text(article.publishedAt ?? '',
                textAlign: TextAlign.end, style: AppStyles.publishedAt)
          ],
        ),
      ),
    );
  }
}