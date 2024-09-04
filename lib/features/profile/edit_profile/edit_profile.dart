
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_file/open_file.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:untitled3/core/helpers/extensions.dart';
import '../../../constants/app_localizations.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../../../main.dart';
import '../../../networking/api_constants.dart';
import '../../add/Position/Select_Your_Position.dart';
import '../../add/widget/app_text.dart';
import '../../add/widget/shared_preferences.dart';
import '../../home/ui/home_screen.dart';
import '../model/profile_response.dart';


class EditProfile extends StatefulWidget {
  ProfileInformation? profileInformation;
String? MyImageP;
String?Imagedefault;
  EditProfile({super.key, this.profileInformation,this.MyImageP, this.Imagedefault});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController city;
  late TextEditingController first_name;
  late TextEditingController last_name;
  late TextEditingController gender;
  late TextEditingController PersonalInformation;
  late TextEditingController dateController;

  //String imagePath =CachData.getData(key: 'picked_file');
  String token = CachData.getData(key: 'access_token');
  String firstN = CachData.getData(key: 'firstN');
  String lastN = CachData.getData(key: 'lastN');
  String Gender = CachData.getData(key: 'gender');

  String extractPath(String fullPath) {
    var pathParts = fullPath.split('\\');
    return pathParts.sublist(pathParts.length - 1).join('/');
  }
  dynamic Cv;
  String? MyIamgeP;
  String?Imagedefault;
  @override
  void initState() {
    super.initState();
    MyIamgeP=widget.MyImageP;
   // Imagedefault=widget.Imagedefault;
     Cv =widget.profileInformation?.cv;
    jsonList = jsonDecode(jsonString!);
    city = TextEditingController(text: widget.profileInformation?.city);
    first_name = TextEditingController(text:firstN);
    last_name = TextEditingController(text:lastN);
    gender = TextEditingController(text: Gender);
    PersonalInformation = TextEditingController(text: widget.profileInformation?.additionalInformation);
    dateController = TextEditingController(text: widget.profileInformation?.dateOfBirth);
    combinedString = [ '${jsonList}']; // Default values
  }


  String? jsonString =CachData.getData(key: 'myList');
  late List<dynamic> jsonList ;

  Future EditInformationProfile(String gender, String city, String dateController, String information, List bus,File?img, File? cv, String f, String l) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token'
    };

    var request = http.MultipartRequest('POST', Uri.parse('${ApiConstants.apiBaseUrl}profile/update'));

    request.fields.addAll({
      'first_name': f.isNotEmpty ? f : firstN,
      'last_name': l.isNotEmpty ? l : lastN,
      'date_of_birth': dateController.isNotEmpty ? dateController : widget.profileInformation!.dateOfBirth,
      'city': city.isNotEmpty ? city : widget.profileInformation!.city,
      'gender': gender,
      'additional_information': information.isNotEmpty ? information : widget.profileInformation!.additionalInformation,
    });

    for (int i = 0; i < bus.length; i++) {
      request.fields['search_for[$i]'] = bus[i];
    }

    if (gender != null && gender.isNotEmpty){
      request.fields['gender'] =gender;
    }else{
      request.fields['gender'] ='gender';
    }

    if (img != null && img.path.isNotEmpty) {
      String? mimeType = lookupMimeType(img.path);
      if (mimeType != null) {
        var mediaType = MediaType.parse(mimeType);
        request.files.add(await http.MultipartFile.fromPath('profile_photo', img.path));
      }
    }




    if (cv != null && cv.path.isNotEmpty) {
      String? mimeType = lookupMimeType(cv.path);
      if (mimeType != null) {
        var mediaType = MediaType.parse(mimeType);
        request.files.add(await http.MultipartFile.fromPath('cv', cv.path));
      }
    }

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(cv);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(
            'Information Edit Successfully',
            style: TextStyles.font15DarkBlueMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home_Screen(initialIndex: 2),
                  ),
                );
              },
              child: Text(
                AppLocalizations.of(context)!.translate("continue"),
                style: TextStyles.font14BlueSemiBold,
              ),
            ),
          ],
        ),
      );
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      print(widget.profileInformation?.cv);
      print(Cv);
      print(response.statusCode);
    }
  }

  bool isGenderValid = false;
  bool isCityValid = false;
  bool isBirthdayValid = false;
  bool isDataValid = false;

