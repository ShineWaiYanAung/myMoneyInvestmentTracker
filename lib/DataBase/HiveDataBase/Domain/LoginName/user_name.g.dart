// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_name.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserNameAdapter extends TypeAdapter<UserName> {
  @override
  final int typeId = 20;

  @override
  UserName read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserName(
      name: fields[21] as String,
      profileImage: fields[24] as File?,
    );
  }

  @override
  void write(BinaryWriter writer, UserName obj) {
    writer
      ..writeByte(2)
      ..writeByte(21)
      ..write(obj.name)
      ..writeByte(24)
      ..write(obj.profileImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserNameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
