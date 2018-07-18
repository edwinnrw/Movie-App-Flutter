import 'package:flutter/material.dart';
import 'package:movieflutter/model/Response.dart';
import 'package:movieflutter/GridViewItem.dart';

class ResultSearch extends StatelessWidget {
  List<Movie> movielist;

  ResultSearch({this.movielist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Result"),
      ),
      body: new GridViewItem(movieList: movielist,),
    );
  }
}