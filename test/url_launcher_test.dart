import 'package:flutter_test/flutter_test.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_platform_interface.dart';
import 'package:url_launcher/url_launcher_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockUrlLauncherPlatform
    with MockPlatformInterfaceMixin
    implements UrlLauncherPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final UrlLauncherPlatform initialPlatform = UrlLauncherPlatform.instance;

  test('$MethodChannelUrlLauncher is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelUrlLauncher>());
  });

  test('getPlatformVersion', () async {
    UrlLauncher urlLauncherPlugin = UrlLauncher();
    MockUrlLauncherPlatform fakePlatform = MockUrlLauncherPlatform();
    UrlLauncherPlatform.instance = fakePlatform;

    expect(await urlLauncherPlugin.getPlatformVersion(), '42');
  });
}
