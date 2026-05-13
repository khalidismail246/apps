import 'package:bloc/bloc.dart';
import 'package:flowza/models/borrowed/borrowed_model.dart';
import 'package:flowza/services/notification_services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'borrowed_state.dart';

class BorrowedCubit extends Cubit<BorrowedState> {
  BorrowedCubit() : super(BorrowedInitial());
  Box<BorrowedModel> box = Hive.box<BorrowedModel>('borroweds');
  int selectedCategory = 0;
  //add borrowed
  void addBorrowed(BorrowedModel borrowed) {
    try {
      box.add(borrowed);
    } catch (e) {
      emit(BorrowedError(e.toString()));
    }
    emit(BorrowedAdded(borrowed));
  }

  // remove borrowed
  void removeBorrowed(int index, int notificationId) {
    try {
      box.deleteAt(index);
      NotificationServices.cancelNotification(notificationId);
    } catch (e) {
      emit(BorrowedError(e.toString()));
    }
    emit(BorrowedRemoved());
  }

  Map<String, int> calculatTotal(List<BorrowedModel> borroweds) {
    Map<String, int> total = {};
    for (var item in borroweds) {
      total[item.currency] = (total[item.currency] ?? 0) + item.amount;
    }
    return total;
  }

  void selectCategory(int index) {
    selectedCategory = index;
    emit(BorrowedCategoryUpdated(selectedCategory));
  }

  // select paid borrowed
  void selectPaidBorrowed(int index, BorrowedModel borrowed) {
    try {
      final updatedBorrowed = borrowed.copyWith(isPaid: !borrowed.isPaid);
      box.putAt(index, updatedBorrowed);
    } catch (e) {
      emit(BorrowedError(e.toString()));
    }
    emit(BorrowedUpdated());
  }
}
