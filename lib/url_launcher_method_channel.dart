import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'url_launcher_platform_interface.dart';

/// An implementation of [UrlLauncherPlatform] that uses method channels.
class MethodChannelUrlLauncher extends UrlLauncherPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('url_launcher');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  void launchUrl(String url) {
    try {
      methodChannel.invokeMethod('launchUrl', {'url': url});
    } on PlatformException catch (e) {
      throw e.message ?? "Unexpected error.";
    }
  }
}
