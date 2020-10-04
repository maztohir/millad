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
              "Nama Berzanji diambil dari nama pengarangnya yaitu Syekh Ja'far al-Barzanji bin Hasan bin Abdul Karim. Ia lahir di Madinah tahun 1690 dan meninggal tahun 1766. Barzanji berasal dari nama sebuah tempat di Kurdistan, Barzinj"),
      BookModel(2, 'simtud',
          arabTitle: "سمط الدرر",
          contentUri: "assets/books/simtud/content.json",
          description:
              "Pengarangnya adalah Al-Habib Al-Imam Al-Allamah Ali bin Muhammad bin Husin Al-Habsyi, dilahirkan pada hari Juma’at 24 Syawal 1259 H di Qasam, sebuah kota di negeri Hadhramaut. Di antara putera-putera beliau yang dikenal di Indonesia ialah puteranya yang bongsu; Al-Habib Alwi bin Ali Al-Habsyi, pendiri Masjid “Riyadh” di kota Solo (Surakarta)"),
      BookModel(3, 'burdah',
          arabTitle: "البردة",
          contentUri: "assets/books/burdah/content.json",
          description:
              "Pengarangnya adalah Al-Bushiri (610-695H/1213-1296 M). Nama lengkapnya Syarafuddin Abu Abdillah Muhammad bin Zaid Al-Bushiri. Al-Bushiri adalah keturunan Berber yang lahir di Dallas, Maroko, dan dibesarkan di Bushir, Mesir."),
    ];
  }

  List<BookModel> get otherBooks {
    return [
      BookModel(4, 'Aqidatul Awam',
          arabTitle: "عَـقِـيْدَةَ الْـعَوَامِ",
          contentUri: "assets/books/aqidatulawam/content.json",
          description:
              "Pengarangnya adalah Syekh Al-'Alim Al-'Allamah Ahmad Al-Marzuqi Al-Maliki Al-Makki. Beliau dilahirkan di Mesir, kemudian pindah ke Kota Makkah, dan mengajar di sana hingga diangkat menjadi mufti mazhab Maliki."),
      BookModel(5, 'Munjiyat',
          arabTitle: "منجيات",
          contentUri: "assets/books/munjiyat/content.json",
          description:
              "Arti dari kata munjiyat adalah menyelamatkan. Sholawat munjiyat diciptakan oleh Asy-Syadzili yaitu Syaikh Shalih Musa Al-Dharir, seorang sufi dari tariqat Asy-Syadzili"),
      BookModel(6, 'Tibbil Qulub',
          arabTitle: "تبيل قلوب",
          contentUri: "assets/books/tibbilqulub/content.json",
          description:
              "Sholawat Tibbil Qulul adalah karya Syekh Ahmad Dardiri. Sholawat Ini Juga dinamakan Sholawat Syifa atau sholawat Thibbiyah"),
    ];
  }
}
