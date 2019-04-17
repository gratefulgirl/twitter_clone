abstract class Tweet{}
class TweetWithTextOnly implements Tweet{
  String textInput, retweets, likes, avatar, name, handle;
  TweetWithTextOnly({
    this.textInput,
    this.retweets,
    this.likes,
    this.avatar,
    this.name,
    this.handle
  });
}
class TweetWithImage1 implements Tweet{
  String textInput, retweets, likes, imageUrl, avatar, name, handle;
  TweetWithImage1({
    this.textInput,
    this.retweets,
    this.likes,
    this.imageUrl,
    this.avatar,
    this.name,
    this.handle
  });
}
class TweetWithImage2 implements Tweet{
  String textInput, retweets, likes, imageUrl1, imageUrl2, avatar, name, handle;
  TweetWithImage2({
    this.textInput,
    this.retweets,
    this.likes,
    this.imageUrl1,
    this.imageUrl2,
    this.avatar,
    this.name,
    this.handle
  });
}
class TweetWithImage3 implements Tweet{
  String textInput, retweets, likes, imageUrl1, imageUrl2, imageUrl3, avatar, name, handle;
  TweetWithImage3({
    this.textInput,
    this.retweets,
    this.likes,
    this.imageUrl1,
    this.imageUrl2,
    this.imageUrl3,
    this.avatar,
    this.name,
    this.handle
  });
}