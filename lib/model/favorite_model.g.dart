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
      name: fields[0] as dynamic,
      image: fields[1] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteGame obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image);
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
