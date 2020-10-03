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

    String simtudJson =
        await rootBundle.loadString("assets/books/simtud/structure.json");
    BookModel simtud = BookModel.fromJson(jsonDecode(simtudJson));

    String burdahJson =
        await rootBundle.loadString("assets/books/burdah/structure.json");
    BookModel burdah = BookModel.fromJson(jsonDecode(burdahJson));

    return [diba, barjanzi, simtud, burdah];
  }
}
