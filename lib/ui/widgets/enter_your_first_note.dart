import 'package:flutter/widgets.dart';

class EnterYourFirstNote extends StatelessWidget {
  const EnterYourFirstNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 180),
          Image.asset("assets/rafiki.png"),
          const SizedBox(height: 6),
          const Text('Enter your first note'),
        ],
      ),
    );
  }
}
