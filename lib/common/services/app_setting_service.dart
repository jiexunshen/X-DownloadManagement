import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xdownloadmanagement/common/utils/crypto_util.dart';

import '../utils/secure_storage_util.dart';

class AppSettingService extends GetxService {
  final _secureStorage = SecureStorageUtil();

  final RxString themeMode = 'light'.obs;
  final RxDouble fontSize = 14.0.obs;

  // 初始化，读取存储的设置
  Future<AppSettingService> init() async {
    final prefs = await SharedPreferences.getInstance();
    themeMode.value = prefs.getString('themeMode') ?? 'light';
    fontSize.value = prefs.getDouble('fontSize') ?? 14.0;
    return this;
  }

  // 设置并保存密码
  Future<void> setPassword(String password) async {
    await _secureStorage.write('user_password', CryptoUtil().sha256(password));
  }

  // 验证密码
  Future<bool> verifyPassword(String inputPassword) async {
    return !(await _secureStorage.read('reset_password_times') == '0') ||
        ((await _secureStorage.read('user_password')) ==
            CryptoUtil().sha256(inputPassword));
  }

  // 设置字体大小
  Future<void> changeFontSize(double size) async {
    fontSize.value = size;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSize', size);
  }

  // 设置主题模式
  Future<void> changeTheme(String mode) async {
    themeMode.value = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', mode);
  }
}
