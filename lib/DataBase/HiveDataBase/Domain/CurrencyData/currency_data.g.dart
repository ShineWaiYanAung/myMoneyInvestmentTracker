// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyInvestmentDataAdapter
    extends TypeAdapter<CurrencyInvestmentData> {
  @override
  final int typeId = 2;

  @override
  CurrencyInvestmentData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyInvestmentData(
      investmentId: fields[11] as int,
      investmentCurrencyName: fields[12] as String,
      investmentCurrencyQuantity: fields[13] as double,
      investmentCurrencyPriceRate: fields[14] as double,
      myanmarDollarRate: fields[16] as double,
      investmentCurrencyDatTime: fields[15] as DateTime,
      investmentTotalPrice: fields[17] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CurrencyInvestmentData obj) {
    writer
      ..writeByte(7)
      ..writeByte(11)
      ..write(obj.investmentId)
      ..writeByte(12)
      ..write(obj.investmentCurrencyName)
      ..writeByte(13)
      ..write(obj.investmentCurrencyQuantity)
      ..writeByte(14)
      ..write(obj.investmentCurrencyPriceRate)
      ..writeByte(15)
      ..write(obj.investmentCurrencyDatTime)
      ..writeByte(16)
      ..write(obj.myanmarDollarRate)
      ..writeByte(17)
      ..write(obj.investmentTotalPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyInvestmentDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
