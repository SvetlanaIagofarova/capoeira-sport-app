import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'event.g.dart';

@HiveType(typeId: 1)
class Event extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String imgUrl;

  const Event({
    required this.id,
    required this.title,
    required this.imgUrl,
  });

  @override
  List<Object?> get props => [id, title, imgUrl];
}
