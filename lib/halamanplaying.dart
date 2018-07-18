import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movieflutter/GridViewItem.dart';
import 'package:movieflutter/model/Response.dart';

class Playing extends StatefulWidget {
  PlayingState createState() => PlayingState();
}

class PlayingState extends State<Playing> {
  Future<Response> getData() async {
    final response = await http.get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=56c0b25e08f10a2324473bfc39985e49');
    if (response.statusCode == 200) {
      return Response.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: new FutureBuilder<Response>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return new Container(
            margin: EdgeInsets.only(right: 7.0,left: 7.0, top: 5.0),
            child: GridViewItem(
              movieList: snapshot.data.result,
            )
          ); 
        } else {
          return new Center(
            child: new CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}


