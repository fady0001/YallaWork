import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/Tabs/ProfilePagr.dart';
import 'package:untitled3/Tabs/posts.dart';
import 'package:untitled3/features/freelance/logic/homeF_cubit.dart';
import '../../../Tabs/freelanceposts.dart';
import '../../../Tabs/menu.dart';
import '../../../chat/modules/chat_page.dart';
import '../../../chat/modules/main_page.dart';
import '../../../constants/app_localizations.dart';
import '../../../core/di/dependency_injection.dart';
import '../../main_search_page/ui/search_empty.dart';
import '../../posts/logic/home_cubit.dart';
import '../../profile/cubit/cubit.dart';
import '../../profile/pro.dart';



class Home_Screen extends StatelessWidget    {
  final int initialIndex;

  Home_Screen({this.initialIndex = 0});
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(

            elevation: 0,

            title: Text(AppLocalizations.of(context)!.translate("splas_mess"),
              style: TextStyle(fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent,),),
            actions: <Widget>[
              IconButton(
                color: Colors.black,
                icon: Icon(Icons.search_sharp),
                onPressed: () {

                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchEmptyPage()));
                },
              ),
              // IconButton(
              //     color: Colors.black,
              //     icon: Icon(Icons.forum, size: 30,),
              //     onPressed: () {}
              // ),
            ],


            //Tab Bar
            bottom: TabBar(
              unselectedLabelColor: Colors.black54,
              indicatorColor: Colors.orangeAccent,
              labelColor: Colors.orangeAccent,
              tabs: [
                Tab(icon: Icon(Icons.home_filled)),

                // Tab(icon: Icon(Icons.control_point_rounded),),
                Tab(icon: Icon(Icons.maps_home_work_outlined)),
                Tab(icon: Icon(Icons.person_2_outlined),),
                Tab(icon: Icon(Icons.forum),),
                Tab(icon: Icon(Icons.menu)),
              ],
            ),
          ),

          body: TabBarView(
            children: <Widget>[

              Container(child:
              BlocProvider(
                create: (context) => HomeCubit(getIt())..getSpecializations(),
                child:  PostsPage(),
              ),),

              Container(child: BlocProvider(
                create: (context) =>
                HomeFCubit(getIt())
                  ..getSpecializations(),
                child: FreelancePage(),
              ),
              ),
              Container(child:
              BlocProvider(
                create: (context) => ProfileCubit(getIt())..getSpecializations(),
                child:  ProfileScreen(),
              ),),

              Container(child: ChatPage(),),

              Container(
                child: Side_bar(),
              )
              // Icon(Icons.control_point_rounded),
              // Icon(Icons.bookmark_border_rounded),

            ],
          )
      ),
    );
  }
}