import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:noteapp/widgets/square_icon_button.dart';

class NewNoteScreen extends StatelessWidget {
  const NewNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SquareIconButton(
            icon: SvgPicture.asset("assets/back.svg"),
            onPressed: () => context.pop(),
          ),
        ),
        actions: [
          SquareIconButton(
            icon: SvgPicture.asset("assets/visibility.svg"),
            onPressed: () {},
          ),
          const SizedBox(width: 25),
          SquareIconButton(
            icon: SvgPicture.asset("assets/save.svg"),
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
