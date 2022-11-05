class PostModel {
  String? id;
  String? postTitle;
  String? postBody;
  String? date;
  String? category;
  String? tags;
  int? like;
  int? dislike;
  List? userLikes;
  List? userDislikes;
  List? userBookmarked;
  String? creatorId;
  int? totalBookmark;
  List? comment;
  String? username;

  PostModel(
      {this.id,
      this.postTitle,
      this.postBody,
      this.date,
      this.category,
      this.tags,
      this.like,
      this.dislike,
      this.userLikes,
      this.userDislikes,
      this.userBookmarked,
      this.creatorId,
      this.totalBookmark,
      this.comment,
      this.username});
}
