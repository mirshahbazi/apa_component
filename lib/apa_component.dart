
import 'dart:async';

import 'package:flutter/services.dart';

class ApaComponent {
  static const MethodChannel _channel =
      const MethodChannel('apa_component');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
