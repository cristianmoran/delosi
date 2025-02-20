
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reto_delosi/presentation/matrix/bloc/matrix_bloc.dart';
import 'package:reto_delosi/presentation/matrix/view/matrix_screen.dart';

import 'core/di/service_locator.dart';

void main() {
  setupDependencies();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => MatrixBloc(),
        child: MatrixScreen(),
      ),
    );
  }
}


