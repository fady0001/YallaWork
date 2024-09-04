// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:phlox_animations/phlox_animations.dart';
//
// import '../../../core/helpers/option_constant.dart';
// import '../../../theme/app_color.dart';
//
// class SearcheTimeWorkPage extends StatefulWidget {
//   final Function(List<String>) onDone;
//
//   const SearcheTimeWorkPage({super.key, required this.onDone});
//
//   @override
//   State<SearcheTimeWorkPage> createState() => _SearcheTimeWorkPageState();
// }
//
// class _SearcheTimeWorkPageState extends State<SearcheTimeWorkPage> {
//   List<String> selectedSalaries = [];
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
//               SizedBox(height: 25.h),
//               Row(
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.close),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                   SizedBox(width: 50.w),
//                   Text('Time Work', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   TextButton(
//                     onPressed: () {
//                       widget.onDone(selectedSalaries);
//                       Navigator.pop(context);
//                     },
//                     child: Text('Done', style: TextStyle(color: Colors.lightGreenAccent, fontSize: 18, fontWeight: FontWeight.bold)),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 25.h),
//               Wrap(
//                 children: enrollement.map((salary) {
//                   bool isSelected = selectedSalaries.contains(salary);
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         if (isSelected) {
//                           selectedSalaries.remove(salary);
//                         } else {
//                           selectedSalaries.add(salary);
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
//                         child: Text(salary, style: TextStyle(color: Colors.black, fontSize: 15.sp)),
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
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_color.dart';
import '../../../constants/option_constant.dart';

class SearcheTimeWorkPage extends StatefulWidget {
  final Function(List<String>) onDone;

  const SearcheTimeWorkPage({super.key, required this.onDone});

  @override
  State<SearcheTimeWorkPage> createState() => _SearcheTimeWorkPageState();
}

class _SearcheTimeWorkPageState extends State<SearcheTimeWorkPage> {
  String? selectedTimeWork; // تعديل لتخزين خيار واحد فقط

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
                  Text('Time Work', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      if (selectedTimeWork != null) {
                        widget.onDone([selectedTimeWork!]);
                      }
                      Navigator.pop(context);
                    },
                    child: Text('Done', style: TextStyle(color: Colors.lightGreenAccent, fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(height: 25.h),
              Wrap(
                children: enrollement.map((timeWork) {
                  bool isSelected = selectedTimeWork == timeWork; // تعديل لتحديد خيار واحد فقط
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTimeWork = timeWork; // حفظ الخيار الواحد فقط
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
                        child: Text(timeWork, style: TextStyle(color: Colors.black, fontSize: 15.sp)),
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
