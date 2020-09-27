import '../model/content.dart';
import '../model/book.dart';

class BookData {
  List<BookModel> books() {
    BookModel diba = BookModel(0, "Diba'",
        "Pengarangnya adalah Imam Wajihuddin Abdu Ar-Rahman bin Muhammad bin Umar bin Ali bin Yusuf bin Ahmad bin Umar ad-Dibai (866H-944H), beliau berasal Zabid, salah satu kota di Yaman.",
        arabTitle: "الديبع");

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

    BookModel barjanzi = BookModel(1, "Barjanzi",
        "Pengarangnya adalah Imam Wajihuddin Abdu Ar-Rahman bin Muhammad bin Umar bin Ali bin Yusuf bin Ahmad bin Umar ad-Dibai (866H-944H), beliau berasal Zabid, salah satu kota di Yaman.",
        arabTitle: "البر زنجى");
    barjanzi.setContent(dibaContent);

    BookModel simtud = BookModel(2, "Simtud Duror",
        "Pengarangnya adalah Imam Wajihuddin Abdu Ar-Rahman bin Muhammad bin Umar bin Ali bin Yusuf bin Ahmad bin Umar ad-Dibai (866H-944H), beliau berasal Zabid, salah satu kota di Yaman.",
        arabTitle: "سمط الدرر");
    simtud.setContent(dibaContent);

    BookModel burdah = BookModel(3, "Burdah",
        "Pengarangnya adalah Imam Wajihuddin Abdu Ar-Rahman bin Muhammad bin Umar bin Ali bin Yusuf bin Ahmad bin Umar ad-Dibai (866H-944H), beliau berasal Zabid, salah satu kota di Yaman.",
        arabTitle: "البردة");
    burdah.setContent(dibaContent);

    BookModel addiyaul = BookModel(4, "Addiyaul lami",
        "Pengarangnya adalah Imam Wajihuddin Abdu Ar-Rahman bin Muhammad bin Umar bin Ali bin Yusuf bin Ahmad bin Umar ad-Dibai (866H-944H), beliau berasal Zabid, salah satu kota di Yaman.",
        arabTitle: "الضياءالامع");
    addiyaul.setContent(dibaContent);

    BookModel sarofulAnam = BookModel(5, "Saroful Anam",
        "Pengarangnya adalah Imam Wajihuddin Abdu Ar-Rahman bin Muhammad bin Umar bin Ali bin Yusuf bin Ahmad bin Umar ad-Dibai (866H-944H), beliau berasal Zabid, salah satu kota di Yaman.",
        arabTitle: "شرف الأنام");
    sarofulAnam.setContent(dibaContent);

    return [diba, barjanzi, simtud, burdah, addiyaul, sarofulAnam];
  }

  List<BookModel> getBookByIds(List<int> list_ids) {
    List<BookModel> books = this.books();
    return books.where((element) => list_ids.contains(element.id));
  }
}
