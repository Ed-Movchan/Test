import 'package:flutter/material.dart';

class ChatUsers {
  String name;
  String messageText;
  String imageURL;
  String time;
  Widget labelContact;

  ChatUsers(
      {@required this.name,
      @required this.messageText,
      @required this.imageURL,
      @required this.time,
      @required this.labelContact});
}
