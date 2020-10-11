import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class NextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/svgs/Next.svg",
      height: 20,
    );
  }
}
