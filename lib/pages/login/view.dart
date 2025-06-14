import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      id: "login",
      builder: (_) {
        return Scaffold(
          body: Center(
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                      controller: controller.passwordController,
                      decoration: const InputDecoration(
                          hintText: '请输入用户密码', border: OutlineInputBorder())),
                  ElevatedButton(
                    onPressed: controller.login,
                    child: const Text('登录'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
