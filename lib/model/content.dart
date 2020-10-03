class ContentModel {
  String title;
  String contentUri;

  ContentModel(this.title, this.contentUri);

  ContentModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        contentUri = json['content_uri'];
}
