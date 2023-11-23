import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xff252525),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.nunito(
            fontSize: 43,
            fontWeight: FontWeight.w600,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0x00000000),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          IconButton.filled(
            onPressed: () {},
            style: const ButtonStyle(
              fixedSize: MaterialStatePropertyAll(Size(50, 50)),
              backgroundColor: MaterialStatePropertyAll(Color(0xff3B3B3B)),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
            icon: const Icon(Icons.search),
          ),
          const SizedBox(width: 21),
          IconButton.filled(
            onPressed: () {},
            style: const ButtonStyle(
              fixedSize: MaterialStatePropertyAll(Size(50, 50)),
              backgroundColor: MaterialStatePropertyAll(Color(0xff3B3B3B)),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/rafiki.png"),
            const SizedBox(height: 6),
            Text(
              'Enter your first note',
              style: GoogleFonts.nunito(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
