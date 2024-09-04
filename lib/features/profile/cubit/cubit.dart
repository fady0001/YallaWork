import 'package:flutter_bloc/flutter_bloc.dart';
import '../../add/widget/shared_preferences.dart';
import '../repo.dart';
import 'cubit_state.dart';


class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(const ProfileState.initial());

  void getSpecializations() async {
    emit(const ProfileState.specializationsLoading());

    final response = await _profileRepo.getSpecialization();

    response.when(

      success: (specializationsResponseModel)async {
        print('truuuuuuuuuuuuuuuuuuuuuu');
        emit(ProfileState.specializationsSuccess(specializationsResponseModel));
      },
      failure: (errorHandler) {
        print('falseeeeeeeeeeeeeeeeeeeee');
        String pj= CachData.getData(key: 'photo');
        print(pj);
        print(errorHandler);
        emit(ProfileState.specializationsError(errorHandler));
      },
    );
  }

}
