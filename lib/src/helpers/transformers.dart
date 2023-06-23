import 'package:intl/intl.dart';

int dynamicToInt(source) {
  if (source.runtimeType == bool) {
    return source ? 1 : 0;
  }

  return source;
}

bool dynamicToBool(dynamic source, {bool nullable = false}) {
  if (source.toString() == 'true') {
    return true;
  } else if (source.toString() == 'false') {
    return false;
  }
  return dynamicToInt(source) != 0;
}

String dynamicToString(dynamic source) {
  if (source != null) {
    return source.toString();
  }
  return '';
}

double dynamicToDouble(dynamic source) {
  try {
    return double.parse(source.toString());
  } catch (e) {
    return 0;
  }
}

String formatCurrency(
  double amount, {
  int decimais = 2,
  String prefix = 'R\$ ',
}) {
  final formatCurrency = NumberFormat.simpleCurrency(
    locale: 'pt_BR',
    name: prefix,
    decimalDigits: decimais,
  );
  return formatCurrency.format(amount);
}

double currencyToDouble(String value) {
  value = value.replaceAll(' ', '');
  value = value.replaceAll('R\$', '');
  value = value.replaceAll('.', '');
  value = value.replaceAll(',', '.');
  value = value.replaceAll(' ', '');

  return dynamicToDouble(value);
}
