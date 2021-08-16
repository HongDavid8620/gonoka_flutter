import 'package:flutter/material.dart';
import 'package:gonoka/view/component/postCard.dart';

class AllPost extends StatefulWidget {
  const AllPost({Key? key}) : super(key: key);

  @override
  _AllPostState createState() => _AllPostState();
}

class _AllPostState extends State<AllPost> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            //card column
            //allPost = true ,for only remove ignore action from postcard
            PostCard(
              allPost: true,
            ),
            PostCard(
              allPost: true,
            ),
            PostCard(
              allPost: true,
            ),
          ],
        ),
      ),
    );
  }
}
