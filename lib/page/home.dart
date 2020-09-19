import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:millad/data/route.dart';
import 'package:millad/model/book.dart';

import '../data/palette.dart';
import '../styles.dart';
import '../data/data.dart';
import '../component/EmptySpace.dart';
import '../component/particles.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    BookData bookData = BookData();

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
      body: Column(
        children: [
          _header(context, bookData),
          Expanded(
            child: _body(context, bookData),
          )
        ],
      ),
    );
  }

  Widget _header(BuildContext context, BookData bookData) {
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
              _searchBar(),
              EmptySpace(
                height: 40.0,
              ),
              _bookListHolder(
                  context, 'Your recent book', bookData.getBooks()..shuffle(),
                  primary: true),
              EmptySpace(
                height: 5.0,
              ),
              _swipableToggle(),
              EmptySpace(
                height: 7.0,
              ),
            ],
          )),
        ],
      ),
    );
  }

  Widget _swipableToggle() {
    return Container(
      height: 4,
      width: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Palette.background03,
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          color: Palette.background,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          style: TextStyle(
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 15, color: Palette.primary01),
            hintText: 'Search..',
            prefixIcon: Icon(
              Icons.search,
              size: 20,
              color: Palette.primary01,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
          ),
        ),
      ),
    );
  }

  Widget _bookListHolder(
      BuildContext context, String title, List<BookModel> bookList,
      {primary: false}) {
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
                  .map((book) => _bookCard(context, book, primary: primary))
                  .toList(),
            ))
      ]),
    );
  }

  Widget _card(BuildContext context, BookModel book, {primary: false}) {
    return Container(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          onTap: () => Navigator.pushNamed(context, AppRoute.BOOK_PAGE,
              arguments: {'book': book}),
          child: Container(
            height: 140.0,
            width: 100.0,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // image: new DecorationImage(
        //   image: new ExactAssetImage('assets/images/cover/diba.jpg'),
        //   fit: BoxFit.cover,
        // ),
        color: book.color,
        boxShadow: [
          BoxShadow(
              color: primary
                  ? Colors.black.withAlpha(20)
                  : book.color.withAlpha(60),
              blurRadius: 3,
              spreadRadius: 2,
              offset: Offset(0.5, 3)),
        ],
      ),
      margin: EdgeInsets.only(right: 12.0),
    );
  }

  Widget _bookCard(BuildContext context, BookModel book, {primary: false}) {
    return Container(
      padding: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
      child: Column(
        children: [
          _card(context, book, primary: primary),
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

  Widget _body(BuildContext context, BookData bookData) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      children: [
        _bookListHolder(context, "Maulid's related", bookData.getBooks()),
        EmptySpace(height: 10.0),
        _bookListHolder(
            context, "Another sholawat", bookData.getBooks()..shuffle())
      ],
    );
  }
}
