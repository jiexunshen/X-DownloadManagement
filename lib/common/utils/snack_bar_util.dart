import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:get/get.dart';

class SnackBarUtil {
  static final SnackBarUtil _instance = SnackBarUtil._internal();
  factory SnackBarUtil() => _instance;
  SnackBarUtil._internal();

  // 用于存储最后一次展示不同类型SnackBar的时间
  final Map<SnackBarType, DateTime> _lastShownTime = {};

  // 定义2秒的间隔
  final int _intervalSeconds = 2;

  // 成功消息的SnackBar
  void success(String label) {
    _showSnackBar(
      SnackBarType.success,
      label,
    );
  }

  // 失败消息的SnackBar
  void fail(String label) {
    _showSnackBar(
      SnackBarType.fail,
      label,
    );
  }

  // 私有方法用于显示SnackBar，并处理时间间隔
  void _showSnackBar(SnackBarType snackBarType, String label) {
    DateTime now = DateTime.now();

    // 检查是否存在相同类型的SnackBar展示时间记录
    if (_lastShownTime.containsKey(snackBarType)) {
      DateTime lastShown = _lastShownTime[snackBarType]!;

      // 计算从上次展示到现在的时间差
      Duration difference = now.difference(lastShown);

      // 如果间隔时间小于2秒，则不展示相同类型的SnackBar
      if (difference.inSeconds < _intervalSeconds) {
        return;
      }
    }

    // 更新展示时间为当前时间
    _lastShownTime[snackBarType] = now;

    // 调用IconSnackBar展示SnackBar
    IconSnackBar.show(
      Get.context!,
      snackBarType: snackBarType,
      label: label,
    );
  }
}
