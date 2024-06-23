import 'package:hive_flutter/hive_flutter.dart';

// part 'cardModel.g.dart';

@HiveType(typeId: 1)
class CardModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String accountNumber;
  @HiveField(2)
  final String expiryDate;
  @HiveField(3)
  final String bankName;
  @HiveField(4)
  final String cvv;

  CardModel({
    required this.bankName,
    required this.name,
    required this.accountNumber,
    required this.expiryDate,
    required this.cvv,
  });
}
