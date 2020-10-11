import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Back button used inside app bar to navigate back
class BackButtonSvg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: SvgPicture.asset(
        "assets/svgs/Back.svg",
        fit: BoxFit.none,
      ),
    );
  }
}
