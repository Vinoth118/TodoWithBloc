import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Todo extends Equatable{
  String todo;

  Todo(this.todo);

  @override
  List<Object> get props => [todo];

}