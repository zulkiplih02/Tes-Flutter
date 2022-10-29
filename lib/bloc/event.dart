part of 'bloc.dart';

@immutable
abstract class EventFood extends Equatable {
  const EventFood();
  @override
  List<Object> get props => [];
}

class ListEventFood extends EventFood {
  const ListEventFood();
}

class DetailEventFood extends EventFood {
  final String id;
  final VoidCallback onEmptyDetail;
  final Function({required FoodModel detailData}) onSuccess;
  const DetailEventFood(
      {required this.id, required this.onEmptyDetail, required this.onSuccess});
}
