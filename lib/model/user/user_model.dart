class UserModel {
  String id;
  String username;
  String name;
  String email;
  List? createdPost;
  UserModel(
      {required this.id,
      required this.username,
      required this.email,
      required this.name,
      required this.createdPost});
}
