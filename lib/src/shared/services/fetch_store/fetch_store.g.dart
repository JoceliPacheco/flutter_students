// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FetchStore<T> on FetchStoreBase<T>, Store {
  Computed<dynamic>? _$hasErrorComputed;

  @override
  dynamic get hasError =>
      (_$hasErrorComputed ??= Computed<dynamic>(() => super.hasError,
              name: 'FetchStoreBase.hasError'))
          .value;

  late final _$isFetchingAtom =
      Atom(name: 'FetchStoreBase.isFetching', context: context);

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

  late final _$fetchedAtom =
      Atom(name: 'FetchStoreBase.fetched', context: context);

  @override
  bool get fetched {
    _$fetchedAtom.reportRead();
    return super.fetched;
  }

  @override
  set fetched(bool value) {
    _$fetchedAtom.reportWrite(value, super.fetched, () {
      super.fetched = value;
    });
  }

  late final _$successAtom =
      Atom(name: 'FetchStoreBase.success', context: context);

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'FetchStoreBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$dataAtom = Atom(name: 'FetchStoreBase.data', context: context);

  @override
  T get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(T value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('FetchStoreBase.fetch', context: context);

  @override
  Future fetch(Future<dynamic> callback, {bool silent = false}) {
    return _$fetchAsyncAction.run(() => super.fetch(callback, silent: silent));
  }

  late final _$FetchStoreBaseActionController =
      ActionController(name: 'FetchStoreBase', context: context);

  @override
  dynamic setData(T value) {
    final _$actionInfo = _$FetchStoreBaseActionController.startAction(
        name: 'FetchStoreBase.setData');
    try {
      return super.setData(value);
    } finally {
      _$FetchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic refresh() {
    final _$actionInfo = _$FetchStoreBaseActionController.startAction(
        name: 'FetchStoreBase.refresh');
    try {
      return super.refresh();
    } finally {
      _$FetchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _onSuccess(dynamic value) {
    final _$actionInfo = _$FetchStoreBaseActionController.startAction(
        name: 'FetchStoreBase._onSuccess');
    try {
      return super._onSuccess(value);
    } finally {
      _$FetchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _onError(dynamic error) {
    final _$actionInfo = _$FetchStoreBaseActionController.startAction(
        name: 'FetchStoreBase._onError');
    try {
      return super._onError(error);
    } finally {
      _$FetchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFetching: ${isFetching},
fetched: ${fetched},
success: ${success},
errorMessage: ${errorMessage},
data: ${data},
hasError: ${hasError}
    ''';
  }
}
