// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
//
// import '../../../core/helpers/option_constant.dart';
// import '../../../theme/app_color.dart';
// class SearchJobTitlePage extends StatefulWidget {
//   final Function(List<String>) onDone;
//
//   const SearchJobTitlePage({super.key, required this.onDone}); // تعديل البناء
//
//   @override
//   State<SearchJobTitlePage> createState() => _SearchJobTitlePageState();
// }
//
// class _SearchJobTitlePageState extends State<SearchJobTitlePage> {
//   List<String> selectedJobTitles = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 45, right: 20, left: 25),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//             children  SizedBox(height: 25.h),
//               Row(
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.close),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                   SizedBox(width: 50.w),
//                   Text('Job Title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   TextButton(
//                     onPressed: () {
//                       print('object${selectedJobTitles}');
//                       widget.onDone(selectedJobTitles);
//                       Navigator.pop(context);
//                     },
//                     child: Text('Done', style: TextStyle(color: Colors.lightGreenAccent, fontSize: 18, fontWeight: FontWeight.bold)),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 25.h),
//               Wrap(
//                 children: jobtital.map((title) {
//                   bool isSelected = selectedJobTitles.contains(title);
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         if (isSelected) {
//                           selectedJobTitles.remove(title);
//                         } else {
//                           selectedJobTitles.add(title);
//                         }
//                       });
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: isSelected ? AppColor.primaryColor : AppColor.secondaryColor,
//                           borderRadius: BorderRadius.circular(18.r),
//                         ),
//                         padding: EdgeInsets.all(16),
//                         child: Text(title, style: TextStyle(color: Colors.black, fontSize: 15.sp)),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_color.dart';
import '../../../constants/option_constant.dart';

class SearchJobTitlePage extends StatefulWidget {
  final Function(List<String>) onDone;

  const SearchJobTitlePage({super.key, required this.onDone});

  @override
  State<SearchJobTitlePage> createState() => _SearchJobTitlePageState();
}

class _SearchJobTitlePageState extends State<SearchJobTitlePage> {
  String? selectedJobTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 45, right: 20, left: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 50.w),
                  Text('Job Title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      if (selectedJobTitle != null) {
                        widget.onDone([selectedJobTitle!]);
                      }
                      Navigator.pop(context);
                    },
                    child: Text('Done', style: TextStyle(color: Colors.lightGreenAccent, fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(height: 25.h),
              Wrap(
                children: jobtital.map((title) {
                  bool isSelected = selectedJobTitle == title;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedJobTitle = title;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? AppColor.primaryColor : AppColor.secondaryColor,
                          borderRadius: BorderRadius.circular(18.r),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(title, style: TextStyle(color: Colors.black, fontSize: 15.sp)),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
