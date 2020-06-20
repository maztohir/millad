import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:millad/component/EmptySpace.dart';

import '../data/palette.dart';
import '../styles.dart';

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
      height: 280.0,
      child: SafeArea(
        child: Column(
          children: [
            EmptySpace(height: 40.0,),
            _logo(),
            EmptySpace(height: 20.0,),
            _searchBar()
          ],
        )
      ),
    );
  }

  

  Widget _searchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Palette.background,
          borderRadius:  BorderRadius.circular(32),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 15),
            hintText: 'Search..',
            suffixIcon: Icon(Icons.search),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
        ),
      ),
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