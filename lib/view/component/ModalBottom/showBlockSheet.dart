import 'package:flutter/material.dart';
import 'package:gonoka/view/component/ModalBottom/showBottomSheetCustom.dart';

//Show bottom sheet class(Mood and comment)

class ShowBlockBottomSheet {
  void showBlockBottomSheet({context}) {
    //check which Sheet
    showModalBottomSheetCustom(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        context: context,
        builder: (context) {
          return BlockSheetWidget();
        });
  }
}

//report container for bottom sheet
class BlockSheetWidget extends StatefulWidget {
  const BlockSheetWidget({
    Key? key,
  }) : super(key: key);
  @override
  _BlockSheetWidgetState createState() => _BlockSheetWidgetState();
}

class _BlockSheetWidgetState extends State<BlockSheetWidget> {
  int? selectedRadio;
  setSelectedRadio(val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Wrap(children: [
      //Black bar
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          color: Colors.white,
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 8),
            child: Container(
                height: 4,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.all(Radius.circular(10))))),
      ),

      //block sheet body
      Container(
        width: double.infinity,
        color: Color.fromRGBO(222, 222, 222, 0.5),
        child: Wrap(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Block profile temporarily',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text('User gets unblocked automatically',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.black38)),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _radioContainer(
                    selectedRadio: selectedRadio, value: 1, hours: '6 Hours'),
                _radioContainer(
                    selectedRadio: selectedRadio, value: 2, hours: '12 Hours'),
                _radioContainer(
                    selectedRadio: selectedRadio, value: 3, hours: '24 Hours'),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 17),
                    child: Text(
                      'Block profile',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    )),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 17, vertical: 3),
                    child: Text(
                        'User must contact admin requesting to be unblocked if they want to get their profile back.',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.black38))),
                _radioContainer(
                    selectedRadio: selectedRadio, value: 4, hours: 'Block'),
              ],
            ),
          ),
          Container(
            height: 7,
          ),
          Center(
            child: SizedBox(
              width: 280,
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.redAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ))),
                  child: Text(
                    'Block',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),
        ]),
      ),
    ]));
  }

// Making container for radio
  Widget _radioContainer({selectedRadio, int? value, hours}) {
    return Container(
      height: 35,
      child: Row(
        children: [
          Radio(
            activeColor: Colors.red,
            value: value!,
            groupValue: selectedRadio,
            onChanged: (val) {
              print("Radio Tile pressed $val");
              setSelectedRadio(val);
            },
          ),
          Text('$hours')
        ],
      ),
    );
  }
}
