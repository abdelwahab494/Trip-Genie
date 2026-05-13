// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_tip_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TravelTipModelAdapter extends TypeAdapter<TravelTipModel> {
  @override
  final typeId = 2;

  @override
  TravelTipModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TravelTipModel(
      icon: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TravelTipModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.icon)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TravelTipModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
