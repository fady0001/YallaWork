



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:untitled3/suggestion_freelance/logic/suggestion_freelance_cubit.dart';
import 'package:untitled3/suggestion_freelance/logic/suggestion_freelance_state.dart';

import '../../core/routing/routes.dart';
import '../../networking/api_constants.dart';
import '../data/model/suggestion_freelance_model.dart';

class RecentSuggestionFreelanceWidget extends StatefulWidget {
  RecentSuggestionFreelanceWidget({super.key});

  @override
  State<RecentSuggestionFreelanceWidget> createState() => _RecentSuggestionWidgetState();
}


class _RecentSuggestionWidgetState extends State<RecentSuggestionFreelanceWidget> {
  dynamic baseUrl = ApiConstants.Url;

  String extractPath(String fullPath) {
    var pathParts = fullPath.split('\\');
    return pathParts.sublist(pathParts.length - 1).join('/');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SuggestionFreelanceCubit, SuggestionFreelanceState>(
      listener: (context, state) {
        if (state is SuggestionFreelanceStateSuccess) {
          // if (mounted) {
          setState(() {});
          // }
        }
      },
      builder: (context, state) {
        var cubit = context.read<SuggestionFreelanceCubit>();
        if (state is SuggestionFreelanceStateLoading && cubit.allPosts.isEmpty) {
          return setupLoading();
        } else if (state is SuggestionFreelanceStateError) {
          return setupError();
        }
        return setupSuccess(cubit.allPosts, state is SuggestionFreelanceStateLoading);
      },
    );
  }

  Widget setupLoading() {
    return const SizedBox(
      height: 100,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget setupSuccess(List<Post1> specializationsList, bool isLoading) {

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: specializationsList.length + (isLoading ? 1 : 0),
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemBuilder: (context, index) {
        if (index == specializationsList.length) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final freelances = specializationsList[index];
        var extractedPath = extractPath(freelances.profilePhoto!);
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.detailFreelanceSuggestionScreen,
              arguments: {
                'id':freelances.id,
                'user_id':freelances.userid,
                'profile_photo': freelances.profilePhoto,
                'phone_number': freelances.phoneNumber,
                'location': freelances.location,
                'general_job_title': freelances.generalJobTitle,
                'specialization': freelances.specialization,
                'earnings': freelances.earnings,
                'job_information': freelances.jobInformation,
                'requirements': freelances.requirements,
              },
            );
          },
          child: PhloxAnimations(
            duration: const Duration(milliseconds: 800),
            fromX: 200,
            child: Container(
              height: 86,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: Image.network(
                      freelances.profilePhoto != null && freelances.profilePhoto!.isNotEmpty
                          ? baseUrl +'storage/'+ extractedPath
                          : 'assets/images/photo_2024-08-17_03-15-37.jpg',
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/photo_2024-08-17_03-15-37.jpg',
                          width: 48,
                          height: 48,
                        );
                      },

                      width: 48,
                      height: 48,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          freelances.generalJobTitle!,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        // SizedBox(height:2),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                freelances.applicationDeadline!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: Colors.grey),
                              ),]
                        ),

                        Row(
                          children: [
                            const Icon(
                              Icons.phone,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                                freelances.phoneNumber!,
                                style: TextStyle(
                                  // Theme.of(context).textTheme.titleMedium,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            // const SizedBox(width: 5),
                            // // const Icon(
                            // //   Icons.card_travel_rounded,
                            // //   size: 20,
                            // // ),
                            const SizedBox(width: 12),
                            Text(
                                freelances.specialization!,
                                style: TextStyle(
                                  // Theme.of(context).textTheme.titleMedium,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                )

                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // const SizedBox(width:4),

                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget setupError() {
    return const SizedBox(
      height: 100,
      child: Center(
        child: Text('Error loading data.'),
      ),
    );
  }
}



