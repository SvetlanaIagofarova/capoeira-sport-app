import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class News extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String date;

  const News({
    required this.id,
    required this.title,
    required this.date,
  });

  @override
  List<Object?> get props => [id, title, date];
}
