import 'package:http/http.dart' as http;

void main(List<String> arguments) async{
  await tryUri();
}

Future<void> tryUri() async{
  final String url = 'https://capoeirasport.com/getBirthdays';
  final uri = Uri.parse(url);
  final uriData = await http.get(uri);
  print(uriData.statusCode);
  print(uriData.body);
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const CapoeiraApp(),
//     );
//   }
// }

// class CapoeiraApp extends StatelessWidget {
//   const CapoeiraApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

/*
Future<T> getT(String url) => HttpClient()
      .getUrl(Uri.parse(url))
      .then((req) => req.close())
      .then((resp) => resp.transform(utf8.decoder).join())
      .then((str) =>json.decode(str) as List<dynamic>)
      .then((list) => list.map((e) => T.fromJson(e)));
*/