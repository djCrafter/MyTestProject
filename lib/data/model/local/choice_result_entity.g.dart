// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice_result_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChoiceResultEntityAdapter extends TypeAdapter<ChoiceResultEntity> {
  @override
  final int typeId = 0;

  @override
  ChoiceResultEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChoiceResultEntity(
      choice: fields[0] as UserChoice,
      birthdayYear: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ChoiceResultEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.choice)
      ..writeByte(1)
      ..write(obj.birthdayYear);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChoiceResultEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
