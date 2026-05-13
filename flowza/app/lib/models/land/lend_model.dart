import 'package:hive/hive.dart';
part 'lend_model.g.dart';

@HiveType(typeId: 1)
class LendModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  int amount;
  @HiveField(2)
  String currency;
  @HiveField(3)
  bool isPaid;
  @HiveField(4)
  DateTime lendDate;
  @HiveField(5)
  DateTime returnDate;
  @HiveField(6)
  int notificationId;

  LendModel({
    required this.name,
    required this.amount,
    required this.currency,
    required this.isPaid,
    required this.lendDate,
    required this.returnDate,
    required this.notificationId,
  });
  LendModel copyWith({
    String? name,
    int? amount,
    String? currency,
    bool? isPaid,
    DateTime? lendDate,
    DateTime? returnDate,
    int? notificationId,
  }) {
    return LendModel(
      name: name ?? this.name,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      isPaid: isPaid ?? this.isPaid,
      lendDate: lendDate ?? this.lendDate,
      returnDate: returnDate ?? this.returnDate,
      notificationId: notificationId ?? this.notificationId,
    );
  }
}
