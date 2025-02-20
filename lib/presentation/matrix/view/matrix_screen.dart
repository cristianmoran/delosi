import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/matrix_bloc.dart';
import '../bloc/matrix_event.dart';
import '../bloc/matrix_state.dart';
import '../widgets/matrix_display_widget.dart';
import '../widgets/matrix_input_widget.dart';

class MatrixScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  MatrixScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final matrixBloc = BlocProvider.of<MatrixBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Rotar Matriz')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MatrixInputWidget(
              controller: _controller,
              onChanged: (value) => matrixBloc.add(UpdateMatrix(value)),
              onRotate: () => matrixBloc.add(RotateMatrix()),
            ),
            const SizedBox(height: 20),
            BlocBuilder<MatrixBloc, MatrixState>(
              builder: (context, state) {
                if (state is MatrixUpdated) {
                  return MatrixDisplayWidget(matrix: state.matrix);
                } else if (state is MatrixError) {
                  return Text(
                    state.error,
                    style: const TextStyle(color: Colors.red),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
