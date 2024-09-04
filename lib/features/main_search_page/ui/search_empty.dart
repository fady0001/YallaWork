
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants/app_color.dart';
import '../../../constants/app_localizations.dart';
import '../../../core/di/dependency_injection.dart';
import '../../../my_widgets/headline_widget.dart';
import '../../../networking/api_constants.dart';
import '../FilterSearchPage/main_filter_search_page.dart';
import '../MainSearchPage.dart';
import '../logic/search_cubit.dart';

class SearchEmptyPage extends StatefulWidget {
  const SearchEmptyPage({super.key});

  @override
  State<SearchEmptyPage> createState() => _SearchEmptyPageState();
}

class _SearchEmptyPageState extends State<SearchEmptyPage> {
  TextEditingController _searchController = TextEditingController();
  String? query;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  dynamic baseUrl = ApiConstants.Url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeadlineWidget(title: ""),
      ),
    //  backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 20),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 250.w,
                    height: 50.h,
                    child: TextFormField(
                      controller: _searchController,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {
                        query = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide: BorderSide(color: AppColor.primaryColor)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide: BorderSide(color: AppColor.primaryColor)),
                        hintText:  AppLocalizations.of(context)!.translate("search"),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide: BorderSide(color: AppColor.primaryColor)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide: BorderSide(color: AppColor.primaryColor, width: 2)),
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: IconButton(
                          onPressed: () {
                            if (query != null && query!.isNotEmpty) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                    create: (context) => SearchCubit(getIt())..searchPosts(query!),
                                    child: MainSearchPage(query: query!),
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please enter something to search.'),
                                ),
                              );
                            }
                          },
                          icon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 50.h,
                    width: 55.w,
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder:  (context) =>
                                FilterSearchPage());

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      child:  Icon(
                        size: 30,
                        Icons.filter_list,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
SizedBox(height: 40.h,),
              SvgPicture.asset('assets/illestrations/Job hunt-amico.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
