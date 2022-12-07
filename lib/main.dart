import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  Future<void> init() async => await ServiceLocatorManager.init(services: [AuthServiceLocator()]);
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    globalSL<AuthBloc>().add(SignInEvent(email: "erkebulanice@gmail.com", password: "qwerty123"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test Task")),
      body: BlocBuilder(
        builder: (context, state) {
          if (state is LoadingAuthState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FailureAuthState) {
            return Center(child: Text(state.message));
          }
          if (state is SignInState) {
            return Center(
              child: Text(
                'YOU SUCCESSFULLY SIGNED IN(your token): ${state.signInEntity.accessToken}',
              ),
            );
          }

          return Container();
        },
        bloc: globalSL<AuthBloc>(),
      ),
    );
  }
}
