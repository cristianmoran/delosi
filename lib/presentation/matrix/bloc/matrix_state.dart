abstract class MatrixState {}

class MatrixInitial extends MatrixState {}

class MatrixUpdated extends MatrixState {
  final List<List<int>> matrix;
  MatrixUpdated(this.matrix);
}

class MatrixError extends MatrixState {
  final String error;
  MatrixError(this.error);
}

