class Crypto101Model {
  String id;
  String title;
  String body;
  int totalSaved;
  int totalBookmark;
  List? userBookmarked;
  Crypto101Model({
    required this.id,
    required this.title,
    required this.body,
    required this.totalSaved,
    required this.totalBookmark,
  });
}
