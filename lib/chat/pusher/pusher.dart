import 'dart:convert';
import 'dart:math';



import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:untitled3/chat/Api/service/chat_controller.dart';

import '../Api/data/model/msg_model.dart';
import '../Api/data/model/notification_model.dart';
import '../Api/linkapi.dart';
import '../Api/service/notifications.dart';

class PusherController extends GetxController {
  String pusherAppKey = '61270d1f5bd8be2fd993';
  String pusherAppCluster = 'ap1';
  String pusherAppSecret = 'ec895da7d4eb506c65a6';
  List<int> chatIds = [];
  PusherChannelsFlutter? pusher;
  ChatsController chatsController = Get.put(ChatsController());

  @override
  void onInit() async {
    super.onInit();
    print('pusher init.....');

    await chatsController.getChats().then((value) {
      Future.delayed(const Duration(seconds: 1));
      chatIds = chatsController.listChatsId;
      if (chatIds.isEmpty) {
        for (var i = 0; i < 100; i++) {
          chatIds.add(i);
        }
      }
      pusher = PusherChannelsFlutter.getInstance();
      onConnect();
    });
  }

  @override
  void onClose() {
    // Unsubscribe from all channels
    for (int chatId in chatIds) {
      pusher?.unsubscribe(channelName: 'private-chat.$chatId');
    }
    super.onClose();
  }

  void log(String text) {
    print("LOG: $text");
  }

  void onConnect() async {
    try {
      await pusher?.init(
        apiKey: pusherAppKey,
        cluster: pusherAppCluster,
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: onEvent,
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
        onSubscriptionCount: onSubscriptionCount,
        onAuthorizer: onAuthorizer,
      );

      await pusher?.connect();

      // Subscribe to each chat channel
      for (int chatId in chatIds) {
        String channelName = 'private-chat.$chatId';
        await pusher?.subscribe(channelName: channelName);
        log("Subscribed to channel: $channelName");
      }
    } catch (e) {
      log("ERROR: $e");
    }
  }

  String getSignature(String value) {
    var key = utf8.encode(pusherAppSecret);
    var bytes = utf8.encode(value);

    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);
    return digest.toString();
  }

  dynamic onAuthorizer(String channelName, String socketId, dynamic options) {
    return {
      "auth": "$pusherAppKey:${getSignature("$socketId:$channelName")}",
    };
  }

  void onDecryptionFailure(String event, String reason) {
    log("onDecryptionFailure: $event reason: $reason");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    log("onMemberAdded: $channelName user: $member");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    log("onMemberRemoved: $channelName user: $member");
  }

  void onSubscriptionCount(String channelName, int subscriptionCount) {
    log("onSubscriptionCount: $channelName subscriptionCount: $subscriptionCount");
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    log("Connection: $currentState");
  }

  void onError(String message, int? code, dynamic e) {
    log("onError: $message code: $code exception: $e");
  }

  void onEvent(PusherEvent event) {
    log("onEvent: ${event.data}");
    // Handle the incoming event data (if needed)
    if (event.data.runtimeType == String) {
      var data = jsonDecode(event.data);
      NotificationModel notificationModel = NotificationModel.fromJson(data);
      if (true) {
        print('ghimaaaaaaaaaa');
        showNotification(

            "${notificationModel.message.user.firstName}( ${notificationModel.message.user.email} )",

            notificationModel.message.message,

            Random().nextInt(1000));
      }

      if (chatsController.cuurnetOpenChat != 0 &&
          chatsController.cuurnetOpenChat == notificationModel.chatId &&
          notificationModel.message.userId.toString() != AppLink.myId) {
        MessageModel messageModel = MessageModel(
            id: notificationModel.message.id,
            userId: notificationModel.message.userId,
            chatId: notificationModel.message.chatId,
            message: notificationModel.message.message,
            user: notificationModel.message.user);
        chatsController.listMsgs.insert(0, messageModel);
        chatsController.update();
        // chatsController.getMessages(chatsController.cuurnetOpenChat.toString());
      }
    }
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    log("onSubscriptionSucceeded: $channelName data: $data");
    final me = pusher?.getChannel(channelName)?.me;
    log("Me ======: $me");
  }

  void onSubscriptionError(String message, dynamic e) {
    log("onSubscriptionError: $message Exception: $e");
  }
}


/*
import 'dart:convert';

import 'package:get/get.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:crypto/crypto.dart';

class PusherController extends GetxController {
  String pusherAppKey = '61270d1f5bd8be2fd993';
  String pusherAppCluster = 'ap1';
  String pusherAppSecret = 'ec895da7d4eb506c65a6';
  int? chatId = 1;
  PusherChannelsFlutter? pusher;
  @override
  void onInit() {
    pusher = PusherChannelsFlutter.getInstance();
    onConnect();

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    //pusher?.unsubscribe(channelName:)
    super.onClose();
  }

  void log(String text) {
    print("LOG: $text");
  }
  // pusher?.trigger(PusherEvent(channelName: 'channelName', eventName: 'eventName',data: []));

  void onConnect() async {
    try {
      await pusher?.init(
          apiKey: pusherAppKey,
          cluster: pusherAppCluster,
          onConnectionStateChange: onConnectionStateChange,
          onError: onError,
          onSubscriptionSucceeded: onSubscriptionSucceeded,
          onEvent: onEvent,
          onSubscriptionError: onSubscriptionError,
          onDecryptionFailure: onDecryptionFailure,
          onMemberAdded: onMemberAdded,
          onMemberRemoved: onMemberRemoved,
          onSubscriptionCount: onSubscriptionCount,
          // authEndpoint: "<Your Authendpoint Url>",
          onAuthorizer: onAuthorizer);
      await pusher?.subscribe(
        channelName: 'private-chat.$chatId',
      );
      await pusher?.connect();
    } catch (e) {
      log("ERROR: $e");
    }
  }

  // void sendMessage() {
  //   final messageData = {"chat_id": "1", "message": "mhmd aloooooo"};
  //   final dataString = json.encode(messageData);
  //   print("Sending message data: $dataString");
  //   pusher?.trigger(PusherEvent(
  //     channelName: 'private-chat.$chatId',
  //     eventName: 'client-message.sent',
  //     data: dataString,
  //   ));
  // }

  getSignature(String value) {
    var key = utf8.encode(pusherAppSecret);
    var bytes = utf8.encode(value);

    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);
    //print("HMAC signature in string is: $digest");
    return digest;
  }

  dynamic onAuthorizer(String channelName, String socketId, dynamic options) {
    return {
      "auth": "$pusherAppKey:${getSignature("$socketId:$channelName")}",
    };
  }

  void onDecryptionFailure(String event, String reason) {
    log("onDecryptionFailure: $event reason: $reason");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    log("onMemberAdded: $channelName user: $member");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    log("onMemberRemoved: $channelName user: $member");
  }

  void onSubscriptionCount(String channelName, int subscriptionCount) {
    log("onSubscriptionCount: $channelName subscriptionCount: $subscriptionCount");
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    log("Connection: $currentState");
  }

  void onError(String message, int? code, dynamic e) {
    log("onError: $message code: $code exception: $e");
  }

  void onEvent(PusherEvent event) {
    log("onEvent: ${event.data}");
    // var data = jsonDecode(event.data);
    // if (data['message'] != null) {}
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    log("onSubscriptionSucceeded: $channelName data: $data");
    final me = pusher?.getChannel(channelName)?.me;
    log("Me ======: $me");
  }

  void onSubscriptionError(String message, dynamic e) {
    log("onSubscriptionError: $message Exception: $e");
  }
}


 */