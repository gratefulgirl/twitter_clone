class User{
  String name, avatarUrl,likedTweet;
  User({
    this.name,
    this.avatarUrl,
    this.likedTweet
  });
}
class Trends{
  String title, tweetsNo;
  Trends({
    this.title,
    this.tweetsNo
  });
}
class MessageModel{
  String senderName, senderHandle, senderAvatar, messageShort, time;
  MessageModel({
    this.senderName,
    this.senderHandle,
    this.senderAvatar,
    this.messageShort,
    this.time
  });
}