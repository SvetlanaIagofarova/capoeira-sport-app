// import 'package:http/http.dart' as http;

// void main(List<String> arguments) async{
//   await tryUri();
// }

// Future<void> tryUri() async{
//   final String url = 'https://capoeirasport.com/getMobileEvents';
//   final uri = Uri.parse(url);
//   final uriData = await http.get(uri);
//   print(uriData.statusCode);
//   print(uriData.body);
// }

import 'package:capoeirasport_project/injection.dart';
import 'package:capoeirasport_project/src/features/capoeirasportapp/application/widgets/capoeirs_sport_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  // await HiveServiceImpl.initHive();

  runApp(const CapoeiraSportApp());
}
