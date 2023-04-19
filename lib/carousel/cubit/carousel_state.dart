import 'package:equatable/equatable.dart';

class CarouselState extends Equatable {
  const CarouselState({
    this.selectedPage = 0,
  });

  final int selectedPage;

  @override
  List<Object?> get props => [selectedPage];

  CarouselState copyWith({
    int? selectedPage,
  }) =>
      CarouselState(selectedPage: selectedPage ?? this.selectedPage);
}
