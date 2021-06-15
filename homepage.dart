import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toto/todo.dart';
import 'package:toto/todo_event.dart';
import 'package:toto/todo_state.dart';

import 'todo_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple ToDo App'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: TextField(
                  onSubmitted: (val) {
                    BlocProvider.of<TodoBloc>(context)
                        .add(TodoAdded(Todo(val)));
                  },
                  decoration: InputDecoration(
                    hintText: 'What do you want to do?',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<TodoBloc, TodoState>(
                  bloc: BlocProvider.of(context),
                  builder: (context, state) {
                    if (state is TodoLoadSuccess) {
                      final list = state.todo.map((e) => e.todo).toList();
                      return ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Card(
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: CheckboxListTile(
                                          value: false,
                                          onChanged: (val) {},
                                          title: Text('${list[index]}'),
                                    )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.cancel))
                                  ],
                                ),
                              ),
                            );
                          });
                    } else if(state is TodoLoadInProgress){
                      return CircularProgressIndicator();
                    }
                    return Container();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
