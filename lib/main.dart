import 'package:flutter/material.dart';
import 'package:hive_db/model/transaction.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize hive db
  await Hive.initFlutter();
  // register adapter
  Hive.registerAdapter(TransactionAdapter());
  // open hive box
  await Hive.openBox<Transaction>('transaction');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
