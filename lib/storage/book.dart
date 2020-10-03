import 'dart:convert';

import 'package:flutter/services.dart';
import '../model/book.dart';

class BookStorage {
  Future<List<BookModel>> books() async {
    String dibaJson =
        await rootBundle.loadString("assets/books/diba/structure.json");
    BookModel diba = BookModel.fromJson(jsonDecode(dibaJson));

    String barjanziJson =
        await rootBundle.loadString("assets/books/barzanji/structure.json");
    BookModel barjanzi = BookModel.fromJson(jsonDecode(barjanziJson));

    BookModel simtud = BookModel.fromJson(jsonDecode(dibaJson));

    BookModel burdah = BookModel.fromJson(jsonDecode(dibaJson));

    BookModel addiyaul = BookModel.fromJson(jsonDecode(dibaJson));

    BookModel sarofulAnam = BookModel.fromJson(jsonDecode(dibaJson));

    return [diba, barjanzi, simtud, burdah, addiyaul, sarofulAnam];
  }

  // BookModel book(int bookId) {
  //   return books().singleWhere((element) => element.id == bookId);
  // }
}
