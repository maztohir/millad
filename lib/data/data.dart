import '../model/content.dart';
import '../model/book.dart';

class BookData {
  List<BookModel> getBooks() {
    BookModel diba = BookModel("Diba'",
        "Pengarangnya adalah Imam Wajihuddin Abdu Ar-Rahman bin Muhammad bin Umar bin Ali bin Yusuf bin Ahmad bin Umar ad-Dibai (866H-944H), beliau berasal Zabid, salah satu kota di Yaman.");

    List<ContentModel> dibaContent = [
      ContentModel(
          "Ya Rabbi Sholli ‘Ala Muhammad", "assets/books/diba/web1.html"),
      ContentModel("Inna Fatahna", "assets/books/diba/web2.html"),
      ContentModel(
          "Ya Rasulallah Salamun Alaik", "assets/books/diba/web3.html"),
      ContentModel(
          "Alhamdulillah Alqowiyil Ghalik", "assets/books/diba/web4.html"),
      ContentModel("Qiila Hua Adam", "assets/books/diba/web5.html"),
      ContentModel("Yub’atsu Min Tihama", "assets/books/diba/web6.html"),
      ContentModel("Tsumma Aruddu Minal ‘Ars", "assets/books/diba/web7.html")
    ];
    diba.setContent(dibaContent);

    BookModel barjanzi = BookModel("Barjanzi",
        "Pengarangnya adalah Imam Wajihuddin Abdu Ar-Rahman bin Muhammad bin Umar bin Ali bin Yusuf bin Ahmad bin Umar ad-Dibai (866H-944H), beliau berasal Zabid, salah satu kota di Yaman.");
    barjanzi.setContent(dibaContent);

    BookModel simtud = BookModel("Simtud Duror",
        "Pengarangnya adalah Imam Wajihuddin Abdu Ar-Rahman bin Muhammad bin Umar bin Ali bin Yusuf bin Ahmad bin Umar ad-Dibai (866H-944H), beliau berasal Zabid, salah satu kota di Yaman.");
    simtud.setContent(dibaContent);

    BookModel burdah = BookModel("Burdah",
        "Pengarangnya adalah Imam Wajihuddin Abdu Ar-Rahman bin Muhammad bin Umar bin Ali bin Yusuf bin Ahmad bin Umar ad-Dibai (866H-944H), beliau berasal Zabid, salah satu kota di Yaman.");
    burdah.setContent(dibaContent);

    BookModel addiyaul = BookModel("Addiyaul lami",
        "Pengarangnya adalah Imam Wajihuddin Abdu Ar-Rahman bin Muhammad bin Umar bin Ali bin Yusuf bin Ahmad bin Umar ad-Dibai (866H-944H), beliau berasal Zabid, salah satu kota di Yaman.");
    addiyaul.setContent(dibaContent);

    return [diba, barjanzi, simtud, burdah, addiyaul];
  }
}
