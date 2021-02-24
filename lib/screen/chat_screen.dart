import 'package:flutter/material.dart';
import '../models/chatUserModel.dart';
import '../widget/conversationList.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController searchController = TextEditingController(text: '');

  final List<ChatUsers> chatUsers = [
    ChatUsers(
        name: 'Michael Grant',
        messageText: 'You: Tnanks',
        imageURL: 'https://i.pravatar.cc/150?img=2',
        time: 'Yestterday',
        labelContact: Container()),
    ChatUsers(
        name: 'Daren Swinney',
        messageText: 'Darren: Perhaps, if there was some...',
        imageURL: 'https://i.pravatar.cc/150?img=3',
        time: '13:24',
        labelContact: labelContact('Challenge', Colors.red, Colors.white)),
    ChatUsers(
        name: 'Alexander Murphy',
        messageText: 'Alexander: Based on what you`ve told...',
        imageURL: 'https://i.pravatar.cc/150?img=4',
        time: 'Mon',
        labelContact: labelContact('Help Req.', Colors.yellow, Colors.black)),
    ChatUsers(
        name: 'Stphanie Jones',
        messageText: 'You: What time do you think you`ll be...',
        imageURL: 'https://i.pravatar.cc/150?img=5',
        time: '14:48',
        labelContact: Container()),
    ChatUsers(
        name: 'Julie McAndrew',
        messageText: 'You: Thanks, Julie!',
        imageURL: 'https://i.pravatar.cc/150?img=6',
        time: '14:48',
        labelContact:
            labelContact('Engagement Partner', Colors.black45, Colors.white)),
    ChatUsers(
        name: 'Dilan Edmonds',
        messageText: 'You: Call me',
        imageURL: 'https://i.pravatar.cc/150?img=7',
        time: '2d ago',
        labelContact: Container()),
    ChatUsers(
        name: 'Andy Jones',
        messageText: 'Andy: Can you share the file?',
        imageURL: 'https://i.pravatar.cc/150?img=8',
        time: '11 Feb',
        labelContact: Container()),
    ChatUsers(
        name: 'John Wick',
        messageText: 'You: Do you went to gym?',
        imageURL: 'https://i.pravatar.cc/150?img=9',
        time: '02 Feb',
        labelContact: Container()),
  ];

  @override
  void initState() {
    searchController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = filterContacts(chatUsers);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 50,
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          BorderSide(color: Colors.blueGrey, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.blueGrey,
                    ),
                    labelText: 'Search...',
                    fillColor: Colors.white,
                    filled: true,
                    labelStyle: TextStyle(color: Colors.grey)),
              ),
            ),
          ),
          ListView.builder(
            itemCount: filtered.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 16),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final user = filtered[index];
              return Column(
                children: <Widget>[
                  ConversationList(
                    name: user.name,
                    messageText: user.messageText,
                    imageUrl: user.imageURL,
                    time: user.time,
                    withLabel:
                        (index == 1 || index == 2 || index == 4) ? true : false,
                    labelContact: user.labelContact,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(thickness: 1.0, height: 2),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  List<ChatUsers> filterContacts(List<ChatUsers> chatUsers) {
    return chatUsers.where((element) {
      final containsInName = element.name
              ?.trim()
              ?.toLowerCase()
              ?.contains(searchController.text) ??
          false;
      return containsInName;
    }).toList();
  }
}
