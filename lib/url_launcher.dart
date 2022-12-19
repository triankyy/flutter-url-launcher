
import 'url_launcher_platform_interface.dart';

class UrlLauncher {
  Future<String?> getPlatformVersion() {
    return UrlLauncherPlatform.instance.getPlatformVersion();
  }
  void launchUrl(String url) {
    return UrlLauncherPlatform.instance.launchUrl(url);
  }
}
