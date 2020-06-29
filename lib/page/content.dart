import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_html/flutter_html.dart';

import '../data/palette.dart';
import '../styles.dart';
import '../component/EmptySpace.dart';
import '../component/particles.dart';

class Content extends StatefulWidget {
  final Map<String, dynamic> content;

  Content(this.content);

  @override
  ContentState createState() => ContentState();
}

class ContentState extends State<Content> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  String _content = 'Loading...';

  @override
  void initState() {
    _loadHtml();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    super.initState();
  }

  _hideStatusBar() {
    // SystemChrome.setEnabledSystemUIOverlays([]);
  }

  _showStatusBar() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

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
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, build) => Stack(
          children: [
            _body(context),
            Transform.translate(
              offset: Offset(0, -_animationController.value * 104),
              child: _header(context),
            ),
            // _header(context),
            Transform.translate(
              offset: Offset(0, _animationController.value * 64),
              child: _footer(context),
            ),
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
          bottomRight: Radius.circular(20),
        ),
        color: Palette.primary,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 3, spreadRadius: 2)
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Particles(
              1,
              minDuration: 40000,
            ),
          ),
          SafeArea(
            child: Container(
              child: _appBarContent(context),
              padding: EdgeInsets.symmetric(vertical: 10.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Palette.primary,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 3, spreadRadius: 2)
          ],
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Particles(
                1,
                minDuration: 40000,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EmptySpace(
                  height: 20.0,
                ),
                _pageCounter(context),
                EmptySpace(
                  height: 15.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _pageCounter(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        '001 / 200',
        style: TextStyle(
          fontFamily: FontNameDefault,
          fontWeight: FontWeight.w500,
          fontSize: 11.0,
          color: Palette.primaryText,
        ),
      ),
    );
  }

  Widget _appBarContent(BuildContext context) {
    String contentTitle = widget.content['title'] ?? '';
    return Container(
      padding: EdgeInsets.only(left: 17.0),
      child: Row(
        children: [
          Material(
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
              ),
            ),
          ),
          EmptySpace(
            width: 5.0,
          ),
          Text(
            contentTitle,
            style: AppBarText,
          ),
          EmptySpace(),
          Material(
            color: Colors.transparent,
            child: InkWell(
              customBorder: CircleBorder(),
              onTap: () => {},
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  'assets/images/icon_translate.svg',
                  color: Colors.white,
                  width: 23,
                ),
              ),
            ),
          ),
          EmptySpace(
            width: 20.0,
          ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_animationController.isCompleted) {
          _animationController.reverse();
          print('hahahah 1');
          _showStatusBar();
        } else {
          _animationController.forward();
          print('hahahah 2');
          _hideStatusBar();
        }
      },
      child: Container(
        color: Palette.background,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Html(
            padding: EdgeInsets.only(
                top: 105.0, left: 30.0, right: 30.0, bottom: 30.0),
            data: _content,
            defaultTextStyle: ArabicContentText,
            customTextAlign: (_) => TextAlign.center,
          ),
        ),
      ),
    );
  }

  Future<void> _loadHtml() async {
    print('Opening file..');
    String fileText =
        await rootBundle.loadString('assets/books/sample/web.html');
    setState(() {
      _content = fileText;
    });
  }
}
