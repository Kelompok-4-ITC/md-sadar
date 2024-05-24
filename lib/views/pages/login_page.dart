import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sadar_app/services/services.dart';
import 'package:sadar_app/routes/route_name.dart';
import 'package:sadar_app/views/widget/text_field_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _LoginVariable {
  static TextStyle _mainText(double? size,
      {Color color = const Color(0xFF112211)}) {
    return TextStyle(
      fontFamily: 'Montserrat',
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }
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
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Login untuk mengakses akun ',
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
              height: 48,
            ),
            _LoginForm(
              key: super.key,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tidak punya akun?',
                  style: _LoginVariable._mainText(14),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.register,
                    );
                  },
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Atau Login dengan',
                      textAlign: TextAlign.center,
                      style: _LoginVariable._mainText(14),
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
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm({super.key});

  @override
  State<_LoginForm> createState() => __LoginFormState();
}

class __LoginFormState extends State<_LoginForm> {
  bool _isVisible = false;
  bool _isChecked = false;

  bool _validateUname = false;
  bool _validatePass = false;

  final _uNameTextField = CustomTextVield(
    textAction: TextInputAction.next,
    label: 'Username',
    hint: 'Masukkan username anda',
  );
  final _passTextField = CustomTextVield(
    textAction: TextInputAction.done,
    label: 'Password',
    hint: 'Masukkan password anda',
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _uNameTextField.generateNormalWidget(
          validation: _validateUname,
        ),
        const SizedBox(
          height: 24,
        ),
        _passTextField.generatePasswordWidget(
          validation: _validatePass,
          isHide: !_isVisible,
          suffixIcon: InkWell(
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
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Checkbox(
              activeColor: const Color(0xFF54BB8D),
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
            Text(
              'Remember me',
              style: _LoginVariable._mainText(14),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
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
                _validateUname = _uNameTextField.getController.text.isEmpty;
                _validatePass = _passTextField.getController.text.isEmpty;

                _passTextField.setErrorMessage("Password tidak boleh kosong!");
                _uNameTextField.setErrorMessage("Username tidak boleh kosong!");

                if (!_validatePass && !_validateUname) {
                  _loginProcess(_uNameTextField.getController.text,
                      _passTextField.getController.text);
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
              child: Text(
                'Login',
                style: _LoginVariable._mainText(14, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _loginProcess(String uName, String pass) async {
    //Data Post
    var data = {
      'loginUser': uName,
      'password': pass,
    };

    //Call API
    var res = await Services().auth(data, '/login');
    var body = json.decode(res.body);
    var status = res.statusCode;

    //Check Response
    if (status == 200) {
      SharedPreferences local = await SharedPreferences.getInstance();
      local.setString('token', body['token']);
      if (mounted) {
        Navigator.pushReplacementNamed(context, RouteNames.home);
      }
    } else {
      _validatePass = true;
      _validateUname = true;
      _uNameTextField.setErrorMessage(body['message']);
      _passTextField.setErrorMessage(body['message']);
    }
    setState(() {});
  }
}
