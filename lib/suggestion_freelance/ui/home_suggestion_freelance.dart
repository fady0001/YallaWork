


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled3/suggestion_freelance/logic/suggestion_freelance_cubit.dart';
import 'package:untitled3/suggestion_freelance/ui/suggestion_freelance_ui.dart';

import '../../constants/app_localizations.dart';
import '../../my_widgets/headline_widget.dart';

class ExploreFreelancePage extends StatefulWidget {
  const ExploreFreelancePage({super.key});

  @override
  _ExploreFreelancePageState createState() => _ExploreFreelancePageState();
}

class _ExploreFreelancePageState extends State<ExploreFreelancePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      context.read<SuggestionFreelanceCubit>().getSpecializations();
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
        elevation: 0,
        title:  HeadlineWidget(title:AppLocalizations.of(context)!.translate("suggestionFree"),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding:  EdgeInsets.all(24),
        child: Column(
          children: [
          SvgPicture.asset('assets/illestrations/Writersblock-bro.svg',
          width: 250,
          height: 150,),
            SizedBox(height: 24.h),
            HeadlineWidget(title:AppLocalizations.of(context)!.translate("posts"),
            ),
            SizedBox(height: 16.h),
            Container(child:RecentSuggestionFreelanceWidget()),

          ],
        ),
      ),
    );
  }
}

