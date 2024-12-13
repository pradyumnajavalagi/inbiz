abstract class HomeEvent {}

class HomeFetch extends HomeEvent {
  final String category;

  HomeFetch({required this.category});
}
