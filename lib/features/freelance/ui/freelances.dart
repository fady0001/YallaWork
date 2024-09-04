import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:untitled3/features/freelance/logic/homeF_cubit.dart';
import 'package:untitled3/features/freelance/models.dart';
import '../../../constants/app_color.dart';
import '../../../core/helpers/sharedpreference.dart';
import '../../../core/routing/routes.dart';
import '../../../networking/api_constants.dart';
import '../../add/widget/shared_preferences.dart';
import '../logic/homeF_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class FreelancesPosts extends StatefulWidget {
  const FreelancesPosts({super.key  });



  @override

  State<FreelancesPosts> createState() => _FreelancesPostsState();
}

class _FreelancesPostsState extends State<FreelancesPosts> {

  dynamic baseUrl = ApiConstants.Url;
  List<int> savedPosts = []; // List to store saved post IDs
  int? id;

  String extractPath(String fullPath) {
    var pathParts = fullPath.split('\\');
    return pathParts.sublist(pathParts.length - 1).join('/');
  }

  String token=  CachData.getData(key: 'access_token');

  Future<bool> SendIdPostSave(int id) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization':'Bearer $token'
    };
    var request = http.Request('POST', Uri.parse('${ApiConstants.apiBaseUrl}wishlist/add_post'));
    request.body = json.encode({
      "freelancer_id": id,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print('Successfully added to wishlist');
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  Future<bool> RemoveIdPostSave(int id) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization':'Bearer $token'
    };
    var request = http.Request('DELETE', Uri.parse('${ApiConstants.apiBaseUrl}wishlist/remove_post'));
    request.body = json.encode({
      "freelancer_id": id,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print('Successfully removed from wishlist');
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  @override

  Widget build(BuildContext context) {

    return BlocConsumer<HomeFCubit, HomeStateF>(
      listener: (context, state) {
        if (state is SpecializationsSuccess) {
          setState(() {});
        }
      },
      builder: (context, state) {
        var cubit = context.read<HomeFCubit>();
        if (state is SpecializationsLoading && cubit.allPostsF.isEmpty) {
          return setupLoading();
        }
        return setupSuccess(cubit.allPostsF, state is SpecializationsLoading);
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
  Widget setupSuccess(List<Freelance> specializationsList, bool isLoading) {
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

        final freelance = specializationsList[index];
        var extractedPath = extractPath(freelance.profilePhoto!);
        bool isSaved = savedPosts.contains(freelance.id);
        SharedPrefHelper.setData('save', isSaved);
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.detailfreelance,
              arguments: {
                'application_deadline':freelance.applicationDeadline,

                'id':freelance.id,
                'user_id':freelance.userid,
                'profile_photo': freelance.profilePhoto,
                'general_job_title': freelance.generalJobTitle,
                'specialization': freelance.specialization,
                'location': freelance.location,
                'earnings': freelance.earnings,
                'phone_number': freelance.phoneNumber,
                'requirements': freelance.requirements,
                'job_information': freelance.jobInformation,
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
                      freelance.profilePhoto != null && freelance.profilePhoto!.isNotEmpty
                          ? baseUrl +'storage/'+ extractedPath
                          : 'assets/images/photo_2024-08-17_03-15-37.jpg',
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/photo_2024-08-17_03-15-37.jpg',
                          width: 48,
                          height: 48,
                        );
                      },                 width: 48,
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
                          freelance.generalJobTitle!,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        // SizedBox(height:2),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                freelance.applicationDeadline!,
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
                              freelance.phoneNumber!,
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
                              freelance.specialization!,
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
                  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        GestureDetector(
        onTap: () async {
        bool isSuccess;
        if (isSaved) {
        isSuccess = await RemoveIdPostSave(freelance.id!);
        } else {
        isSuccess = await SendIdPostSave(freelance.id!);
        }

        if (isSuccess) {
        setState(() {
        if (isSaved) {
        savedPosts.remove(freelance.id);
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
        content: Text('Removed from saved posts'),
        ),
        );
        } else {
        savedPosts.add(freelance.id!);
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
        content: Text('Added to saved posts successfully!'),
        ),
        );
        }
        });
        } else {
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
        content: Text('Failed to add to saved posts. Please try again.'),
        ),
        );
        }

        },

        child: Icon(

        isSaved ? Icons.bookmark : Icons.bookmark_border_rounded,
        color: isSaved ? AppColor.primaryColor : null,
        ),
        ),
        ],
        ),
        ],
        ),
        ),
        )
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