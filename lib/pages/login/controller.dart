import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xdownloadmanagement/common/index.dart';
import 'package:xdownloadmanagement/common/utils/snack_bar_util.dart';

class LoginController extends GetxController {
  late TextEditingController passwordController;

  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    passwordController.dispose();
  }

  login() async {
    if (await AppSettingService().verifyPassword(passwordController.text)) {
      Get.offNamed(RouteNames.main);
      SnackBarUtil().success('登陆成功');
    }else{
      SnackBarUtil().fail('登陆失败');
    }
  }
}
