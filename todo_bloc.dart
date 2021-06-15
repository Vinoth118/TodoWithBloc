import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toto/todo_event.dart';
import 'package:toto/todo_state.dart';
import 'todo.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial());

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if(event is TodoAdded) {
      yield* _mapTodoAddedToState(event);
    }
  }

  Stream<TodoState> _mapTodoAddedToState(event) async* {
    yield TodoLoadInProgress();
    List<Todo> list = event.todo;
    yield TodoLoadSuccess(list);
  }

}