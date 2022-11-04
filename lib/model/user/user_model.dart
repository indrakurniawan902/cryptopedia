class UserModel {
  String? id;
  String username;
  String name;
  String email;
  List? createdPost;
  UserModel(
      {this.id,
      required this.username,
      required this.email,
      required this.name,
      this.createdPost});
}
