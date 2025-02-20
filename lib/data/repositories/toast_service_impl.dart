import 'package:flutter/services.dart';
import '../../domain/repositories/toast_service.dart';

class ToastServiceImpl implements ToastService {
  static const _channel = MethodChannel('matrix_toast');

  @override
  Future<void> showToast(String message) async {
    try {
      await _channel.invokeMethod('showToast', {'message': message});
    } on PlatformException catch (e) {
      print("Error al mostrar toast: ${e.message}");
    }
  }
}
