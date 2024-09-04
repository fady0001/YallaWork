
import 'package:flutter/material.dart';
import 'package:untitled3/chat/Api/class/statusrequest.dart';


class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: CircularProgressIndicator())
        : statusRequest == StatusRequest.offlinefailure
            ? const Center(
                child:
                    Text('No Internet'))
            : statusRequest == StatusRequest.failure
                    ? const Center(
                        child:  Text('worng'))
                    : widget;
  }
}
