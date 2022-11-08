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
      c.sort((a, b) => b.date!.compareTo(a.date!));
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
      c.sort((a, b) => b.date!.compareTo(a.date!));
      _myPostSharing = c;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  changeBookmarkStatus(String email, String id) async {
    try {
      _isLoading = true;
      await PostApi.addSharingBookmark(email, id);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      e.toString();
    }
  }

  getSharingBookmarkData(String email) async {
    try {
      _isLoading = true;
      final c = await PostApi.getMySharingBookmark(email);
      // c.sort((a, b) => b.date!.compareTo(a.date!));
      _sharingBookmark = c;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
