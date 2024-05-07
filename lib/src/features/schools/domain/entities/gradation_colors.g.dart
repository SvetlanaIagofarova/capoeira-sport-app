// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradation_colors.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GradationColorsAdapter extends TypeAdapter<GradationColors> {
  @override
  final int typeId = 7;

  @override
  GradationColors read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GradationColors(
      c1: fields[0] as String,
      c2: fields[1] as String,
      c3: fields[2] as String,
      c4: fields[3] as String,
      k1: fields[4] as String,
      k2: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GradationColors obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.c1)
      ..writeByte(1)
      ..write(obj.c2)
      ..writeByte(2)
      ..write(obj.c3)
      ..writeByte(3)
      ..write(obj.c4)
      ..writeByte(4)
      ..write(obj.k1)
      ..writeByte(5)
      ..write(obj.k2);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GradationColorsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
