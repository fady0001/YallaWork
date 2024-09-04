
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/features/freelance/models.dart';
import '../repoF.dart';
import 'homeF_state.dart';




class HomeFCubit extends Cubit<HomeStateF> {
  final HomeRepoF _homeRepoF;
  int currentPage = 1;
  List<Freelance> allPostsF = [];


  HomeFCubit(this._homeRepoF) : super(const HomeStateF.initial());

  void getSpecializations() async {
    emit(const HomeStateF.specializationsLoading());
    final response = await _homeRepoF.getSpecialization(currentPage);

    response.when(
      success: (specializationsResponseModel) {
        currentPage++;
        allPostsF.addAll(specializationsResponseModel.posts!);
        emit(HomeStateF.specializationsSuccess(specializationsResponseModel));
      },
      failure: (errorHandler) {
        emit(HomeStateF.specializationsError(errorHandler));
      },
    );
  }
}