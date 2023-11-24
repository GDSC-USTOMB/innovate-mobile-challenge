import 'package:flutter/material.dart';

class AboutNotesAppDialog extends StatelessWidget {
  const AboutNotesAppDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 28,
          vertical: 38,
        ),
        child: Text(
          "Designed by - \n"
          "Redesigned by - \n"
          "Illustrations - \n"
          "Icons - \n"
          "Font -",
          style: Theme.of(context).dialogTheme.contentTextStyle,
        ),
      ),
    );
  }
}
