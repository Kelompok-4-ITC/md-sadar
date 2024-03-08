import 'package:flutter/material.dart';

class _LoginVariable {
  static var usernameController = TextEditingController();
  static var passwordController = TextEditingController();
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: Color(0xFF112211),
                ),
                children: [
                  TextSpan(
                    text: 'Login untuk mengakses akun ',
                  ),
                  TextSpan(
                    text: 'SDU',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: ' Anda.',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            const _LoginForm(),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm({super.key});

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  _LoginFormState();

  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _LoginVariable.usernameController,
          textInputAction: TextInputAction.next,
          decoration: _decorationForm(false,
              label: 'Username', hint: 'Masukkan username anda'),
        ),
        const SizedBox(
          height: 24,
        ),
        TextField(
          controller: _LoginVariable.passwordController,
          textInputAction: TextInputAction.done,
          obscureText: !_isVisible,
          decoration: _decorationForm(true,
              label: 'Password', hint: 'Masukkan password anda'),
        ),
      ],
    );
  }

  InputDecoration _decorationForm(bool isPass,
      {String label = 'Username', String hint = 'Masukkan username anda'}) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      labelText: label,
      hintText: hint,
      hintStyle: const TextStyle(
        fontWeight: FontWeight.normal,
      ),
      suffixIcon: isPass
          ? InkWell(
              onTap: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              child: Icon(
                _isVisible ? Icons.visibility_off : Icons.visibility,
                color: const Color(0xFF112211),
              ),
            )
          : null,
    );
  }
}
