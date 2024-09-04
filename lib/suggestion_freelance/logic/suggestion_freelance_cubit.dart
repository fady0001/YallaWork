

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/suggestion_freelance/logic/suggestion_freelance_state.dart';

import '../../core/helpers/constants.dart';
import '../../core/helpers/sharedpreference.dart';
import '../data/model/suggestion_freelance_model.dart';
import '../data/repo/repository_SF.dart';

class SuggestionFreelanceCubit extends Cubit<SuggestionFreelanceState>{
  final SuggestionFreelanceRepo _freelanceRepo;
  int currentPage = 1;
  List<Post1> allPosts = [];

  SuggestionFreelanceCubit(this._freelanceRepo) : super(const SuggestionFreelanceState.initial());

  void getSpecializations() async{
    emit(const SuggestionFreelanceState.specializationsLoading());
    final response = await _freelanceRepo.getSpecialization(currentPage);
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

          emit(SuggestionFreelanceState.specializationsSuccess(SuggestedFreelance(data: allPosts)));
        }
        emit(SuggestionFreelanceState.specializationsSuccess(SuggestedFreelance(data: allPosts)));
      },
      failure: (errorHandler) {
        emit(SuggestionFreelanceState.specializationsError(errorHandler));
      },
    );
  }
  Future savePostId(int postIdSuggetion) async {
    await SharedPrefHelper.setData( SharedPrefKeys.postIdSuggetion, postIdSuggetion);

  }
}