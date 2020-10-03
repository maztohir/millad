import 'dart:convert';

import '../model/book.dart';
import '../storage/book.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecentPageStorage {
  static const KEY = 'RECENT-PAGE-STORAGE-KEY';

  Future<Map<String, dynamic>> _getMap() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String values = pref.getString(KEY);
    try {
      return jsonDecode(values);
    } catch (e) {
      print(e);
      return {};
    }
  }

  _saveMap(Map<String, dynamic> recents) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String str = json.encode(recents);
    pref.setString(KEY, str);
  }

  update(int bookId, int page) async {
    Map<String, dynamic> recents = await _getMap();
    recents.remove(bookId.toString());
    recents[bookId.toString()] = page;

    _saveMap(recents);
  }

  Future<List<BookModel>> getRecentPages() async {
    Map<String, dynamic> maps = await _getMap();
    BookStorage bookStorage = BookStorage();

    List<BookModel> books = [];
    maps.forEach((key, value) {
      BookModel book = bookStorage.book(int.parse(key));
      book.lastIndex = value;
      books.add(book);
    });
    return books;
  }
}