import 'content.dart';

class BookModel {
  String title;
  String description;
  String id;
  int totalPage;

  List<ContentModel> contents;

  BookModel(this.title, this.description) {
    this.id = title.replaceAll(" ", "").toLowerCase();
  }

  setContent(List<ContentModel> _contents) {
    this.contents = _contents;
    this.totalPage = _contents.length;
  }
}
