import 'package:flowza/cubits/bank/cubit/bank_cubit.dart';
import 'package:flowza/cubits/borrowed/cubit/borrowed_cubit.dart';
import 'package:flowza/cubits/lend/cubit/lend_cubit.dart';
import 'package:flowza/services/hive_services.dart';
import 'package:flowza/services/notification_services.dart';
import 'package:flowza/views/bank_view.dart';
import 'package:flowza/views/borrowed_view.dart';
import 'package:flowza/views/lend_view.dart';
import 'package:flowza/views/splach_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  final timezone = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timezone.identifier));
  await HiveServices.initHiveServices();
  await NotificationServices.init();
  await NotificationServices.requestPermission();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BorrowedCubit()),
        BlocProvider(create: (context) => LendCubit()),
        BlocProvider(create: (context) => BankCubit()),
      ],
      child: const FlowzaApp(),
    ),
  );
}

class FlowzaApp extends StatelessWidget {
  const FlowzaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplachView.id,
      routes: {
        SplachView.id: (context) => const SplachView(),
        BorrowedView.id: (context) => const BorrowedView(),
        LendView.id: (context) => const LendView(),
        BankView.id: (context) => const BankView(),
      },
    );
  }
}
