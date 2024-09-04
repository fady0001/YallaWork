
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:untitled3/chat/Api/data/data_source/ChatsData.dart';
import '../class/handingdatacontroller.dart';
import '../class/statusrequest.dart';
import '../data/model/chat_model.dart';
import '../data/model/msg_model.dart';

// ignore: camel_case_types
class ChatsController extends GetxController {
  TextEditingController msg = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  List<MessageModel> listMsgs = [];
  List<ChatModel> listChats = [];
  int cuurnetOpenChat = 0, pageNumber = 1;
  bool _hasNextPage = true;
  bool isFetchingMore = false;
  final ScrollController scrollController = ScrollController();
  List<int> listChatsId = [];
  ChatsData chatsData = ChatsData();
  double lastPosition = 0;

  @override
  void onInit() {
    // getChats();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !isFetchingMore &&
          _hasNextPage) {
        pageNumber++;
        getMoreMessages(cuurnetOpenChat.toString());
      }
    });

    super.onInit();
  }

  getMessages(String idChat) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await chatsData.getAllMsg(idChat, pageNumber.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List data = response['messages'] as List;
      // data = data.reversed.toList();
      print(data.length);
      listMsgs = data.map((json) => MessageModel.fromJson(json)).toList();
      update();
    } else {
      statusRequest = StatusRequest.failure;
      update();
    }
  }

  getMoreMessages(String idChat) async {
    if (isFetchingMore) return;
    isFetchingMore = true;
    statusRequest = StatusRequest.loading;
    update();
    var response = await chatsData.getAllMsg(idChat, pageNumber.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List data = response['messages'];
      data = data.reversed.toList();
      _hasNextPage = data.isNotEmpty;
      data.map((json) => listMsgs.add(MessageModel.fromJson(json))).toList();
      isFetchingMore = false;
      update();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent - 260,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      });
    } else {
      statusRequest = StatusRequest.failure;
      update();
    }
  }

  Future<void> getChats() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await chatsData.getAllChats();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List data = response['chats'];
      listChats = data.map((json) => ChatModel.fromJson(json)).toList();
      for (var element in listChats) {
        listChatsId.add(element.id);
      }
      update();
    } else {
      statusRequest = StatusRequest.failure;
      update();
    }
  }

  sendMsg(String idChat) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await chatsData.sendMsg(msg.text.toString(), idChat.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Map<String, dynamic> data = response['chat_message'];
      listMsgs.insert(0, MessageModel.fromJson(data));
      msg.clear();
      update();
    } else {
      statusRequest = StatusRequest.failure;
      update();
    }
  }

  addChat({required String idUser}) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await chatsData.addChat(idUser.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Map<String, dynamic> data = response['chat'];
      listChats.add(ChatModel.fromJson(data));
      PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
      pusher.subscribe(
          channelName: 'private-chat.${ChatModel.fromJson(data).id}');
      update();
    } else {
      statusRequest = StatusRequest.failure;
      update();
    }
  }
}
