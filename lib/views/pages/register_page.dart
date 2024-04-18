import 'package:flutter/material.dart';
import 'package:sadar_app/views/pages/second_register_page.dart';

class _RegisterVariable {
  static TextStyle _mainText(double? size,
      {Color color = const Color(0xFF112211),
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
      fontFamily: 'Montserrat',
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    );
  }
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
                color: const Color(0xFF54BB8D),
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
                    child: const Icon(
                      size: 38,
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Register',
              style: _RegisterVariable._mainText(
                40,
                fontWeight: FontWeight.w600,
                color: Colors.black,
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
                ),
                children: [
                  TextSpan(
                    text: 'Buat akun ',
                  ),
                  TextSpan(
                    text: 'Sadar',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF297754),
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
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sudah punya akun?',
                  style: _RegisterVariable._mainText(14),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Log In',
                    style: _RegisterVariable._mainText(
                      14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFEB5757),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Atau Sign Up dengan',
                      textAlign: TextAlign.center,
                      style: _RegisterVariable._mainText(14),
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
  State<_RegisterForm> createState() => __RegisterFormState();
}

class __RegisterFormState extends State<_RegisterForm> {
  bool _isVisible = false;

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _validateUname = false;
  bool _validateEmail = false;
  bool _validatePass = false;

  String message = 'Data wajib diisi!';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _usernameController,
          textInputAction: TextInputAction.next,
          decoration: _decorationForm(
            false,
            _validateUname,
            label: 'Username',
            hint: 'Masukkan username anda',
            errorMessage: message,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: _emailController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          decoration: _decorationForm(
            false,
            _validateEmail,
            label: 'Email',
            hint: 'Masukkan email anda',
            errorMessage: message,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: _passwordController,
          textInputAction: TextInputAction.next,
          obscureText: !_isVisible,
          decoration: _decorationForm(
            true,
            _validatePass,
            label: 'Password',
            hint: 'Masukkan password anda',
            errorMessage: message,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 48,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF54BB8D),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
            onPressed: () {
              setState(() {
                _validateUname = _usernameController.text.isEmpty;
                _validateEmail = _emailController.text.isEmpty;
                _validatePass = _passwordController.text.isEmpty;

                if (_validateEmail || _validatePass || _validateUname) {
                  message = 'Data wajib diisi!';
                } else if (!_emailController.text.contains('@')) {
                  _validateEmail = true;
                  message = 'Tidak dapat membaca email';
                } else if (_passwordController.text.length < 5) {
                  _validatePass = true;
                  message = 'Password harus memiliki minimal 5 karakter';
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondRegister(
                        uName: _usernameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    ),
                  );
                }
              });
            },
            child: Text(
              'Lanjut',
              style: _RegisterVariable._mainText(14, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration _decorationForm(
    bool isPass,
    bool validation, {
    String label = 'Username',
    String hint = 'Masukkan username anda',
    String errorMessage = 'Data wajib diisi!',
  }) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      errorText: validation ? errorMessage : null,
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
