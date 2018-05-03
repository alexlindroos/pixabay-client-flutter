import 'package:flutter/material.dart';
import 'dart:core';

class ImageDetails extends StatelessWidget {

  final String userImageURL;
  final String largeImageUrl;
  final String user;
  final int likes;
  final int views;
  final String tags;

  ImageDetails(this.userImageURL, this.largeImageUrl, this.user, this.likes, this.views, this.tags);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      appBar: new AppBar(
        title: new Text("Image details"),
      ),
      body: new Column(
        children: <Widget>[
          new Image.network(largeImageUrl),
          _userInfo(user),
          new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _viewsInfo(views),
              _likesInfo(likes),
            ],
          ),
          _tags(tags),
        ],
      ),
    );
  }

  Widget _userInfo(String user) {
    return new Padding(
      padding: EdgeInsets.all(15.0),
      child: new Column(
        children: <Widget>[
          new Text(
              "User:",
              style: new TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          new Text(
            "$user",
            style: new TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          new Image.network(
              userImageURL,
              height: 100.0,
              width: 100.0,
          ),
        ],
      ),
    );
  }

  Widget _viewsInfo(int views) {
    return new Padding(
      padding: EdgeInsets.all(1.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.all(5.0),
                child: new Icon(Icons.remove_red_eye),
              ),
              new Text(views.toString())
            ],
          ),
        ],
      ),
    );
  }

  Widget _likesInfo(int likes) {
    return new Padding(
      padding: EdgeInsets.all(5.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.all(5.0),
                child: new Icon(Icons.thumb_up),
              ),
              new Text(likes.toString()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tags(String tags) {
    return new Text(
      tags,
      style: new TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}