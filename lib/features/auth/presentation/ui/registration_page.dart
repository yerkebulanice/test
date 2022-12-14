import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/core/custom_button/custom_button.dart';
import 'package:test_task/core/custom_snackbar/custom_snackbar.dart';
import 'package:test_task/core/custom_textfield/custom_text_field.dart';
import 'package:test_task/core/service_locator_manager.dart';
import 'package:test_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:test_task/features/auth/presentation/ui/login_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final AuthBloc _authBloc;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

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
    _usernameController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _phoneController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registration")),
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: _authBloc,
        listener: (context, state) {
          if (state is FailureAuthState) {
            clearControllers();
            showCustomSnackBar(context: context, title: state.message);
          }
          if (state is SignUpState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is LoadingAuthState) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomTextField(controller: _usernameController, labelText: "Username"),
                CustomTextField(controller: _firstNameController, labelText: "First Name"),
                CustomTextField(controller: _lastNameController, labelText: "Last Name"),
                CustomTextField(controller: _passwordController, labelText: "Password"),
                CustomTextField(controller: _emailController, labelText: "Email"),
                CustomTextField(controller: _phoneController, labelText: "Phone"),
                CustomButton(
                  text: 'Sign Up',
                  onPressed: () {
                    _authBloc.add(SignUpEvent(
                      username: _usernameController.text,
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      password: _passwordController.text,
                      email: _emailController.text,
                      phone: _phoneController.text,
                    ));
                  },
                  width: double.infinity,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
