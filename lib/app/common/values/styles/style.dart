import 'package:google_fonts/google_fonts.dart';

import '../../util/exports.dart';

class Style {
  static _TextStyle get textStyle => _TextStyle();

  static _ButtonStyle get buttonStyle => _ButtonStyle();

  static _Other get other => _Other();
}

class _TextStyle {
  final TextStyle semiBoldStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
    fontWeight: FontWeight.w600,
  );

  final TextStyle boldStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize22,
    fontWeight: FontWeight.w700,
  );

  final TextStyle regularStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize18,
    fontWeight: FontWeight.w400,
  );

  final TextStyle buttonTextStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
    fontWeight: FontWeight.w700,
  );

  final TextStyle title = GoogleFonts.muli(
    fontSize: Dimens.fontSize16,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  final TextStyle hints = GoogleFonts.muli(
    fontSize: Dimens.fontSize10,
    color: Colors.grey,
  );

  final TextStyle fieldHeading = GoogleFonts.muli(
    fontSize: Dimens.fontSize12,
    color: Colors.grey,
  );

  static final TextStyle _textStyle = TextStyle(
    color: Colors.black,
    fontSize: Dimens.fontSize14,
  );
}

class _ButtonStyle {}

class _Other {
  final InputDecoration inputDecorationNone = const InputDecoration(
    labelStyle: TextStyle(color: Color(0xFF6200EE)),
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
  );

  final InputDecoration inputDecoration = const InputDecoration(
    labelStyle: TextStyle(color: Color(0xFF6200EE)),
    border: _outlineInputBorder,
    focusedBorder: _outlineInputBorder,
    enabledBorder: _outlineInputBorder,
    errorBorder: _outlineInputBorder,
    disabledBorder: _outlineInputBorder,
    contentPadding: EdgeInsets.all(10),
    isCollapsed: true,
  );

  // helper
  static const OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 0.0),
  );
}
