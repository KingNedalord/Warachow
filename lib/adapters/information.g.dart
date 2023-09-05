// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InformationAdapter extends TypeAdapter<Information> {
  @override
  final int typeId = 0;

  @override
  Information read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Information(
      name: fields[0] as String,
      password: fields[1] as String,
      email: fields[2] as String,
      date_of_birth: fields[3] as String,
      address: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Information obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.date_of_birth)
      ..writeByte(4)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
