// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserChoiceAdapter extends TypeAdapter<UserChoice> {
  @override
  final int typeId = 1;

  @override
  UserChoice read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UserChoice.trackPeriod;
      case 1:
        return UserChoice.getPregnant;
      default:
        return UserChoice.trackPeriod;
    }
  }

  @override
  void write(BinaryWriter writer, UserChoice obj) {
    switch (obj) {
      case UserChoice.trackPeriod:
        writer.writeByte(0);
        break;
      case UserChoice.getPregnant:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserChoiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
