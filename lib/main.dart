import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
import 'widgets/amound_and_filter.dart';
import 'widgets/data_viz/data_viz.dart';
import 'widgets/header.dart';
import 'widgets/payment_item.dart';

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Constants.backgroundColor,
        body: SafeArea(
          child: (isMobile(context) ? mobilePage() : desktopPage()),
        ),
      ),
    );
  }

  Widget desktopPage() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Header(),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.chevron_left_rounded,
                        size: 60,
                        color: Colors.black45,
                      ),
                      Expanded(child: DataViz()),
                      const Icon(
                        Icons.chevron_right_rounded,
                        size: 60,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(24.0), child: AmountAndFilter()),
              Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      PaymentItem(
                        title: "Dark Souls",
                        category: "Games",
                        iconData: Icons.videogame_asset_rounded,
                        amount: "-\$54.00",
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      PaymentItem(
                        title: "Cinema Theater",
                        category: "Entertainment",
                        iconData: Icons.movie_creation_rounded,
                        amount: "-\$10.00",
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      PaymentItem(
                        title: "Other",
                        iconData: Icons.grid_on_rounded,
                        amount: "-\$130.00",
                      )
                    ],
                  ))
            ],
          ),
        )),
      ],
    );
  }

  Widget mobilePage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Header(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Row(
              children: [
                const Icon(
                  Icons.chevron_left_rounded,
                  size: 60,
                  color: Colors.black45,
                ),
                Expanded(child: DataViz()),
                const Icon(Icons.chevron_right_rounded, size: 60, color: Colors.black45),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.all(24.0), child: AmountAndFilter()),
          Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: const [
                  PaymentItem(
                    title: "Dark Souls",
                    category: "Games",
                    iconData: Icons.videogame_asset_rounded,
                    amount: "-\$54.00",
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  PaymentItem(
                    title: "Cinema Theater",
                    category: "Entertainment",
                    iconData: Icons.movie_creation_rounded,
                    amount: "-\$10.00",
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  PaymentItem(
                    title: "Other",
                    iconData: Icons.grid_on_rounded,
                    amount: "-\$130.00",
                  )
                ],
              ))
        ],
      ),
    );
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }
}
