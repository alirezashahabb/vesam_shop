// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeProductsAdapter extends TypeAdapter<HomeProducts> {
  @override
  final int typeId = 0;

  @override
  HomeProducts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeProducts(
      id: fields[0] as int?,
      title: fields[1] as String?,
      price: fields[2] as num?,
      discountPrice: fields[3] as num?,
      hasDiscount: fields[4] as bool?,
      discountPercent: fields[5] as num?,
      image: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HomeProducts obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.discountPrice)
      ..writeByte(4)
      ..write(obj.hasDiscount)
      ..writeByte(5)
      ..write(obj.discountPercent)
      ..writeByte(6)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeProductsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}



// flutter packages pub run build_runner build