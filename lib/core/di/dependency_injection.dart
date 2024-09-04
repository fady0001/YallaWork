import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled3/features/freelance/logic/homeF_cubit.dart';

import '../../features/freelance/apis/homeF_api_service.dart';
import '../../features/freelance/repoF.dart';

import '../../features/login/data/repos/login_repo.dart';
import '../../features/login/logic/cubit/login_cubit.dart';
import '../../features/main_search_page/data/repo/repositorySearchMain.dart';
import '../../features/main_search_page/data/searchApiService.dart';
import '../../features/main_search_page/data/searchApiServiceFilter.dart';
import '../../features/posts/apis/home_api_service.dart';
import '../../features/posts/repos.dart';
import '../../features/profile/apis/profile_api_services.dart';
import '../../features/profile/repo.dart';
import '../../features/sign_up/data/repos/sign_up_repo.dart';
import '../../features/sign_up/logic/sign_up_cubit.dart';
import '../../features/suggestion_post/data/api_servies_suggestion-post.dart';
import '../../features/suggestion_post/data/repo/repo.dart';
import '../../networking/api_service.dart';
import '../../networking/dio_factory.dart';
import '../../savepost/api/save_api_services.dart';
import '../../savepost/repo.dart';
import '../../suggestion_freelance/data/api_servies_suggestion_freelance.dart';
import '../../suggestion_freelance/data/repo/repository_SF.dart';


final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));



  // home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));

  getIt.registerLazySingleton<HomeApiServiceF>(() => HomeApiServiceF(dio));
  getIt.registerLazySingleton<HomeRepoF>(() => HomeRepoF(getIt()));

  getIt.registerLazySingleton<SuggestionFreelanceApiService>(() => SuggestionFreelanceApiService(dio));
  getIt.registerLazySingleton<SuggestionFreelanceRepo>(() => SuggestionFreelanceRepo(getIt()));

  getIt.registerLazySingleton<SaveApiService>(() => SaveApiService(dio));
  getIt.registerLazySingleton<SaveRepo>(() => SaveRepo(getIt()));

//profile
  getIt.registerLazySingleton<ProfileApiService>(() => ProfileApiService(dio));
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));



  //search
  getIt.registerLazySingleton<SearchApiService>(() => SearchApiService(dio));
  getIt.registerLazySingleton<SearchRepom>(() => SearchRepom(getIt()));


  //searchFilter
  getIt.registerLazySingleton<SearchApiServiceF>(() => SearchApiServiceF(dio));
  getIt.registerLazySingleton<SearchRepo>(() => SearchRepo(getIt()));

  // suggestion_post
  getIt.registerLazySingleton<SuggestionApiService>(() => SuggestionApiService(dio));
  getIt.registerLazySingleton<SuggestionRepo>(() => SuggestionRepo(getIt()));
}


