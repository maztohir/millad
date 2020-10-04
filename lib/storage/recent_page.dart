import 'dart:convert';

import '../model/book.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecentPageStorage {
  static const MAP = 'RECENT-PAGE-STORAGE-KEY-MAP';
  static const LIST = 'RECENT-PAGE-STORAGE-KEY-LIST';

  update(int bookId, int page) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    Map<String, dynamic> recentPageMap =
        jsonDecode(pref.getString(MAP) ?? "{}");

    recentPageMap[bookId.toString()] = page;
    pref.setString(MAP, json.encode(recentPageMap));

    List<String> recentPageList = pref.getStringList(LIST) ?? [];
    recentPageList.removeWhere((element) => element == bookId.toString());
    recentPageList.insert(0, bookId.toString());
    if (recentPageList.length > 5) recentPageList.removeLast();
    print(recentPageList);
    pref.setStringList(LIST, recentPageList);
  }

  Future<List<BookModel>> getList(List<BookModel> bookDict) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    Map<String, dynamic> recentPageMap =
        jsonDecode(pref.getString(MAP) ?? "{}");
    List<String> recentPageList = pref.getStringList(LIST) ?? [];

    List<BookModel> recentBook = bookDict.where((book) {
      if (recentPageList.contains(book.id.toString())) {
        book.lastPageOpened = recentPageMap[book.id.toString()];
        book.recentIndex = recentPageList.indexOf(book.id.toString());
        return true;
      }
      return false;
    }).toList();
    recentBook..sort((a, b) => a.recentIndex.compareTo(b.recentIndex));
    return recentBook;
  }
}
