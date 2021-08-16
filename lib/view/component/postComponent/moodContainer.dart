import 'package:flutter/material.dart';
import 'package:gonoka/view/component/ModalBottom/showCommentSheet.dart';
import 'package:gonoka/view/component/ModalBottom/showMoodSheet.dart';

//mood on bottom of post container
class MoodContainer extends StatelessWidget {
  const MoodContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Moods
          InkWell(
            onTap: () {
              var moodSheet = ShowMoodBottomSheet();
              moodSheet.showMoodBottomSheet(context: context);
            },
            child: Text(
              '853k',
              style: TextStyle(color: Colors.black38),
            ),
          ),

          //comment and share
          Container(
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    var commentSheet = ShowCommentBottomSheet();
                    commentSheet.showCommentBottomSheet(context: context);
                  },
                  child: Text('23 Comment',
                      style: TextStyle(color: Colors.black38)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
                  child: Icon(
                    Icons.fiber_manual_record_sharp,
                    size: 5,
                    color: Colors.black38,
                  ),
                ),
                Text('234 Share', style: TextStyle(color: Colors.black38)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
