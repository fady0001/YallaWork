
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../bloc/Dark/theme_bloc.dart';
import '../../constants/app_color.dart';
import '../../constants/app_localizations.dart';
import '../../main.dart';
import '../../networking/api_constants.dart';
import '../../theme/dark.dart';
import '../add/widget/shared_preferences.dart';
import 'cubit/cubit.dart';
import 'cubit/cubit_state.dart';
import 'edit_profile/edit_profile.dart';
import 'model/profile_response.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DarkTheme? currentTheme=DarkTheme.Light;
  final appThemeData = {
    DarkTheme.Light: ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      brightness: Brightness.light,
      primaryColor: Colors.blue,
    ),
    DarkTheme.Dark: ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: Color(0xFF333333)),
      brightness: Brightness.dark,
      primaryColor: Colors.blue[700],
    ),

  };
  void toggleTheme() {

   currentTheme = currentTheme == DarkTheme.Light ? DarkTheme.Dark : DarkTheme.Light;
   context.read<ThemeBloc>().add(ThemeChangedEvent(theme: currentTheme!));

  }



  final _picker = ImagePicker();
  String gender = "Male";
  late String imageEdite = CachData.getData(key: 'image');
String? Imagedefault;
  @override
  void initState() {
    super.initState();
  context.read<ProfileCubit>().getSpecializations();
  

  }

  // Future<void> getImage() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() async {
  //       image = File(pickedFile.path);
  //       // SharedPreferences prefs = await SharedPreferences.getInstance();
  //       // await prefs.getString('profile_image');
  //     });
  //   } else {
  //     print("No image selected");
  //   }
  // }

  String extractPath(String fullPath) {
    var pathParts = fullPath.split('\\');
    return pathParts.sublist(pathParts.length-1).join('/');
  }

  dynamic baseUrl = ApiConstants.Url;
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xfffdf5d7),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is SpecializationsSuccess) {
            setState(() {});
          }
        },
        builder: (context, state) {
          if (state is SpecializationsLoading) {
            return setupLoading();
          } else if (state is SpecializationsSuccess) {
            return setupSuccess(state.profileresponse.profileInformation);
          } else {
            return setupError();
          }
        },
      ),
    );
  }

  Widget setupLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget setupError() {
    return const Center(
      child: Text('Error loading data.'),
    );
  }

  Widget setupSuccess(ProfileInformation profile) {
    var extractedPath = extractPath(profile.profilePhoto);
    ////////////////////////////////////
    Imagedefault = "${ApiConstants.Url}${extractedPath}";

    imageUrl ="${ApiConstants.Url}storage/${extractedPath}" ;

    return Container(

      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              children: [


                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 100,
                        bottom: 8,
                      ),
                      child:  Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            //color: Colors.blueAccent,
                            width: 6.0,
                          ),
                        ),
                    child:
                    imageUrl != null
                        ? ClipOval(
                      child: Image.network(
                        imageUrl!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                            Imagedefault!,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    )
                        : ClipOval(
                      child: Image.network(
                        Imagedefault!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                            Imagedefault!,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),

                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                Text(
                  profile.fullName,
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(

              padding: const EdgeInsets.only(
                top: 20,
                left: 24,
                right: 24,
              ),
              decoration: BoxDecoration(
                color:  Theme.of(context).colorScheme.background.withOpacity(0.8),

                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [


                    Padding(
                      padding: const EdgeInsets.only(left: 33.0),
                      child:  Text(
                        AppLocalizations.of(context)!.translate("profile"),
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color:  Color(0xffff962d),
                        ),
                      ),
                    ),
                    SizedBox(width: 4.h,),
                    IconButton(onPressed: (){      Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => EditProfile(
                    profileInformation: profile,
                      MyImageP:imageUrl,
                        Imagedefault:Imagedefault

                    ),
                    ),
                    );
                    }, icon: Container(

                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(8),
                          ),


                        child: Icon(Icons.edit))),
                      ],
                    ),
                    const SizedBox(height: 16),
                    listProfile(Icons.person, AppLocalizations.of(context)!.translate("fullName"),
                        profile.fullName),
                    listProfile(Icons.date_range, AppLocalizations.of(context)!.translate("birthday"), profile.dateOfBirth),
                    listProfile(Icons.location_pin,AppLocalizations.of(context)!.translate("location"), profile.city),
                    listProfile(Icons.email, AppLocalizations.of(context)!.translate("email"), profile.email),
                    listProfile(Icons.info,AppLocalizations.of(context)!.translate("additionalinfo"), profile.additionalInformation),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 6.h,)
        ],

      ),

    );
  }

  Widget listProfile(IconData icon, String text1, String text2) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
          ),
          const SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 14,
                ),
              ),
              Text(
                text2,
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );

  }

}
