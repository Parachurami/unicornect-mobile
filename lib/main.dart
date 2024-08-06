import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:unicornect/app/my_app.dart';

void main() async{
  await Hive.initFlutter();
  var box = await Hive.openBox("misc_data");
  runApp(const ProviderScope(child: MyApp()));
}

