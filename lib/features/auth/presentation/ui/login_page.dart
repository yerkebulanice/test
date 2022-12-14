import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/core/custom_button/custom_button.dart';
import 'package:test_task/core/custom_snackbar/custom_snackbar.dart';
import 'package:test_task/core/custom_textfield/custom_text_field.dart';
import 'package:test_task/core/service_locator_manager.dart';
import 'package:test_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:test_task/features/auth/presentation/ui/registration_page.dart';
import 'package:test_task/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final AuthBloc _authBloc;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _authBloc = globalSL<AuthBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }

  void clearControllers() {
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: _authBloc,
        listener: (context, state) async {
          if (state is FailureAuthState) {
            clearControllers();
            showCustomSnackBar(context: context, title: state.message);
          }
          if (state is SignInState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(accessToken: state.signInEntity.accessToken),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is LoadingAuthState) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomTextField(controller: _emailController, labelText: 'Email'),
                CustomTextField(controller: _passwordController, labelText: 'Password'),
                CustomButton(
                  text: 'Sign In',
                  onPressed: () {
                    _authBloc.add(SignInEvent(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ));
                  },
                  width: double.infinity,
                ),
                CustomButton(
                  text: 'Sign Up',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegistrationPage()),
                    );
                  },
                  height: 50,
                  width: 200,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
