import 'package:flutter/material.dart';

//report container under the post
class ReportContainer extends StatelessWidget {
  const ReportContainer({Key? key, this.header}) : super(key: key);
  final header;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Headder
          //if headder
          header != null
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Report  ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '31',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.normal))
                  ])),
                )
              : SizedBox(),

          //Report body
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
            decoration: BoxDecoration(
              color: Color.fromRGBO(222, 222, 222, 0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text('Name',
                          style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.normal)),
                    ),
                    Text('01 Jun 2021  10:23 AM',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.normal))
                  ],
                ),
                Text(
                    'She meets all company standards for attendance and punctuality. You schedule your time off in advance and can be relied upon for completing your tasks on time.')
              ],
            ),
          )
        ],
      ),
    );
  }
}
