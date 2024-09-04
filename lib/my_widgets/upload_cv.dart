import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import '../constants/app_color.dart';

class UploadCv extends StatefulWidget {
  const UploadCv({super.key});

  @override
  State<UploadCv> createState() => _UploadCvState();
}

class _UploadCvState extends State<UploadCv> {
  List<File> pickedFiles=[] ;
  Future pickFiles()async{

    var result = await FilePicker.platform.pickFiles(
      allowMultiple: true,

      type:FileType.custom,
      allowedExtensions: ['pdf'],
    );
    print(result);
    if(result !=null){
      setState(() {
        pickedFiles = result.files.map((file) => File(file.path!)).toList();

      });
    }
  }
  openFile(file){
    OpenFile.open(file.path);
     OpenFile.open(file.name);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  body:  Column(
      //        children: [
      //
      // IconButton(icon: Icon(Icons.upload_file,color: Colors.green,size: 50,),
      //   onPressed: (){
      //     pickFiles();
      //   },
      //   ),
      //          SizedBox(height: 15,),
      //          Text( '     Upload CV',style: TextStyle(
      //            color: Colors.black,
      //            fontSize: 18,
      //          ),),
      //          pickedFiles.isNotEmpty?
      //          Center(
      //            child: Container(
      //              width: 500,
      //              height: 100,
      //              child: ListView.builder(
      //                itemCount: pickedFiles.length,
      //                shrinkWrap: true,
      //                itemBuilder: (context,index){
      //                  return GestureDetector(
      //                    onTap: ()=>openFile(pickedFiles[index]),
      //                    child: Card(
      //                      color: Color(0xff7CACEEFF),
      //                        child: ListTile(
      //                          leading: returnLogo(pickedFiles[index]),
      //                          subtitle: Text(
      //                            'File: ${pickedFiles[index].path}',
      //
      //                          ),
      //                        ),
      //
      //                    ),
      //                  );
      //                },
      //
      //              ),
      //            ),
      //          ):Container(),
      //
      //        ],
      //      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: GestureDetector(
          onTap: (){
            pickFiles();
          },

          child: pickedFiles.isNotEmpty?
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(25)),
                       color: Colors.grey.shade300,
                     ),
                     child: ListView.builder(

                       itemCount: pickedFiles.length,
                       shrinkWrap: true,
                       itemBuilder: (context,index){
                         return GestureDetector(
                           onTap: ()=>openFile(pickedFiles[index]),
                           child: Card(
                             color: Colors.grey.shade300,
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.all(Radius.circular(20))
                               ),
                               child: ListTile(
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.all(Radius.circular(25))
                                 ),
                                 leading: returnLogo(pickedFiles[index]),
                                 subtitle: Text(
                                   'File: ${pickedFiles[index].path}',style: TextStyle(
                                   fontSize: 12.5
                                 ),

                                 ),
                               ),

                           ),
                         );
                       },

                     ),
                   ):
         Container(
            width:double.infinity,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: AppColor.primaryColor,
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
                    Text('Upload Your Resume',style: TextStyle(
                        fontWeight: FontWeight.bold,
                      fontSize: 17,
                      ),),
                    SizedBox(height: 3,),
                    Text('Pleas Keep Us Your file CV Her..... ',style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 14
                    ),),


                  ],
                ),

              ],
            ),
          ),

      ),
    ));
  }

  F() {return Container();}
}
returnLogo(file){
  var ex=  (file.path);
  if(ex=='.jpg'){
    return Icon(Icons.image,color: Colors.green,);}
  else if(ex=='.docx'){
    return Icon(Icons.picture_in_picture_alt,color: Colors.green,);}
  else {
    return Icon(Icons.picture_as_pdf_rounded,color: Colors.red,);}
}