Future DeleteCv()async{
  var headers = {
    'Authorization': 'Bearer ${token}'
  };
  var request = http.Request('PUT', Uri.parse('${ApiConstants.apiBaseUrl}profile/cv_delete'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          'CV Has Been Deleted!',
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {

              context.pop();


            },
            child: Text(
              AppLocalizations.of(context)!.translate("ok"),              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
    print(await response.stream.bytesToString());
  }
  else {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          'There is no file to delete. Please upload your CV.',
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {

              context.pop();


            },
            child: Text(
              AppLocalizations.of(context)!.translate("ok"),              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
    print(response.reasonPhrase);
  }

}
Future DeleteImage()async{
  var headers = {
    'Authorization': 'Bearer ${token}'
  };
  var request = http.Request('GET', Uri.parse('${ApiConstants.apiBaseUrl}profile/avatar_delete'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    setState(() {
  //    image=widget.Imagedefault as File?;
    //  MyIamgeP =widget.Imagedefault;
      image=null;
    });
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          'Profile Photo Has Been Deleted!',
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {

              context.pop();


            },
            child: Text(
              AppLocalizations.of(context)!.translate("ok"),              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
    print(await response.stream.bytesToString());
  }
  else {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          'There is no Profile Photo to delete',
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {

              context.pop();


            },
            child: Text(
              AppLocalizations.of(context)!.translate("ok"),              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
    print(response.reasonPhrase);
  }

}

  List<String>? combinedString;

   File?file;
var imageUrl;

  dynamic baseUrl = ApiConstants.Url;
  final _picker = ImagePicker();
  Future<void> getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
         CachData.setData(key: 'image', id: image);
      });

    } else {
      print("No image selected");
    }
  }



  Future upLoad() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      setState(() {
        file = File(result.files.single.path!);
      });
    }
  }

  openFile(file) {
    OpenFile.open(file.path);
  }

  GlobalKey<FormState> formState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var extractedPath = extractPath(widget.profileInformation!.profilePhoto);
    ////////////////////////
  //  imageUrl = baseUrl +'storage/'+ extractedPath;
   Imagedefault = baseUrl + extractedPath;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home_Screen(initialIndex: 2),
                          ),
                        );
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                    PopupMenuButton<int>(
                      onSelected: (value) {
                        if (value == 1) {
                          DeleteImage();
                        } else if (value == 2) {
                          DeleteCv();
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          child: Text(AppLocalizations.of(context)!.translate("deletePROphoro")),
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: Text( AppLocalizations.of(context)!.translate("deletecv"),),
                        ),
                      ],
                      icon: Icon(Icons.more_vert),
                    ),
                  ],
                )

              ),
              Text(
                AppLocalizations.of(context)!.translate("editeProfile"),                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: buttonYellowColor,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 110,
                height: 110,
                child: Stack(
                  children: [
                    Column(
                      children: <Widget>[
                        Stack(children: [
                          if (image != null)
                            ClipOval(
                              child: Image.file(
                                image!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          if (image == null)
                            ClipOval(
                              child: Image.network(
                                widget.MyImageP ?? widget.Imagedefault!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.network(
                                    widget.Imagedefault!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),

                          // image != null
                          //     ? ClipOval(
                          //   child: Image.file(
                          //     image!,
                          //     width: 100,
                          //     height: 100,
                          //     fit: BoxFit.cover,
                          //   ),
                          // )
                          //     : ClipOval(
                          //   child: Image.network(
                          //     imageUrl,
                          //     width: 100,
                          //     height: 100,
                          //     fit: BoxFit.cover,
                          //     errorBuilder: (context, error, stackTrace) {
                          //       return Image.network(
                          //         Imagedefault!,
                          //         width: 100,
                          //         height: 100,
                          //         fit: BoxFit.cover,
                          //       );
                          //     },
                          //   ),
                          // ),

                          Positioned(
                            child: IconButton(
                              onPressed: getImage,
                              icon: const Icon(Icons.add_a_photo),
                            ),
                            bottom: -10,
                            left: 65,
                          ),

                          SizedBox(height: 15.h),
                        ]
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: first_name,
                  decoration: InputDecoration(
                    labelText:  AppLocalizations.of(context)!.translate("firstName"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: last_name,
                  decoration: InputDecoration(
                    labelText:AppLocalizations.of(context)!.translate("lastName"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                height: 160.h,
                child: Column(
                  children: [
                    AppTextField(
                      cities: [
                        SelectedListItem(name: AppLocalizations.of(context)!.translate("male")),
                        SelectedListItem(name: AppLocalizations.of(context)!.translate("female")),
                      ],
                      textEditingController: gender,
                      title:AppLocalizations.of(context)!.translate("se_gender"),
                      hint: AppLocalizations.of(context)!.translate("gender"),
                      isCitySelected: isCityValid == false ? true : isCityValid,
                    ),
SizedBox(height: 20.h,),
                    AppTextField(
                      cities: [
                        SelectedListItem(name: AppLocalizations.of(context)!.translate("damascus")),
                        SelectedListItem(name:AppLocalizations.of(context)!.translate("daraa")),
                        SelectedListItem(name: AppLocalizations.of(context)!.translate("homs")),
                        SelectedListItem(name: AppLocalizations.of(context)!.translate("latakia")),
                        SelectedListItem(name: AppLocalizations.of(context)!.translate("asSuwayda")),
                        SelectedListItem(name:AppLocalizations.of(context)!.translate("tartus")),
                        SelectedListItem(name:AppLocalizations.of(context)!.translate("aleppo")),
                        SelectedListItem(name: AppLocalizations.of(context)!.translate("ruralDamascuse")),
                        SelectedListItem(name: AppLocalizations.of(context)!.translate("alhasakah")),
                        SelectedListItem(name: AppLocalizations.of(context)!.translate("hama")),
                        SelectedListItem(name: AppLocalizations.of(context)!.translate("deirElzor")),
                        SelectedListItem(name: AppLocalizations.of(context)!.translate("idlib")),
                        SelectedListItem(name: AppLocalizations.of(context)!.translate("raqqa")),
                        SelectedListItem(name: AppLocalizations.of(context)!.translate("qunetiera")),
                      ],
                      textEditingController: city,
                      title: AppLocalizations.of(context)!.translate("se_city"),
                      hint: AppLocalizations.of(context)!.translate("city"),
                      isCitySelected: isCityValid == false ? true : isCityValid,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: dateController,
                  decoration: const InputDecoration(
                    //icon: Icon(Icons.calendar_today),
                    suffixIcon:Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.calendar_today),
                    ) ,
                    labelText: '  Enter Date of Birth',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18))
                   //   borderRadius: BorderRadius.circular(18),
                    ),
                  ),

                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      dateController.text = pickedDate.toString();
                    }
                  },
                ),
              ),

              SizedBox(height: 20.h),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: PersonalInformation,
                  decoration: InputDecoration(
                    labelText: '  Add Information',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SelectPositionScreen()),
                      );
                      if (result != null) {
                        setState(() {
                          combinedString = List<String>.from(result);
                        });
                      }
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                         // mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                         // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [


                            combinedString!=null&&combinedString!.isEmpty?
                            Text('Search For: ${jsonList}'):
                            Text('Search For: ${combinedString}'),
                            Icon(Icons.edit, color: Colors.grey),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: buttonYellowColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: TextButton(
                        onPressed: () async {
                            setState(() async {
                              await EditInformationProfile(
                              gender.text,
                              city.text,
                              dateController.text,
                              PersonalInformation.text,
                              combinedString!,
                              image,
                              file,
                              first_name.text,
                              last_name.text,
                              );
                            });


                        },
                        child: Text(
                          AppLocalizations.of(context)!.translate("save"),                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () async {
                        upLoad();
                      },
                      child: Container(
                        height: 40,

                        decoration: BoxDecoration(
                          color: buttonYellowColor,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.translate("cv"),                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ),

                    ),
                    SizedBox(height: 1.h,),
                    file != null?
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GestureDetector(
                          onTap: () {
                            openFile(file);
                          },


                        child:
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Selected file: ${file!.path.split('/').last}'),
                                    //'${file!.path.split('/').last}'),
                                SizedBox(width: 8),
                                Icon(Icons.file_present, color: Colors.grey),
                              ],
                            ),
                          ),
                        ),
                      ):SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                        child: GestureDetector(
                        onTap: () {
                          '${file!.path.split('/').last}'!=null?'${file!.path.split('/').last}':Cv;
                          file!=null?
                          openFile(file):
                          openFile('${Cv}');

                        },
                          child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              file==null&&widget.profileInformation?.cv==null?
                              Text('Selected file: null' ):
                              Text('The file has been sent previosly'),
                              // Text('${widget.profileInformation!.cv}'!=null?'${widget.profileInformation!.cv}':'null'),
                              //
                              // //'${file!.path.split('/').last}'),
                              // SizedBox(width: 8),
                              // Icon(Icons.file_present, color: Colors.grey),
                            ],
                          ),
                                              ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
