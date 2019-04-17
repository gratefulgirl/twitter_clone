import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/HomeScreen.dart';
import 'package:twitter_clone/models/OtherModel.dart';
class SearchScreen extends StatelessWidget{
  final List<Trends> trends = [
    Trends(title: "Wizkid", tweetsNo: "1,820 Tweets"),
    Trends(title: "#Davido", tweetsNo: "4,080 Tweets"),
    Trends(title: "#Nigeria", tweetsNo: "8,374 Tweets"),
    Trends(title: "#Holiday", tweetsNo: "9,993 Tweets"),
    Trends(title: "#Thursday Motivation", tweetsNo: "9,989 Tweets"),
    Trends(title: "#Happy", tweetsNo: "1,653 Tweets"),
  ];
  @override
  Widget build(BuildContext context){
    return new CustomScrollView(
      slivers:<Widget>[
        new SliverAppBar(
          backgroundColor: Colors.white70,
          centerTitle: false,
          title: new Text("Trends for you", style: new TextStyle(color: Colors.black),),
        ),
        new SliverToBoxAdapter(child: Container(height: 0.25, width: double.infinity, color:Colors.black54,)),
        new SliverList(
          delegate: new SliverChildBuilderDelegate((context, index) => _buildTrendsList(context, index),
         childCount: trends.length
          ),),
          new SliverAppBar(
            pinned:true,
            centerTitle: false,
            backgroundColor: Colors.white70,
            floating: false,
            title: new ListTile(
              title: new Text("From your feed", style: new TextStyle(fontWeight:FontWeight.bold, fontSize:15.0),),
              subtitle: new Text("Because you followed Gabby and 20 others", style: new TextStyle(fontStyle:FontStyle.italic, fontSize:13.0),),
              trailing: new Icon(Icons.keyboard_arrow_down),
            ),
          ),
          new SliverList(
            delegate: new SliverChildBuilderDelegate((context, index) => HomeScreen().buildTweet(context, index),
           childCount:HomeScreen().allTweets.length
            ),),
      ],
    );
  }
  Widget _buildTrendsList(BuildContext context, index){
    Trends trend = trends[index];
    return new Column(children: <Widget>[
      ListTile(
        leading: new Text((index +1).toString()),
        title: new Text(trend.title),
        subtitle: new Text(trend.tweetsNo),
        trailing: new Container(child: new Icon(Icons.keyboard_arrow_down),),
      ),
      new Container(height:0.25, width:double.infinity, color:Colors.black54,)
    ],);
  }
}