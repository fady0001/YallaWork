import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/routing/routes.dart';
import '../../../networking/api_constants.dart';
import '../data/model/suggestion_post_model.dart';
import '../logic/suggestion_post_cubit.dart';
import '../logic/suggestion_post_state.dart';



class RecentSuggestionWidget extends StatefulWidget {
  RecentSuggestionWidget({super.key});

  @override
  State<RecentSuggestionWidget> createState() => _RecentSuggestionWidgetState();
}


class _RecentSuggestionWidgetState extends State<RecentSuggestionWidget> {
  dynamic baseUrl = ApiConstants.Url;

  String extractPath(String fullPath) {
    var pathParts = fullPath.split('\\');
    return pathParts.sublist(pathParts.length - 1).join('/');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SuggestionCubit, SuggestionState>(
      listener: (context, state) {
        if (state is SuggestionStateSuccess) {
          // if (mounted) {
            setState(() {});
          // }
        }
      },
      builder: (context, state) {
        var cubit = context.read<SuggestionCubit>();
        if (state is SuggestionStateLoading && cubit.allPosts.isEmpty) {
          return setupLoading();
        } else if (state is SuggestionStateError) {
          return setupError();
        }
        return setupSuccess(cubit.allPosts, state is SuggestionStateLoading);
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

        final jobs = specializationsList[index];
        var extractedPath = extractPath(jobs.companyLogo!);
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.detailJobSuggestionScreen,
              arguments: {
                'id': jobs.id,
                'user_id':jobs.userid,
                'company_logo': jobs.companyLogo,
                'general_job_title': jobs.generalJobTitle,
                'company_name': jobs.companyName,
                'detailed_location': jobs.detailedLocation,
                'expected_salary': jobs.expectedSalary,
                'enrollment_status': jobs.enrollmentStatus,
                'requirements': jobs.requirements,
                'job_information': jobs.jobInformation,
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.network(
                    jobs.companyLogo != null && jobs.companyLogo!.isNotEmpty
                        ? baseUrl + extractedPath
                        : '',
                    width: 48,
                    height: 48,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        jobs.generalJobTitle!,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Row(
                        children: [
                          Text(
                            jobs.applicationDeadline!,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.place_outlined, size: 18),
                          const SizedBox(width: 3),
                          Text(
                            jobs.detailedLocation!,
                            style: const TextStyle(fontSize: 11),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.card_travel_rounded, size: 18),
                          const SizedBox(width: 3),
                          Text(
                            jobs.enrollmentStatus!,
                            style: const TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
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



