import 'package:get_it/get_it.dart';

import '../../data/repositories/toast_service_impl.dart';
import '../../domain/repositories/toast_service.dart';

final getIt = GetIt.instance;

void setupDependencies() {

  getIt.registerLazySingleton<ToastService>(() => ToastServiceImpl());

}
