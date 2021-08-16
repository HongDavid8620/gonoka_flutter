import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gonoka/view/component/ModalBottom/showBottomSheetCustom.dart';

//Show bottom sheet class(Mood and comment)
class ShowMoodBottomSheet {
  List moods = [
    {"mood": "happy"},
    {"mood": "angry"},
    {"mood": "happy"},
    {"mood": "sad"},
    {"mood": "angry"},
    {"mood": "wow"},
    {"mood": "sad"},
    {"mood": "love"},
    {"mood": "love"},
  ];
  void showMoodBottomSheet({context}) {
    //check which Sheet
    showModalBottomSheetCustom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        context: context,
        builder: (context) {
          var like;
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Black bar
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15)),
                    color: Colors.white,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 8),
                      child: Container(
                          height: 4,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))))),
                ),

                //Content(profile pic, moods)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 18),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Moods  ',
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                    TextSpan(
                        text: '853K',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.normal))
                  ])),
                ),

                //body
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 9,
                          itemBuilder: (context, index) {
                            return ProfileContainerForMood(
                              mood: moods[index]['mood'],
                            );
                          }),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

//Profile pic for moods sheet list container
class ProfileContainerForMood extends StatelessWidget {
  ProfileContainerForMood({Key? key, this.mood}) : super(key: key);
  final mood;
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
    {"src": "https://cdn.iconscout.com/icon/free/png-512/wow-20-894767.png"}
  ];

  Random ran = Random();
  random(num) {
    int imageIndex = ran.nextInt(num);
    return imageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        children: [
          //Profile pic and name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFe0f2f1)),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('User Name')),
                ],
              ),
              Container(
                height: 20,
                child: Image.network('${imageSrc[random(4)]['src']}'),
              ),
            ],
          ),

          //Diverder
          Padding(
            padding: EdgeInsets.only(left: 50),
            child: Divider(thickness: 1),
          )
        ],
      ),
    );
  }
}
