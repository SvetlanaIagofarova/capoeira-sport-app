// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schools_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SchoolsResultAdapter extends TypeAdapter<SchoolsResult> {
  @override
  final int typeId = 4;

  @override
  SchoolsResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SchoolsResult(
      status: fields[0] as String,
      data: (fields[1] as Map).cast<int, School>(),
    );
  }

  @override
  void write(BinaryWriter writer, SchoolsResult obj) {
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
      other is SchoolsResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
