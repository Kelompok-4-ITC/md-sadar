import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sadar_app/routes/route_name.dart';
import 'package:sadar_app/services/services.dart';
import 'package:sadar_app/views/widget/text_field_form.dart';
import 'package:sadar_app/views/widget/toggle_button.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _SecondRegisterVariable {
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

class SecondRegister extends StatelessWidget {
  final String uName;
  final String email;
  final String password;
  const SecondRegister(
      {super.key,
      required this.uName,
      required this.email,
      required this.password});

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
            Text(
              'Silahkan isi data anda',
              style: _SecondRegisterVariable._mainText(
                16,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            _SecondRegisterForm(
              uName: uName,
              email: email,
              password: password,
            ),
          ],
        ),
      ),
    );
  }
}

class _SecondRegisterForm extends StatefulWidget {
  final String uName;
  final String email;
  final String password;

  const _SecondRegisterForm(
      {super.key,
      required this.uName,
      required this.email,
      required this.password});

  @override
  State<_SecondRegisterForm> createState() => __SecondRegisterFormState();
}

class __SecondRegisterFormState extends State<_SecondRegisterForm> {
  bool _isChecked = false;

  bool _validateFullName = false;
  bool _validateBirthDate = false;
  bool _validatePhoneNumber = false;

  final _fullNameTextField = CustomTextVield(
    textAction: TextInputAction.next,
    textType: TextInputType.name,
    label: 'Nama Lengkap',
    hint: 'Masukkan nama lengkap,',
  );
  final _birthDayTextField = CustomTextVield(
    label: 'Tanggal lahir',
    suffixIcon: const Icon(
      Icons.calendar_today_outlined,
      color: Color(0xFF112211),
    ),
  );
  final _phoneTextField = CustomTextVield(
    textAction: TextInputAction.done,
    textType: TextInputType.phone,
    label: 'Nomor Handphone',
    hint: 'Masukkan nomor handphone',
  );

  final List<String> _dataRole = ['Customer', 'Driver'];

  String message = '';
  String role = 'Customer';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fullNameTextField.generateNormalWidget(
          validation: _validateFullName,
        ),
        const SizedBox(
          height: 24,
        ),
        _birthDayTextField.generateReadOnlyWidget(
          validation: _validateBirthDate,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: _birthDayTextField.getController.text.isEmpty
                  ? DateTime.now()
                  : DateFormat('yyyy-MM-dd')
                      .parse(_birthDayTextField.getController.text),
              firstDate: DateTime(DateTime.now().year - 100),
              lastDate: DateTime.now(),
            );
            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              setState(() {
                _birthDayTextField.getController.text = formattedDate;
              });
            }
          },
        ),
        const SizedBox(
          height: 24,
        ),
        _phoneTextField.generateNormalWidget(
          validation: _validatePhoneNumber,
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          'Memilih Sebagai',
          style: _SecondRegisterVariable._mainText(14, color: Colors.black),
        ),
        const SizedBox(
          height: 16,
        ),
        AnimatedToggle(
          values: _dataRole,
          onToggleCallback: (value) {
            setState(() {
              role = _dataRole[value];
            });
          },
          buttonColor: const Color(0xFF79747E),
          backgroundColor: const Color(0xFFFFFFFF),
          textColor: const Color(0xFFFFFFFF),
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
            SizedBox(
              width: MediaQuery.of(context).size.width - 120,
              child: Text(
                'Saya setuju dengan syarat dan ketentuan',
                style: _SecondRegisterVariable._mainText(14),
                maxLines: 2,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
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
                _validateFullName =
                    _fullNameTextField.getController.text.isEmpty;
                _validateBirthDate =
                    _birthDayTextField.getController.text.isEmpty;
                _validatePhoneNumber =
                    _phoneTextField.getController.text.isEmpty;

                if (_validateFullName ||
                    _validateBirthDate ||
                    _validatePhoneNumber) {
                  _fullNameTextField.setErrorMessage('Data wajib diisi!');
                  _birthDayTextField.setErrorMessage('Data wajib diisi!');
                  _phoneTextField.setErrorMessage('Data wajib diisi!');
                } else if (_phoneTextField.getController.text.length < 10) {
                  _validatePhoneNumber = true;
                  _phoneTextField.setErrorMessage(
                      'Nomor HP Anda tidak valid. Mohon cek kembali');
                } else {
                  _registerProcess(
                    widget.uName,
                    widget.email,
                    widget.password,
                    role,
                    _fullNameTextField.getController.text,
                    _birthDayTextField.getController.text,
                    _phoneTextField.getController.text,
                  );
                }
              });
            },
            child: Text(
              'Daftar',
              style: _SecondRegisterVariable._mainText(14, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  void _registerProcess(String uName, String email, String pass, String role,
      String fullName, String tglLahir, String noHp) async {
    //Data Post
    var data = {
      'userName': uName,
      'email': email,
      'password': pass,
      'role': role,
      'fullName': fullName,
      'tanggalLahir': tglLahir,
      'noHP': noHp,
    };

    //Call API
    var res = await Services().auth(data, '/register');
    var body = json.decode(res.body);
    var status = res.statusCode;

    //Check Response
    if (status >= 200 && status < 300) {
      SharedPreferences local = await SharedPreferences.getInstance();
      local.setString('token', json.encode(body['token']));
      if (mounted) {
        Navigator.pushReplacementNamed(context, RouteNames.home);
      }
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(
              Icons.error_outline,
              size: 50,
            ),
            iconColor: Colors.red,
            title: const Text('GAGAL'),
            content: const Text(
                'Username, email, atau noHP sudah dipakai. Mohon cek kembali'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
    setState(() {});
  }
}
