// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlacesModelAdapter extends TypeAdapter<PlacesModel> {
  @override
  final int typeId = 0;

  @override
  PlacesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlacesModel(
      id: fields[0] as String?,
      name: fields[1] as String,
      cityId: fields[2] as String,
      regionId: fields[3] as String?,
      description: fields[4] as String?,
      address: fields[5] as String?,
      lat: fields[6] as double?,
      lng: fields[7] as double?,
      images: (fields[8] as List?)?.cast<String>(),
      category: fields[9] as String?,
      openingHours: (fields[10] as Map?)?.cast<String, dynamic>(),
      createdAt: fields[11] as DateTime?,
      visitTime: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PlacesModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.cityId)
      ..writeByte(3)
      ..write(obj.regionId)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.lat)
      ..writeByte(7)
      ..write(obj.lng)
      ..writeByte(8)
      ..write(obj.images)
      ..writeByte(9)
      ..write(obj.category)
      ..writeByte(10)
      ..write(obj.openingHours)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.visitTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlacesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
