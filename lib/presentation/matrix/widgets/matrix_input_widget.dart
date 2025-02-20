import 'package:flutter/material.dart';

class MatrixInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onRotate;

  const MatrixInputWidget({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onRotate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            maxLines: null,
            minLines: 1,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ingrese la matriz (Ej: [[1,2],[3,4])',
            ),
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
          FocusScope.of(context).unfocus();
          onRotate();
          },
          child: const Text('Rotar'),
        ),
      ],
    );
  }
}