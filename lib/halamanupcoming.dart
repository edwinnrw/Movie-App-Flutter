import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movieflutter/GridViewItem.dart';
import 'package:movieflutter/model/Response.dart';

class Upcoming extends StatefulWidget {
  UpcomingState createState() => UpcomingState();
}

class UpcomingState extends State<Upcoming> {
  Future<Response> getData() async {
    final response = await http.get(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=56c0b25e08f10a2324473bfc39985e49');
    if (response.statusCode == 200) {
      return Response.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  List<Movie> createList() {
    List<Movie> movieList = new List();
    new FutureBuilder<Response>(
      future: getData(),
      builder: (context, snapshot) {
        print(snapshot.hasData);
        if (snapshot.hasError) {
          for (int i = 0; i < snapshot.data.result.length; i++) {
            print(snapshot.data.result[i]);
            movieList.add(snapshot.data.result[i]);
          }
        }
      },
    );
    return movieList;
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


