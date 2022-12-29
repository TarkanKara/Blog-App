// ignore_for_file: prefer_const_constructors

import 'package:uuid/uuid.dart';

//Random Id
String generateId() {
  return Uuid().v1();
}
