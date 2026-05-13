part of 'bank_cubit.dart';

sealed class BankState {}

final class BankInitial extends BankState {}

final class BankRemoved extends BankState {}

final class BankError extends BankState {
  final String error;
  BankError(this.error);
}

final class BankAdded extends BankState {
  final BankModel bank;
  BankAdded(this.bank);
}

final class BankCategoryUpdated extends BankState {
  final int selectedCategory;
  BankCategoryUpdated(this.selectedCategory);
}
