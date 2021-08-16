import 'package:flutter/material.dart';

class ShowDeleteDialog {
  confirmDeleteDialog(BuildContext context) {
    // set up the buttons
    //Cancel Button
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ))),
      onPressed: () {
        Navigator.pop(context);
        // print('Cancel');
      },
    );

    // Submit Button
    Widget continueButton = TextButton(
      child: Text("Yes"),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ))),
      onPressed: () {
        Navigator.pop(context);
        print('Yes');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Post"),
      content: Text("Would you like to delete this post?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
