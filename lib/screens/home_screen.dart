import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:noteapp/widgets/square_icon_button.dart';

import 'about_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          SquareIconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          const SizedBox(width: 21),
          SquareIconButton(
            onPressed: () {
              showAdaptiveDialog(
                context: context,
                builder: (context) => const AboutNotesAppDialog(),
              );
            },
            icon: const Icon(Icons.info_outline),
          ),
          const SizedBox(width: 24),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/NewNote');
        },
        child: SvgPicture.asset("assets/add.svg"),
      ),
    );
  }
}
