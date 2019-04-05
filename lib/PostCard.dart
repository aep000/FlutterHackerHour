import 'package:flutter/material.dart';
import 'DataModels.dart';

class PostCard extends StatefulWidget {
  Post post;
  PostCard(this.post);

  @override
  _PostCardState createState() => _PostCardState(post);
}

class _PostCardState extends State<PostCard> {
  Post post;

  _PostCardState(this.post);

  @override
  Widget build(BuildContext context) {
    Widget likeIcon;
    if(!post.userLiked){
      likeIcon = Icon(Icons.favorite_border);
    }
    else{
      likeIcon = Icon(Icons.favorite, color: Colors.pink,);
    }

    return Container(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Card(elevation: 4,
            child: Column(
              children: <Widget>[
                GestureDetector(child:
                  Image.network(post.imageURL),
                  onDoubleTap: (){
                    setState(() {
                      if(post.userLiked){
                        post.likeCount -= 1;
                      }
                      else{
                        post.likeCount += 1;
                      }
                      post.userLiked = !post.userLiked;


                    });
                  },
                ),
                Container(
                  child:
                    Row(
                      children: <Widget>[
                        likeIcon,
                        Text(post.likeCount.toString())
                      ],
                    ),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                ),
                Container(
                  padding: EdgeInsets.only(left: 5, bottom: 5),
                  child: Row(
                    children: [Text(post.Caption)]
                  )
                )
              ],
            )
        )
    );
  }
}

