import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sadar_app/routes/route_name.dart';
import 'package:sadar_app/services/services.dart';
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

  final _fullNameController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  final List<String> _dataRole = ['Customer', 'Driver'];

  bool _validateFullName = false;
  bool _validateBirthDate = false;
  bool _validatePhoneNumber = false;

  String message = '';
  String role = 'Customer';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _fullNameController,
          textInputAction: TextInputAction.next,
          decoration: _decorationForm(
            _validateFullName,
            label: 'Nama Lengkap',
            hint: 'Masukkan nama lengkap',
            errorMessage: message,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        TextField(
          controller: _birthDateController,
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: _birthDateController.text.isEmpty
                  ? DateTime.now()
                  : DateFormat('yyyy-MM-dd').parse(_birthDateController.text),
              firstDate: DateTime(DateTime.now().year - 100),
              lastDate: DateTime.now(),
            );
            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              setState(() {
                _birthDateController.text = formattedDate;
              });
            }
          },
          textInputAction: TextInputAction.done,
          decoration: _decorationForm(
            _validateBirthDate,
            label: 'Tanggal Lahir',
            suffixIcon: const Icon(
              Icons.calendar_today_outlined,
              color: Color(0xFF112211),
            ),
            errorMessage: message,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        TextField(
          controller: _phoneNumberController,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.phone,
          decoration: _decorationForm(
            _validatePhoneNumber,
            label: 'Nomor Handphone',
            hint: 'Masukkan nomor handphone',
            errorMessage: message,
          ),
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
            Text(
              'Saya setuju dengan syarat dan ketentuan',
              style: _SecondRegisterVariable._mainText(14),
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
                _validateFullName = _fullNameController.text.isEmpty;
                _validateBirthDate = _birthDateController.text.isEmpty;
                _validatePhoneNumber = _phoneNumberController.text.isEmpty;

                if (_validateFullName ||
                    _validateBirthDate ||
                    _validatePhoneNumber) {
                  message = 'Data wajib diisi!';
                } else if (_phoneNumberController.text.length < 10) {
                  _validatePhoneNumber = true;
                  message = 'Nomor HP Anda tidak valid. Mohon cek kembali';
                } else {
                  _registerProcess(
                    widget.uName,
                    widget.email,
                    widget.password,
                    role,
                    _fullNameController.text,
                    _birthDateController.text,
                    _phoneNumberController.text,
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

    print(status);
    print(body);

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

  InputDecoration _decorationForm(bool validation,
      {String label = 'Username',
      String hint = '',
      Icon? suffixIcon,
      String errorMessage = 'Data wajib diisi!'}) {
    return InputDecoration(
      errorText: validation ? errorMessage : null,
      border: const OutlineInputBorder(),
      labelText: label,
      hintText: hint,
      hintStyle: const TextStyle(
        fontWeight: FontWeight.normal,
      ),
      suffixIcon: suffixIcon,
    );
  }
}
