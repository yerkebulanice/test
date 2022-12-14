import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/config/network/custom_dio.dart';
import 'package:test_task/core/service_locator_manager.dart';
import 'package:test_task/features/auth/auth_sl.dart';
import 'package:test_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:test_task/features/auth/presentation/ui/login_page.dart';

void main() async {
  await const MyApp().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(title: 'Test Task', home: LoginPage());

  Future<void> init() async {
    await ServiceLocatorManager.init(
      services: [
        AuthServiceLocator(),
        CustomAuthDio(backendUrl: "https://dasta.vilion-k.ru/api/v1"),
      ],
    );
  }
}
