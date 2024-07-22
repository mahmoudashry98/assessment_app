import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/modules/home/controller/states.dart';
import 'package:test_project/services/home/home_services.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateInitial());
  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  int currentPage = 1;
  bool isFetching = false;



  Future<void> fetchProducts({bool isInitial = false}) async {
    if (isFetching) return;
    isFetching = true;

    if (isInitial) {
      currentPage = 1;
      emit(HomeStateInitial());
    } else {
      emit(ProductLoadingMore(state.products));
    }

    final result = await HomeServices.getProducts();
    result.fold(
      (products) {
        if (isInitial) {
          emit(ProductLoaded(products.products));
        } else {
          emit(ProductLoaded(state.products + products.products));
        }
        currentPage++;
      },
      (failure) => emit(ProductError(failure.message)),
    );
    isFetching = false;
  }
}
