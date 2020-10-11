import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CancelButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CancelButton({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SvgPicture.asset(
        "assets/svgs/Cancel.svg",
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
