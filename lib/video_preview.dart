import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPreview extends StatefulWidget {

  VideoPreview(this.url);

  final String url;

  @override
  State<StatefulWidget> createState() {
    return new VideoPreviewState();
  }

}

class VideoPreviewState extends State<VideoPreview> {
  VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = new VideoPlayerController.network(
      widget.url,
    )
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


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("VideoPreview"),
      ),
      body: new Center(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new AspectRatio(
            aspectRatio: 1280 / 720,
            child: new VideoPlayer(_controller),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed:
        _controller.value.isPlaying ? _controller.pause : _controller.play,
        child: new Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}