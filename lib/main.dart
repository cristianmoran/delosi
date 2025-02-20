// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: BlocProvider(
//         create: (context) => MatrixBloc(),
//         child: MatrixScreen(),
//       ),
//     );
//   }
// }
//
// // BLoC Events
// abstract class MatrixEvent {}
// class RotateMatrix extends MatrixEvent {
//   final List<List<int>> matrix;
//   RotateMatrix(this.matrix);
// }
//
// // BLoC State
// abstract class MatrixState {}
// class MatrixInitial extends MatrixState {}
// class MatrixRotated extends MatrixState {
//   final List<List<int>> rotatedMatrix;
//   final List<List<int>> previousMatrix;
//   MatrixRotated(this.previousMatrix, this.rotatedMatrix);
// }
//
// // BLoC Logic
// class MatrixBloc extends Bloc<MatrixEvent, MatrixState> {
//   MatrixBloc() : super(MatrixInitial()) {
//     on<RotateMatrix>((event, emit) {
//       List<List<int>> rotated = rotateMatrix(event.matrix);
//       emit(MatrixRotated(event.matrix, rotated));
//     });
//   }
// }
//
// List<List<int>> rotateMatrix(List<List<int>> matrix) {
//   int n = matrix.length;
//   List<List<int>> rotated = List.generate(n, (_) => List.filled(n, 0));
//   for (int i = 0; i < n; i++) {
//     for (int j = 0; j < n; j++) {
//       rotated[j][n - i - 1] = matrix[i][j];
//     }
//   }
//   return rotated;
// }
//
// // UI
// class MatrixScreen extends StatefulWidget {
//   @override
//   _MatrixScreenState createState() => _MatrixScreenState();
// }
//
// class _MatrixScreenState extends State<MatrixScreen> {
//   final TextEditingController _controller = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Rotar Matriz')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Ingrese la matriz (Ej: 1,2;3,4)',
//               ),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 List<List<int>> matrix = parseMatrix(_controller.text);
//                 if (matrix.isNotEmpty) {
//                   BlocProvider.of<MatrixBloc>(context).add(RotateMatrix(matrix));
//                 }
//               },
//               child: Text('Rotar'),
//             ),
//             SizedBox(height: 20),
//             BlocBuilder<MatrixBloc, MatrixState>(
//               builder: (context, state) {
//                 if (state is MatrixRotated) {
//                   return Column(
//                     children: [
//                       Text('Matriz Original'),
//                       SizedBox(
//                         height: 200,
//                         width: 200,
//                         child: CustomPaint(
//                           painter: MatrixPainter(state.previousMatrix),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       Text('Matriz Rotada'),
//                       SizedBox(
//                         height: 200,
//                         width: 200,
//                         child: CustomPaint(
//                           painter: MatrixPainter(state.rotatedMatrix),
//                         ),
//                       ),
//                     ],
//                   );
//                 }
//                 return Container();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// List<List<int>> parseMatrix(String input) {
//   try {
//     List<List<int>> matrix = input
//         .trim()
//         .split(';')
//         .map((row) => row.split(',').map(int.parse).toList())
//         .toList();
//     return matrix;
//   } catch (e) {
//     return [];
//   }
// }
//
//
//
// class MatrixPainter extends CustomPainter {
//   final List<List<int>> matrix;
//
//   MatrixPainter(this.matrix);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     if (matrix.isEmpty) return; // Evita errores si la matriz está vacía
//
//     final paint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.fill;
//
//     int n = matrix.length;
//     double cellSize = size.width / n; // Ajusta el tamaño de cada celda
//
//     for (int i = 0; i < n; i++) {
//       for (int j = 0; j < n; j++) {
//         Rect rect = Rect.fromLTWH(j * cellSize, i * cellSize, cellSize, cellSize);
//         canvas.drawRect(rect, paint);
//
//         // Dibujar bordes blancos en cada celda
//         final borderPaint = Paint()
//           ..color = Colors.white
//           ..style = PaintingStyle.stroke
//           ..strokeWidth = 2;
//         canvas.drawRect(rect, borderPaint);
//
//         // Dibujar el número dentro de la celda
//         final textPainter = TextPainter(
//           text: TextSpan(
//             text: matrix[i][j].toString(),
//             style: TextStyle(color: Colors.white, fontSize: cellSize * 0.4),
//           ),
//           textAlign: TextAlign.center,
//           textDirection: TextDirection.ltr,
//         );
//
//         textPainter.layout();
//         Offset textOffset = Offset(
//           j * cellSize + (cellSize - textPainter.width) / 2,
//           i * cellSize + (cellSize - textPainter.height) / 2,
//         );
//
//         textPainter.paint(canvas, textOffset);
//       }
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

class MatrixBloc extends Bloc<MatrixEvent, MatrixState> {
  MatrixBloc() : super(MatrixInitial()) {
    on<GenerateMatrixEvent>((event, emit) {
      try {
        List<List<int>> matrix = parseMatrix(event.input);
        emit(MatrixGenerated(matrix, 0));
      } catch (e) {
        emit(MatrixError('Formato inválido'));
      }
    });

    on<RotateMatrixEvent>((event, emit) {
      if (state is MatrixGenerated) {
        int newRotationAngle = ((state as MatrixGenerated).rotationAngle + 90) % 360;
        emit(MatrixGenerated((state as MatrixGenerated).matrix, newRotationAngle));
      }
    });
  }

  List<List<int>> parseMatrix(String input) {
    try {
      return input.split(';').map((row) => row.split(',').map(int.parse).toList()).toList();
    } catch (e) {
      throw FormatException('Entrada inválida');
    }
  }
}

abstract class MatrixEvent {}
class GenerateMatrixEvent extends MatrixEvent {
  final String input;
  GenerateMatrixEvent(this.input);
}
class RotateMatrixEvent extends MatrixEvent {}

abstract class MatrixState {}
class MatrixInitial extends MatrixState {}
class MatrixGenerated extends MatrixState {
  final List<List<int>> matrix;
  final int rotationAngle;
  MatrixGenerated(this.matrix, this.rotationAngle);
}
class MatrixError extends MatrixState {
  final String message;
  MatrixError(this.message);
}

class MatrixScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rotar Matriz NxN')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingrese la matriz (Ej: 1,2;3,4)',
              ),
              keyboardType: TextInputType.text,
              maxLines: null,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final input = controller.text;
                    context.read<MatrixBloc>().add(GenerateMatrixEvent(input));
                  },
                  child: Text('Generar Matriz'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<MatrixBloc>().add(RotateMatrixEvent());
                  },
                  child: Text('Rotar Matriz'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: BlocBuilder<MatrixBloc, MatrixState>(
                    builder: (context, state) {
                      if (state is MatrixGenerated) {
                        return Center(
                          child: Transform.rotate(
                            angle: -state.rotationAngle * 3.1415926535 / 180,
                            child: Container(
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: state.matrix.map((row) => Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: row.map((num) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('$num', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                                  )).toList(),
                                )).toList(),
                              ),
                            ),
                          ),
                        );
                      } else if (state is MatrixError) {
                        return Text('Error: ${state.message}', style: TextStyle(color: Colors.red));
                      }
                      return Container();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



