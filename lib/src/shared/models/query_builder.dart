class QueryBuilder {
  List<String> fields;
  String orderBy;
  String termo;

  QueryBuilder({
    this.termo = '',
    this.fields = const [],
    this.orderBy = ' id Desc',
  });
}
