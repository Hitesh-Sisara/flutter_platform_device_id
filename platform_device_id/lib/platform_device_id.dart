// File: lib/platform_device_id.dart

import 'dart:async';

import 'package:flutter/services.dart';

class PlatformDeviceId {
  static const MethodChannel _channel = MethodChannel('platform_device_id');

  static Future<String?> get getDeviceId async {
    try {
      final String? deviceId = await _channel.invokeMethod('getDeviceId');
      return deviceId;
    } on PlatformException {
      return null;
    }
  }
}
