class Crypto101Model {
  String id;
  String title;
  String body;
  List? userBookmarked;

  Crypto101Model({
    required this.id,
    required this.title,
    required this.body,
    this.userBookmarked,
  });
}
