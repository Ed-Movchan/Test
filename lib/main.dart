import 'package:flutter/material.dart';
import 'package:flutter_application_test/widget/chatAppBar.dart';
import 'package:flutter_application_test/screen/chat_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Chat(),
    );
  }
}

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    ChatScreen(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purpleAccent,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_outlined),
            label: "More",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}