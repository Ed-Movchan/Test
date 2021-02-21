import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      leading: Container(
        padding: EdgeInsets.only(left: 20),
        height: 40,
        width: 40,
        child: GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            radius: 40.0,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=1'),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      centerTitle: true,
      title: Text('Chat'),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: IconButton(
            icon: Icon(Icons.message, size: 35.0),
            onPressed: () => {},
          ),
        ),
      ],
    );
  }
}
