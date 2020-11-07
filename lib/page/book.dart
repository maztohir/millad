import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:millad/storage/global_text_style.dart';

import '../storage/global_color.dart';
import '../storage/route.dart';
import '../storage/recent_page.dart';
import '../model/book.dart';
import '../model/content.dart';
import '../component/EmptySpace.dart';
import '../component/particles.dart';

class Book extends StatefulWidget {
  final BookModel book;
  final RecentPageStorage recentPageStorage = RecentPageStorage();

  Book(this.book);

  @override
  BookState createState() => BookState(book.contents);
}

class BookState extends State<Book> with SingleTickerProviderStateMixin {
  List<ContentModel> contents = [];

  BookState(this.contents);

  @override
  Widget build(BuildContext context) {
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
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: primaryColor(),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 3, spreadRadius: 1)
          ],
        ),
        child: Stack(
          children: [
            Positioned.fill(child: Particles(3)),
            SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EmptySpace(
                  height: 20.0,
                ),
                _backButton(context),
                EmptySpace(
                  height: 40.0,
                ),
                _logo(),
                EmptySpace(
                  height: 10.0,
                ),
                _bookDescription(),
                EmptySpace(
                  height: 20.0,
                ),
                // _searchBar(),
                // EmptySpace(
                //   height: 20.0,
                // ),
              ],
            )),
          ],
        ));
  }

  Widget _backButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 17.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            customBorder: CircleBorder(),
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            )),
      ),
    );
  }

  Timer _debounce;
  _onSearchChangedHandler(String value) {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _updateContentScreen(value);
    });
  }

  _updateContentScreen(String filter) {
    if (filter.isEmpty) {
      contents = widget.book.contents;
    } else {
      contents = widget.book.contents
          .where((element) =>
              element.title.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
    setState(() {});
  }

  Widget _searchBar() {
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

  Widget _logo() {
    return Container(
      padding: EdgeInsets.only(left: 30.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SvgPicture.asset(
          'assets/images/logo.svg',
          color: Colors.white,
        ),
        EmptySpace(
          width: 10.0,
        ),
        Text(widget.book.title, style: logoTextStyle()),
      ]),
    );
  }

  Widget _bookDescription() {
    return Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: Text(
        widget.book.description,
        style: bodyPrimaryTextStyle(),
      ),
    );
  }

  Widget _body(BuildContext context) {
    List<ContentModel> contents = this.contents;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 30.0, top: 30.0),
          child: Text(
            'Daftar isi',
            style: titleBackgroundTextStyle(),
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            children:
                contents.map((content) => _content(context, content)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _content(BuildContext context, ContentModel content) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          int contentIndex = widget.book.contents.indexOf(content);
          widget.recentPageStorage.update(widget.book.id, contentIndex);
          return Navigator.pushNamed(context, AppRoute.BOOK_CONTENT_PAGE,
              arguments: {'book': widget.book, 'index': contentIndex});
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.3, color: backgroundText04Color()),
              ),
            ),
            child: Text(
              content.title,
              style: bodyBackgroundTextStyle(),
            ),
          ),
        ),
      ),
    );
  }
}
