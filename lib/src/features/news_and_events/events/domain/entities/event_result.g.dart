// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventResultAdapter extends TypeAdapter<EventResult> {
  @override
  final int typeId = 3;

  @override
  EventResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventResult(
      status: fields[0] as String,
      data: (fields[1] as List).cast<Event>(),
    );
  }

  @override
  void write(BinaryWriter writer, EventResult obj) {
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
      other is EventResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
