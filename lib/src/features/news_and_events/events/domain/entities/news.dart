import 'package:equatable/equatable.dart';

class News extends Equatable {
  final int id;
  final String title;
  final String date;

  const News({
    required this.id,
    required this.title,
    required this.date,
  });

  @override
  List<Object?> get props => [id, title, date];
}
