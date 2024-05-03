// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsResultAdapter extends TypeAdapter<NewsResult> {
  @override
  final int typeId = 1;

  @override
  NewsResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsResult(
      status: fields[0] as String,
      data: (fields[1] as List).cast<News>(),
    );
  }

  /*
loc: json['loc'] == null
        ? null
        : LocModel.fromJson(json['loc'] as Map<String, dynamic>),
  */

  @override
  void write(BinaryWriter writer, NewsResult obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
