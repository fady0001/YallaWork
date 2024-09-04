
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/features/main_search_page/logic/search_filter_state.dart';
import '../data/model/ModelSearchFilter.dart';
import '../data/model/searchmModel.dart';
import '../data/repo/repositorySearchMain.dart';
import 'searchm_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepom _searchRepom;
  int currentPage = 1;
  List<Data> posts = [];
  List<DataF> freelancePosts = [];

  SearchCubit(this._searchRepom) : super(const SearchState.initial());

  void searchPosts(String query, {bool isNewSearch = false}) async {
    if (isNewSearch) {
      emit(const SearchState.specializationsLoading());
      currentPage = 1;
      // posts.clear();
      // freelancePosts.clear();
    } else {
      emit(SearchState.specializationsLoading());
    }

    final response = await _searchRepom.searchSpecialization(query, currentPage);

    response.when(
      success: (specializationsResponseModel) {
        if (specializationsResponseModel.posts!.isNotEmpty&&specializationsResponseModel.posts! !=null) {
          currentPage++;
          posts.addAll(specializationsResponseModel.posts!);
        }

        if (specializationsResponseModel.freelancePosts != null) {
          freelancePosts.addAll(specializationsResponseModel.freelancePosts!);
        }

        emit(SearchState.specializationsSuccess(SearchMmodel(posts: posts)));
      },
      failure: (errorHandler) {
        emit(SearchState.specializationsError(errorHandler));
      },
    );
  }
}







class SearchCubitF extends Cubit<SearchStateF> {
  final SearchRepo _searchRepo;
  int currentPage = 1;
  List<Datafilter> posts = [];
  List<DataFreelancefilter> freelancePosts = [];

  SearchCubitF(this._searchRepo) : super(const SearchStateF.initial());

  void searchPosts({
     List<String>? jobTitles,
     List<String>? enrollement,
     List<String>? specializations,
    bool isNewSearch = false,
  }) async {
    if (isNewSearch) {
      emit(const SearchStateF.specializationsLoading());
      currentPage = 1;
      // posts.clear();
      // freelancePosts.clear();
    } else {
      emit(SearchStateF.specializationsLoading());
    }


    final response = await _searchRepo.searchSpecialization(
      jobTitles: jobTitles!,
      enrollement: enrollement!,
      specializations: specializations!,
      page: currentPage,
    );

    response.when(
      success: (specializationsResponseModel) {
        if (specializationsResponseModel.posts != null && specializationsResponseModel.posts!.isNotEmpty) {
          currentPage++;
          posts.addAll(specializationsResponseModel.posts!);
        }

        if (specializationsResponseModel.freelancePosts != null && specializationsResponseModel.freelancePosts!.isNotEmpty) {
          currentPage++;
          freelancePosts.addAll(specializationsResponseModel.freelancePosts!);
        }

        emit(SearchStateF.specializationsSuccess(SearchMmodelF(posts: posts)));
      },
      failure: (errorHandler) {
        emit(SearchStateF.specializationsError(errorHandler));
      },
    );
  }
}



