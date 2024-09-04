import 'dart:convert';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:untitled3/chat/Api/class/statusrequest.dart';

import '../linkapi.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(
      String linkurl, Map data, Map<String, String> headers) async {
    // if (await checkInternet()) {
    headers.addAll(
      {'Authorization': "Bearer ${AppLink.token}"},
    );
    var response =
        await http.post(Uri.parse(linkurl), body: data, headers: headers);
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);
      print(responsebody);

      return Right(responsebody);
    } else {
      return const Left(StatusRequest.failure);
    }
    // } else {
    //   return const Left(StatusRequest.offlinefailure);
    // }
  }

  Future<Either<StatusRequest, Map>> getData(
      String linkurl, Map<String, String> headers) async {
    print("................1");
    // if (await checkInternet()) {

    var response = await http.get(
      Uri.parse(linkurl),
      headers: {'Authorization': "Bearer ${AppLink.token}"},
    );
    print(response.statusCode);
    print('=======$response');
    print('hiiii ghinaaaaaa');

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);
      print('=======$response');
      // print(responsebody['data'].length);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.failure);
    }
    // }
    //  else {
    //   print("============================================================5");

    //   return const Left(StatusRequest.offlinefailure);
    // }
  }

  postFileAndData(
    String linkUrl,
    Map data,
    Map<String, String> headers,
    Uint8List file,
    String filePath,
  ) async {
    headers.addAll(
      {'Authorization': "Bearer ${AppLink.token}"},
    );
    var request = http.MultipartRequest('Post', Uri.parse(linkUrl));

    var multiFile = http.MultipartFile.fromBytes('image', file,
        filename: basename(filePath));
    request.files.add(multiFile);
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    request.headers.addAll(headers);

    var myRequest = await request.send();
    var response = await http.Response.fromStream(myRequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);

      print("postMultiData1============ $responsebody");

      return Right(responsebody);
    } else {
      print("postMultiData1============ ${response.body}");

      return const Left(StatusRequest.failure);
    }
  }
}
