import 'package:flutter/material.dart';

import '../painters/matrix_painter.dart';

class MatrixDisplayWidget extends StatelessWidget {
  final List<List<int>> matrix;

  const MatrixDisplayWidget({super.key, required this.matrix});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: CustomPaint(painter: MatrixPainter(matrix)),
    );
  }
}
