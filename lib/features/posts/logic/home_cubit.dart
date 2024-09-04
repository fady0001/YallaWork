
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models.dart';
import '../repos.dart';
import 'home_state.dart';

// class HomeCubit extends Cubit<HomeState> {
//   final HomeRepo _homeRepo;
//   int currentPage = 1;
//
//   HomeCubit(this._homeRepo) : super(const HomeState.initial());
//
//   void getSpecializations() async {
//     emit(const HomeState.specializationsLoading());
//     final response = await _homeRepo.getSpecialization(currentPage);
//     response.when(
//       success: (specializationsResponseModel) {
//         currentPage++;
//
//         emit(HomeState.specializationsSuccess(specializationsResponseModel));
//       },
//       failure: (errorHandler) {
//         emit(HomeState.specializationsError(errorHandler));
//       },
//     );
//   }
// }
//
//


// class HomeCubit extends Cubit<HomeState> {
//   final HomeRepo _homeRepo;
//   int currentPage = 1;
//   List<Post> allPosts = [];
//
//   HomeCubit(this._homeRepo) : super(const HomeState.initial());
//
//   void getSpecializations() async {
//     emit(const HomeState.specializationsLoading());
//
//     final response = await _homeRepo.getSpecialization(currentPage);
//     response.when(
//       success: (specializationsResponseModel) {
//         if(specializationsResponseModel.posts!.isNotEmpty){
//           currentPage++;
//           allPosts.addAll(specializationsResponseModel.posts ?? []);
//         }else{
//           emit(HomeState.specializationsSuccess(PostModels(posts: allPosts)));
//         }
//         emit(HomeState.specializationsSuccess(PostModels(posts: allPosts)));
//       },
//       failure: (errorHandler) {
//         emit(HomeState.specializationsError(errorHandler));
//       },
//     );
//   }
// }


class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  int currentPage = 1;
  List<Post> allPosts = [];


  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecialization(currentPage);

    response.when(
      success: (specializationsResponseModel) {
        currentPage++;
        allPosts.addAll(specializationsResponseModel.posts!);
        emit(HomeState.specializationsSuccess(specializationsResponseModel));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationsError(errorHandler));
      },
    );
  }
}