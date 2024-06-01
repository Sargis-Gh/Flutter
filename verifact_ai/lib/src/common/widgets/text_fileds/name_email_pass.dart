import 'package:flutter/material.dart';
import 'package:verifactai/src/common/widgets/text_fileds/base_text_field.dart';
import 'package:verifactai/src/features/sign/providers/sign_provider.dart';

// class NameTextField extends StatelessWidget {
//   final SignProvider signProvider;
//   final String validatorText;
//   final String labelText;

//   const NameTextField({
//     super.key,
//     required this.signProvider,
//     required this.validatorText,
//     required this.labelText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BaseTextField(
//       labelText: labelText,
//       validatorText: validatorText,
//       signProvider: signProvider,
//       onChanged: (value) {
//         signProvider.userName = value;
//       },
//     );
//   }
// }

// class EmailTextField extends StatelessWidget {
//   final SignProvider signProvider;
//   final String validatorText;
//   final String labelText;

//   const EmailTextField({
//     super.key,
//     required this.signProvider,
//     required this.validatorText,
//     required this.labelText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BaseTextField(
//       labelText: labelText,
//       validatorText: validatorText,
//       signProvider: signProvider,
//       onChanged: (value) {
//         signProvider.email = value;
//       },
//     );
//   }
// }

class Decoration {}

class UserNameTextField extends StatelessWidget {
  final SignProvider signProvider;
  final String validatorText;
  final String labelText;

  const UserNameTextField({
    super.key,
    required this.signProvider,
    required this.validatorText,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      labelText: labelText,
      validatorText: validatorText,
      signProvider: signProvider,
      onChanged: (value) {
        signProvider.userName = value;
      },
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final SignProvider signProvider;
  final String validatorText;
  final String labelText;

  const PasswordTextField({
    super.key,
    required this.signProvider,
    required this.validatorText,
    required this.labelText,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isObscureText = true;

  void toggleObscureText() {
    setState(() {
      isObscureText = !isObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      labelText: widget.labelText,
      validatorText: widget.validatorText,
      signProvider: widget.signProvider,
      isPassword: true,
      isObscure: isObscureText,
      onChanged: (value) {
        widget.signProvider.password = value;
      },
      toggleObscureText: toggleObscureText,
    );
  }
}

class ConfirmPasswordTextField extends StatefulWidget {
  final SignProvider signProvider;
  final String validatorText;
  final String labelText;

  const ConfirmPasswordTextField({
    super.key,
    required this.signProvider,
    required this.validatorText,
    required this.labelText,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ConfirmPasswordTextFieldState createState() =>
      _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
  bool isObscureText = true;

  void toggleObscureText() {
    setState(() {
      isObscureText = !isObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      labelText: widget.labelText,
      validatorText: widget.validatorText,
      signProvider: widget.signProvider,
      isPassword: true,
      isObscure: isObscureText,
      onChanged: (value) {
        widget.signProvider.confirmPassword = value;
      },
      toggleObscureText: toggleObscureText,
    );
  }
}
