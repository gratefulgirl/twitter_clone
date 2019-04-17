import 'package:flutter/material.dart';
import 'package:twitter_clone/models/OtherModel.dart';
class NotificationsScreen extends StatelessWidget{
@override
Widget build(BuildContext context){
  return new Scaffold(
    body: ListView.builder(
      itemCount: 1,
      itemBuilder: _buildAll)
  );
}
final List<User> whoFollowedMe =[
  User(name: "Dangote", avatarUrl: "images/dangote.jpeg"),
  User(name: "Bill Gates", avatarUrl: "images/billgates.jpg"),
  User(name: "Rihanna", avatarUrl: "images/rihanna.jpg"),
];
final List<User> highlights = [
  User(name: "Dangote", avatarUrl:"images/dangote.jpeg"),
   User(name: "Bill Gates", avatarUrl:"images/billgates.jpg"),
    User(name: "Rihanna", avatarUrl:"images/rihanna.jpg"),
    User(name: "Big sean", avatarUrl:"images/bigsean2.jpg"),
    User(name: "Wizkid", avatarUrl:"images/wizkid.jpg"),
    User(name: "Davido", avatarUrl:"images/davido.jpg"),
];
final List<User> likesRecentPic = [
   User(name: "Dangote", avatarUrl: "images/dangote.jpeg"),
  User(name: "Bill Gates", avatarUrl: "images/billgates.jpg"),
  User(name: "Rihanna", avatarUrl: "images/rihanna.jpg", likedTweet: "Today is awesome"),
];
Widget _buildWhoFollowed(BuildContext context, int index){
  List<Widget> avatarList =[];
  User follower = whoFollowedMe[index];
  for (follower in whoFollowedMe){
    avatarList.add(
      new CircleAvatar(backgroundImage:AssetImage(follower.avatarUrl), radius:20.0,),
    );
  }
  return new Column(children: <Widget>[
    new Padding(padding:EdgeInsets.only(top:10.0)),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(child:Image.asset("images/twitter.png", height: 20.0, width:20.0,),padding: EdgeInsets.only(right: 10.0, left: 40.0),),
        new Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(children: avatarList),
          new Padding(padding: EdgeInsets.only(bottom: 5.0)),
          new Text(whoFollowedMe[0].name + "and" + (whoFollowedMe.length -1).toString() + "others followed you"),
        ],),
      ],),
      new Padding(padding: EdgeInsets.only(top:10.0)),
      new Container(height:0.25, width: double.infinity, color: Colors.black45,)
  ],);
}
Widget _buildHighlights(BuildContext context, int index){
  List<Widget> avatarList = [];
  User follower = highlights[index];
  for (follower in highlights){
    avatarList.add(
      new CircleAvatar(backgroundImage: AssetImage(follower.avatarUrl),radius:20.0,),
    );
  }
  return new Column(children: <Widget>[
    new Padding(padding: EdgeInsets.only(top:10.0)),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(child: Icon(Icons.person, color: Colors.blue,),padding: EdgeInsets.only(right: 10.0, left: 40.0),),
        new Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(children: avatarList),
          new Padding(padding: EdgeInsets.only(bottom:5.0)),
          new Text("Highlights from" + follower.name + "and" + (highlights.length -1).toString() +"others"),
        ],),
      ],),
      new Padding(padding:EdgeInsets.only(top:10.0)),
      new Container(height:0.25, width:double.infinity, color:Colors.black45,)
  ],);
}
Widget _buildLikedYourPics(BuildContext context, int index){
  List<Widget>avatarList = [];
  User follower = likesRecentPic[index];
  for (follower in likesRecentPic){
    avatarList.add(
      new CircleAvatar(backgroundImage: AssetImage(follower.avatarUrl),radius: 20.0,),
    );
  }
return new Column(children: <Widget>[
  new Padding(padding:EdgeInsets.only(top:10.0)),
  Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      new Padding(child:Icon(Icons.favorite, color: Colors.red),padding: EdgeInsets.only(right:10.0, left:40.0),),
      new Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(children: avatarList),
        new Padding(padding: EdgeInsets.only(bottom: 5.0)),
        new RichText(
          text: new TextSpan(
            style: DefaultTextStyle.of(context).style,
            children:<TextSpan>[
              new TextSpan(text:likesRecentPic[0].name + "and" + likesRecentPic[1].name, style: new TextStyle(fontWeight:FontWeight.bold)),
              new TextSpan(text: 'liked your tweet'),
            ],
          ),
        ),
        new Container(child:Text(likesRecentPic[0].likedTweet, softWrap:true,
        style: new TextStyle(color:Colors.black54),),
        alignment:Alignment.center, width:200.0,)
      ],),
    ],),
    new Padding(padding:EdgeInsets.only(top:10.0)),
    new Container(height: 0.25, width: double.infinity, color: Colors.black45,)
],);
}
Widget _buildAll(BuildContext context, int index){
  return new Column(children: <Widget>[
    _buildWhoFollowed(context, index),
    _buildLikedYourPics(context, index),
    _buildHighlights(context, index),
  ],);
}
}