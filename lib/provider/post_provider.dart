import 'package:cryptopedia/model/post_model/api/post_api.dart';
import 'package:cryptopedia/model/post_model/post_model.dart';
import 'package:flutter/cupertino.dart';

class PostProvider extends ChangeNotifier {
  List<PostModel> _allSharing = [];
  List<PostModel> _myPostSharing = [];
  List<PostModel> _sharingBookmark = [];
  bool _isLoading = true;

  List<PostModel> get allSharing => _allSharing;
  List<PostModel> get myPostSharing => _myPostSharing;
  List<PostModel> get sharingBookmark => _sharingBookmark;
  bool get loading => _isLoading;

  getAllPostData() async {
    try {
      _isLoading = true;
      final c = await PostApi.getAllPost();
      _allSharing = c;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  getMyPostData(String email) async {
    try {
      _isLoading = true;
      final c = await PostApi.getMyPost(email);
      _myPostSharing = c;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  getSharingBookmarkData(String email) async {
    try {
      _isLoading = true;
      final c = await PostApi.getMySharingBookmark(email);
      _sharingBookmark = c;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
