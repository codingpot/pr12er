export "youtube_interface.dart"
    if (dart.library.html) "./youtube_web.dart"
    if (dart.library.io) "./youtube_native.dart";
