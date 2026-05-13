part of 'lend_cubit.dart';

@immutable
sealed class LendState {}

final class LendInitial extends LendState {}

final class LendAdded extends LendState {
  final LendModel lend;
  LendAdded(this.lend);
}

final class LendRemoved extends LendState {}

final class LendCategoryUpdated extends LendState {
  final int selectedCategory;
  LendCategoryUpdated(this.selectedCategory);
}

final class LendPaidSelected extends LendState {
  final LendModel lend;
  LendPaidSelected(this.lend);
}
