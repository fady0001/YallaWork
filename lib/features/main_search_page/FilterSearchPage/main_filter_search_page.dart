// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../core/di/dependency_injection.dart';
// import '../../../theme/app_color.dart';
// import '../logic/search_cubit.dart';
// import '../ui/Filter_search.dart';
// import 'SearchJobTitlePage.dart';
// import 'SearchSpecializationPage.dart';
// import 'SearchenrollementPage.dart';
//
//
// class FilterSearchPage extends StatefulWidget {
//   const FilterSearchPage({Key? key}) : super(key: key);
//
//   @override
//   State<FilterSearchPage> createState() => _FilterSearchPageState();
// }
//
// class _FilterSearchPageState extends State<FilterSearchPage> {
//   List<String> selectedJobTitles = [];
//   List<String> selectedenrollement = [];
//   List<String> selectedSpecializations = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         height: 420,
//         child: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   SizedBox(height: 10.h),
//                   Row(
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.close),
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                       ),
//                       SizedBox(width: 120.w),
//                       Text('Filters', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                   SizedBox(height: 70.h),
//                   MaterialButton(
//                     minWidth: double.infinity,
//                     height: 60,
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return SearchJobTitlePage(
//                               onDone: (selectedTitles) {
//                                 setState(() {
//                                   selectedJobTitles = selectedTitles;
//                                 });
//                               },
//                             );
//                           },
//                         ),
//                       );
//                     },
//                     color: AppColor.primaryColor,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
//                     child: Text('Job Title', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white)),
//                   ),
//                   SizedBox(height: 20),
//                   MaterialButton(
//                     minWidth: double.infinity,
//                     height: 60,
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return SearcheTimeWorkPage(
//                               onDone: (selectedTime) {
//                                 setState(() {
//                                   this.selectedenrollement = selectedTime;
//                                 });
//                               },
//                             );
//                           },
//                         ),
//                       );
//                     },
//                     color: AppColor.primaryColor,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
//                     child: Text('Time Work', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white)),
//                   ),
//                   SizedBox(height: 20),
//                   MaterialButton(
//                     minWidth: double.infinity,
//                     height: 60,
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return SearcheSpecializationsPage(
//                               onDone: (selectedSpecialization) {
//                                 setState(() {
//                                   selectedSpecializations.add(selectedSpecialization);
//                                 });
//                               },
//                             );
//                           },
//                         ),
//                       );
//                     },
//                     color: AppColor.primaryColor,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
//                     child: Text('Specialization', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white)),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: SizedBox(
//                   height: 45.h,
//                   width: 150,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       print('Selected Job Titles: $selectedJobTitles');
//                       print('Selected Time Work: $selectedenrollement');
//                       print('Selected Specializations: $selectedSpecializations');
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => BlocProvider(
//                             create: (context) => SearchCubitF(getIt())
//                               ..searchPosts(
//                                 jobTitles: selectedJobTitles.isNotEmpty ? selectedJobTitles : ['None'],
//                                 enrollement: selectedenrollement.isNotEmpty ? selectedenrollement : ['None'],
//                                 specializations: selectedSpecializations.isNotEmpty ? selectedSpecializations : ['None'],
//                               ),
//                             child: MainSearchPageF(
//                               jobTitles: selectedJobTitles,
//                               enrollement: selectedenrollement,
//                               specializations: selectedSpecializations,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xfffdf5d7),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15.r),
//                       ),
//                     ),
//                     child: Text(
//                       'Done',
//                       style: TextStyle(color: Colors.lightGreenAccent, fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/app_color.dart';
import '../../../core/di/dependency_injection.dart';
import '../logic/search_cubit.dart';
import '../ui/Filter_search.dart';
import 'SearchJobTitlePage.dart';
import 'SearchSpecializationPage.dart';
import 'SearchenrollementPage.dart';

class FilterSearchPage extends StatefulWidget {
  const FilterSearchPage({Key? key}) : super(key: key);

  @override
  State<FilterSearchPage> createState() => _FilterSearchPageState();
}

class _FilterSearchPageState extends State<FilterSearchPage> {
  List<String> selectedJobTitles = [];
  List<String> selectedenrollement = [];
  List<String> selectedSpecializations = [];

  bool get isDoneButtonEnabled => selectedJobTitles.isNotEmpty&&selectedSpecializations.isNotEmpty;

  void _showErrorMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You must select at least one job title and select selectedSpecializations'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: 420,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 120.w),
                      Text('Filters', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 35.h),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SearchJobTitlePage(
                              onDone: (selectedTitles) {
                                setState(() {
                                  selectedJobTitles = selectedTitles;
                                });
                              },
                            );
                          },
                        ),
                      );
                    },
                    color: AppColor.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    child: Text('Job Title', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white)),
                  ),
                  SizedBox(height: 20),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SearcheTimeWorkPage(
                              onDone: (selectedTime) {
                                setState(() {
                                  this.selectedenrollement = selectedTime;
                                });
                              },
                            );
                          },
                        ),
                      );
                    },
                    color: AppColor.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    child: Text('Time Work', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white)),
                  ),
                  SizedBox(height: 20),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SearcheSpecializationsPage(
                              onDone: (selectedSpecialization) {
                                setState(() {
                                  selectedSpecializations.add(selectedSpecialization);
                                });
                              },
                            );
                          },
                        ),
                      );
                    },
                    color: AppColor.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    child: Text('Specialization', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
            ),
             SizedBox(height: 20.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 45.h,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: isDoneButtonEnabled
                        ? () {
                      print('Selected Job Titles: $selectedJobTitles');
                      print('Selected Time Work: $selectedenrollement');
                      print('Selected Specializations: $selectedSpecializations');
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => SearchCubitF(getIt())
                              ..searchPosts(
                                jobTitles: selectedJobTitles.isNotEmpty ? selectedJobTitles : ['None'],
                                enrollement: selectedenrollement.isNotEmpty ? selectedenrollement : ['None'],
                                specializations: selectedSpecializations.isNotEmpty ? selectedSpecializations : ['None'],
                              ),
                            child: MainSearchPageF(
                              jobTitles: selectedJobTitles,
                              enrollement: selectedenrollement,
                              specializations: selectedSpecializations,
                            ),
                          ),
                        ),
                      );
                    }
                        : () {
                      _showErrorMessage(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDoneButtonEnabled ? Color(0xfffdf5d7) : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),

                    child: Text(
                      'Done',
                      style: TextStyle(
                        color: isDoneButtonEnabled ? Colors.lightGreenAccent : Colors.black26,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
