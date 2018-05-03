import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:video_player/video_player.dart';
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
  final resultsPerPage = 20;
  final String apiKey = "ADD API KEY HERE";
  final String url = "http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_20mb.mp4";
  bool _isPlaying = false;
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
   // _fetchVideos();
    _controller = new VideoPlayerController.network(url)
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      })
      ..initialize();
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
          final video = this.videos[i];
          return new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Center(
                child: new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new AspectRatio(
                    aspectRatio: 1280 / 720,
                    child: new VideoPlayer(_controller),
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