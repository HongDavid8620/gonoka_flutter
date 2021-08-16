import 'package:flutter/material.dart';
import 'package:gonoka/view/component/ModalBottom/showBlockSheet.dart';
import 'package:gonoka/view/component/showDeleteDialog.dart';

//action icon for every post
class PostActionContainer extends StatefulWidget {
  const PostActionContainer({Key? key, this.allPost}) : super(key: key);

  // need allpost to check if use in all post and don't the ignore icon
  final bool? allPost;
  @override
  _PostActionContainerState createState() => _PostActionContainerState();
}

class _PostActionContainerState extends State<PostActionContainer> {
  var visible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Action icon
            if (widget.allPost == null)
              InkWell(
                onTap: () {
                  print('Ignore');
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.remove_circle,
                      color: Colors.black87,
                    ),
                    Text('Ignore',
                        style: TextStyle(
                          color: Colors.black87,
                        ))
                  ],
                ),
              ),
            InkWell(
              onTap: () {
                setState(() {
                  visible = !visible;
                });
                print('Hided');
              },
              child: Column(
                children: [
                  Icon(
                    visible ? Icons.visibility_off : Icons.visibility,
                    color: Colors.blue[900],
                  ),
                  Text(
                    'Hide',
                    style: TextStyle(color: Colors.blue[900]),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                var dialogAlert = ShowDeleteDialog();
                dialogAlert.confirmDeleteDialog(context);
                print('Deleted');
              },
              child: Column(
                children: [
                  Icon(
                    Icons.delete_outline,
                    color: Colors.yellow[700],
                  ),
                  Text(
                    'Delete',
                    style: TextStyle(color: Colors.yellow[700]),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                // bottomSheet.showLikeBottomSheet(context);
                var blockBottomSheet = ShowBlockBottomSheet();
                blockBottomSheet.showBlockBottomSheet(context: context);
                print('Blocked');
              },
              child: Column(
                children: [
                  Icon(
                    Icons.block,
                    color: Colors.red[400],
                  ),
                  Text(
                    'Block',
                    style: TextStyle(color: Colors.red[400]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
