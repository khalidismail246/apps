import 'package:hive/hive.dart';
part 'borrowed_model.g.dart';

@HiveType(typeId: 0)
class BorrowedModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int amount;
  @HiveField(2)
  final String currency;
  @HiveField(3)
  final bool isPaid;
  @HiveField(4)
  final DateTime borrowedDate;
  @HiveField(5)
  final DateTime returnDate;
  @HiveField(6)
  int notificationId;

  BorrowedModel({
    required this.name,
    required this.amount,
    required this.currency,
    required this.isPaid,
    required this.borrowedDate,
    required this.returnDate,
    required this.notificationId,
  });
  BorrowedModel copyWith({
    String? name,
    int? amount,
    String? currency,
    bool? isPaid,
    DateTime? borrowedDate,
    DateTime? returnDate,
    int? notificationId,
  }) {
    return BorrowedModel(
      name: name ?? this.name,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      isPaid: isPaid ?? this.isPaid,
      borrowedDate: borrowedDate ?? this.borrowedDate,
      returnDate: returnDate ?? this.returnDate,
      notificationId: notificationId ?? this.notificationId,
    );
  }
}
