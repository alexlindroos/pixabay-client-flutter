import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:pixabay_client/pixabay_image_details.dart';
import 'package:http/http.dart' as http;

class ImagePage extends StatefulWidget {

  final String query;

  ImagePage(this.query);

  @override
  State<StatefulWidget> createState() {
    return new ImagePageState();
  }
}

class ImagePageState extends State<ImagePage>{

  var pictures = [];
  final resultsPerPage = 20;
  final String apiKey = "ADD API KEY HERE";

  @override
  void initState() {
    super.initState();
    _fetchPictures();
  }

  _fetchPictures() async{
    final response = await http.get('https://pixabay.com/api/?key=$apiKey&q=${widget.query}&image_type=photo&per_page=$resultsPerPage');
    final responseJson = json.decode(response.body);

    final pictures = responseJson['hits'];

    setState(() {
      this.pictures = pictures;
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
        itemCount: pictures.length,
        itemBuilder: (context, i) {
          final pic = this.pictures[i];
          return new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new ImageDetails(
                            pic['userImageURL'],
                            pic['largeImageURL'],
                            pic['user'],
                            pic['likes'],
                            pic['views'],
                            pic['tags']
                        ),
                    ),
                  );
                },
                child: new Image.network(
                  pic['webformatURL'],
                  fit: BoxFit.fill,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}