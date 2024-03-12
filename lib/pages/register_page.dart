import 'package:flutter/material.dart';

class _RegisterVariable {
  static var usernameController = TextEditingController();
  static var emailController = TextEditingController();
  static var passwordController = TextEditingController();
  static var noHpController = TextEditingController();
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.topLeft,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Material(
                color: const Color(0xFF3D9970),
                shape: const CircleBorder(),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  customBorder: const CircleBorder(),
                  child: Ink(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    height: 42,
                    width: 42,
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Register',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                decoration: TextDecoration.none,
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
                    text: 'Buat akun ',
                  ),
                  TextSpan(
                    text: 'Sadar',
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
              height: 16,
            ),
            const _RegisterForm(),
            const SizedBox(
              height: 30,
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
                  'Register',
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
                  'Sudah punya akun?',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFEB5757),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
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
                      'Atau Sign Up dengan',
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
              height: 30,
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({super.key});

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  bool _isVisible = false;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _RegisterVariable.usernameController,
          textInputAction: TextInputAction.next,
          decoration: _decorationForm(false,
              label: 'Username', hint: 'Masukkan username anda'),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: _RegisterVariable.emailController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          decoration: _decorationForm(false,
              label: 'Email', hint: 'Masukkan email anda'),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: _RegisterVariable.passwordController,
          textInputAction: TextInputAction.next,
          obscureText: !_isVisible,
          decoration: _decorationForm(true,
              label: 'Password', hint: 'Masukkan password anda'),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: _RegisterVariable.noHpController,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.number,
          decoration: _decorationForm(false,
              label: 'Nomor HP', hint: 'Masukkan nomor hp anda'),
        ),
        const SizedBox(
          height: 20,
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
