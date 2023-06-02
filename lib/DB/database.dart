import 'package:firebase_database/firebase_database.dart';

class DataBase {
  //var
  final database = FirebaseDatabase.instance.ref();

  //func insert
  void insert(String name, String msg, int id) {
    database.child('user').push().set({
      'id': id,
      'name': name,
      'msg': msg,
    });
  }

  //func fetch
  Future<Iterable<DataSnapshot>> fetch() {
    final data = database.child('user').get();
    return data.then((value) => value.children);
  }
}