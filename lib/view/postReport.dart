import 'package:flutter/material.dart';
import 'package:gonoka/view/component/postComponent/moodContainer.dart';
import 'package:gonoka/view/component/postComponent/postActionContainer.dart';
import 'package:gonoka/view/component/postComponent/postDateContainer.dart';
import 'package:gonoka/view/component/postComponent/reportContainer.dart';

//page for check reported post
class PostReport extends StatelessWidget {
  const PostReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          //remove left space from appbar title
          titleSpacing: 0.0,
          title: PostDateContainer(),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //post description
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Text(
                      'She meets all company standards for attendance and punctuality. You schedule your time off in advance and can be relied upon for completing your tasks on time.'),
                ),

                //post image
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Image.network(
                    'https://img.jakpost.net/c/2021/01/18/2021_01_18_109951_1610963733._large.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),

                // bottom of the post
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      //mood, comment, share
                      MoodContainer(),
                      Divider(
                        thickness: 1,
                      ),

                      //ignore, hide, delete, block
                      PostActionContainer(),
                      Divider(
                        thickness: 1,
                      ),

                      //show all reported comment on this post
                      Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ReportContainer(
                                header: true,
                              ),
                              ReportContainer(),
                              ReportContainer(),
                              ReportContainer(),
                              ReportContainer(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
