import 'package:flutter/material.dart';
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
      color: Palette.primary,
      child: SafeArea(
        child: Column(
          children: [
            EmptySpace(height: 50.0,),
            _logo(),
            EmptySpace(height: 20.0,),
            _searchBar(),
            EmptySpace(height: 30.0,),
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
          borderRadius:  BorderRadius.circular(20),
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
            prefixIcon: Icon(Icons.search, size: 20,),
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
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Your recent pages', 
            style: TitlePrimaryText,
            textAlign: TextAlign.start,
          ),
          Container(
            child: Row(
              children: bookList.map((book) => _bookcard(book)).toList(),
            ),
          )
        ]
      ),
    );
  }

  Widget _bookcard(book){
    return Container(
      child: Text(book['title']),
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