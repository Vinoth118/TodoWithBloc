import 'package:equatable/equatable.dart';
import 'todo.dart';

abstract class TodoEvent extends Equatable {
}
class TodoAdded extends TodoEvent {
  final Todo todo;
  TodoAdded(this.todo);
  @override
  List<Object> get props => [todo];

}

class TodoDeleted extends TodoEvent {
  TodoDeleted();
  @override
  List<Object> get props => [];
}