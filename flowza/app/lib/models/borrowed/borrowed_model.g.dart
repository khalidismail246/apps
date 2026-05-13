// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrowed_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BorrowedModelAdapter extends TypeAdapter<BorrowedModel> {
  @override
  final int typeId = 0;

  @override
  BorrowedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BorrowedModel(
      name: fields[0] as String,
      amount: fields[1] as int,
      currency: fields[2] as String,
      isPaid: fields[3] as bool,
      borrowedDate: fields[4] as DateTime,
      returnDate: fields[5] as DateTime,
      notificationId: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BorrowedModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.currency)
      ..writeByte(3)
      ..write(obj.isPaid)
      ..writeByte(4)
      ..write(obj.borrowedDate)
      ..writeByte(5)
      ..write(obj.returnDate)
      ..writeByte(6)
      ..write(obj.notificationId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BorrowedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
