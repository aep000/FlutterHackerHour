import 'package:http/http.dart';
import 'dart:convert';
import 'dart:math';
class Post{
  String imageURL;
  String Caption;
  int likeCount;
  bool userLiked;
  Post(this.imageURL,this.Caption,this.likeCount, this.userLiked);
  /*
  This constructor is equivalent to the one above
  Post(int likes, String imageSrc, String caption){
    this.imageURL = imageSrc
    this.Caption = caption
    this.likeCount = likes
  }*/
  static Future<Post> genPost() async{
    String caption = "";
    var rng = new Random();
    for (var i = 0; i < 10; i++) {
      if(rng.nextInt(2)==1){
        caption += "Bark ";
      }
    }
    var response = await get("https://dog.ceo/api/breeds/image/random");
    Map<String, dynamic> data = json.decode(response.body);
    return new Post(data["message"], caption, rng.nextInt(100), false);

  }
}
//https://dog.ceo/dog-api/