

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/features/suggestion_post/logic/suggestion_post_state.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/helpers/sharedpreference.dart';
import '../data/model/suggestion_post_model.dart';
import '../data/repo/repo.dart';


class SuggestionCubit extends Cubit<SuggestionState> {
  final SuggestionRepo _suggestionRepo;
  int currentPage = 1;
  List<Post1> allPosts = [];


  SuggestionCubit(this._suggestionRepo) : super(const SuggestionState.initial());

  void getSpecializations() async {
    emit(const SuggestionState.specializationsLoading());
    final response = await _suggestionRepo.getSpecialization(currentPage);
    response.when(
      success: (specializationsResponseModel)async {
        // if (specializationsResponseModel.data != null) {
        if (specializationsResponseModel.data!.isNotEmpty){
          currentPage++;
          allPosts.addAll(specializationsResponseModel.data!);
          // emit(SuggestionState.specializationsSuccess(SuggestedPosts(data: allPosts)));

          // Save the IDs of all posts
          for (var post in specializationsResponseModel.data!) {
            await savePostId(post.id!);
          }
         // emit(SuggestionState.specializationsSuccess(SuggestedPosts(data: allPosts)));
        } else {

         emit(SuggestionState.specializationsSuccess(SuggestedPosts(data: allPosts)));
        }
        emit(SuggestionState.specializationsSuccess(SuggestedPosts(data: allPosts)));
      },
      failure: (errorHandler) {
        emit(SuggestionState.specializationsError(errorHandler));
      },
    );
  }
  Future savePostId(int postIdSuggetion) async {
    await SharedPrefHelper.setData( SharedPrefKeys.postIdSuggetion, postIdSuggetion);
  }
}


