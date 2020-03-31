import 'package:firebase_database/firebase_database.dart';

class NewsModel {
  String _id;
  String _title;
  String _data;
  String _imageUrl;
  String _datePost;
  String _source;

  String get getID => _id;
  String get getTitle => _title;
  String get getData => _data;
  String get getImageUrl => _imageUrl;
  String get getDatePost => _datePost;
  String get getSource => _source;
  NewsModel.fromSnapShot(DataSnapshot snapshot) {
    _id=snapshot.key;
    _title = snapshot.value['title'];
    _imageUrl = snapshot.value['image'];
    _data = snapshot.value['data'];
    _datePost = snapshot.value['datePost'];
    _source = snapshot.value['source'];
  }
}
