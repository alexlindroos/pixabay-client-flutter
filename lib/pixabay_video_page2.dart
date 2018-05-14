import 'package:flutter/material.dart';
import 'package:pixabay_client/medium.dart';
import 'package:pixabay_client/video_preview.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class VideoPage extends StatefulWidget {

  final String query;

  VideoPage(this.query);

  @override
  State<StatefulWidget> createState() {
    return new VideoPageState();
  }
}

class VideoPageState extends State<VideoPage>{

  var videos = [];
  final String apiKey = "ADD API KEY HERE";

  @override
  void initState() {
    super.initState();
    _fetchVideos();
  }

  _fetchVideos() async{
    final response = await http.get('https://pixabay.com/api/videos/?key=$apiKey&q=${widget.query}');
    final responseJson = json.decode(response.body);

    final videos = responseJson['hits'];

    setState(() {
      this.videos = videos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      appBar: new AppBar(
        title: new Text(widget.query),
      ),
      body: new ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, i) {
          final base = this.videos[i];
          final video = base['videos'];
          final medium = video['medium'];
          final String url = medium['url'];

          return new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Center(
                child: new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Column(
                    children: <Widget>[
                      new IconButton(
                          icon: new Icon(Icons.play_circle_outline),
                          iconSize: 50.0,
                          onPressed: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new VideoPreview(url)
                              ),
                            );
                          }
                      ),
                      new Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                        "Press play to play",
                        style: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),),
                      new Text("${base['user']}"),
                      new Text("${base['views']}"),
                      new Text("${base['tags']}"),
                      new Divider(),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}