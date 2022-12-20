import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
import 'widgets/data_viz/circle/neuomorphic_circle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
          scaffoldBackgroundColor: Constants.backgroundColor,
          backgroundColor: Constants.backgroundColor,
          textTheme: GoogleFonts.oxygenTextTheme(
            Theme.of(context).textTheme,
          )),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Constants.backgroundColor,
        body: SafeArea(
          child: TestPage(),
        ),
      ),
    );
  }
}

Color shadowColor = Colors.black87;
Color backgroundColor = Constants.backgroundColor;
Color highlightColor = Colors.white;

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1,
        child: Stack(
          alignment: Alignment.center,
          children: [
            NeuomorphicCircle(
              shadowColor: Colors.black54.withOpacity(0.6),
              backgroundColor: const Color(0xFF71BF0D),
              highlightColor: highlightColor,
              innerShadow: true,
              outerShadow: false,
            ),
            LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth * 0.8,
                height: constraints.maxWidth * 0.8,
                child: NeuomorphicCircle(
                  innerShadow: false,
                  outerShadow: true,
                  highlightColor: highlightColor,
                  shadowColor: Colors.black54,
                  backgroundColor: const Color(0xFFFFFFFF),
                ),
              );
            }),
          ],
        ));
  }
}
