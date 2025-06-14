import 'package:cherrilog/cherrilog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xdownloadmanagement/common/index.dart';

void main() {
  CherriLog.init(
  options: CherriOptions()
    ..logLevelRange = CherriLogLevelRanges.all
    ..useBuffer = false,
).logTo(CherriConsole());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'X下载管理器',
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.login,
      getPages: RoutePages.list,
    );
  }
}
