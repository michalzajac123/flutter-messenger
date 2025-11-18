class Announcment {
  String title;
  String body;
  String imgUrl;
  int likes;
  Announcment({
    required this.title,
    required this.body,
    required this.imgUrl,
    this.likes = 0,
  });
}
