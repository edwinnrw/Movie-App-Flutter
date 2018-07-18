import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movieflutter/model/Response.dart';
import 'package:http/http.dart' as http;
import 'package:movieflutter/util/mycustomroute.dart';
import 'halamanresultsearch.dart' as result;

class Pencarian extends StatefulWidget{
  PencariantState createState()=>  PencariantState();
}


class PencariantState extends State<Pencarian> {
  bool _loading = true;
  final myController = TextEditingController();
  Future<Response> fecthData(String param) async {
    final response = await http.get(
        'https://api.themoviedb.org/3/search/movie?api_key=56c0b25e08f10a2324473bfc39985e49&query=$param');
        print(response.body);
    if (response.statusCode == 200) {
      return Response.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
  List<Movie> getData(BuildContext context,String param) {
    _onLoading();
    List<Movie>movie;
    fecthData(param).then((s) {
       movie=s.result;
       dismisLoading();
    });
    return movie;
  }
  void _onLoading() {
    getData(context, myController.text);
    showDialog(
      context: context,
      barrierDismissible: false,
      child: new Dialog(
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            new CircularProgressIndicator(),
            new Text("Loading"),
          ],
        ),
      ),
    );
  }
  void dismisLoading(){
    new Future.delayed(new Duration(seconds: 3), () {
      Navigator.pop(context); //pop dialog
      Navigator.push(context,new MyCustomRoute(
        builder: (context) => result.ResultSearch(movielist: getData(context,myController.text),)));
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Search Movie"),
      ),
      body: new Container(
          padding: EdgeInsets.all(10.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: new Text("M Search",
                    style: new TextStyle(
                        color: Colors.blue[900],
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold)),
              ),
              new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Flexible(
                    child: new TextField(
                      controller: myController,
                      decoration: InputDecoration(hintText: "Input Movie"),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: new RaisedButton(
                        child: new Text("Search",
                            style: new TextStyle(color: Colors.white)),
                        color: Theme.of(context).accentColor,
                        elevation: 4.0,
                        splashColor: Colors.blueGrey,
                        onPressed: _onLoading),
                  )
                ],
              ),
            ],
          )),
    );
  }
  @override
    void dispose() {
      myController.dispose();
      // TODO: implement dispose
      super.dispose();
    }
}

