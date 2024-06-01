import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:verifactai/src/common/widgets/text_fileds/name_email_pass.dart';
import 'package:verifactai/src/content/app_content.dart';
import 'package:verifactai/src/features/sign/providers/sign_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  bool isobscureText = true;

  @override
  Widget build(BuildContext context) {
    final signProvider = Provider.of<SignProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        // foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(0),
        title: const Text(
          AppContent.appName,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: ListView(
            children: [
              Center(
                  child: Icon(
                Icons.app_registration,
                size: 150,
                color: Theme.of(context).colorScheme.primary,
              )),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RegisterWidgets(
                  formKey: formKey,
                  signProvider: signProvider,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Email
// Password
// Login Button

class RegisterWidgets extends StatefulWidget {
  const RegisterWidgets({
    super.key,
    required this.formKey,
    required this.signProvider,
  });

  final GlobalKey<FormState> formKey;
  final SignProvider signProvider;

  @override
  State<RegisterWidgets> createState() => _RegisterWidgetsState();
}

class _RegisterWidgetsState extends State<RegisterWidgets> {
  bool _isLoading = false;

  Future<void> _signIn() async {
    HapticFeedback.lightImpact();
    setState(() {
      _isLoading = true;
    });
    if (widget.formKey.currentState!.validate()) {
      if (widget.signProvider.password == widget.signProvider.confirmPassword) {
        await widget.signProvider.signUp(
          widget.signProvider.userName,
          widget.signProvider.password,
          context,
        );
      } else {
        widget.signProvider.errorMessage = 'Գաղտնաբառերը տարբերվում են';
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          UserNameTextField(
            validatorText: 'Խնդրում ենք մուտքագրել ձեր մուտքանունը',
            labelText: 'Մուտքանունը',
            signProvider: widget.signProvider,
          ),
          const SizedBox(height: 8.0),
          PasswordTextField(
            labelText: 'Գաղտնաբառ',
            validatorText: 'Խնդրում ենք մուտքագրել ձեր գաղտնաբառը',
            signProvider: widget.signProvider,
          ),
          const SizedBox(height: 8.0),
          ConfirmPasswordTextField(
            labelText: 'հաստատեք ձեր գաղտնաբառը',
            validatorText: 'Խնդրում ենք հաստատել ձեր գաղտնաբառը',
            signProvider: widget.signProvider,
          ),
          const SizedBox(height: 8.0),
          const SizedBox(height: 30.0),
          TextButton.icon(
            icon: const Icon(Icons.app_registration),
            style: ButtonStyle(
                foregroundColor: const WidgetStatePropertyAll(Colors.white),
                fixedSize: const WidgetStatePropertyAll<Size>(Size(270, 50)),
                backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.primary)),
            onPressed: _isLoading ? null : _signIn,
            label: _isLoading
                ? const CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : const Text('Գրանցվել'),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Արդեն գրանցված եք՞'),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/signin');
                },
                child: const Text(
                  'Մուտք',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
