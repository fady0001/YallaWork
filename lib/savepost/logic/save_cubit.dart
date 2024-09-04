import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/savepost/logic/save_state.dart';

import '../../../core/helpers/constants.dart';

import '../../core/helpers/sharedpreference.dart';
import '../models/save_model.dart';
import '../repo.dart';
class SaveCubit extends Cubit<SaveState> {
  final SaveRepo _saveRepo;
  SaveCubit(this._saveRepo) : super(const SaveState.initial());

  void getGeneralPosts() async {
    emit(const SaveState.specializationsLoading());
    final response = await _saveRepo.getSpecialization();
    response.when(
      success: (specializationsResponseModel) {

        final generalPosts = specializationsResponseModel.wishlistPosts.posts.where((list) => list.every((post) => post.freelancerId == null)).toList();
        emit(SaveState.specializationsSuccess(ResponseModel(status: specializationsResponseModel.status, wishlistPosts: WishlistPosts(posts: generalPosts))));
      },
      failure: (errorHandler) {
        emit(SaveState.specializationsError(errorHandler));
      },
    );
  }

  void getFreelancePosts() async {
    emit(const SaveState.specializationsLoading());
    final response = await _saveRepo.getSpecialization();
    response.when(
      success: (specializationsResponseModel) {

        final freelancePosts = specializationsResponseModel.wishlistPosts.posts.where((list) => list.every((post) => post.freelancerId != null)).toList();

        emit(SaveState.specializationsSuccess(ResponseModel(status: specializationsResponseModel.status, wishlistPosts: WishlistPosts(posts: freelancePosts))));
        },
      failure: (errorHandler) {
        emit(SaveState.specializationsError(errorHandler));
      },
    );
  }
}

