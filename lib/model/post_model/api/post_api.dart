import 'package:cryptopedia/model/post_model/post_model.dart';
import 'package:cryptopedia/utils/constant/api_constant.dart';
import 'package:dio/dio.dart';

class PostApi {
  static Future<List<PostModel>> getAllPost() async {
    try {
      final response =
          await Dio().get('${ApiConstants.baseUrl}${ApiConstants.getSharing}');
      if (response.statusCode == 200) {
        List<PostModel> posts = (response.data as List)
            .map((e) => PostModel(
                id: e['_id'],
                category: e['category'],
                comment: e['comment'],
                creatorId: e['creator_id'],
                date: e['date'],
                dislike: e['dislike'],
                like: e['like'],
                postBody: e['post_body'],
                postTitle: e['post_title'],
                tags: e['tags'],
                totalBookmark: e['total_bookmark'],
                userDislikes: e['user_dislikes'],
                userLikes: e['user_likes'],
                username: e['username'],
                userBookmarked: e['user_bookmarked']))
            .toList();
        print(posts);
        return posts;
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<PostModel>> getMySharingBookmark(String email) async {
    try {
      final response = await Dio().get(
          '${ApiConstants.baseUrl}${ApiConstants.getSharingBookmark}?email=$email');
      if (response.statusCode == 200) {
        List<PostModel> posts = (response.data as List)
            .map((e) => PostModel(
                id: e['_id'],
                category: e['category'],
                comment: e['comment'],
                creatorId: e['creator_id'],
                date: e['date'],
                dislike: e['dislike'],
                like: e['like'],
                postBody: e['post_body'],
                postTitle: e['post_title'],
                tags: e['tags'],
                totalBookmark: e['total_bookmark'],
                userDislikes: e['user_dislikes'],
                userLikes: e['user_likes'],
                username: e['username'],
                userBookmarked: e['user_bookmarked']))
            .toList();
        print(posts);
        return posts;
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<PostModel>> getMyPost(String email) async {
    try {
      final response = await Dio().get(
          '${ApiConstants.baseUrl}${ApiConstants.getSharing}?email=$email&filter=my-post');
      if (response.statusCode == 200) {
        List<PostModel> posts = (response.data as List)
            .map((e) => PostModel(
                id: e['_id'],
                category: e['category'],
                comment: e['comment'],
                creatorId: e['creator_id'],
                date: e['date'],
                dislike: e['dislike'],
                like: e['like'],
                postBody: e['post_body'],
                postTitle: e['post_title'],
                tags: e['tags'],
                totalBookmark: e['total_bookmark'],
                userDislikes: e['user_dislikes'],
                userLikes: e['user_likes'],
                username: e['username'],
                userBookmarked: e['user_bookmarked']))
            .toList();
        print(posts);
        return posts;
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
