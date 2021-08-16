import 'package:flutter/material.dart';
import 'package:gonoka/view/component/postCard.dart';

class ReportPost extends StatefulWidget {
  const ReportPost({Key? key}) : super(key: key);

  @override
  _ReportPostState createState() => _ReportPostState();
}

class _ReportPostState extends State<ReportPost> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            //card column
            PostCard(
              report: true,
            ),
            PostCard(
              report: true,
            ),
            PostCard(
              report: true,
            ),
          ],
        ),
      ),
    );
  }
}
