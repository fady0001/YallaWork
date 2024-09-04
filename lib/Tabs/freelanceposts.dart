
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled3/suggestion_freelance/logic/suggestion_freelance_cubit.dart';
import '../constants/app_color.dart';
import '../core/di/dependency_injection.dart';
import '../features/freelance/logic/homeF_cubit.dart';
import '../features/freelance/ui/freelances.dart';
import '../my_widgets/headline_widget.dart';
import '../suggestion_freelance/ui/home_suggestion_freelance.dart';

class FreelancePage extends StatefulWidget {
  const FreelancePage({super.key});

  @override
  State<FreelancePage> createState() => _FreelancePageState();
}

class _FreelancePageState extends State<FreelancePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<HomeFCubit>().getSpecializations();
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
        body: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.all(24),
          child:Column (
            children: [
            SvgPicture.asset('assets/illestrations/Writersblock-bro.svg',
            width: 250,
            height: 150,),
              Padding(
                padding: EdgeInsets.all(4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadlineWidget(title: "Freelance"),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:
                      IconButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  Container(child:
                        BlocProvider(
                          create: (context) => SuggestionFreelanceCubit(getIt())..getSpecializations(),
                          child:  ExploreFreelancePage(),
                        ),),));
                      },
                        icon: Icon(Icons.explore,color: AppColor.primaryColor,),
                      ),),
                  ],
                ),
              ),

              SizedBox(height: 16),

              FreelancesPosts(),
            ],

          ),
        ),
      );
  }
}
