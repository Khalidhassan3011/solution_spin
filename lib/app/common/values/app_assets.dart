class AppAssets {
  const AppAssets._();

  static _Fonts get fonts => _Fonts();

  static _Gif get gif => _Gif();

  static _Image get image => _Image();
}

class _Fonts {}

class _Gif {}

class _Image {
  String get icon => 'assets/image/icon.png';
}
