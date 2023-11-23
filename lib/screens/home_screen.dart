import 'package:flutter/material.dart';
import 'package:noteapp/widgets/square_icon_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: const [
          SquareIconButton(icon: Icon(Icons.search)),
          SizedBox(width: 21),
          SquareIconButton(icon: Icon(Icons.info_outline)),
          SizedBox(width: 24),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/rafiki.png"),
            const SizedBox(height: 6),
            const Text('Enter your first note'),
          ],
        ),
      ),
    );
  }
}
