import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/app_nav/ui/nav_menu_screen.dart';
import 'package:test_project/core/utils/app_color.dart';
import 'package:test_project/core/utils/widgets/custom_elevated_button.dart';
import 'package:test_project/core/utils/widgets/custom_text_form_field.dart';
import 'package:test_project/core/vaildator/auth_vaildator.dart';
import 'package:test_project/modules/auth/login/controller/cubit.dart';
import 'package:test_project/modules/auth/login/controller/states.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                controller: _emailController,
                labelText: 'Email',
                icon: Icons.email,
                validator: Validators.emailValidator,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: _passwordController,
                labelText: 'Password',
                icon: Icons.lock,
                obscureText: true,
                validator: Validators.passwordValidator,
              ),
              const SizedBox(height: 16),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  } else if (state is AuthSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Sign Up Successful')),
                    );
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const CircularProgressIndicator();
                  }

                  return CustomElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        context.read<AuthCubit>().signUp(email, password).then((value) => Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const NavMenuScreen())));
                      }
                    },
                    text: 'Sign Up',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
