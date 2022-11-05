class ApiConstants {
  static String baseUrl = 'https://ternakcoin.vercel.app/api';
  static String postEndpoint = '/v2/getPost';
  static String checkRegister = '/isRegistered';
  static String register = '/registerUser';
  static String addPost = '/v2/addPost';
  static String getUser = '/v2/getUser';
  static String get101 = '/v2/getArticle';
  static String get101Bookmark = '/v2/users/bookmark/article';
  static String editProfile = '/v2/editProfile';
  static String addComment = '/v2/posts-action/comment/';
  static String getSharing = '/v2/getPost';
  static String getLikePost = '/v2/posts-action/like/';
  static String getDislikePost = '/v2/posts-action/dislike/';
  static String getSharingBookmark = '/v2/users/bookmark/post';
  static String getCoinData =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';
}
