import 'package:bloc/bloc.dart';
import 'package:flowza/models/bank/bank_model.dart';
import 'package:flowza/services/notification_services.dart';
import 'package:hive/hive.dart';
part 'bank_state.dart';

class BankCubit extends Cubit<BankState> {
  BankCubit() : super(BankInitial());
  Box<BankModel> box = Hive.box<BankModel>('banks');
  int selectedCategory = 0;
  // add bank
  void addBank(BankModel bank) {
    try {
      box.add(bank);
    } catch (e) {
      emit(BankError(e.toString()));
    }
    emit(BankAdded(bank));
  }

  // remove bank
  void removeBank(int index, int notificationId) {
    try {
      box.deleteAt(index);
      NotificationServices.cancelNotification(notificationId);
    } catch (e) {
      emit(BankError(e.toString()));
    }
    emit(BankRemoved());
  }

  Map<String, int> calculatTotal(List<BankModel> banks) {
    Map<String, int> total = {};
    for (var bank in banks) {
      total[bank.currency] = (total[bank.currency] ?? 0) + bank.money;
    }
    return total;
  }

  void selectCategory(int index) {
    selectedCategory = index;
    emit(BankCategoryUpdated(selectedCategory));
  }
}
