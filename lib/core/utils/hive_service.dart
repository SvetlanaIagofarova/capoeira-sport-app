import 'package:capoeirasport_project/src/consts/hive_consts.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/domain/entities/event.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/entities/news.dart';
import 'package:hive_flutter/hive_flutter.dart';


class HiveService {
  static final HiveService _instance = HiveService._internal();
  factory HiveService() => _instance;
  HiveService._internal();

  static late final Map<BoxType, Box<dynamic>> boxes;

  static Future<void> initHive() async {
    await _registerHiveAdapters();

    boxes = <BoxType, Box<dynamic>>{
      BoxType.newsList: await Hive.openBox(HiveConsts.newsListBox),
      BoxType.eventList:
          await Hive.openBox(HiveConsts.eventListBox),
    };
  }

  List<T>? getAllThings<T>({required BoxType boxType}) {
    return boxes[boxType]?.values.map((v) => v as T).toList();
  }

  T getThing<T>({
    required BoxType boxType,
    required int key,
  }) {
    return boxes[boxType]?.get(key) as T;
  }

  Future<void> saveThings<T>({
    required BoxType boxType,
    required List<T> value,
  }) async {
    var index = 0;
    var map = {for (var v in value) 'listIndex$index': v};
    return await boxes[boxType]?.putAll(map);
  }

  Future<void> saveThing<T>({
    required BoxType boxType,
    required Object key,
    required T value,
  }) async {
    return await boxes[boxType]?.put(key, value);
  }

  Future<void> deleteThing<T>({
    required BoxType boxType,
    required Object key
  }) async {
    return await boxes[boxType]?.delete(key);
  }
}

Future<void> _registerHiveAdapters() async {
  await Hive.initFlutter();
  Hive
    ..registerAdapter(NewsAdapter())
    ..registerAdapter(EventAdapter());
}

enum BoxType {
  newsList,
  eventList,
}
