
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled3/chat/Api/data/model/chat_model.dart';
import '../Api/service/chat_controller.dart';
import '../modules/chat_detail_page.dart';

// ignore: must_be_immutable
class ChatUsersList extends StatefulWidget {
  String text;
  ChatModel chatModel;
  String secondaryText;
  String image;
  String time;
  bool isMessageRead;
  ChatUsersList(
      {super.key,
      required this.text,
      required this.chatModel,
      required this.secondaryText,
      required this.image,
      required this.time,
      required this.isMessageRead});
  @override
  _ChatUsersListState createState() => _ChatUsersListState();
}

class _ChatUsersListState extends State<ChatUsersList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ChatsController chatsController = Get.find<ChatsController>();
        chatsController.getMessages(widget.chatModel.id.toString());
        chatsController.cuurnetOpenChat = widget.chatModel.id;
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatDetailPage(
            chatModel: widget.chatModel,
          );
        }));
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.blue.withOpacity(0.3),
                    maxRadius: 30,
                    child: Center(
                      child: Text(
                        widget.text[0],
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 30),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.text),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.secondaryText,
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.time,
              style: TextStyle(
                  fontSize: 12,
                  color: widget.isMessageRead
                      ? Colors.pink
                      : Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }
}
