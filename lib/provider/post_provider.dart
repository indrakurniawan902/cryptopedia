import 'package:cryptopedia/model/post_model/api/post_api.dart';
import 'package:cryptopedia/model/post_model/post_model.dart';
import 'package:flutter/cupertino.dart';

enum PostViewState {
  none,
  loading,
  error,
}

class PostProvider extends ChangeNotifier {
  List<PostModel> _allSharing = [];
  List<PostModel> _myPostSharing = [];
  List<PostModel> _sharingBookmark = [];
  PostViewState _state = PostViewState.none;

  List<PostModel> get allSharing => _allSharing;
  List<PostModel> get myPostSharing => _myPostSharing;
  List<PostModel> get sharingBookmark => _sharingBookmark;
  PostViewState get state => _state;

  changeState(PostViewState s) {
    s = _state;
    notifyListeners();
  }

  getAllPostData() async {
    changeState(PostViewState.loading);
    try {
      final c = await PostApi.getAllPost();
      c.sort((a, b) => b.date!.compareTo(a.date!));
      _allSharing = c;
    } finally {
      notifyListeners();
      changeState(PostViewState.none);
    }
  }

  getMyPostData(String email) async {
    changeState(PostViewState.loading);
    try {
      final c = await PostApi.getMyPost(email);
      c.sort((a, b) => b.date!.compareTo(a.date!));
      _myPostSharing = c;
    } finally {
      notifyListeners();
      changeState(PostViewState.none);
    }
  }

  changeBookmarkStatus(String email, String id) async {
    changeState(PostViewState.loading);
    try {
      await PostApi.addSharingBookmark(email, id);
      notifyListeners();
      changeState(PostViewState.none);
    } catch (e) {
      e.toString();
    }
  }

  getSharingBookmarkData(String email) async {
    changeState(PostViewState.loading);
    try {
      final c = await PostApi.getMySharingBookmark(email);
      c.sort((a, b) => b.date!.compareTo(a.date!));
      _sharingBookmark = c;
    } finally {
      notifyListeners();
      changeState(PostViewState.none);
    }
  }

  likeAction(String email, String id) async {
    changeState(PostViewState.loading);
    try {
      await PostApi.addSharingLike(email, id);
      notifyListeners();
      changeState(PostViewState.none);
    } catch (e) {
      e.toString();
    }
  }

  dislikeAction(String email, String id) async {
    changeState(PostViewState.loading);
    try {
      await PostApi.addSharingDislike(email, id);
      notifyListeners();
      changeState(PostViewState.none);
    } catch (e) {
      e.toString();
    }
  }

  addComment(String id, String text, String username, String email,
      String profileUrl) async {
    changeState(PostViewState.loading);
    try {
      await PostApi.addComment(id, text, username, email, profileUrl);
      notifyListeners();
      changeState(PostViewState.none);
    } catch (e) {
      e.toString();
    }
  }
}
