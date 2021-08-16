import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gonoka/view/allPost.dart';
import 'package:gonoka/view/reportPost.dart';
import 'package:gonoka/view/susPost.dart';

//mainpage for wrapping (all post, Suspicous post, report post)

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  var _selectedpage = 0;
  int _selectedMenu = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedpage = index;
      print(_selectedpage);
    });
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(statusBarColor: Colors.transparent
    //         //color set to transperent or set your own color
    //         ));
    return Scaffold(
      drawer: Container(
        color: Colors.blueGrey[900],
        width: 250,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            //drawer header (active user)
            Container(
              height: 180,
              child: DrawerHeader(
                child: Stack(
                  children: [
                    Positioned(
                        top: -10,
                        right: -10,
                        child: IconButton(
                          icon: Icon(
                            Icons.west,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                    Positioned(
                      bottom: 0,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFe0f2f1)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Sasuke uchiha',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal)),
                              Text('example@cotafer.com',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            //Body of drawer
            ListDrawer(
              selectedMenu: _selectedMenu,
              icon: Icons.home_outlined,
              text: 'Newsfeed',
              indexMenu: 0,
              onTap: () {
                setState(() {
                  _selectedMenu = 0;
                  Navigator.pop(context);
                });
              },
            ),
            ListDrawer(
              selectedMenu: _selectedMenu,
              icon: Icons.library_books_outlined,
              text: 'Books',
              indexMenu: 1,
              onTap: () {
                setState(() {
                  _selectedMenu = 1;

                  Navigator.pop(context);
                });
              },
            ),
            ListDrawer(
              selectedMenu: _selectedMenu,
              icon: Icons.feed_outlined,
              text: 'News',
              indexMenu: 2,
              onTap: () {
                setState(() {
                  _selectedMenu = 2;
                  Navigator.pop(context);
                });
              },
            ),
            ListDrawer(
              selectedMenu: _selectedMenu,
              icon: Icons.video_library_outlined,
              text: 'Newsfeed',
              indexMenu: 3,
              onTap: () {
                setState(() {
                  _selectedMenu = 3;
                  Navigator.pop(context);
                });
              },
            ),
            //Divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(
                color: Colors.white,
              ),
            ),
            ListDrawer(
              selectedMenu: _selectedMenu,
              icon: Icons.rate_review_outlined,
              text: 'Book Review',
              indexMenu: 4,
              onTap: () {
                setState(() {
                  _selectedMenu = 4;
                  Navigator.pop(context);
                });
              },
            ),
            ListDrawer(
              selectedMenu: _selectedMenu,
              icon: Icons.chat_bubble_outline_sharp,
              text: 'Comment',
              indexMenu: 5,
              onTap: () {
                setState(() {
                  _selectedMenu = 5;
                  Navigator.pop(context);
                });
              },
            ),
            //Divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(
                color: Colors.white,
              ),
            ),
            ListDrawer(
              selectedMenu: _selectedMenu,
              icon: Icons.history,
              text: 'History',
              indexMenu: 6,
              onTap: () {
                setState(() {
                  _selectedMenu = 6;
                  Navigator.pop(context);
                });
              },
            ),
            ListDrawer(
              selectedMenu: _selectedMenu,
              icon: Icons.logout_outlined,
              text: 'Sign Out',
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Newsfeed'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            color: Colors.black,
            iconSize: 33,
            onPressed: () {},
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedpage,
        children: [AllPost(), SusPost(), ReportPost()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedpage,
        selectedItemColor: Colors.redAccent,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.wysiwyg),
            label: 'All Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: 'Suspicious post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'Post Reporter',
          ),
        ],
      ),
    );
  }
}

//Container of each drawer item
class ListDrawer extends StatelessWidget {
  const ListDrawer(
      {Key? key,
      required int selectedMenu,
      this.icon,
      this.text,
      this.indexMenu,
      this.onTap})
      : _selectedMenu = selectedMenu,
        super(key: key);

  final int _selectedMenu;
  final icon;
  final String? text;
  final indexMenu;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _selectedMenu == indexMenu ? Colors.blueGrey[700] : null,
      child: ListTile(
        onTap: onTap,
        title: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 27,
            ),
            SizedBox(
              width: 10,
            ),
            Text('$text',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.normal))
          ],
        ),
      ),
    );
  }
}
