// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealslistAdapter extends TypeAdapter<Meals_list> {
  @override
  final int typeId = 1;

  @override
  Meals_list read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meals_list(
      meal_label: fields[0] as String,
      price: fields[1] as int,
      image: fields[2] as String,
      amount: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Meals_list obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.meal_label)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealslistAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
