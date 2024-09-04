import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/app_localizations.dart';
import '../core/di/dependency_injection.dart';
import '../features/add/widget/colors.dart';
import '../features/home/ui/tips_widget.dart';
import '../features/posts/logic/home_cubit.dart';
import '../features/posts/ui/recent_job_widget.dart';
import '../features/suggestion_post/logic/suggestion_post_cubit.dart';
import '../features/suggestion_post/ui/home_suggestion_post.dart';
import '../main.dart';
import '../my_widgets/headline_widget.dart';


class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);


  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<HomeCubit>().getSpecializations();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            HeadlineWidget(title: AppLocalizations.of(context)!.translate("tips")),
            SizedBox(height: 16),
            TipsWidget(),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeadlineWidget(title: AppLocalizations.of(context)!.translate("recentjob")),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:
                    IconButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  Container(child:
                      BlocProvider(
                        create: (context) => SuggestionCubit(getIt())..getSpecializations(),
                        child:  ExplorePage(),
                      ),),));
                    },

                      icon: Icon(Icons.explore,color: AppColor.primaryColor,),

                    ),),
                ],
              ),
            ),

            SizedBox(height: 16),
            Container(child:
            RecentJobWidget(),
            ),


          ],
        ),
      ),
    );
  }
}