
import 'package:flutter/rendering.dart';


class Gradients {
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [
      0,
      1,
    ],
    colors: [
      Color.fromARGB(255, 239, 0, 151),
      Color.fromARGB(255, 74, 27, 89),
    ],
  );
  static const Gradient secondaryGradient = LinearGradient(
    begin: Alignment(-0.06722, 0.11926),
    end: Alignment(1.44464, 1.68172),
    stops: [
      0,
      1,
    ],
    colors: [
      Color.fromARGB(255, 239, 0, 151),
      Color.fromARGB(255, 74, 27, 89),
    ],
  );
}