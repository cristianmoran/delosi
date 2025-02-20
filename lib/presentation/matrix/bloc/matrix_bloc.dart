import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/service_locator.dart';
import '../../../domain/repositories/toast_service.dart';
import 'matrix_event.dart';
import 'matrix_state.dart';

class MatrixBloc extends Bloc<MatrixEvent, MatrixState> {
  final ToastService toastService = getIt<ToastService>();
  List<List<int>> currentMatrix = [];

  MatrixBloc() : super(MatrixInitial()) {
    on<UpdateMatrix>((event, emit) {
      List<List<int>>? matrix = _parseMatrix(event.input);
      if (matrix == null) {
        emit(MatrixError('Formato incorrecto o filas de distinto tamaño'));
      } else {
        currentMatrix = matrix;
        emit(MatrixUpdated(matrix));
      }
    });

    on<RotateMatrix>((event, emit) async {
      if (currentMatrix.isNotEmpty && currentMatrix[0].isNotEmpty) {
        final previousMatrix = currentMatrix;
        currentMatrix = _rotateMatrix(currentMatrix);
        String previousMatrixStr = previousMatrix.toString();

        await toastService.showToast(previousMatrixStr);

        emit(MatrixUpdated(currentMatrix));
      } else {
        emit(MatrixError('No hay una matriz válida para rotar'));
      }
    });
  }

  List<List<int>>? _parseMatrix(String input) {
    try {
      String trimmed = input.trim();
      if (!trimmed.startsWith('[[') || !trimmed.endsWith(']]')) {
        return null;
      }

      String inner = trimmed.substring(2, trimmed.length - 2);

      List<String> rows = inner.split('],[');
      if (rows.isEmpty) return null;

      List<List<int>> matrix = rows.map((row) {
        String cleanRow = row.trim();
        if (cleanRow.isEmpty) throw FormatException();
        List<int> parsedRow = cleanRow.split(',').map((s) => int.parse(s.trim())).toList();
        if (parsedRow.isEmpty) throw FormatException();
        return parsedRow;
      }).toList();

      if (matrix.isEmpty || matrix[0].isEmpty) return null;
      int expectedLength = matrix[0].length;
      for (var row in matrix) {
        if (row.length != expectedLength) return null;
      }
      return matrix;
    } catch (e) {
      return null;
    }
  }

  List<List<int>> _rotateMatrix(List<List<int>> matrix) {
    int rows = matrix.length;
    int cols = matrix[0].length;
    List<List<int>> rotated = List.generate(cols, (_) => List.filled(rows, 0));
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        rotated[cols - j - 1][i] = matrix[i][j];
      }
    }
    return rotated;
  }
}
