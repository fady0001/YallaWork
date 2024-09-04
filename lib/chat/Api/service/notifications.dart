//Notifications

import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> initializeLocalNotifications() async {
  await AwesomeNotifications().initialize(
    null, //'resource://drawable/res_app_icon',//
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Alerts',
        channelDescription: 'Notification tests as alerts',
        playSound: true,
        onlyAlertOnce: true,
        groupAlertBehavior: GroupAlertBehavior.Children,
        importance: NotificationImportance.High,
        defaultPrivacy: NotificationPrivacy.Private,
      )
    ],
  );
}

Future<void> startListeningNotificationEvents() async {
  AwesomeNotifications().setListeners(
      onActionReceivedMethod: (ReceivedAction receivedAction) async {
    // Get.offAll(screenWidget);
  });
}

showNotification(String title, String body, id) {
  AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: id,
        channelKey: 'basic_channel',
        title: title,
        body: body,
        category: NotificationCategory.Message,
        // backgroundColor: AppColor.primaryColor,
        // color: AppColor.primaryColor,
        notificationLayout: NotificationLayout.BigPicture,
        actionType: ActionType.Default),
  );
}
