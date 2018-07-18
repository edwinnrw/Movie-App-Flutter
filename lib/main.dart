import 'package:flutter/material.dart';
import 'package:movieflutter/halamanplaying.dart' as playing;
import 'package:movieflutter/halamanupcoming.dart' as upcoming;
import 'package:movieflutter/util/mycustomroute.dart';
import 'package:movieflutter/halamanpencarian.dart' as cari;

void main() {
  runApp(new MaterialApp(
    title: "Movie Flutter",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // TabController controller;
  List<Widget> pages;
  Widget currentPage;
  final PageStorageBucket bucket = PageStorageBucket();
  int currentTab = 0;

  @override
  void initState() {
    pages = [playing.Playing(), upcoming.Upcoming()];
    currentPage = playing.Playing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Home"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () => Navigator.push(
                    context,
                    new MyCustomRoute(
                      builder: (context) => cari.Pencarian(),
                    ))),
          ],
        ),
        body: PageStorage(
          child: currentPage,
          bucket: bucket,
        ),
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.blueAccent,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.white,
              textTheme: Theme
                  .of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.white70))),
          child: new BottomNavigationBar(
            currentIndex: currentTab,
            onTap: (int index) {
              setState(() {
                currentTab = index;
                currentPage = pages[index];
              });
            },
            items: <BottomNavigationBarItem>[
              new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.movie,
                  size: 26.00,
                ),
                title: new Text("Playing"),
              ),
              new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.video_library,
                  size: 26.00,
                ),
                title: new Text("Upcoming"),
              ),
            ],
          ),
        ));
  }
}
