import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart'as http;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_file/open_file.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';
import 'package:untitled3/core/helpers/extensions.dart';
import 'package:untitled3/features/add/widget/shared_preferences.dart';
import 'package:untitled3/features/add/widget/upload_cv.dart';
import '../../constants/app_color.dart';
import '../../constants/app_localizations.dart';
import '../../core/routing/routes.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/styles.dart';
import '../../networking/api_constants.dart';
import '../profile/edit_profile/field_text.dart';
import 'Position/Select_Your_Position.dart';
class AddInformation extends StatefulWidget {
  const AddInformation({super.key});

  @override
  State<AddInformation> createState() => _AddInformationState();
}
class _AddInformationState extends State<AddInformation> {

  TextEditingController city =TextEditingController();
  TextEditingController gender =TextEditingController();
  TextEditingController PersonalInformation =TextEditingController();
  TextEditingController Languages =TextEditingController();
  TextEditingController dateControoler =TextEditingController();
  String token=  CachData.getData(key: 'access_token');

  Future sendDataToServer(String gender,String city, String dateControoler, String? lan, String? information,List bus,
      File? img ,File? cv,String ID,
      )async{
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'multipart/form-data',
      'Authorization':'Bearer ${token}'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiConstants.apiBaseUrl}information/user'));
    request.fields['user_id'] = ID;
    request.fields['gender'] = gender;
    request.fields['date_of_birth'] = dateControoler;
    request.fields['city'] = city;

    for (int i = 0; i < bus.length; i++) {
      request.fields['search_for[$i]'] = bus[i];
    }

