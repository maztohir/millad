import 'package:flutter/material.dart';

import 'content.dart';
import '../data/palette.dart';

class BookModel {
  String title;
  String description;
  int id;
  int totalPage;
  String arabTitle;

  List<ContentModel> contents;

  BookModel(this.id, this.title, this.description, {this.arabTitle});

  setContent(List<ContentModel> _contents) {
    this.contents = _contents;
    this.totalPage = _contents.length;
  }

  getColor() {
    List<Color> colors = [
      Palette.dustyPink,
      Palette.sweetGreen,
      Palette.powderBlue,
      Palette.chocoMilk,
      Palette.dustyGreen,
      Palette.toscaPuf,
      Palette.softGrey
    ];
    return colors[this.id % colors.length];
  }

  getCoverStyle() {
    List<String> styles = [
      "assets/images/coverstyle/path_n.svg",
      "assets/images/coverstyle/path_s.svg",
      "assets/images/coverstyle/path_u.svg",
      "assets/images/coverstyle/path_w.svg",
    ];
    return styles[this.id % styles.length];
  }
}
