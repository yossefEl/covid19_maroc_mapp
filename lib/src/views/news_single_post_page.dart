import 'package:corona_fighter/src/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intent/intent.dart' as android_intent;
import 'package:intent/action.dart' as android_action;

class NewsSinglePostPage extends StatefulWidget {
  final NewsModel newsItem;

  const NewsSinglePostPage({Key key, this.newsItem}) : super(key: key);
  @override
  _NewsSinglePostPageState createState() => _NewsSinglePostPageState();
}

class _NewsSinglePostPageState extends State<NewsSinglePostPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            widget.newsItem.getTitle,
            style: GoogleFonts.tajawal().copyWith(color: Colors.purple),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: ListView(
          padding: EdgeInsets.all(8),
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: Text(widget.newsItem.getTitle,
                  style: GoogleFonts.tajawal().copyWith(
                      color: Colors.purple, fontWeight: FontWeight.bold)),
            ),
            Image.network(widget.newsItem.getImageUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("بتاريخ: "+widget.newsItem.getDatePost,style: GoogleFonts.tajawal().copyWith(
                      color: Colors.redAccent)),
            ),
            InkWell(
              onTap: () {
                                          android_intent.Intent()
                                            ..setAction(
                                                android_action.Action.ACTION_VIEW)
                                            ..setData(Uri(
                                                scheme: "https",
                                                path: widget.newsItem.getSource))
                                            ..startActivity()
                                                .catchError((e) => print(e));
                                        },
                          child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("المصدر: "+widget.newsItem.getSource,style: GoogleFonts.tajawal().copyWith(
                        color: Colors.redAccent)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.newsItem.getData),
            ),
          ],
        ),
      ),
    );
  }
}