    if(lan!=null && lan.isNotEmpty){
      request.fields['languages']=lan;
    }else{
      request.fields['languages']='Not Provided';
    }
    if(information!=null && information.isNotEmpty){
      request.fields['additional_information']=information;
    }else{
      request.fields['additional_information']='Not Provided';
    }
    if(img!=null && img.path.isNotEmpty){
      String? mimeType=lookupMimeType(img.path);
      if(mimeType!=null){
        var mediaType=MediaType.parse(mimeType);
        request.files.add(await http.MultipartFile.fromPath('profile_photo', img.path));
      }
    }
    if(cv!=null && cv.path.isNotEmpty ){
      String? mimeType=lookupMimeType(cv.path);
      if(mimeType!=null){
        var mediaType=MediaType.parse(mimeType);
        request.files.add(await http.MultipartFile.fromPath('cv', cv.path,));
      }
    }
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if(response.statusCode != 201 && response.statusCode != 422) {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(
            color: ColorsManager.mainBlue,
          ),
        ),
      );
    }
    if (response.statusCode == 201) {

print(img);
      String jsonString = jsonEncode(bus);
      await CachData.setData(key: 'myList', id: jsonString);
      CachData.setData(key: 'gender', id:  gender);

      context.pop();
             showDialog(
              context: context,
              builder: (context) => AlertDialog(
              icon: const Icon(
            Icons.error,
            color: Colors.green,
            size: 32,
          ),
          content: Text(
            AppLocalizations.of(context)!.translate("storedInfo"),
            style: TextStyles.font15DarkBlueMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
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
      print('${request.fields}');
      print('${request.files}');
    }
    else {
      context.pop();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          icon: const Icon(
            Icons.error,
            color: Colors.red,
            size: 32,
          ),
          content: Text(
            AppLocalizations.of(context)!.translate("missingInfo"),
            style: TextStyles.font15DarkBlueMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                // context.pop();
                Navigator.of(context).pushReplacementNamed(Routes.addinformation);
              },
              child: Text(
                'Got it',
                style: TextStyles.font14BlueSemiBold,
              ),
            ),
          ],
        ),
      );
      print('${request.fields}');
      print('${request.files}');
      print('${response.statusCode}');

      print(response.reasonPhrase);
    }

  }
  bool isGenderValid=false;
  bool isCityValid=false;
  bool isBirthdayValid=false;
  bool isDataValid=false;
  void checkFormValidity(){
    setState(() {
      isGenderValid=gender.text.isNotEmpty;
      isCityValid=city.text.isNotEmpty;
      isBirthdayValid=dateControoler.text.isNotEmpty;

    });

  }

  List<String>?combinedString ;
  File? image ,file;


  final _piker = ImagePicker();

  Future getImage() async {
    final pickedfile = await _piker.pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      setState(() {
        image = File(pickedfile.path);
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_image', pickedfile.path);
      CachData.setData(key: 'picked_file', id:  pickedfile.path);
    } else {
      print("no image selected");
    }
  }


  Future upLoad()async{

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      // allowMultiple: true,
      type:FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if(result != null){
      setState(() {
        file= File(result.files.single.path!);

      });
    }
  }
  openFile(file){
    OpenFile.open(file.path);
    // OpenFile.open(file.name);
  }
  GlobalKey<FormState> formstate=GlobalKey();

  late final List<String> result;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(

          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                SizedBox(
                  height: 20,
                ),
                Text(AppLocalizations.of(context)!.translate("addInformation"),style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: buttonYellowColor,
                ),),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 110,
                    height: 110,
                    child:
                    Stack(
                        children: [

                          Column(
                            children: <Widget>[
                              Stack(children: [
                                image  != null?
                                CircleAvatar(
                                  radius: 50,backgroundImage: FileImage(image!),
                                ):
                                const CircleAvatar(
                                  radius: 50,backgroundImage:AssetImage('assets/images/Capture.png',),
                                ),
                                Positioned(child: IconButton(
                                  onPressed: getImage,
                                  icon: const Icon(Icons.add_a_photo),
                                ),
                                  bottom: -10,
                                  left: 65,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ]),

                            ],
                          ),
                        ]
                    )

                ),

                SizedBox(
                  height: 20,
                ),
                //gender and city
                Container(
                  width: double.infinity,
                  height: 180.h,
                  child: Column(
                    children:  [
                      AppTextFieldADD(

                        cities: [
                          SelectedListItem(name: AppLocalizations.of(context)!.translate("male")),
                          SelectedListItem(name: AppLocalizations.of(context)!.translate("female")),

                        ],
                        textEditingController: gender,
                        title:AppLocalizations.of(context)!.translate("se_gender"),
                        hint: AppLocalizations.of(context)!.translate("gender"),
                        isCitySelected: isCityValid==false?true: isCityValid,

                      ),

                      AppTextFieldADD(

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
                          isCitySelected: isCityValid==false?true: isCityValid),
                    ],
                  ),
                ),

                SizedBox(
                  height: 8,
                ),
                //birthday
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: TextFormField(
                    style: TextStyle(
                        color: Colors.black
                    ),
                    validator:(value){
                      if(value==null || value.isEmpty){
                        return AppLocalizations.of(context)!.translate("pleaseEnteryourDate");
                      }
                      return null;
                    },
                    onChanged: (value){
                      checkFormValidity();
                    },

                    cursorColor: Colors.amber,
                    autofocus: false,
                    controller: dateControoler,
                    decoration: InputDecoration
                      (
                      fillColor:AppColor.secondaryColor,
                      labelText: AppLocalizations.of(context)!.translate("birthday"),  labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                      filled: true,
                      suffixIcon: TextButton(
                          onPressed: (){
                            _selectDatem();
                          },
                          child: Icon(Icons.calendar_month,color: AppColor.primaryColor)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: Color(0xff7cacee)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12,
                          )
                      ),
                    ),
                    readOnly: true,

                  ),
                ),

                SizedBox(
                  height: 24,
                ),
                TextF(hint: AppLocalizations.of(context)!.translate("language"),controller:Languages ,maxL: 2,minL: 1,  ),
                SizedBox(
                  height: 24,
                ),
                TextF(hint: AppLocalizations.of(context)!.translate("personalInfo"),  controller: PersonalInformation,maxL: 3,minL: 1,),


                SizedBox(
                  height: 24,
                ),
                Stack(

                  children: [
                    Container(
                        width: double.infinity,
                        height: 70,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20,right: 20),
                          child: GestureDetector(
                            onTap:file==null? ()async{
                              await upLoad();
                            }:null,

                            child: file!=null?
                            Container(
                              width: double.infinity,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                                color:AppColor.secondaryColor,
                              ),
                              child: Column(

                                children: [
                                  GestureDetector(
                                    onTap: ()=>openFile(file),
                                    child: Center(
                                      child: Container(
                                        width: double.infinity,
                                        height: 70,
                                        child: Card(

                                          color: AppColor.secondaryColor,
                                          shape: RoundedRectangleBorder(

                                              borderRadius: BorderRadius.all(Radius.circular(20))
                                          ),
                                          child: ListTile(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(25))
                                            ),
                                            leading: returnLogo(file),
                                            subtitle: Text(

                                              'File: ${file}',style: TextStyle(
                                                fontSize: 12.5
                                            ),

                                            ),
                                          ),

                                        ),
                                      ),
                                    ),
                                  )
                                ],

                              ),

                            ):
                            Container(
                              width:double.infinity,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                                color:AppColor.secondaryColor,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20,right: 16),
                                    child: Container(
                                      width: 41,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),
                                      child: Icon(Icons.upload_file,color: Colors.red,size: 35,),

                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 18,),
                                      Text(AppLocalizations.of(context)!.translate("uploadCV"),style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black45,
                                      ),),
                                      SizedBox(height: 3,),
                                      Text(AppLocalizations.of(context)!.translate("pleaseSendCV"),style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 11
                                      ),),


                                    ],
                                  ),

                                ],
                              ),
                            ),

                          ),
                        )



                    ),
                  ],
                ),
                SizedBox(height: 24,),



                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Padding(
                      padding: EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap:combinedString == null? ()async{


                        combinedString = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SelectPositionScreen()));

                                  setState(() {
                                    // combinedString = result.join(',');
                                    combinedString?.join(',');
                                  });


                        }:fady(),
                        child: Container(
                          width:MediaQuery.of(context).size.width/2.5,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.all(Radius.circular(20)) ,
                            color:combinedString!=null?AppColor.secondaryColor:AppColor.primaryColor,

                          ),
                          child: Center(
                            child: Opacity(
                              opacity:combinedString==null ?1:0.3,
                              child: Center(
                                child: Text(AppLocalizations.of(context)!.translate("chooseWork"),style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15,
                                ),),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap:dateControoler.text.isNotEmpty && gender.text.isNotEmpty && city.text.isNotEmpty&&combinedString!=null?(){
                            String id=  CachData.getData(key: 'user_id');
                            print('id add + ${id}');
                            print('id add + ${token}');

                               print(' ${combinedString}');

                              print('id combinedString + ${combinedString}');
                            sendDataToServer(gender.text,  city.text,  dateControoler.text, Languages.text ,PersonalInformation.text,combinedString!,image,file,id);
                          }:fady(),
                          //select you work
                          child: Container(

                            width: MediaQuery.of(context).size.width/2.5,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius:BorderRadius.all(Radius.circular(20)) ,
                              color: dateControoler.text.isNotEmpty && gender.text.isNotEmpty && city.text.isNotEmpty&&combinedString!=null? AppColor.primaryColor:AppColor.secondaryColor,
                              // border: Border.all(
                              //   color: Colors.grey.shade300,
                              //   width: 3,
                              // )
                            ),
                            child: Opacity(
                              opacity: dateControoler.text.isNotEmpty && gender.text.isNotEmpty && city.text.isNotEmpty&&combinedString!=null? 1:0.3,
                              child: Center(
                                child: Text(AppLocalizations.of(context)!.translate("saveInfo"),style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15,
                                ),),
                              ),
                            ),
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(height: 13,)
              ],
            ),
          ),
        )

    );


  }
  Future<void> _selectDatem()async{

    DateTime? _picked =   await showDatePicker(context: context, firstDate: DateTime(1950), lastDate: DateTime.now(),
      initialDate: DateTime.now(),
      builder: (context, child)=> Theme(data:ThemeData().copyWith(
        colorScheme:ColorScheme.dark(
          primary: Colors.grey.shade700,
          onPrimary:AppColor.primaryColor,
          surface: AppColor.secondaryColor,
          onSurface: Colors.black,
        ),
        dialogBackgroundColor: Colors.white,
      ),
        child: Container(child: child),

      ),
    );
    if(_picked != null){
      setState(() {
        dateControoler.text = _picked.toString().split(" ")[0];
      });
    }
  }

  fady() {
    if(combinedString!=null)
      return null;
  }


}


