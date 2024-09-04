
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/chat/Api/service/chat_controller.dart';

import '../Api/data/model/chat_model.dart';

class ChatDetailPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final ChatModel chatModel;

  const ChatDetailPageAppBar({super.key, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  ChatsController chatsController = Get.find<ChatsController>();
                  chatsController.cuurnetOpenChat = 0;
                  chatsController.getChats();
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              CircleAvatar(
                backgroundColor: Colors.blue.withOpacity(0.3),
                maxRadius: 30,
                child: Center(
                  child: Text(
                    chatModel.participants[1].user.firstName[0],
                    style: const TextStyle(color: Colors.blue, fontSize: 30),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      chatModel.participants[1].user.firstName,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Text(
                      "Online",
                      style: TextStyle(color: Colors.green, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.more_vert,
                color: Colors.grey.shade700,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
