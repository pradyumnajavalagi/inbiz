import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'news_service.dart';

class NewsFeed extends StatefulWidget {
  final String category;

  NewsFeed({required this.category});

  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  late Future<List<dynamic>> newsFuture;
  final NewsService newsService = NewsService();

  @override
  void initState() {
    super.initState();
    newsFuture = newsService.fetchNews(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: newsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No news available"));
        } else {
          final news = snapshot.data!;
          return ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              final article = news[index];
              return GestureDetector(
                onTap: () {

                },
                child: Card(
                  borderOnForeground: true,
                  surfaceTintColor: Colors.white,
                  color: Colors.white70,
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: article['image'] ?? '',
                        placeholder: (context, url) => SizedBox(
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        errorWidget: (context, url, error) => SizedBox(
                          child: Center(child: Icon(Icons.error)),
                        ),
                        height: 400,
                        fit: BoxFit.cover,
                      ),
                      ListTile(
                        title: Text(article['headline']?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black)
                        ),
                        subtitle: Text(article['summary'] ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black)),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
