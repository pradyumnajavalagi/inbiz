import 'package:flutter/material.dart';

import 'news_feed.dart';

class HomePage extends StatelessWidget {
  final List<String> categories = ["general", "crypto", "merger"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Market Updates"),
          bottom: TabBar(
            tabs: categories.map((cat) => Tab(text: cat.toUpperCase())).toList(),
          ),
        ),
        body: TabBarView(
          children: categories.map((category) {
            return NewsFeed(category: category);
          }).toList(),
        ),
      ),
    );
  }
}
