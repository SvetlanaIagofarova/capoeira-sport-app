// import 'package:get_it/get_it.dart';

// final sl = GetIt.instance;

// Future<void> init() async{

//   //* Features

//   //* Core

//   //* External

// }

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final di = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async => di.init();
