import 'package:hive/hive.dart';
part 'bank_model.g.dart';

@HiveType(typeId: 2)
class BankModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int money;
  @HiveField(2)
  final String currency;
  @HiveField(3)
  final double benefit;
  @HiveField(4)
  final String certificateType;
  @HiveField(5)
  final DateTime startDate;
  @HiveField(6)
  final DateTime endDate;
  @HiveField(7)
  final int profit;
  @HiveField(8)
  final int notificationId;

  BankModel({
    required this.name,
    required this.money,
    required this.benefit,
    required this.certificateType,
    required this.startDate,
    required this.endDate,
    required this.profit,
    required this.currency,
    required this.notificationId,
  });
}
