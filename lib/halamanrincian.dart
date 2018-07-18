import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieflutter/model/Response.dart';

class Rincian extends StatefulWidget {
  final Movie movie;
  Rincian({this.movie});
  RincianState createState() => RincianState(movie: movie);
}

class RincianState extends State<Rincian> {
  final Movie movie;
  RincianState({this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Rincian"),
      ),
      body: new Container(
        child: ListView(
          children: <Widget>[
            new FadeInImage.assetNetwork(
              placeholder: "img/placeholder.png",
              image: "http://image.tmdb.org/t/p/w500" + movie.backdropPath,
              height: 250.0,
              fit: BoxFit.cover,
            ),
            new Container(
              margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: new Text(movie.title,
                  style: new TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold)),
            ),
            new Container(
              margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: new Text(movie.overview,
                  style: new TextStyle(fontSize: 15.0)),
            ),
          ],
        ),
      ),
    );
  }
}
