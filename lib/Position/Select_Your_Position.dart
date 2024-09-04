import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phlox_animations/phlox_animations.dart';


import '../constants/app_color.dart';
import '../constants/app_localizations.dart';
import '../core/theming/styles.dart';



class SelectPositionScreen extends StatefulWidget {
  const SelectPositionScreen({Key? key}) : super(key: key);

  @override
  State<SelectPositionScreen> createState() => _SelectPositionScreenState();
}

class _SelectPositionScreenState extends State<SelectPositionScreen> {
  List<String> SelectPositionList = [
    "None",
    "Marketing",
    "Quality Assurance"
    "Engineering",
    "Community and Social Services",
    "Sales",
    "Others",
    "Program and Project Management",
    "Military and Protective Services",
    "Media and Communication",
    "Suppor",
    "Operations",
    "Business Development",
    "Education",
    "Information Technology",
  "Administrative",
  "Arts and Design",
  "Healthcare Services"
  "Entrepreneurship",
  "Finance",
  "Human Resources",
  "Consulting"
  "Product Management",
  "Tourism",
    "Accounting",
  "Research"
    ,
    "Purchasing",

  "Real Estate",
    "Legal",
  ];

 List<String> SelectPosition = [];
dynamic ion;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 45, right: 20, left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: 25.h),
                      PhloxAnimations(
                        duration: Duration(seconds: 1),
                        fromDegrees: -90,
                        fromScale: 0,
                        fromOpacity: 0.1,
                        fromY: -100,
                        fromX: -200,
                        child: Text(
                          AppLocalizations.of(context)!.translate("quesPos"),
                          style: TextStyle(
                            color:Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Wrap(
                        children: SelectPositionList.map(
                              (hobby) {
                          bool isSelected = false;
                            if (SelectPosition!.contains(hobby)) {
                              isSelected = true;

                              ion =hobby;
                            }
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if(hobby=="None"){
                                    SelectPosition.clear();
                                   // SelectPosition.add(hobby);

                                    showDialog(

                                      context: context,
                                      builder: (context) => AlertDialog(

                                       title: Text(AppLocalizations.of(context)!.translate("messageNone"),  style: TextStyles.font15DarkBlueMedium,),
                                        content: Text(
                                          AppLocalizations.of(context)!.translate("quesNone"),
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Row(

                                            children: [

                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();

                                                },
                                                child: Text(
                                                  AppLocalizations.of(context)!.translate("cancel"),
                                                  style: TextStyle(
                                                    color: AppColor.primaryColor,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 80),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  Navigator.pop(context, SelectPosition);
                                                },
                                                child: Text(
                                                  AppLocalizations.of(context)!.translate("ok"),
                                               style: TextStyle(
                                                 color: AppColor.primaryColor,
                                               ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }else{
                                    if(SelectPosition.contains('None'))
                                      SelectPosition.clear();

                                  }
                                  if(SelectPosition.contains(hobby)&&SelectPosition.length<5)
                                  {
                                    SelectPosition.add(hobby);
                                  }else{
                                    SelectPosition.remove(hobby);
                                  }
                                });
                                String message;
                                if (!SelectPosition.contains(hobby)) {
                                  if (  SelectPosition.length < 5 ) {
                                    SelectPosition.add(hobby);
                                    message='You have selected: ${SelectPosition.join('.')}';
                                    setState(() {});
                                    print(SelectPosition);
                                  }else{
                                    message='You can select up to 5 position.';
                                  }
                                } else {
                                  SelectPosition.removeWhere(
                                          (element) => element == hobby);
                                  message='You have selected: ${SelectPosition.join('.')}';
                                  setState(() {});
                                  print(SelectPosition);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(18),
                                child: PhloxAnimations(
                                  duration: const Duration(seconds: 1),
                                  fromX: -40,
                                  fromY: 100,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? AppColor.primaryColor
                                          : AppColor.secondaryColor,
                                      borderRadius: BorderRadius.circular(18.r),
                                    ),
                                    padding: EdgeInsets.all(14),
                                    child: Text(
                                      hobby,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15.sp),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [

                  const Spacer(),
                  SizedBox(
                    height: 45.h,
                    width: 100.w,
                    child: ElevatedButton(
                      style:ElevatedButton.styleFrom(backgroundColor: AppColor.primaryColor,maximumSize: Size(67, 100)),

                      onPressed: () {
                        if(SelectPosition.isEmpty){
                        showDialog(

                          context: context,
                          builder: (context) => AlertDialog(

                            icon: const Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 32,
                            ),
                            content: Text(
                              AppLocalizations.of(context)!.translate("atLasteOnePostion"),
                              style: TextStyles.font14GrayRegular,
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                 // Navigator.of(context).pushReplacementNamed(Routes.homeScreen);

                                  Navigator.pop(context);
                                  // Navigator.pop(context, SelectPosition);
                                },
                                child: Text(
                                  'OK',
                            style: TextStyle(color: AppColor.primaryColor,),
                                ),
                              ),
                            ],
                          ),
                        );}else{

// عرض الرسالة باستخدام AlertDialog
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(AppLocalizations.of(context)!.translate("yourSelection")),
                              content: SingleChildScrollView( // استخدام SingleChildScrollView للتأكد من عرض كل النص
                                child: ListBody(
                                  children: SelectPosition.map((position) => Text(position)).toList(),
                                ),

                              ),
                              actions: <Widget>[
                                Text(AppLocalizations.of(context)!.translate("messageInPosition"),style: TextStyle(
                                  color: AppColor.secondaryColor,
                                  fontWeight: FontWeight.bold
                                ),),
                                SizedBox(width: 8,),
                                SizedBox(height: 10,),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.primaryColor,
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  child: TextButton(
                                    child: Text(AppLocalizations.of(context)!.translate("ok")),
                                    onPressed: () {
                                 if(SelectPosition!=null&&SelectPosition.isNotEmpty) {

                                        Navigator.of(context).pop();
                                        Navigator.pop(context, SelectPosition);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                      },

                      child:  Text(AppLocalizations.of(context)!.translate("back"),style: TextStyle(
                        color: Colors.black
                      ),),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
