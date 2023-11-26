import 'package:flutter/widgets.dart';

final noResults = <Widget>[
  const SizedBox(height: 40),
  Container(
    margin: const EdgeInsets.symmetric(horizontal: 22),
    child: Image.asset("assets/nothing-was-found.png"),
  ),
  const SizedBox(height: 6),
  const Center(child: Text("No results were found")),
];
