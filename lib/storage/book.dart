import '../model/book.dart';

class BookStorage {
  List<BookModel> get maulidBoooks {
    return [
      BookModel(0, 'diba',
          arabTitle: "الديبع",
          contentUri: "assets/books/diba/content.json",
          description:
              "Pengarangnya adalah Imam Wajihuddin Abdu Ar-Rahman bin Muhammad bin Umar bin Ali bin Yusuf bin Ahmad bin Umar ad-simtudi (866H-944H), beliau berasal Zabid, salah satu kota di Yaman."),
      BookModel(1, 'barzanji',
          arabTitle: "البر زنجى",
          contentUri: "assets/books/barzanji/content.json",
          description:
              "Pengarangnya adalah Imam Wajihuddin Abdu Ar-Rahman bin Muhammad bin Umar bin Ali bin Yusuf bin Ahmad bin Umar ad-simtudi (866H-944H), beliau berasal Zabid, salah satu kota di Yaman."),
      BookModel(2, 'simtud',
          arabTitle: "سمط الدرر",
          contentUri: "assets/books/simtud/content.json",
          description:
              "Pengarangnya adalah Imam Wajihuddin Abdu Ar-Rahman bin Muhammad bin Umar bin Ali bin Yusuf bin Ahmad bin Umar ad-simtudi (866H-944H), beliau berasal Zabid, salah satu kota di Yaman."),
      BookModel(3, 'burdah',
          arabTitle: "البردة",
          contentUri: "assets/books/burdah/content.json",
          description:
              "Pengarangnya adalah Imam Wajihuddin Abdu Ar-Rahman bin Muhammad bin Umar bin Ali bin Yusuf bin Ahmad bin Umar ad-simtudi (866H-944H), beliau berasal Zabid, salah satu kota di Yaman."),
    ];
  }

  List<BookModel> get otherBooks {
    return [
      BookModel(4, 'burdah',
          arabTitle: "البردة",
          contentUri: "assets/books/burdah/content.json",
          description:
              "Pengarangnya adalah Imam Wajihuddin Abdu Ar-Rahman bin Muhammad bin Umar bin Ali bin Yusuf bin Ahmad bin Umar ad-simtudi (866H-944H), beliau berasal Zabid, salah satu kota di Yaman."),
      BookModel(5, 'diba',
          arabTitle: "الديبع",
          contentUri: "assets/books/diba/content.json",
          description:
              "Pengarangnya adalah Imam Wajihuddin Abdu Ar-Rahman bin Muhammad bin Umar bin Ali bin Yusuf bin Ahmad bin Umar ad-simtudi (866H-944H), beliau berasal Zabid, salah satu kota di Yaman."),
      BookModel(6, 'simtud',
          arabTitle: "سمط الدرر",
          contentUri: "assets/books/simtud/content.json",
          description:
              "Pengarangnya adalah Imam Wajihuddin Abdu Ar-Rahman bin Muhammad bin Umar bin Ali bin Yusuf bin Ahmad bin Umar ad-simtudi (866H-944H), beliau berasal Zabid, salah satu kota di Yaman."),
      BookModel(7, 'barzanji',
          arabTitle: "البر زنجى",
          contentUri: "assets/books/barzanji/content.json",
          description:
              "Pengarangnya adalah Imam Wajihuddin Abdu Ar-Rahman bin Muhammad bin Umar bin Ali bin Yusuf bin Ahmad bin Umar ad-simtudi (866H-944H), beliau berasal Zabid, salah satu kota di Yaman."),
    ];
  }
}
