import 'package:flutter/material.dart';
import 'package:verifactai/src/features/sign/providers/sign_provider.dart';

class BaseTextField extends StatelessWidget {
  final String labelText;
  final String validatorText;
  final SignProvider signProvider;
  final bool isPassword;
  final bool isObscure;
  final Function(String)? onChanged;
  final VoidCallback? toggleObscureText;

  const BaseTextField({
    super.key,
    required this.labelText,
    required this.validatorText,
    required this.signProvider,
    this.isPassword = false,
    this.isObscure = false,
    this.onChanged,
    this.toggleObscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        errorText: signProvider.errorMessage.isEmpty
            ? null
            : signProvider.errorMessage,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: toggleObscureText,
              )
            : null,
      ),
      obscureText: isPassword && isObscure,
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        }
        return null;
      },
    );
  }
}
