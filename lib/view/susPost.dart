import 'package:flutter/material.dart';
import 'package:gonoka/view/component/postCard.dart';

class SusPost extends StatefulWidget {
  const SusPost({Key? key}) : super(key: key);

  @override
  _SusPostState createState() => _SusPostState();
}

class _SusPostState extends State<SusPost> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            //card column
            //sus = true ,for show type of Suspicous text on top of post
            PostCard(
              sus: true,
            ),
            PostCard(
              sus: true,
            ),
            PostCard(
              sus: true,
            ),
          ],
        ),
      ),
    );
  }
}
