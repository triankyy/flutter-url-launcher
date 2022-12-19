import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'url_launcher_method_channel.dart';

abstract class UrlLauncherPlatform extends PlatformInterface {
  /// Constructs a UrlLauncherPlatform.
  UrlLauncherPlatform() : super(token: _token);

  static final Object _token = Object();

  static UrlLauncherPlatform _instance = MethodChannelUrlLauncher();

  /// The default instance of [UrlLauncherPlatform] to use.
  ///
  /// Defaults to [MethodChannelUrlLauncher].
  static UrlLauncherPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UrlLauncherPlatform] when
  /// they register themselves.
  static set instance(UrlLauncherPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  void launchUrl(String url) {
    throw UnimplementedError('launchUrl() has not been implemented.');
  }
}
