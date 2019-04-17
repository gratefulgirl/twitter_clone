import 'package:flutter/material.dart';
import 'package:twitter_clone/models/TweetModel.dart';
class HomeScreen extends StatelessWidget{
  final List<Tweet> allTweets = [
    TweetWithImage1(textInput: "I had a really wonderful day with my friends",
    retweets:"273", likes:"1005", imageUrl:"images/rihanna1.jpg", avatar: "images/rihanna1.jpg", name: "Rihanna Boma" handle: "@Rihanna" ),
    TweetWithTextOnly(textInput: "Hi there! Flutter is amazing",
    retweets: "3.5k", likes: "4.9k", avatar: "images/success011.jpg", name:"Success", handle: "@flutterdev"),
    TweetWithImage3(textInput: "To me family is everything", retweets: "4.9k", likes: "7k",
    imageUrl1:"images/davido3.jpg", imageUrl2: "images/davido.jpg", imageUrl3:"images/davido2.jpg", avatar:"images/davido.jpg", name: "Davido OBO", handle:"@davido"),
    TweetWithImage2(textInput: "Wizkid in the building! Shout out to all my fans",
    retweets: "200", likes: "212", imageUrl1:"images/wizkid1.jpg", imageUrl2: "images/wizkid.jpg", avatar: "images/wizkid.jpg", name:"Wizkid", handle: "@WizkidAyo"),
  ];
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView.builder(
        itemBuilder: buildTweet,
        itemCount: allTweets.length,
      ),
    );
  }
  Widget _buildTitle(String name, handle){
    return new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      new Row(children:<Widget>[
        new Text(name,style:new TextStyle(fontWeight:FontWeight.bold),),
        new Text(handle),
      ],),
      new Column(crossAxisAlignment:CrossAxisAlignment.end,
      children: <Widget>[
        new Icon(Icons.keyboard_arrow_down),
      ],),
    ],
    );
  }
  Widget _buildTweetContent(BuildContext context, var meTweet, Widget picToBuild){
    return new Column(
      children: <Widget>[
        Row(crossAxisAlignment:CrossAxisAlignment.start,
        children: <Widget>[
          new Container(child:CircleAvatar(radius: 30.0, backgroundImage:AssetImage(meTweet.avatar),),
          margin: EdgeInsets.all(10.0),),
          new Flexible(
            child:Column(crossAxisAlignment:CrossAxisAlignment.start,
            children: <Widget>[
              new Padding(padding:EdgeInsets.only(bottom:2.0)),
              _buildTitle(meTweet.name, meTweet.handle),
              new Padding(padding:EdgeInsets.only(bottom:2.0)),
              new Text(meTweet.textInput,style:Theme.of(context).textTheme.body1,),
              new Padding(padding:EdgeInsets.only(bottom:5.0)),
              picToBuild,
              _buildBottomButtons(context, meTweet.retweets, meTweet.likes),
            ],
            ), flex:1,
          )
        ],),
        new Container(height:0.25, width:double.infinity, color: Colors.black45,)
      ]);
  }
  Widget _buildBottomButtons(BuildContext context, String reyweets, String likes){
    return new Container(margin:EdgeInsets.only(top:10.0, bottom:5.0, right:30.0),
    child:Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(Icons.reply, size: 15.0,),
        new Row(mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[                
          new Image.asset("images/retweet.png", height:20.0, width:20.0,),
          new Padding(padding:EdgeInsets.only(right:5.0)),
          new Text("retweets")
        ],),
        new Row(children: <Widget>[
          Icon(Icons.favorite_border, size: 15.0,),
          new Padding(padding:EdgeInsets.only(right:5.0)),
          new Text ("likes")
        ],),
        Icon(Icons.share, size:15.0,)
      ],
    ));
  }
  Widget _noImage(){
    return new Padding(padding:EdgeInsets.only(top:0.01));
  }
  Widget _oneImage(var singleTweet){
    return new Container(child: Image.asset(singleTweet.imageUrl),padding:EdgeInsets.only(right:10.0),);
  }
  Widget _twoImage(var singleTweet){
    return new Row(
      mainAxisSize:MainAxisSize.min,
      children: <Widget>[
        new Expanded(child: Image.asset(singleTweet.imageUrl1, fit:BoxFit.contain,),flex:1,),
        new Expanded(child: Image.asset(singleTweet.imageUrl2, fit:BoxFit.contain,),flex:1,),
        new Padding(padding:EdgeInsets.only(right:10.0))
      ],);
  } 
  Widget buildTweet(BuildContext context, int index){
    Tweet singleTweet =allTweets[index];
    if(singleTweet is TweetWithTextOnly){
      return _buildTweetContent(context, singleTweet, _noImage());
    }
    else if (singleTweet is TweetWithImage1){
      return _buildTweetContent(context, singleTweet, _oneImage(singleTweet));
    }
    else if (singleTweet is TweetWithImage2){
      return _buildTweetContent(context, singleTweet, _twoImage(singleTweet));
    }
    else{
      return new Text("No Tweet found");
    }
  }
}