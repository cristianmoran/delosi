
abstract class MatrixEvent {}

class RotateMatrix extends MatrixEvent {}

class UpdateMatrix extends MatrixEvent {
  final String input;
  UpdateMatrix(this.input);
}