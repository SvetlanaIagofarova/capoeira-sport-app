import 'package:equatable/equatable.dart';

class Event extends Equatable {
  final int id;
  final String title;
  final String imgUrl;

  const Event({
    required this.id,
    required this.title,
    required this.imgUrl,
  });

  @override
  List<Object?> get props => [id, title, imgUrl];
}
