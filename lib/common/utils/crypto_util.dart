import 'dart:convert';

import 'package:crypto/crypto.dart' as crypto;

class CryptoUtil {
  static final CryptoUtil _instance = CryptoUtil._internal();
  factory CryptoUtil() => _instance;
  CryptoUtil._internal();

  String md5(String data) {
    return crypto.md5.convert(utf8.encode(data)).toString();
  }

  String sha256(String data) {
    return crypto.sha256.convert(utf8.encode(data)).toString();
  }
}
