import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gonoka/view/component/ModalBottom/showBlockSheet.dart';
import 'package:gonoka/view/component/postComponent/moodContainer.dart';
import 'package:gonoka/view/component/postComponent/postActionContainer.dart';
import 'package:gonoka/view/component/postComponent/postDateContainer.dart';
import 'package:gonoka/view/component/postComponent/reportContainer.dart';
import 'package:gonoka/view/postReport.dart';

class PostCard extends StatefulWidget {
  const PostCard({Key? key, this.report, this.sus, this.allPost})
      : super(key: key);

  final bool? allPost;
  final bool? report;
  final bool? sus;

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  List postImageSrc = [
    {
      'src':
          'https://img.jakpost.net/c/2021/01/18/2021_01_18_109951_1610963733._large.jpg'
    },
    {
      'src':
          'https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/eggs-breakfast-avocado-1296x728-header.jpg?w=1155&h=1528'
    },
    {
      'src':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzR3YadgMaJgWRO6NdElEYgdvdLJDPLzaD8Q&usqp=CAU'
    },
    {
      'src':
          'https://media-cldnry.s-nbcnews.com/image/upload/newscms/2019_39/3027176/190926-chicken-tikka-masala-se-405p.jpg'
    },
    {
      'src':
          'https://www.ketoindia.fit/health/wp-content/uploads/2020/05/keto-diet.jpg'
    },
  ];

  Random ran = Random();
  random(num) {
    int imageIndex = ran.nextInt(num);
    return imageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Suspicous post type
              widget.sus != null
                  ? Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Suspicious or spam',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : SizedBox(),

              //Date
              PostDateContainer(),

              //Post Description
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 90,
                      color: Color.fromRGBO(222, 222, 222, 1),
                      child: Image.network(
                        '${postImageSrc[random(4)]['src']}',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                            'A less harsh taste than bitterness. Couples tartness with sweetness.'),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
              ),

              //Like, Comment, Share
              MoodContainer(),
              Divider(
                thickness: 1,
              ),

              //Report Container
              widget.report != null
                  ? InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PostReport()),
                        );
                      },
                      child: ReportContainer(
                        header: true,
                      ))
                  : SizedBox(),

              // Action Icon
              PostActionContainer(
                allPost: widget.allPost,
              )
            ],
          ),
        ),
        //Bottom Drawer
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Divider(
            thickness: 3,
          ),
        ),
      ],
    );
  }
}
