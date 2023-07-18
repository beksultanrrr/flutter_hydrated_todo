import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_todo/bloc/todo_bloc.dart';
import 'package:hydrated_todo/data/repository/todo_repository.dart';
import 'package:hydrated_todo/presemtation/todo_home.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TodoRepository(),
      child: BlocProvider(
        create: (context) => TodoBloc(
          RepositoryProvider.of<TodoRepository>(context),
        ),
        child: const MaterialApp(
          home: TodoHome(),
        ),
      ),
    );
  }
}





// BlocProvider(
//       create: (context) => TodoBloc(
//         RepositoryProvider.of<TodoRepository>(context),
//       ),
//       child: const MaterialApp(
//         home: TodoHome(),
//       ),
//     )