import 'dart:convert';

import '../model/book.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecentPageStorage {
  static const KEY = 'RECENT-PAGE-STORAGE-KEY';

  Future<Map<String, dynamic>> _getMap() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String values = pref.getString(KEY);
    // pref.remove(KEY);
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

  Future<List<BookModel>> getRecentPages(List<BookModel> bookDict) async {
    Map<String, dynamic> maps = await _getMap();
    print('updating recent page');
    print(maps);

    List<BookModel> recentBook = bookDict.where((book) {
      if (maps.containsKey(book.id.toString())) {
        book.lastIndex = maps[book.id.toString()];
        return true;
      }
      return false;
    }).toList();
    // maps.forEach((key, value) {
    //   BookModel book = bookDict.singleWhere(
    //     (el) => el.id == int.parse(key),
    //   );
    //   book.lastIndex = value;
    //   books.add(book);
    // });
    return recentBook;
  }
}
