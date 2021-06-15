import 'package:equatable/equatable.dart';
import 'package:toto/todo.dart';

abstract class TodoState extends Equatable {}

class TodoInitial extends TodoState {
  @override
  List<Object> get props => [];

}

class TodoLoadSuccess extends TodoState {
  final List<Todo> todo;

  TodoLoadSuccess(this.todo);

  @override
  List<Object> get props => [todo];

}

class TodoLoadInProgress extends TodoState {
  TodoLoadInProgress();

  @override
  List<Object> get props => [];

}

class TodoLoadFailure extends TodoState {
  final String message;

  TodoLoadFailure({required this.message});

  @override
  List<Object> get props => [message];

}