
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import '../../core/routing/routes.dart';
import '../../features/add/widget/shared_preferences.dart';
import '../../my_widgets/headline_widget.dart';
import '../../networking/api_constants.dart';
import '../logic/save_cubit.dart';
import '../logic/save_state.dart';
import '../models/save_model.dart';

class Save extends StatefulWidget {
  @override
  State<Save> createState() => _SaveState();
}

class _SaveState extends State<Save> {
  @override
  void initState() {
    super.initState();
    context.read<SaveCubit>().getGeneralPosts();
  }
  String token = CachData.getData(key: 'access_token');
  Future<bool>DeletePost(int id) async{
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var request = http.Request('DELETE', Uri.parse('${ApiConstants.apiBaseUrl}wishlist/remove_post'));
    request.body = json.encode({
      "post_id": id
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('truuuuuuuuuuuu');
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print('falseeeeeeee');
      print(response.reasonPhrase);
      return false;
    }

  }
  int? id;
  dynamic baseUrl = ApiConstants.Url;

  String extractPath(String fullPath) {
    var pathParts = fullPath.split('\\');
    return pathParts.sublist(pathParts.length - 1).join('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeadlineWidget(title: "Saved Posts"),
      ),
      body: BlocConsumer<SaveCubit, SaveState>(
        listener: (context, state) {
          if (state is SpecializationsSuccess) {
            setState(() {});
          }
        },
        builder: (context, state) {
          var cubit = context.read<SaveCubit>();
          if (state is SpecializationsLoading) {
            return setupLoading();
          } else if (state is SpecializationsSuccess) {
            return setupSuccess(state.responseModel.wishlistPosts.posts);
          }
            else{

            return setupError();
          }


        },
      ),
    );
  }
  Widget setupEmptyState() {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Text('No saved posts.'),
              Spacer(flex: 2,),
              Image.asset('assets/illestrations/No data.gif',
              ),
              Spacer(),
              Text('Save the posts that suit for easy reference',textAlign: TextAlign.center,),
              Spacer(flex: 2,),
            ],
          ),
        ),
      ),
    );
  }
  Widget setupLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget setupSuccess(List<List<WishlistPost>> specializationsLists) {
    return Padding(
      padding: const EdgeInsets.all(16.0),

      child:  specializationsLists.isNotEmpty?ListView.builder(
        itemCount: specializationsLists.length,
        itemBuilder: (context, outerIndex) {
          final specializationsList = specializationsLists[outerIndex];
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: specializationsList.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final post = specializationsList[index];
              var extractedPath = extractPath(post.companyLogo ?? post.profilePhoto ?? '');

              return InkWell(
                onTap: () {

                  if (post.freelancerId != null) {
                    Navigator.pushNamed(
                      context,
                      Routes.detailsavefreelance,
                      arguments: {
                        'profile_photo': post.profilePhoto,
                        'phone_number': post.phoneNumber,
                        'location': post.location,
                        'general_job_title': post.generalJobTitle,
                        'specialization': post.specialization,
                        'earnings': post.earnings,
                        'job_information': post.jobInformation,
                        'requirements': post.requirements,
                      },
                    );
                  } else {
                    Navigator.pushNamed(
                      context,
                      Routes.detailJobSave,
                      arguments: {
                        'id': post.id,
                        'company_logo': post.companyLogo,
                        'general_job_title': post.generalJobTitle,
                        'company_name': post.companyName,
                        'detailed_location': post.detailedLocation,
                        'expected_salary': post.expectedSalary,
                        'enrollment_status': post.enrollmentStatus,
                        'requirements': post.requirements,
                        'job_information': post.jobInformation,
                      },
                    );
                  }
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

                        child: post.companyLogo!=null&&post.companyLogo!.isNotEmpty
                            ? Image.network(
                          ApiConstants.Url +'storage/'+ extractedPath,
                          width: 48,
                          height: 48,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                             'assets/images/photo_2024-08-17_03-15-31.jpg',
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                            );
                          },
                        )
                            : Image.asset('assets/images/photo_2024-08-17_03-15-31.jpg',
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
                              post.generalJobTitle ?? '',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                if (post.applicationDeadline != null)
                                  Text(
                                    post.applicationDeadline!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: Colors.grey),
                                  ),
                                const SizedBox(width: 5),
                                if (post.phoneNumber != null) ...[
                                  const Icon(
                                    Icons.phone,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                      post.phoneNumber!,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold
                                      )
                                  ),
                                ],
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                if (post.detailedLocation != null) ...[
                                  const Icon(
                                    Icons.place_outlined,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    post.detailedLocation ?? '',
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                  const SizedBox(width: 4),
                                ],
                                if (post.enrollmentStatus != null) ...[
                                  const Icon(
                                    Icons.card_travel_rounded,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    post.enrollmentStatus ?? '',
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 3),
                      GestureDetector(
                        onTap: () async {
                          bool isDeleted = await DeletePost(post.id!);
                          if (isDeleted) {
                            setState(() {
                              specializationsList.removeAt(index);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Deleted from saved posts successfully!'),
                                ),
                              );
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Failed to delete from saved posts. Please try again.'),
                              ),
                            );
                          }
                        },
                        child: const Icon(
                          Icons.delete,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ):setupEmptyState()
    );
  }

  Widget setupError() {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Text('No saved posts.'),
              Spacer(flex: 2,),
              Image.asset('assets/illestrations/No data.gif',
              ),
              Spacer(),
              Text('Save the posts that suit for easy reference',textAlign: TextAlign.center,),
              Spacer(flex: 2,),
            ],
          ),
        ),
      ),
    );
  }


}
