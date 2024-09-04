
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/chat/Api/class/handlingdataview.dart';
import 'package:untitled3/chat/Api/data/model/chat_model.dart';
import 'package:untitled3/features/add/widget/colors.dart';
import '../Api/data/model/msg_model.dart';
import '../Api/linkapi.dart';
import '../Api/service/chat_controller.dart';
import '../components/chat_bubble.dart';
import '../components/chat_detail_page_appbar.dart';
import '../models/chat_message.dart';
import '../models/send_menu_items.dart';

enum MessageType {
  Sender,
  Receiver,
}

// ignore: must_be_immutable
class ChatDetailPage extends StatefulWidget {
  ChatModel chatModel;
  ChatDetailPage({
    super.key,
    required this.chatModel,
  });

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  List<ChatMessage> chatMessage = [
    ChatMessage(message: "Hi John", type: MessageType.Receiver),
  ];

  List<SendMenuItems> menuItems = [
    SendMenuItems(
        text: "Photos & Videos", icons: Icons.image, color: Colors.amber),
    SendMenuItems(
        text: "Document", icons: Icons.insert_drive_file, color: Colors.blue),
    SendMenuItems(text: "Audio", icons: Icons.music_note, color: Colors.orange),
    SendMenuItems(
        text: "Location", icons: Icons.location_on, color: Colors.green),
    SendMenuItems(text: "Contact", icons: Icons.person, color: Colors.purple),
  ];

  void showModal() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height / 2,
            color: const Color(0xff737373),
            child: Container(
              decoration:  BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Container(
                      height: 4,
                      width: 50,
                      color: Colors.grey.shade200,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    itemCount: menuItems.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: menuItems[index].color.shade50,
                            ),
                            height: 50,
                            width: 50,
                            child: Icon(
                              menuItems[index].icons,
                              size: 20,
                              color: menuItems[index].color.shade400,
                            ),
                          ),
                          title: Text(menuItems[index].text),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatDetailPageAppBar(
        chatModel: widget.chatModel,
      ),
      body: GetBuilder<ChatsController>(
          init: ChatsController(),
          builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Stack(
                  children: <Widget>[
                    ListView.builder(
                      reverse: true,
                      controller: controller.scrollController,
                      itemCount: controller.listMsgs.length + 1,
                      // shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 60, bottom: 100),
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        controller.lastPosition =
                            controller.scrollController.position.pixels;
                        if (index == controller.listMsgs.length) {
                          return Center(
                            child: controller.isFetchingMore
                                ? const CircularProgressIndicator()
                                : const SizedBox(
                                    height: 20,
                                  ),
                          );
                        }
                        MessageModel messageModel = controller.listMsgs[index];
                        return ChatBubble(
                          chatMessage: ChatMessage(
                              message: messageModel.message,
                              type:
                                  AppLink.myId != messageModel.userId.toString()
                                      ? MessageType.Receiver
                                      : MessageType.Sender),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, bottom: 10),
                        height: 80,
                        width: double.infinity,
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[

                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: TextField(
                                controller: controller.msg,
                                decoration: InputDecoration(
                                    hintText: "Type message...",
                                    hintStyle:
                                        TextStyle(color: Colors.grey.shade500),
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.only(right: 30, bottom: 50),
                        child: FloatingActionButton(
                          onPressed: () {
                            if (controller.msg.text.isNotEmpty) {
                              controller
                                  .sendMsg(widget.chatModel.id.toString());
                            }
                          },
                          backgroundColor: Colors.pink,
                          elevation: 0,
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ));
          }),
    );
  }
}
