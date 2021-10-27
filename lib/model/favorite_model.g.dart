// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteGameAdapter extends TypeAdapter<FavoriteGame> {
  @override
  final int typeId = 0;

  @override
  FavoriteGame read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteGame(
      description: fields[4] as dynamic,
      icon: fields[5] as dynamic,
      id: fields[0] as dynamic,
      website: fields[2] as dynamic,
      name: fields[1] as dynamic,
      image: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteGame obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.website)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteGameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
