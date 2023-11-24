import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'square_icon_button.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SquareIconButton(
        icon: SvgPicture.asset("assets/back.svg"),
        onPressed: () => context.pop(),
      ),
    );
  }
}
