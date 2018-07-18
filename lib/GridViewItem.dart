import 'package:flutter/material.dart';
import 'package:movieflutter/model/Response.dart';
import 'package:movieflutter/util/mycustomroute.dart';
import 'package:movieflutter/halamanrincian.dart' as rincian;

class GridViewItem extends StatelessWidget {
  final List<Movie> movieList;
  GridViewItem({this.movieList});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return new Container(
      child: GridView.builder(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (itemWidth / itemHeight),
      ),
      itemCount: movieList.length,
      itemBuilder: (context, i) {
        return new Container(
          child: new GestureDetector(
            onTap: () => Navigator.push(
                context,
                new MyCustomRoute(
                    builder: (context) => rincian.Rincian(movie: movieList[i],
                        ))),
            child: new Card(
              child: new Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Expanded(
                    child: FadeInImage.assetNetwork(
                      placeholder: "img/placeholder.png",
                      image:"http://image.tmdb.org/t/p/w500" +
                          movieList[i].posterPath,
                      fit: BoxFit.fitWidth,
                    ) 
                  ),
                  new Container(
                      padding: EdgeInsets.all(13.0),
                      child: new Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              new Container(
                                child: new Expanded(
                                  child: new Center(
                                    child: new Text(
                                      movieList[i].title,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: new TextStyle(fontSize: 15.0),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          new Center(
                            child: new Text(
                              movieList[i].releaseDate,
                              style: new TextStyle(fontSize: 13.0),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        );
      },
      ) ,
    ); 
  }
}