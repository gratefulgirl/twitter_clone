
import 'package:flutter/material.dart';
import 'package:twitter_clone/models/OtherModel.dart';
class MessagesScreen extends StatelessWidget{
  final List<MessageModel>messages = [
    MessageModel(senderName: "Alhaji Dangote", senderHandle: "@Dangote", messageShort: "I have been looking for you",
    time: "2 days ago", senderAvatar: "images/dangote.jpeg"),
    MessageModel(senderName: "Bill Gates", senderHandle: "@BillGates", messageShort: "Send me your account number",
    time: "2 days ago", senderAvatar: "images/billgates.jpeg"),
    MessageModel(senderName: "Rihanna", senderHandle: "@Rihanna", messageShort: "Hi success! How are you doing",
    time: "5 days ago", senderAvatar: "images/rihanna.jpeg"),
    MessageModel(senderName: "Jacob", senderHandle: "@BigJ", messageShort: "Good  Morning",
    time: "7 days ago", senderAvatar: "images/Kurojpeg"),
  ];
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body:
      ListView.builder(
        itemCount:messages.length,
        itemBuilder:_buildTile,
      )
    );
  }
  Widget _buildTile(BuildContext context, int index){
    MessageModel message = messages[index];
    Widget displaySender = new RichText(
      text: new TextSpan(
        children:<TextSpan>[
          new TextSpan(text: message.senderName, style: new TextStyle(color: Colors.black)),
          new TextSpan(text:message.senderHandle, style: new TextStyle(color:Colors.black54),)
        ]
      ),
    );
    return new Column(children: <Widget>[
      ListTile(
        leading: new CircleAvatar(
          backgroundImage: AssetImage(message.senderAvatar),
        ),
        title: displaySender,
        subtitle: new Container(child:Text(message.messageShort, maxLines: 2,)),padding:EdgeInsets.only(bottom:10.0),),
         trailing:new Text(message.time),
         isThreeLine:false,
    ],);
  }
}