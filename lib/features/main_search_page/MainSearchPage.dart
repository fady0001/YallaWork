import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/routing/routes.dart';
import '../../generated/assets.dart';
import '../../main.dart';
import '../../my_widgets/headline_widget.dart';
import '../../networking/api_constants.dart';
import 'data/model/searchmModel.dart';
import 'logic/search_cubit.dart';
import 'logic/searchm_state.dart';

class MainSearchPage extends StatefulWidget {
  final String query;

  const MainSearchPage({super.key, required this.query});

  @override
  State<MainSearchPage> createState() => _MainSearchPageState();
}

class _MainSearchPageState extends State<MainSearchPage> {
  bool _showFreelancePosts = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      context.read<SearchCubit>().searchPosts(widget.query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeadlineWidget(title: _showFreelancePosts ? "Search Results For Freelance Posts" : 'Search Results For regular Posts'),
        actions: [
          IconButton(
            icon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  size: 20,
                  _showFreelancePosts ? Icons.maps_home_work_outlined : Icons.work_history_outlined,
                  color: Colors.orangeAccent,
                ),
            //    const SizedBox(width: 8),
                Text(
                  _showFreelancePosts ? 'Freelance' : 'Regular',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            onPressed: () {
              setState(() {
                _showFreelancePosts = !_showFreelancePosts;
              });
            },
          ),
        ],
      ),

      body:

      BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          if (state is SearchStateSuccess) {
            setState(() {});
          }
        },
        builder: (context, state) {
          var cubit = context.read<SearchCubit>();
          if (state is SearchStateLoading && cubit.posts.isEmpty) {
            return setupLoading();
          } else if (state is SearchStateError) {
            return setupError();
          }

          if (cubit.posts.isEmpty && cubit.freelancePosts.isEmpty) {

            return setupEmptyState();
          }

          return setupSuccess(cubit.posts, cubit.freelancePosts, state is SearchStateLoading);
        },
      ),
    );
  }

  Widget setupLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget setupError() {
    return const Center(child: Text('Error loading data.'));
  }

  Widget setupEmptyState() {
    return Center(
      child: SvgPicture.asset(
        'assets/illestrations/Peoplesearch-bro.svg',
        width: 250.w,
        height: 250.h,
      ),
    );
  }

  Widget setupSuccess(List<Data> posts, List<DataF> freelancePosts, bool isLoading) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 10, left: 20),
        child: Column(
          children: [
            if (!_showFreelancePosts) ..._buildPostsList(posts),
            if (_showFreelancePosts) ..._buildFreelancePostsList(freelancePosts),
            if (isLoading)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: CircularProgressIndicator()),
              ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPostsList(List<Data> posts) {
    return [
      ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: posts.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final post = posts[index];
          return _buildPostItem(post);
        },
      ),
    ];
  }

  List<Widget> _buildFreelancePostsList(List<DataF> freelancePosts) {
    return [
      ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: freelancePosts.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final freelancePost = freelancePosts[index];
          return _buildFreelancePostItem(freelancePost);
        },
      ),
    ];
  }

  Widget _buildPostItem(Data post) {
    var extractedPath = extractPath(post.companyLogo ?? '');
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.detailJob,
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
                post.companyLogo != null &&    post.companyLogo!.isNotEmpty
                    ?ApiConstants.Url + 'storage/' + extractedPath
                    : 'assets/images/photo_2024-08-17_03-15-31.jpg',

                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/photo_2024-08-17_03-15-31.jpg',
                    width: 48,
                    height: 48,
                  );
                },
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
                  Row(
                    children: [
                      Text(
                        post.applicationDeadline ?? '',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
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
                  ),
                ],
              ),
            ),
            const SizedBox(width: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildFreelancePostItem(DataF freelancePost) {
    var extractedPathF = extractPath(freelancePost.profilePhoto ?? '');
    return ListTile(
      leading: Image.network(
        freelancePost.profilePhoto != null && freelancePost.profilePhoto!.isNotEmpty
            ?ApiConstants.Url + 'storage/' + extractedPathF
            : 'assets/images/photo_2024-08-17_03-15-31.jpg',
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            'assets/images/photo_2024-08-17_03-15-31.jpg',
            width: 48,
            height: 48,
          );
        },


      ),
      title: Text(freelancePost.generalJobTitle),
      subtitle: Text(freelancePost.location),
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.detailfreelance,
          arguments: {
            'id': freelancePost.id,
            'profile_photo': freelancePost.profilePhoto,
            'general_job_title': freelancePost.generalJobTitle,
            'location': freelancePost.location,
            'specialization': freelancePost.specialization,
            'earnings': freelancePost.earnings,
            'job_information': freelancePost.jobInformation,
            'phone_number': freelancePost.phoneNumber,
            'requirements': freelancePost.requirements,
            'application_deadline': freelancePost.applicationDeadline,
          },
        );
      },
    );
  }

  String extractPath(String fullPath) {
    var pathParts = fullPath.split('\\');
    return pathParts.sublist(pathParts.length - 1).join('/');
  }
}
