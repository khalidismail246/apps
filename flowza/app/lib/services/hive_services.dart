import 'package:flowza/models/bank/bank_model.dart';
import 'package:flowza/models/borrowed/borrowed_model.dart';
import 'package:flowza/models/land/lend_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveServices {
  static Future<void> initHiveServices() async {
    await Hive.initFlutter();
    Hive.registerAdapter(BorrowedModelAdapter());
    await Hive.openBox<BorrowedModel>('borroweds');
    Hive.registerAdapter(LendModelAdapter());
    await Hive.openBox<LendModel>('lends');
    Hive.registerAdapter(BankModelAdapter());
    await Hive.openBox<BankModel>('banks');
  }
}
