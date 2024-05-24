import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sadar_app/models/user_model.dart';
import 'package:sadar_app/services/services.dart';
import 'package:sadar_app/views/widget/text_field_form.dart';

class InfoPersonalPage extends StatefulWidget {
  final UserModel userData;
  const InfoPersonalPage({super.key, required this.userData});

  @override
  State<InfoPersonalPage> createState() => _InfoPersonalPageState();
}

class _InfoPersonalPageState extends State<InfoPersonalPage> {
  final bool _validateFullName = false;
  final bool _validateEmail = false;
  final bool _validateNoHP = false;
  final bool _validateAlamat = false;
  final bool _validateBirthDate = false;

  final _fullNameTextField = CustomTextVield(
    textAction: TextInputAction.next,
    label: 'Nama',
    hint: 'Masukkan nama anda',
    suffixIcon: const Icon(
      Icons.person,
    ),
  );
  final _emailTextField = CustomTextVield(
    textAction: TextInputAction.next,
    label: 'Email',
    hint: 'Masukkan email anda',
    suffixIcon: const Icon(
      Icons.email,
    ),
  );
  final _noHPTextField = CustomTextVield(
    textAction: TextInputAction.next,
    label: 'Nomor Telepon',
    hint: 'Masukkan nomor telepon anda',
    suffixIcon: const Icon(
      Icons.phone,
    ),
  );
  final _alamatTextField = CustomTextVield(
    textAction: TextInputAction.next,
    label: 'Alamat',
    hint: 'Masukkan alamat anda',
    suffixIcon: const Icon(
      Icons.location_pin,
    ),
  );
  final _birthDayTextField = CustomTextVield(
    label: 'Tanggal lahir',
    suffixIcon: const Icon(
      Icons.calendar_today_outlined,
    ),
  );

  @override
  void initState() {
    super.initState();
    _fullNameTextField.getController.text = widget.userData.fullName;
    _emailTextField.getController.text = widget.userData.email;
    _noHPTextField.getController.text = widget.userData.noHP;
    _alamatTextField.getController.text = widget.userData.alamat;
    _birthDayTextField.getController.text = widget.userData.tglLahir;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 35,
          ),
        ),
        title: const Text(
          'Informasi Personal',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var data = {
            'email': _emailTextField.getController.text,
            'fullName': _fullNameTextField.getController.text,
            'alamat': _alamatTextField.getController.text,
            'tanggalLahir': _birthDayTextField.getController.text,
            'jenisKelamin': 'Pria',
          };

          //Call API
          var res = await Services().putData(data, '/user/edit-user');
          var body = jsonDecode(res.body);
          print(body);
          if (res.statusCode == 200) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Data berhasil disimpan!"),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Data gagal disimpan!"),
            ));
          }

          Navigator.pop(context);

        },
        child: const Icon(Icons.save),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: ListView(
          children: [
            _fullNameTextField.generateNormalWidget(
              validation: _validateFullName,
            ),
            const SizedBox(
              height: 20,
            ),
            _emailTextField.generateNormalWidget(
              validation: _validateEmail,
            ),
            const SizedBox(
              height: 20,
            ),
            _noHPTextField.generateNormalWidget(
              validation: _validateNoHP,
            ),
            const SizedBox(
              height: 20,
            ),
            _alamatTextField.generateNormalWidget(
              validation: _validateAlamat,
            ),
            const SizedBox(
              height: 20,
            ),
            _birthDayTextField.generateReadOnlyWidget(
              validation: _validateBirthDate,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateFormat('yyyy-MM-dd')
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
          ],
        ),
      ),
    );
  }
}
