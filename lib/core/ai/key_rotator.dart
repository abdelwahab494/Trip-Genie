import 'package:trip_genie/core/manager/app_imports.dart';

class KeyRotator {
  final List<String> keys;
  int _index = 0;

  KeyRotator(this.keys);

  String getKey() {
    final key = keys[_index];
    _index = (_index + 1) % keys.length;
    debugPrint(key);
    return key;
  }
}
