import 'package:flutter/material.dart';

class MatrixPainter extends CustomPainter {
  final List<List<int>> matrix;

  MatrixPainter(this.matrix);

  @override
  void paint(Canvas canvas, Size size) {
    if (matrix.isEmpty || matrix[0].isEmpty) return;

    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    int rows = matrix.length;
    int cols = matrix[0].length;
    double cellWidth = size.width / cols;
    double cellHeight = size.height / rows;

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        Rect rect = Rect.fromLTWH(j * cellWidth, i * cellHeight, cellWidth, cellHeight);
        canvas.drawRect(rect, paint);

        final borderPaint = Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;
        canvas.drawRect(rect, borderPaint);

        String text = matrix[i][j].toString();
        if (text.length > 4) {
          text = '${text.substring(0, 3)}...';
        }

        final textPainter = TextPainter(
          text: TextSpan(
            text: text,
            style: TextStyle(color: Colors.black, fontSize: cellHeight * 0.3),
          ),
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        );

        textPainter.layout(maxWidth: cellWidth * 0.9);
        Offset textOffset = Offset(
          j * cellWidth + (cellWidth - textPainter.width) / 2,
          i * cellHeight + (cellHeight - textPainter.height) / 2,
        );
        textPainter.paint(canvas, textOffset);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

