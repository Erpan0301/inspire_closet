import 'package:get/get.dart';

import 'state.dart';

class RootController extends GetxController {
  RootController();

  final state = RootState();

  _initData() {
    update(["root"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void increment(int i) {
    state.count = i;
    _initData();
  }
}
