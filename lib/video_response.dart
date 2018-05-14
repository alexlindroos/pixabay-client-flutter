class VideoResponse {

  int totalhits;
  List<Video> hits;
  int total;

  VideoResponse({this.totalhits, this.hits, this.total});

  factory VideoResponse.fromJson(Map<String, dynamic> json) {
    return new VideoResponse(
      totalhits: json['totalhits'],
      hits: json['hits'],
      total: json['total'],
    );
  }
}

class Video {

  int id;
  String pageURL;
  String type;
  String tags;
  int duration;
  String picture_id;
  List videos;
  int views;
  int downloads;
  int favorites;
  int likes;
  int comments;
  int user_id;
  String user;
  String userImageURL;


  Video({
    this.id,
    this.pageURL,
    this.type,
    this.tags,
    this.duration,
    this.picture_id,
    this.videos,
    this.views,
    this.downloads,
    this.favorites,
    this.likes,
    this.comments,
    this.user_id,
    this.user,
    this.userImageURL,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return new Video(
      id: json['id'],
      pageURL: json['pageURL'],
      type: json["type"],
      tags: json["tags"],
      duration: json["duration"],
      picture_id: json["picture_id"],
      videos: json["videos"],
      views: json["views"],
      downloads: json["downloads"],
      favorites: json["favorites"],
      likes: json["likes"],
      comments: json["comments"],
      user_id: json["user_id"],
      user: json["user"],
      userImageURL: json["userImageURL"],
    );
  }
}