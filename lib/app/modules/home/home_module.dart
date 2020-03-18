import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo_list/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_todo_list/app/modules/home/home_page.dart';

import 'package:flutter_todo_list/app/modules/home/repositories/todo_repository_interface.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'repositories/todo_firebase_repository.dart';
import 'repositories/todo_hasura_repository.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        // Bind<ITodoRepository>((i) => TodoFirebaseRepository(Firestore.instance)),  // UNCOMMENT LINE FOR FIREBASE USE
        Bind<ITodoRepository>((i) => TodoHasuraRepository(i.get())),                  // COMMENT LINE FOR FIREBASE USE
        Bind((i) => HasuraConnect('HASURA_URL_CONNECT')),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
