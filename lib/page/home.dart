import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../storage/route.dart';
import '../storage/global_color.dart';
import '../storage/book.dart';
import '../storage/recent_page.dart';
import '../model/book.dart';
import '../storage/global_text_style.dart';
import '../component/EmptySpace.dart';
import '../component/particles.dart';

class Home extends StatefulWidget {
  final List<BookModel> maulidBooks = BookStorage().maulidBoooks;
  final List<BookModel> otherBooks = BookStorage().otherBooks;

  final RecentPageStorage recentPageStorage = RecentPageStorage();

  @override
  HomeState createState() {
    return HomeState(maulidBooks, otherBooks);
  }
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List<BookModel> maulidBooks = [];
  List<BookModel> otherBooks = [];
  List<BookModel> recentBooks = [];
  List<BookModel> recentBooksDefault = [];

  bool isDark = false;

  HomeState(this.maulidBooks, this.otherBooks);

  @override
  void initState() {
    loadBook();
    super.initState();
  }

  Future<void> loadBook() async {
    widget.maulidBooks.forEach((element) {
      element.loadContent();
    });
    widget.otherBooks.forEach((element) {
      element.loadContent();
    });
    this.maulidBooks = widget.maulidBooks;
    this.otherBooks = widget.otherBooks;
    // setState(() {});
    updateRecentPage();
  }

  Future<void> updateRecentPage() async {
    List<BookModel> bookReference = widget.maulidBooks + widget.otherBooks;
    this.recentBooks = await widget.recentPageStorage.getList(bookReference);
    this.recentBooksDefault = this.recentBooks;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      backgroundColor: backgroundColor(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          brightness: Brightness.dark,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: Column(
          children: [
            _header(context),
            Expanded(
              child: _body(context),
            )
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        color: primaryColor(),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 3, spreadRadius: 1)
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(child: Particles(5)),
          SafeArea(
              child: Column(
            children: [
              EmptySpace(
                height: 50.0,
              ),
              _logo(),
              EmptySpace(
                height: 20.0,
              ),
              _searchBar(context),
              EmptySpace(
                height: 20.0,
              ),
              this.recentBooks.length > 0
                  ? _recentBookHolder(context)
                  : Container(),
              EmptySpace(
                height: 2.0,
              ),
            ],
          )),
        ],
      ),
    );
  }

  Timer _debounce;
  _onSearchChangedHandler(String value) {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _updateBookScreen(value);
    });
  }

  _updateBookScreen(String value) {
    this.maulidBooks = _filter(widget.maulidBooks, value);
    this.otherBooks = _filter(widget.otherBooks, value);
    this.recentBooks = _filter(this.recentBooksDefault, value);
    setState(() {});
  }

  _filter(List<BookModel> books, String filter) {
    if (filter.isEmpty) return books;
    return books
        .where((element) =>
            element.title.toLowerCase().startsWith(filter.toLowerCase()))
        .toList();
  }

  Widget _searchBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          color: background04Color(),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          onChanged: (vv) => _onSearchChangedHandler(vv),
          style: TextStyle(fontSize: 16, color: primaryTextColor()),
          decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 15, color: primaryText02Color()),
            hintText: 'Cari..',
            prefixIcon: Icon(
              Icons.search,
              size: 20,
              color: primaryTextColor(),
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
          ),
        ),
      ),
    );
  }

  Widget _recentBookHolder(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: _bookListHolder(
          context, 'Terakhir dibuka', this.recentBooks.toList(),
          recentBookTag: true),
    );
  }

  Widget _bookListHolder(
      BuildContext context, String title, List<BookModel> bookList,
      {recentBookTag: false}) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          padding: EdgeInsets.only(left: 30.0),
          child: Text(
            title,
            style: recentBookTag
                ? titlePrimaryTextStyle()
                : titleBackgroundTextStyle(),
            textAlign: TextAlign.start,
          ),
        ),
        EmptySpace(
          height: 10.0,
        ),
        Container(
          height: 200,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 23.0),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            children: bookList
                .map((book) =>
                    _bookCard(context, book, recentBookTag: recentBookTag))
                .toList(),
          ),
        )
      ]),
    );
  }

  Widget _insideCard(BookModel book) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 13.0),
              child: SvgPicture.asset(
                'assets/images/mosque.svg',
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  child: SvgPicture.asset(
                    book.getCoverStyle(),
                    color: Colors.white,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 14.0),
                  child: Text(
                    book.arabTitle ?? book.title,
                    style: arabTitleTextStyle(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  goToBookPage(BookModel book) async {
    await contentCheck(book);
    await Navigator.pushNamed(context, AppRoute.BOOK_PAGE,
        arguments: {'book': book});
    updateRecentPage();
  }

  goToBookContentPage(BookModel book) async {
    await contentCheck(book);
    await Navigator.pushNamed(context, AppRoute.BOOK_CONTENT_PAGE,
        arguments: {'book': book, 'index': book.lastPageOpened});
    updateRecentPage();
  }

  Future<void> contentCheck(BookModel book) async {
    if (book.contents == null) {
      await book.loadContent();
    }
  }

  Widget _card(BuildContext context, BookModel book,
      {bool recentBookTag: false}) {
    return Container(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(11.0),
          onTap: () {
            if (recentBookTag) {
              goToBookContentPage(book);
            } else {
              goToBookPage(book);
            }
          },
          child: Container(
            height: 140.0,
            width: 100.0,
            child: _insideCard(book),
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: book.getColor(),
        boxShadow: [
          BoxShadow(
              color: recentBookTag
                  ? Colors.black.withAlpha(20)
                  : book.getColor().withAlpha(60),
              blurRadius: 3,
              spreadRadius: 2,
              offset: Offset(0.5, 3)),
        ],
      ),
      margin: EdgeInsets.only(right: 12.0),
    );
  }

  Widget _bookCard(BuildContext context, BookModel book,
      {recentBookTag: false}) {
    return Container(
      padding: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
      child: Column(
        children: [
          _card(context, book, recentBookTag: recentBookTag),
          EmptySpace(height: 9.0),
          Text(
            book.title,
            style: recentBookTag
                ? titlePrimaryText1Style()
                : titleBackgroundText1Style(),
          ),
          Text(
            recentBookTag
                ? "Halaman ${(book.lastPageOpened ?? 0) + 1}"
                : "${book.totalPage} Halaman",
            style: recentBookTag
                ? bodyPrimaryText1Style()
                : bodyBackgroundText1Style(),
          )
        ],
      ),
    );
  }

  Widget _logo() {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SvgPicture.asset(
          'assets/images/logo.svg',
          color: Colors.white,
        ),
        EmptySpace(
          width: 10.0,
        ),
        Text(
          'Millad',
          style: logoTextStyle(),
        ),
      ]),
    );
  }

  Widget _body(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      children: [
        _bookListHolder(context, "Bacaan maulid", this.maulidBooks),
        EmptySpace(height: 10.0),
        _bookListHolder(context, "Kumpulan sholawat", this.otherBooks)
      ],
    );
  }
}
