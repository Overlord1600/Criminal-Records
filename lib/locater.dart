import 'package:criminal_records/backend/repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Repository>(Repository());

// Alternatively you could write it if you don't like global variables
}
