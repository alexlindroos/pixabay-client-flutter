import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pixabay_client/pixabay_image_page.dart';
import 'package:pixabay_client/pixabay_video_page2.dart';

class PixabayClientPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return PixabayClientPageState();
  }
}

class PixabayClientPageState extends State<PixabayClientPage> {

  String _query;
  var pictureSearch = true;

  @override
  void initState() {
    super.initState();
    pictureSearch = true;
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        _pixabayInfo(),
        new Center(
          child: new Container(
            width: 200.0,
            child: new TextField(
              onChanged: (val) => _query = val,
            ),
          ),
        ),
        new Padding(
          padding: EdgeInsets.all(5.0),
          child: new Center(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new IconButton(
                  onPressed: () {
                    setState(() {
                      pictureSearch = true;
                    });
                  },
                  color: Colors.black,
                  disabledColor: Colors.black38,
                  icon: new Icon(Icons.photo_camera),
                ),
                new IconButton(
                  onPressed: () {
                    setState(() {
                      pictureSearch = false;
                    });
                  },
                  color: Colors.black,
                  disabledColor: Colors.black38,
                  icon: new Icon(Icons.videocam),
                ),
              ],
            ),
          ),
        ),
        new Center(
          child: new Container(
            width: 100.0,
            child: new FlatButton(
              onPressed: () {
                if (_query == null || _query == "") {
                  Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('Search is empty'),));
                } else {
                  _checkFormatAndMove(context);
                }
              },
              child: new Text(
                'Search',
                style: new TextStyle(
                    fontSize: 20.0
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _checkFormatAndMove(BuildContext context) {
    if (pictureSearch == true) {
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new ImagePage(_query)),
      );
    } else {
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new VideoPage(_query)),
      );
    }

  }

  Widget _pixabayInfo() {
    return new Padding(
      padding: EdgeInsets.symmetric(vertical: 100.0),
      child: new Column(
        children: <Widget>[
          new Image.asset('assets/logo.png',
            height: 100.0,
            width: 200.0,
          ),
          new Center(
            child: new InkWell(
              child: new Text('www.pixabay.com'),
              onTap: _launchURL,
            ),
          ),
        ],
      ),
    );
  }

  _launchURL() async {
    const url = 'https://pixabay.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}