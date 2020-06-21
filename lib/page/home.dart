import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:millad/component/EmptySpace.dart';

import '../data/palette.dart';
import '../styles.dart';
import '../data/dummy.dart';

class Home extends StatelessWidget {
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
          _header(),
          _body()
        ],
      )
    );
  }

  Widget _header() {
    return Container(
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        color: Palette.primary,
        boxShadow: [
          BoxShadow(color: Colors.black26,blurRadius: 3,spreadRadius:2)
        ],
      ),
      child: SafeArea(
        child: Column(
          children: [
            EmptySpace(height: 50.0,),
            _logo(),
            EmptySpace(height: 20.0,),
            _searchBar(),
            EmptySpace(height: 40.0,),
            _recentPage(),
            EmptySpace(height: 20.0,),
          ],
        )
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
          borderRadius:  BorderRadius.circular(15),
        ),
        child: TextField(
          style: TextStyle(
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontSize: 15,
              color: Palette.primary01
            ),
            hintText: 'Search..',
            prefixIcon: Icon(Icons.search, size: 20, color: Palette.primary01,),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
          ),
        ),
      ),
    );
  }

  Widget _recentPage(){
    const bookList = Dummy.bookList;
    return Container(
      padding: EdgeInsets.only(left: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Your recent open pages', 
            style: TitlePrimaryText,
            textAlign: TextAlign.start,
          ),
          EmptySpace(height: 10.0,),
          Container(
            height: 200,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: bookList.map((book) => _bookcard(book)).toList(),
            )
          )
        ]
      ),
    );
  }

  Widget _bookcard(book){
    return Container(
      padding: EdgeInsets.only(left: 5.0, top: 7.0, bottom: 7.0),
      child: Column(
        children: [
          Container(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(15.0),
                onTap: () => {},
                child: Container(
                  height: 140.0,
                  width: 100.0,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.circular(15),
              color: Palette.background,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 3,
                  spreadRadius:2,
                  offset: Offset(0.5,3)
                ),
              ],
            ),
            margin: EdgeInsets.only(right: 7.0),
          ),
          EmptySpace(height: 9.0),
          Text(
            book['title'],
            style: TitlePrimaryText1,
          ),
          Text(
            "${book['page']} pages",
            style: BodyPrimaryText1,
          )
        ],
      )
    );
  }

  Widget _logo() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/logo.svg',
            color: Colors.white,
          ),
          EmptySpace(width: 10.0,),
          Text(
            'Millad',
            style: LogoText
          ),
        ]
      ),
    );
  }

  Widget _body() {
    return Container();
  }
}