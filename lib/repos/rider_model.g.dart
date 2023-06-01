// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rider_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RiderAdapter extends TypeAdapter<Rider> {
  @override
  final int typeId = 1;

  @override
  Rider read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Rider(
      name: fields[1] as String,
      phoneNumber: fields[2] as int,
      localities: (fields[3] as List).cast<String>(),
      address: fields[4] as String,
      pinCode: fields[5] as int,
      bankAccountNumber: fields[6] as int,
      ifsc: fields[7] as String,
      riderDocs: fields[8] as RiderDocs,
    );
  }

  @override
  void write(BinaryWriter writer, Rider obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.localities)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.pinCode)
      ..writeByte(6)
      ..write(obj.bankAccountNumber)
      ..writeByte(7)
      ..write(obj.ifsc)
      ..writeByte(8)
      ..write(obj.riderDocs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RiderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RiderDocsAdapter extends TypeAdapter<RiderDocs> {
  @override
  final int typeId = 2;

  @override
  RiderDocs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RiderDocs(
      aadharPath: fields[1] as String,
      panCardPath: fields[2] as String,
      dl: fields[3] as String,
      bankCheque: fields[4] as String,
      photo: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RiderDocs obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.aadharPath)
      ..writeByte(2)
      ..write(obj.panCardPath)
      ..writeByte(3)
      ..write(obj.dl)
      ..writeByte(4)
      ..write(obj.bankCheque)
      ..writeByte(5)
      ..write(obj.photo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RiderDocsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
