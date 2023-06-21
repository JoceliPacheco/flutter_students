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
  return double.parse(source.toString());
}
