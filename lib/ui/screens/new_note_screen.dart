import 'package:flutter/material.dart';

import '../widgets/go_back_button.dart';
import '../widgets/square_icon_button.dart';

class NewNoteScreen extends StatelessWidget {
  const NewNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        leading: const GoBackButton(),
        actions: [
          SquareIconButton(
            icon: const Icon(Icons.visibility_outlined),
            onPressed: () {},
          ),
          const SizedBox(width: 25),
          SquareIconButton(
            icon: const Icon(Icons.save_outlined),
            onPressed: () {},
          ),
          const SizedBox(width: 25),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 40),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Title',
                  border: InputBorder.none,
                ),
                maxLines: null,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 40),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Note',
                  border: InputBorder.none,
                ),
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
