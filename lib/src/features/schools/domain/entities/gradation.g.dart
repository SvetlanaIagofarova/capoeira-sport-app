// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GradationAdapter extends TypeAdapter<Gradation> {
  @override
  final int typeId = 6;

  @override
  Gradation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Gradation(
      name: fields[0] as String,
      colors: (fields[1] as Map).cast<String, GradationColors>(),
    );
  }

  @override
  void write(BinaryWriter writer, Gradation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.colors);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GradationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
