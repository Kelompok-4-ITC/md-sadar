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
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA2A2A7),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                onPressed: () {},
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Tidak punya akun?',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFEB5757),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width > 100
                      ? 1 / 4 * MediaQuery.of(context).size.width - 30
                      : 30,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width > 100
                      ? 1 / 2 * MediaQuery.of(context).size.width - 30
                      : 40,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Atau Login dengan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width > 100
                      ? 1 / 4 * MediaQuery.of(context).size.width - 30
                      : 30,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 56,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Image.asset(
                    'images/google.png',
                    height: 24,
                    width: 24,
                  )),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {},
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: const Text(
                'Login sebagai tamu',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
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
  bool _isChecked = false;

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
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = !_isChecked;
                });
              },
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              'Remember me',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        )
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
                setState(
                  () {
                    _isVisible = !_isVisible;
                  },
                );
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
