class ImageResponse {

  int totalhits;
  List<Picture> hits;
  int total;

  ImageResponse({this.totalhits, this.hits, this.total});

  factory ImageResponse.fromJson(Map<String, dynamic> json) {
    return new ImageResponse(
      totalhits: json['totalhits'],
      hits: json['hits'],
      total: json['total'],
    );
  }
}

class Picture {

  String largeImageURL;
  int webformatHeight;
  int webformatWidth;
  int likes;
  int imageWidth;
  int id;
  int user_id;
  int views;
  int comments;
  String pageURL;
  int imageHeight;
  String webformatURL;
  int previewHeight;
  String tags;
  int downloads;
  String user;
  int favorites;
  int imageSize;
  int previewWidth;
  String userImageURL;
  String previewURL;

  Picture({
    this.largeImageURL,
    this.webformatHeight,
    this.webformatWidth,
    this.likes,
    this.imageWidth,
    this.id,
    this.user_id,
    this.views,
    this.comments,
    this.pageURL,
    this.imageHeight,
    this.webformatURL,
    this.previewHeight,
    this.tags,
    this.downloads,
    this.user,
    this.favorites,
    this.imageSize,
    this.previewWidth,
    this.userImageURL,
    this.previewURL,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return new Picture(
      largeImageURL: json['largeImageURL'],
      webformatHeight: json['webformatHeight'],
      webformatWidth: json['webformatWidth'],
      likes: json['likes'],
      imageWidth: json['imageWidth'],
      id: json['id'],
      user_id: json['user_id'],
      views: json['views'],
      comments: json['comments'],
      pageURL: json['pageURL'],
      imageHeight: json['imageHeight'],
      webformatURL: json['webformatURL'],
      previewHeight: json['previewHeight'],
      tags: json['tags'],
      downloads: json['downloads'],
      user: json['user'],
      favorites: json['favorites'],
      imageSize: json['imageSize'],
      previewWidth: json['previewWidth'],
      userImageURL: json['userImageURL'],
      previewURL: json['previewURL'],
    );
  }
}