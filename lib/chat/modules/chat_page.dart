
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:untitled3/chat/Api/data/model/chat_model.dart';
import 'package:untitled3/chat/Api/service/chat_controller.dart';
import '../Api/class/handlingdataview.dart';
import '../components/chat.dart';
import '../models/chat_users.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        text: "Jane Russel",
        secondaryText: "Awesome Setup",
        image: "assets/images/userImage1.jpeg",
        time: "Now"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ChatsController>(
          init: ChatsController(),
          builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SafeArea(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 16, right: 16, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Chats",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),

                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 16, left: 16, right: 16),
                        // child: TextField(
                        //   decoration: InputDecoration(
                        //     hintText: "Search...",
                        //     hintStyle: TextStyle(color: Colors.grey.shade400),
                        //     prefixIcon: Icon(
                        //       Icons.search,
                        //       color: Colors.grey.shade400,
                        //       size: 20,
                        //     ),
                        //     filled: true,
                        //     fillColor: Colors.grey.shade100,
                        //     contentPadding: const EdgeInsets.all(8),
                        //     enabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(30),
                        //         borderSide:
                        //             BorderSide(color: Colors.grey.shade100)),
                        //   ),
                        // ),
                      ),
                      ListView.builder(
                        itemCount: controller.listChats.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 16),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          ChatModel chatModel = controller.listChats[index];
                          return ChatUsersList(
                            chatModel: chatModel,
                            text: chatModel.participants[1].user.firstName,
                            secondaryText: chatModel.lastMessage != null
                                ? chatModel.lastMessage!.message
                                : '',
                            image: chatUsers[0].image,
                            time: formatTime(chatModel.updatedAt),
                            isMessageRead: true,
                          );
                        },
                      ),
                    ],
                  ),
                ));
          }),
    );
  }

  String formatTime(String dateString) {
    // Parse the date string into a DateTime object
    DateTime dateTime = DateTime.parse(dateString);

    // Format the DateTime to a 12-hour format with AM/PM
    String formatted = DateFormat.jm().format(dateTime);

    return formatted; // e.g., "11:37 AM" or "11:37 PM"
  }
}
