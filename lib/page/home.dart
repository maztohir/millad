import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../storage/route.dart';
import '../storage/palette.dart';
import '../storage/book.dart';
import '../storage/recent_page.dart';
import '../model/book.dart';
import '../styles.dart';
import '../component/EmptySpace.dart';
import '../component/particles.dart';

class Home extends StatefulWidget {
  final List<BookModel> books = BookStorage().books();
  final List<BookModel> shuffleBooks = BookStorage().books()..shuffle();

  final RecentPageStorage recentPageStorage = RecentPageStorage();

  @override
  HomeState createState() {
    return HomeState(books, shuffleBooks);
  }
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List<BookModel> books = [];
  List<BookModel> shuffleBooks = [];

  HomeState(this.books, this.shuffleBooks);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      backgroundColor: Palette.background,
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
        color: Palette.primary,
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
              _recentBookBuilder(context),
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
    books = _filter(widget.books, value);
    shuffleBooks = _filter(widget.shuffleBooks, value);
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
          color: Palette.background04,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          onChanged: (vv) => _onSearchChangedHandler(vv),
          style: TextStyle(fontSize: 16, color: Palette.primaryText),
          decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 15, color: Palette.primaryText02),
            hintText: 'Search..',
            prefixIcon: Icon(
              Icons.search,
              size: 20,
              color: Palette.primaryText,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
          ),
        ),
      ),
    );
  }

  Widget _recentBookBuilder(BuildContext context) {
    return FutureBuilder(
        future: widget.recentPageStorage.getRecentPages(),
        builder:
            (BuildContext context, AsyncSnapshot<List<BookModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data.length > 0)
            return Container(
              margin: EdgeInsets.only(top: 40.0),
              child: _bookListHolder(context, 'Your recent book', snapshot.data,
                  primary: true),
            );
          else
            return Container();
        });
  }

  Widget _bookListHolder(
      BuildContext context, String title, List<BookModel> bookList,
      {primary: false, index}) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          padding: EdgeInsets.only(left: 30.0),
          child: Text(
            title,
            style: primary ? TitlePrimaryText : TitleBackgroundText,
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
                .map((book) => _bookCard(context, book,
                    primary: primary, index: book.recentPage))
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
                    style: ArabTitleText,
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
    await Navigator.pushNamed(context, AppRoute.BOOK_PAGE,
        arguments: {'book': book});
    setState(() {});
  }

  goToBookContentPage(BookModel book, int index) async {
    Navigator.pushNamed(context, AppRoute.BOOK_CONTENT_PAGE,
        arguments: {'book': book, 'index': index});
    setState(() {});
  }

  Widget _card(BuildContext context, BookModel book,
      {bool primary: false, int index}) {
    return Container(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(11.0),
          onTap: () {
            widget.recentPageStorage.update(book.id, index ?? 1);
            if (index != null) {
              goToBookContentPage(book, index);
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
              color: primary
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
      {primary: false, index}) {
    return Container(
      padding: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
      child: Column(
        children: [
          _card(context, book, primary: primary, index: index),
          EmptySpace(height: 9.0),
          Text(
            book.title,
            style: primary ? TitlePrimaryText1 : TitleBackgroundText1,
          ),
          Text(
            "${book.totalPage} pages",
            style: primary ? BodyPrimaryText1 : BodyBackgroundText1,
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
        Text('Millad', style: LogoText),
      ]),
    );
  }

  Widget _body(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      children: [
        _bookListHolder(context, "Maulid's related", books),
        EmptySpace(height: 10.0),
        _bookListHolder(context, "Another sholawat", shuffleBooks)
      ],
    );
  }
}
