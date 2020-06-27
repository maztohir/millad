import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:millad/data/dummy.dart';
import 'package:millad/data/route.dart';

import '../data/palette.dart';
import '../styles.dart';
import '../component/EmptySpace.dart';
import '../component/particles.dart';

class Book extends StatelessWidget {
  final Map<String, dynamic> book;

  Book(this.book);

  @override
  Widget build(BuildContext context) {
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
            _header(context),
            Expanded(
              child: _body(context),
            )
          ],
        ));
  }

  Widget _header(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: Palette.primary,
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 3, spreadRadius: 2)
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
                _searchBar(),
                EmptySpace(
                  height: 15.0,
                ),
                _swipableToggle(),
                EmptySpace(
                  height: 7.0,
                ),
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
        ));
  }

  Widget _swipableToggle() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Container(
        height: 4,
        width: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Palette.background03,
        ),
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
            hintText: 'Search inside the book..',
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
        Text(book['title'], style: LogoText),
      ]),
    );
  }

  Widget _bookDescription() {
    return Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: Text(
        book['description'],
        style: BodyPrimaryText,
      ),
    );
  }

  Widget _body(BuildContext context) {
    List<String> contents = Dummy.contents;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.only(left: 30.0, top: 30.0),
            child: Text(
              'Contents',
              style: TitleBackgroundText,
            )),
        Expanded(
          child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              children: contents
                  .map((content) => _content(context, content))
                  .toList()),
        )
      ],
    );
  }

  Widget _content(BuildContext context, String title) {
    return Container(
        child: Text(
      title,
      style: BodyBackgroundText1,
    ));
  }
}
