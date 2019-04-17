import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/HomeScreen.dart';
import 'package:twitter_clone/screens/MessagesScreen.dart';
import 'package:twitter_clone/screens/NotificationsScreen.dart';
import 'package:twitter_clone/screens/SearchScreen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twitter  Demo',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Twitter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new DefaultTabController(
        length: 4, child: new Scaffold(
          appBar:AppBar(
            title: new Text("Twitter"),
            bottom: new TabBar(
              isScrollable: true,
              tabs: [
                new Container(child:Tab(icon:new Icon(Icons.home),),width:50.0,),
                new Container(child:Tab(icon:new Icon(Icons.search),),width:50.0,),
                new Container(child:Tab(icon:new Icon(Icons.notifications_none),),width:50.0,),
                new Container(child:Tab(icon:new Icon(Icons.mail_outline),),width:50.0,),
              ]),
          ),
          body: new TabBarView(
            children: [
              new HomeScreen(),
              new SearchScreen(),
              new NotificationsScreen(),
              new MessagesScreen(),
            ]),
            )),
      );
  }
}
