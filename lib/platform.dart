// Flutter imports:
import 'package:flutter/foundation.dart';

class Platform {
  static bool get isDesktop {
    return isLinux || isMacOS || isWindows;
  }

  static bool get isLinux {
    return defaultTargetPlatform == TargetPlatform.linux;
  }

  static bool get isMacOS {
    return defaultTargetPlatform == TargetPlatform.macOS;
  }

  static bool get isWindows {
    return defaultTargetPlatform == TargetPlatform.windows;
  }

  static bool get isFuchsia {
    return defaultTargetPlatform == TargetPlatform.fuchsia;
  }

  static bool get isAndroid {
    return defaultTargetPlatform == TargetPlatform.android;
  }

  static bool get isIOS {
    return defaultTargetPlatform == TargetPlatform.iOS;
  }
}
