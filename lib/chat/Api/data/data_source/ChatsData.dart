

import '../../class/crud.dart';
import '../../linkapi.dart';

class ChatsData {
  Crud crud = Crud();

  getAllChats() async {
    Crud crud = Crud();
    var response = await crud.getData(
      AppLink.getAllChats,
      {},
    );
    return response.fold((l) => l, (r) => r);
  }

  getAllMsg(String idChat, String pageNumber) async {
    Crud crud = Crud();
    var response = await crud.getData(
      "${AppLink.getAllMsg}/?chat_id=$idChat&page=$pageNumber",
      {},
    );
    return response.fold((l) => l, (r) => r);
  }

  sendMsg(String msg, String idChat) async {
    Crud crud = Crud();
    var response = await crud
        .postData(AppLink.sendMsg, {"chat_id": idChat, "message": msg}, {});
    return response.fold((l) => l, (r) => r);
  }

  addChat(String idUser) async {
    Crud crud = Crud();
    var response =
        await crud.postData(AppLink.addChat, {"user_id": idUser}, {});
    return response.fold((l) => l, (r) => r);
  }
}
