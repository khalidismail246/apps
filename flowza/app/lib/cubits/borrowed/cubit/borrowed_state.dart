part of 'borrowed_cubit.dart';

@immutable
sealed class BorrowedState {}

final class BorrowedInitial extends BorrowedState {}

final class BorrowedUpdated extends BorrowedState {}

final class BorrowedError extends BorrowedState {
  final String error;
  BorrowedError(this.error);
}

final class BorrowedCategoryUpdated extends BorrowedState {
  final int selectedCategory;
  BorrowedCategoryUpdated(this.selectedCategory);
}

final class BorrowedAdded extends BorrowedState {
  final BorrowedModel borrowed;
  BorrowedAdded(this.borrowed);
}

final class BorrowedRemoved extends BorrowedState {}

final class BorrowedSelectedPaid extends BorrowedState {
  final BorrowedModel borrowed;
  BorrowedSelectedPaid(this.borrowed);
}
