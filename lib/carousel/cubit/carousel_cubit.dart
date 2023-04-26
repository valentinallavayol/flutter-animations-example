import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselCubit extends Cubit<double> {
  CarouselCubit() : super(0);

  void setSelectedPage(double selectedPage) => emit(selectedPage);
}
