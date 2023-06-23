import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_students/src/shared/models/domain/student.dart';
import 'package:flutter_students/src/shared/repositories/student_repository.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';

import '../../shared/models/query_builder.dart';
import '../../shared/models/register_student.dart';
import '../../shared/services/fetch_store/fetch_store.dart';
import '../../shared/transformers/student_to_register_student.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final StudentRepository repository = Modular.get();

  @observable
  QueryBuilder query = QueryBuilder(
    fields: ['nome', 'email', 'telefone', 'observacao'],
    orderBy: 'id DESC',
    termo: '',
  );

  Map<String, IconData> ordersBase = {
    'id Desc': FontAwesomeIcons.arrowDown91,
    'id ASC': FontAwesomeIcons.arrowDown19,
    'nome ASC': FontAwesomeIcons.arrowDownAZ,
    'nome DESC': FontAwesomeIcons.arrowDownZA,
  };

  Map<String, IconData> orders = {
    'id Desc': FontAwesomeIcons.arrowDown91,
    'id ASC': FontAwesomeIcons.arrowDown19,
    'nome ASC': FontAwesomeIcons.arrowDownAZ,
    'nome DESC': FontAwesomeIcons.arrowDownZA,
  };

  @observable
  IconData iconOrder = FontAwesomeIcons.arrowDown91;

  @observable
  List<Student> list = [];

  @observable
  bool isFetching = false;

  FetchStore<List<Student>> students = FetchStore([]);

  init() {
    fetchStudents();
  }

  fetchStudents({QueryBuilder? queryReult}) async {
    students.fetch(repository.list(queryReult ?? query));
  }

  Future<void> onRefresh() async {
    fetchStudents();
  }

  void goRegister() {
    Modular.to.pushNamed(
      '/register',
      arguments: {
        'data': RegisterStudent(),
      },
    ).then(
      (value) => fetchStudents(),
    );
  }

  void onDelete(Student student) async {
    await repository.delete(student.id.toString());
    fetchStudents();
  }

  void handleActive(Student student) async {
    student.active = !student.active;
    await repository.upInsert(student);
  }

  void onSearch(String termo) {
    query.termo = termo;
    fetchStudents();
  }

  void onActive() {
    fetchStudents(
        queryReult: QueryBuilder(
      fields: ['situacao'],
      termo: '1',
    ));
  }

  void onNoActive() {
    fetchStudents(
        queryReult: QueryBuilder(
      fields: ['situacao'],
      termo: '0',
    ));
  }

  void onOrder() {
    query.orderBy = resolveOrder();
    iconOrder = orders[query.orderBy] ?? FontAwesomeIcons.trash;

    fetchStudents();
  }

  void goEditRegister(Student student) {
    Modular.to.pushNamed(
      '/register',
      arguments: {
        'data': StudentToRegisterStudent.transform(student),
      },
    ).then(
      (value) => fetchStudents(),
    );
  }

  String resolveOrder() {
    String order = '';
    Map<String, IconData> ordersBaseNew = {};

    ordersBase.forEach((key, value) {
      ordersBaseNew[key] = value;
    });

    if (orders.isEmpty) {
      orders = ordersBaseNew;
    }

    orders.removeWhere((key, value) => key == query.orderBy);

    if (orders.isEmpty) {
      orders = ordersBaseNew;
    }

    orders.forEach((key, value) {
      order = key;
    });

    return order;
  }
}
