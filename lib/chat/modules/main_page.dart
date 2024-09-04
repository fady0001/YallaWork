
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/chat/Api/class/handlingdataview.dart';
import 'package:untitled3/chat/Api/service/chat_controller.dart';

import 'chat_page.dart';

class MainPageChat extends StatelessWidget {
  const MainPageChat({super.key});

  @override
  Widget build(BuildContext context) {
    ChatsController controller = Get.find<ChatsController>();
    return Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   icon: const Icon(Icons.chat_outlined),
          //   onPressed: () {
          //     controller.addChat(idUser: '7');
          //   },
          // ),
        ),
        body: GetBuilder<ChatsController>(
            init: ChatsController(),
            builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: const ChatPage(),
              );
            }));
  }
}
