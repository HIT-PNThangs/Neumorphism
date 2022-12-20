import 'package:flutter/material.dart';
import '../../constants.dart';
import 'circle/neuomorphic_circle.dart';
import 'progress_ring.dart';

class DataViz extends StatelessWidget {
  final bevel = 10.0;
  final blurOffset = const Offset(20.0 / 2, 20.0 / 2);

  Color shadowColor = Colors.black87;
  Color backgroundColor = Constants.backgroundColor;
  Color highlightColor = Colors.white.withOpacity(0.05);

  DataViz({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1,
        child: Stack(
          alignment: Alignment.center,
          children: [
            NeuomorphicCircle(
              shadowColor: shadowColor,
              backgroundColor: backgroundColor,
              highlightColor: highlightColor,
              innerShadow: true,
              outerShadow: false,
            ),
            LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox(
                    width: constraints.maxWidth * 0.3,
                    height: constraints.maxWidth * 0.3,
                    child: NeuomorphicCircle(
                      innerShadow: false,
                      outerShadow: true,
                      highlightColor: highlightColor,
                      shadowColor: shadowColor,
                      backgroundColor: backgroundColor,
                      child: const SizedBox.expand(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "14th",
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
            ),
            const ProgressRing(progress: 0.6)
          ],
        ));
  }
}
