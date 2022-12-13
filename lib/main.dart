import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/config/network/custom_dio.dart';
import 'package:test_task/core/service_locator_manager.dart';
import 'package:test_task/features/auth/auth_sl.dart';
import 'package:test_task/features/auth/presentation/bloc/auth_bloc.dart';

void main() async {
  await const MyApp().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(title: 'Test Task', home: Home());

  Future<void> init() async {
    await ServiceLocatorManager.init(
      services: [
        AuthServiceLocator(),
        CustomAuthDio(backendUrl: "https://dasta.vilion-k.ru/api/v1"),
      ],
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final AuthBloc bloc;

  @override
  void initState() {
    bloc = globalSL<AuthBloc>();
    bloc.add(SignInEvent(email: "erkebulan.gaziz@icloud.com", password: "Qwerty123"));
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test Task")),
      body: BlocBuilder<AuthBloc, AuthState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is LoadingAuthState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FailureAuthState) {
            return Center(child: Text(state.message));
          }
          if (state is SignInState) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  'YOU SUCCESSFULLY SIGNED IN(your token): ${state.signInEntity.accessToken}',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
