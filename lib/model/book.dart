import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'content.dart';
import '../storage/palette.dart';

class BookModel {
  String title;
  String description;
  int id;
  String arabTitle;
  String contentUri;

  int lastPageOpened;
  int recentIndex;

  List<ContentModel> contents;

  BookModel(this.id, this.title,
      {this.description, this.arabTitle, this.contents, this.contentUri});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    var list = json['contents'] as List;
    List<ContentModel> contentList =
        list.map((i) => ContentModel.fromJson(i)).toList();

    return BookModel(
      json['id'],
      json['title'],
      description: json['description'],
      arabTitle: json['arab_title'],
      contents: contentList,
    );
  }

  Future<void> loadContent() async {
    String contentStr = await rootBundle.loadString(this.contentUri);
    List<dynamic> contentList = jsonDecode(contentStr) as List;
    List<ContentModel> contents =
        contentList.map((i) => ContentModel.fromJson(i)).toList();
    this.contents = contents;
  }

  int get totalPage {
    if (this.contents != null) return this.contents.length;
    return 0;
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
