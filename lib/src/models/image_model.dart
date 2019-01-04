class ImageModel {
  int id;
  String url;
  String title;

  ImageModel(this.id, this.url, this.title);

  // default approach
  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    url = parsedJson['url'];
    title = parsedJson['title'];
  }

  // alternate approach
  ImageModel.fromJsonShort(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        url = parsedJson['url'],
        title = parsedJson['title'];
}
