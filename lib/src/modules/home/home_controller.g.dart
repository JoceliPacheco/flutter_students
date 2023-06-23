// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$queryAtom =
      Atom(name: 'HomeControllerBase.query', context: context);

  @override
  QueryBuilder get query {
    _$queryAtom.reportRead();
    return super.query;
  }

  @override
  set query(QueryBuilder value) {
    _$queryAtom.reportWrite(value, super.query, () {
      super.query = value;
    });
  }

  late final _$iconOrderAtom =
      Atom(name: 'HomeControllerBase.iconOrder', context: context);

  @override
  IconData get iconOrder {
    _$iconOrderAtom.reportRead();
    return super.iconOrder;
  }

  @override
  set iconOrder(IconData value) {
    _$iconOrderAtom.reportWrite(value, super.iconOrder, () {
      super.iconOrder = value;
    });
  }

  late final _$listAtom =
      Atom(name: 'HomeControllerBase.list', context: context);

  @override
  List<Student> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<Student> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$isFetchingAtom =
      Atom(name: 'HomeControllerBase.isFetching', context: context);

  @override
  bool get isFetching {
    _$isFetchingAtom.reportRead();
    return super.isFetching;
  }

  @override
  set isFetching(bool value) {
    _$isFetchingAtom.reportWrite(value, super.isFetching, () {
      super.isFetching = value;
    });
  }

  @override
  String toString() {
    return '''
query: ${query},
iconOrder: ${iconOrder},
list: ${list},
isFetching: ${isFetching}
    ''';
  }
}
