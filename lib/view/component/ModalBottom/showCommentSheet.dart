import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gonoka/view/component/ModalBottom/listReplyComment.dart';
import 'package:gonoka/view/component/ModalBottom/showBottomSheetCustom.dart';
import 'package:gonoka/view/component/ModalBottom/showMoodSheet.dart';

//Show bottom sheet class(Mood and comment)
class ShowCommentBottomSheet {
  void showCommentBottomSheet({context}) {
    //check which Sheet
    showModalBottomSheetCustom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        context: context,
        builder: (context) {
          return Wrapper();
        });
  }
}

//Wrapping everything into bottomSheet
class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  late FocusNode myFocusNode;

  List comment = [
    {"c": 1, "r": 0},
    {"c": 2, "r": 9},
    {"c": 3, "r": 0},
  ];

  numberOfReply(index) {
    return comment[index]['r'];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('rebuilded');
    //unfocus and dismiss keyboard when tab outside of comment
    return GestureDetector(
      onTap: () {
        if (myFocusNode.hasFocus) myFocusNode.unfocus();
        // FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Black bar
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              ),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 8),
                  child: Container(
                      height: 4,
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10))))),
            ),

            //Content(Profile, Like)
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, left: 18),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Comment  ',
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                TextSpan(
                    text: '23',
                    style: TextStyle(
                        color: Colors.black38, fontWeight: FontWeight.normal))
              ])),
            ),

            //comment sheet body
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                    child: Column(
                        children: List.generate(comment.length, (index) {
                  if (comment[index]['r'] > 0) {
                    return ListReplyCommentContainer(
                      numberOfReply: comment[index]['r'],
                      myFocusNode: myFocusNode,
                    );
                  } else {
                    return CommentContainer(
                      myFocusNode: myFocusNode,
                    );
                  }
                }))),
              ),
            ),

            //comment textfeild
            TextFeildComment(myFocusNode: myFocusNode),

            //add height when open keyboard for textfield
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            )
          ],
        ),
      ),
    );
  }
}

//bottom comment textfeild
class TextFeildComment extends StatelessWidget {
  const TextFeildComment({
    Key? key,
    required this.myFocusNode,
  }) : super(key: key);

  final FocusNode myFocusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Expanded(
              child: SizedBox(
                height: 35,
                child: TextField(
                  focusNode: myFocusNode,
                  cursorColor: Colors.blue,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.only(
                        bottom: 15, top: 15, left: 10, right: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        borderSide: BorderSide.none),
                    fillColor: Colors.grey[300],
                    filled: true,
                    hintText: 'comment',
                    hintStyle: TextStyle(
                        fontSize: 15.0, height: 1.2, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.send,
                color: Colors.blue,
              ))
        ],
      ),
    );
  }
}

//comment container
class CommentContainer extends StatelessWidget {
  CommentContainer({Key? key, this.myFocusNode}) : super(key: key);
  final myFocusNode;

  Random ran = Random();
  random(num) {
    int imageIndex = ran.nextInt(num);
    return imageIndex;
  }

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
            child: Image.network('${imageSrc[random(3)]['src']}'),
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
                        onTap: () {
                          var moodSheet = ShowMoodBottomSheet();
                          moodSheet.showMoodBottomSheet(context: context);
                        },
                        child: Text('34 moods',
                            style:
                                TextStyle(fontSize: 13, color: Colors.black45)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        // splashFactory: NoSplash.splashFactory,
                        onTap: () {
                          if (myFocusNode.hasFocus) {
                            myFocusNode.unfocus();
                            // FocusScope.of(context)
                            //     .requestFocus(new FocusNode());
                          } else {
                            myFocusNode.requestFocus();
                          }
                        },
                        child: Text('1 reply',
                            style:
                                TextStyle(fontSize: 13, color: Colors.black45)),
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
