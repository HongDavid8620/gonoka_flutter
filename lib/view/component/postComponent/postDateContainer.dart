import 'package:flutter/material.dart';

//date on top of post container
class PostDateContainer extends StatelessWidget {
  const PostDateContainer({Key? key, this.resize}) : super(key: key);
  final double? resize;

  @override
  Widget build(BuildContext context) {
    double size = 1;
    if (resize != null || resize == 0) {
      size = resize!;
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '01 Jun 2021',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 15 * size),
          ),

          // small dot
          Padding(
            padding: const EdgeInsets.only(left: 3, right: 3, bottom: 3),
            child: Icon(
              Icons.fiber_manual_record_sharp,
              size: 5 * size,
              color: Colors.black38,
            ),
          ),
          Text('4 hours ago',
              style: TextStyle(color: Colors.black38, fontSize: 14 * size)),
          // small dot
          Padding(
            padding: const EdgeInsets.only(left: 3, right: 3, bottom: 3),
            child: Icon(
              Icons.fiber_manual_record_sharp,
              size: 5 * size,
              color: Colors.black38,
            ),
          ),
          //samll icon
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(
              Icons.public,
              size: 13 * size,
              color: Colors.black38,
            ),
          )
        ],
      ),
    );
  }
}
