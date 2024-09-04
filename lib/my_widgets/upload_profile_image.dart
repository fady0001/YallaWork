import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ProfileIMage extends StatefulWidget {
  const ProfileIMage({super.key});
  @override
  State<ProfileIMage> createState() => _ProfileIMageState();
}

class _ProfileIMageState extends State<ProfileIMage> {

  File? image;
  final _piker = ImagePicker();
  Future getImage() async {

    final pickedfile = await _piker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    print("${pickedfile?.name}   ${pickedfile?.path}" );
    print('klmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
setState(() {

  if (pickedfile != null) {
    image = File(pickedfile.path);
  } else {
    print("no imagewee");
  }
});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        // key: signUpFormKey,
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
    );

  }
}
