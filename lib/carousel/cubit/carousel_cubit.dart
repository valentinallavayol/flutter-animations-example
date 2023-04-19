import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panzetapp/carousel/cubit/carousel_state.dart';

class CarouselCubit extends Cubit<CarouselState> {
  CarouselCubit() : super(const CarouselState());

  void setSelectedPage(int selectedPage) {
    emit(CarouselState(selectedPage: selectedPage));
  }
}
