import 'package:flowza/models/land/lend_model.dart';
import 'package:flowza/services/notification_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'lend_state.dart';

class LendCubit extends Cubit<LendState> {
  LendCubit() : super(LendInitial());
  Box<LendModel> box = Hive.box<LendModel>('lends');
  int selectedCategory = 0;
  //add lend
  void addLend(LendModel lend) {
    box.add(lend);
    emit(LendAdded(lend));
  }

  // remove lend
  void removeLend(int index, int notificationId) {
    box.deleteAt(index);
    NotificationServices.cancelNotification(notificationId);
    emit(LendRemoved());
  }

  // calculate total
  Map<String, int> calculatTotal(List<LendModel> lends) {
    Map<String, int> total = {};
    for (var item in lends) {
      total[item.currency] = (total[item.currency] ?? 0) + item.amount;
    }
    return total;
  }

  // select category
  void selectCategory(int index) {
    selectedCategory = index;
    emit(LendCategoryUpdated(selectedCategory));
  }

  // select paid lend
  void selectPaidLend(int index, LendModel lend) {
    final updatedLend = lend.copyWith(isPaid: !lend.isPaid);
    box.putAt(index, updatedLend);
    emit(LendPaidSelected(updatedLend));
  }
}
