import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gonoka/view/component/ModalBottom/showCommentSheet.dart';

//this is the reply under the main comment
class ListReplyCommentContainer extends StatefulWidget {
  const ListReplyCommentContainer(
      {Key? key, this.myFocusNode, this.onTap, this.numberOfReply})
      : super(key: key);
  final GestureTapCallback? onTap;
  final myFocusNode;
  final numberOfReply;

  @override
  _ListReplyCommentContainerState createState() =>
      _ListReplyCommentContainerState();
}

class _ListReplyCommentContainerState extends State<ListReplyCommentContainer> {
  var ifMoreReply = false;
  var totalReply = 0;

//check main comment reply
  moreReply(commentReply) {
    var addReply = commentReply - totalReply;
    if (!ifMoreReply) {
      return totalReply = 4;
    } else if (addReply % 2 == 0 || addReply > 2) {
      return totalReply = totalReply + 2;
    } else {
      return totalReply = totalReply + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              child: CommentContainer(
            myFocusNode: widget.myFocusNode,
          )),
          Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Column(
              children: List.generate(ifMoreReply ? totalReply : 2, (index) {
                return ReplyCommentContainer();
              }),
            ),
          ),
          totalReply < widget.numberOfReply
              ? Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: InkWell(
                    onTap: () {
                      print('tap');
                      setState(() {
                        moreReply(widget.numberOfReply);
                        ifMoreReply = true;
                        print('$totalReply');
                        // numberOfReply =
                      });
                    },
                    child: Text(
                      'View more replies...',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}

class ReplyCommentContainer extends StatelessWidget {
  ReplyCommentContainer({Key? key, this.myFocusNode, this.onTap})
      : super(key: key);
  final GestureTapCallback? onTap;
  final myFocusNode;

  Random ran = Random();
  random(num) {
    int imageIndex = ran.nextInt(num);
    return imageIndex;
  }

  //image link
  final List imageSrc = [
    {
      "src":
          "https://icons.iconarchive.com/icons/google/noto-emoji-smileys/256/10074-angry-face-icon.png"
    },
    {"src": "https://icon-library.com/images/love-icon/love-icon-9.jpg"},
    {"src": "https://cdn.iconscout.com/icon/free/png-512/wow-20-894767.png"},
    {
      "src":
          "https://banner2.cleanpng.com/20190714/ubh/kisspng-smiley-emoji-portable-network-graphics-face-5d2bf06ac81995.5803807015631606828196.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Stack(
        children: [
          //Picture profile
          Container(
            margin: EdgeInsets.only(right: 5),
            width: 40,
            height: 40,
            child: Image.network(
              '${imageSrc[random(3)]['src']}',
            ),
          ),
          //User name and comment
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      Text(
                        'User Name',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 3, right: 3, top: 5),
                        child: Icon(
                          Icons.fiber_manual_record_sharp,
                          size: 5,
                          color: Colors.black38,
                        ),
                      ),
                      Text('10m')
                    ],
                  ),
                ),
                Container(
                  child: Text(
                      'She is dependable and reliable, follows directions effectively, and follows through on her commitments to him/herself and others.'),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text('34 moods',
                            style:
                                TextStyle(fontSize: 13, color: Colors.black45)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
