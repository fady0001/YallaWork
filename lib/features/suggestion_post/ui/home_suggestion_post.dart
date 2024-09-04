
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled3/features/suggestion_post/ui/suggestion_post_ui.dart';
import '../../../constants/app_localizations.dart';
import '../../../my_widgets/headline_widget.dart';
import '../logic/suggestion_post_cubit.dart';



class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      context.read<SuggestionCubit>().getSpecializations();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  HeadlineWidget(title: AppLocalizations.of(context)!.translate("suggestionJob"),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          padding:  EdgeInsets.all(24),
          child: Column(
            children: [
              SvgPicture.asset('assets/illestrations/Businesssolution-cuate.svg',
                width: 250,
                height: 150,

              ),


              SizedBox(height: 24.h),

              HeadlineWidget(title:AppLocalizations.of(context)!.translate("posts"),
                  ),
              SizedBox(height: 16.h),
              Container(child:RecentSuggestionWidget()),
              // Icon(Icons.home_filled),
              // PostsPage(),),

              //RecentSuggestionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

