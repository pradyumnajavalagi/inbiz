import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../model/news_article_model.dart';


class NewsTile extends StatelessWidget {
  final NewsArticle article;

  const NewsTile({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      color: Colors.white70,
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: article.imageUrl ?? '',
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
            height: 400,
            fit: BoxFit.cover,
          ),
          ListTile(
            title: Text(
              article.title ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),
            ),
            subtitle: Text(
              article.description ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
