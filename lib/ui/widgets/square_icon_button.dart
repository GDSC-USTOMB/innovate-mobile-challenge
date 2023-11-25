import 'package:flutter/material.dart';

class SquareIconButton extends StatelessWidget {
  const SquareIconButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  final Widget icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: const MaterialStatePropertyAll(Size(50, 50)),
        backgroundColor: MaterialStatePropertyAll(
          Theme.of(context).colorScheme.onBackground,
        ),
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      ),
      icon: icon,
    );
  }
}
