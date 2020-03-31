import 'package:corona_fighter/src/components/news_card.dart';
import 'package:corona_fighter/src/models/news_model.dart';
import 'package:corona_fighter/src/views/news_single_post_page.dart';
import 'package:flutter/material.dart';

class NewsView extends StatefulWidget {
  final List<NewsModel> news;

  const NewsView({Key key, this.news}) : super(key: key);
  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.news?.length ?? 0,
      physics: BouncingScrollPhysics(),
      itemBuilder: (c, i) => PostCard(
        description: widget.news[i].getData,
        image: widget.news[i].getImageUrl,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => NewsSinglePostPage(newsItem: widget.news[i])));
        },
        postDate: widget.news[i].getDatePost.substring(0, 6),
        title: widget.news[i].getTitle,
      ),
    );
  }
}
