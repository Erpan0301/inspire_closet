import 'package:get/get.dart';

class RootState {
  final _count = RxInt(0);
  int get count => _count.value;
  set count(int value) => _count.value = value;
}
