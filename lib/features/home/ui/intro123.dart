//
// import 'dart:math';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:untitled3/features/home/ui/home_screen.dart';
// import 'package:untitled3/features/home/ui/welcomeScreen.dart';
// import '../../../constants/app_localizations.dart';
// import '../../../core/theming/colors.dart';
// import '../../../main.dart';
// class IntroScreen extends StatefulWidget {
//   const IntroScreen({super.key});
//
//   @override
//   State<IntroScreen> createState() => _IntroScreenState();
// }
//
// class _IntroScreenState extends State<IntroScreen> {
//   final pageController =new PageController();
//   void nextPage(){
//     pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.ease);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Container(
//
//           child:    PageView(
//             controller: pageController,
//             physics: NeverScrollableScrollPhysics(),
//             children: [
//               Slide1(img: Image.asset("assets/images/intro1.jpg"),
//                   title: AppLocalizations.of(context)!.translate("intro1_message"),
//                   subtitle: AppLocalizations.of(context)!.translate("intro1_subMess"),
//                   onNext:nextPage
//               ),
//               Slide1(img: Image.asset('assets/images/intro2.jpg'),
//                   title: AppLocalizations.of(context)!.translate("intro2_mess"),
//                   subtitle: AppLocalizations.of(context)!.translate("intro2_subMess"),
//                   onNext:nextPage
//               ),
//               Slide1(img: Image.asset("assets/images/intro3.jpg"),
//                   title: AppLocalizations.of(context)!.translate("intro3_mess"),
//                   subtitle: AppLocalizations.of(context)!.translate("intro3_subMess"),
//                   onNext:nextPage
//               ),
//
//               Home_Screen(),
//
//             ],
//
//
//
//           ),
//         ),
//       ),
//     );
//   }}
// class Slide1 extends StatelessWidget {
//   final Widget img;
//   final String title,subtitle;
//   final VoidCallback onNext ;
//
//   const Slide1({super.key, required this.img, required this.title, required this.subtitle, required this.onNext});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Expanded(
//             child:img,
//
//
//           ),
//
//           Padding(padding: EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 Text(
//                   title,
//                   style: K,
//                 ),
//                 SizedBox(height: 20,),
//                 Text(
//                   subtitle,
//                   style: F,
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 35,),
//                 ProButton(onNext:onNext),
//               ],
//             ),
//           ),
//           GestureDetector(
//
//             child: Text(AppLocalizations.of(context)!.translate("skip_button"),
//               style: F,),
//             onTap: onNext,
//           ),
//           SizedBox(
//             height: 5,
//           ),
//
//
//         ],
//       ),
//     );
//   }
// }
// class ProButton extends StatelessWidget {
//   final VoidCallback onNext;
//   const ProButton({super.key,required this.onNext});
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 75,
//       width: 75,
//       child: Stack(
//         children: [
//           AnimatedIndicator(
//             duration:const Duration(seconds: 10,
//             ),
//             size: 75,
//             callback: onNext,
//           ),
//           Center(
//             child: GestureDetector(
//               child: Container(
//                 height: 60,
//                 width: 60,
//                 child: Center(
//                   child: Image.asset('assets/images/arrow.png',width: 24,),
//                 ),
//                 decoration: BoxDecoration(
//                   color:buttonYellowColor,
//                   borderRadius: BorderRadius.circular(99),
//                 ),
//               ),
//               onTap: onNext,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
// class AnimatedIndicator extends StatefulWidget {
//   final Duration duration;
//   final double size;
//   final VoidCallback callback;
//   const AnimatedIndicator({super.key, required this.duration, required this.size, required this.callback});
//
//   @override
//   State<AnimatedIndicator> createState() => _AnimatedIndicatorState();
// }
// class _AnimatedIndicatorState extends State<AnimatedIndicator>with TickerProviderStateMixin{
//   late Animation<double> animation;
//   late AnimationController controller;
//   @override
//   void initState() {
//     controller =AnimationController(duration: widget.duration,vsync: this);
//     animation =Tween(begin: 0.0,end:100.0).animate(controller)
//       ..addListener(
//               (){
//             setState(() {
//
//             });
//           }
//       )..addStatusListener((status){
//         if(status == AnimationStatus.completed){
//           controller.reset();
//           widget.callback();
//         }
//       });
//     controller.forward();
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   void dispose() {
//     controller.dispose();
//     // TODO: implement dispose
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: animation,
//       builder: (context,child){
//         return  CustomPaint(
//           size: Size(widget.size,widget.size,),
//           painter: ProgressPainter(animation.value),    );
//       },
//
//     );
//
//   }
// }
// class ProgressPainter extends CustomPainter{
//
//   final double progress;
//
//   ProgressPainter(this.progress);
//   @override
//   void paint(Canvas canvas,Size size){
//     var linePaint =Paint()
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 3
//       ..color=Colors.blue;
//     final radians = (progress / 100) * 2 *pi;
//     _drawShape(canvas,linePaint, linePaint,-pi / 2,radians,size);
//   }
//   void _drawShape(Canvas canvas,Paint linePaint,Paint circlePaint,double startRadian,
//       double sweepRadian,Size size){
//     final centerX = size.width / 2,centerY = size.height / 2;
//     final centerOffset = Offset(centerY,centerY);
//     final double radius = min(size.width, size.height) / 2;
//     canvas.drawArc(Rect.fromCircle(center: centerOffset, radius: radius), startRadian, sweepRadian, false, linePaint);
//     final x = radius * (1 + sin(sweepRadian)),
//         y = radius * (1 - cos(sweepRadian));
//     final circleOffset = Offset(x,y);
//     canvas.drawCircle(circleOffset, 5, circlePaint);
//   }
//   @override
//   bool shouldRepaint(CustomPainter old)=>true;
//
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/constants/app_localizations.dart';
import '../../../core/routing/routes.dart';
import '../../../main.dart';
import '../../login/ui/widgets/log.dart';
class IntroScreens extends StatefulWidget {
  const IntroScreens({super.key});

  @override
  State<IntroScreens> createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  List<PageViewModel> getPages(){
    return [
      PageViewModel(
      image: Image.asset('assets/images/TeamWork.gif'),
        title: AppLocalizations.of(context)!.translate("intro1_message"),
        body: AppLocalizations.of(context)!.translate("intro1_subMess")
      ),
      PageViewModel(
          image: Image.asset('assets/images/JobOffers.gif'),
          title:  AppLocalizations.of(context)!.translate("intro2_mess"),
          body: AppLocalizations.of(context)!.translate("intro2_subMess"),
      ),
      PageViewModel(
          image: Image.asset('assets/images/SharedWorkspace.gif'),
        title: AppLocalizations.of(context)!.translate("intro3_mess"),
        body:
        AppLocalizations.of(context)!.translate("intro3_subMess"),
      ),
      PageViewModel(
          image: Image.asset('assets/images/Freelancer.gif'),
        title: AppLocalizations.of(context)!.translate("intro4_message"),
        body: AppLocalizations.of(context)!.translate("intro4_subMess",),

      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          // done: Text('Done',style: TextStyle(color: Colors.black),),
          showSkipButton: true,
          showNextButton: true,
          showDoneButton: true,
          skip:  Text(AppLocalizations.of(context)!.translate("skip_button"),style: TextStyle(color: Colors.red,fontFamily: 'myFont'),),
          next:  Text(AppLocalizations.of(context)!.translate("next"),style: TextStyle(color: Colors.green),),
          done:  Text(AppLocalizations.of(context)!.translate("done"),style: TextStyle(color: Colors.orange),),
          onDone: () {
            Navigator.of(context).pushReplacementNamed(Routes.loginScreen);
        
            // When done button is press
          },
          baseBtnStyle: TextButton.styleFrom(
            backgroundColor: Color(0xfff9ddb1),
          ),
          // nextStyle: TextButton.styleFrom(iconColor: Colors.green),
          // skipStyle: TextButton.styleFrom(textStyle: ),
          // doneStyle: TextButton.styleFrom(iconColor: Colors.orange),
        
          // onDone: (){},
          pages: getPages(),
          globalBackgroundColor: Colors.white,
        
        ),
      ),
    );
  }
}



