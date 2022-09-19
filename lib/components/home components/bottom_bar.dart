import 'package:chat_new/screens/stories_screen.dart';
import 'package:chat_new/screens/home.dart';
import 'package:flutter/material.dart';

import '../../screens/messages/message_box_screen.dart';
import '../../screens/settings_screen.dart';


class BottomBar extends StatefulWidget {
  List? users;

  BottomBar({Key? key, required int this.selectedIndex, this.color})
      : super(key: key);
  Color? color;
  int selectedIndex = 0;
  @override
  State<BottomBar> createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  List<Widget> screens = [
    HomePage(),
    Stories(),
    MessageScreen(
     users: [],
    
    ),
    Settingsscreen()
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selectedIndex,
      onTap: (value) {
        setState(() {
          widget.selectedIndex = value;
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (context) {
              return screens[value];
            },
          ), (route) => false);
          print(widget.selectedIndex.toString());
        });
      },
      elevation: 0, // to get rid of the shadow
      backgroundColor: widget.color ??
          Colors
              .transparent, // transparent, you could use 0x44aaaaff to make it slightly less transparent with a blue hue.
      type: BottomNavigationBarType.fixed,

      unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
      selectedItemColor: Color.fromARGB(255, 255, 255, 255),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.home, size: 67),
          icon: Icon(
            Icons.home,
            size: 40,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.search, size: 67),
          icon: Icon(
            Icons.search,
            size: 40,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.message, size: 67),
          icon: Icon(
            Icons.message,
            size: 40,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.settings, size: 67),
          icon: Icon(
            Icons.settings,
            size: 40,
          ),
          label: '',
        ),
      ],
    );
  }
}
