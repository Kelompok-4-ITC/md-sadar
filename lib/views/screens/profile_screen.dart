import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sadar_app/models/user_model.dart';
import 'package:sadar_app/routes/route_name.dart';
import 'package:sadar_app/services/services.dart';
import 'package:sadar_app/views/pages/info_personal_page.dart';
import 'dart:math' as math;

import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(bottom: 24),
        color: const Color(0xFF1AB66C).withOpacity(0.05),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 24),
              color: Colors.white,
              width: double.maxFinite,
              child: const Text(
                "Profile",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: Colors.white,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 260,
                        color: Colors.transparent,
                      ),
                      Container(
                        height: 200,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: const Color(0xFF3D9970),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            'https://www.faithinnature.co.uk/cdn/shop/articles/JanuaryBlues2.jpg?v=1641828814',
                            fit: BoxFit.fitWidth,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 120,
                          height: 120,
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3D9970),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              'https://imge.com/wp-content/uploads/2016/04/Ethan-Eilon_.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: (MediaQuery.of(context).size.width / 2) - 60,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color(0xFF3D9970),
                          ),
                          child: const Icon(
                            Icons.edit_sharp,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFC0FFE3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'ITC - 4 (Driver)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        const SizedBox(height: 5),
                        Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Positioned(
                              child: Transform.rotate(
                                angle: math.pi / 4,
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  color: const Color(0xFF3D9970),
                                ),
                              ),
                            ),
                            Positioned(
                              child: Container(
                                height: 4,
                                width: MediaQuery.of(context).size.width - 60,
                                color: const Color(0xFF3D9970),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: Transform.rotate(
                                angle: math.pi / 4,
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  color: const Color(0xFF3D9970),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Pahlawan Bumi',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    _listButton(
                      context: context,
                      logoIcon: Icons.newspaper,
                      info: 'Informasi Personal',
                      onTap: () async {
                        var res = await Services().getData('/user/fetch-user');
                        var body = json.decode(res.body);
                        print(body);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InfoPersonalPage(
                              userData: UserModel(
                                fullName: body['loggedUser']['fullName'] ?? '',
                                userName: body['loggedUser']['userName'] ?? '',
                                email: body['loggedUser']['email'] ?? '',
                                noHP: body['loggedUser']['noHP'] ?? '',
                                alamat: body['loggedUser']['alamat'] ?? '',
                                jenisKelamin:
                                    body['loggedUser']['jenisKelamin'] ?? '',
                                tglLahir:
                                    body['loggedUser']['tanggalLahir'] ?? '',
                                tglGabung:
                                    body['loggedUser']['tanggalGabung'] ?? '',
                                fotoProfile:
                                    body['loggedUser']['fotoProfile'] ?? '',
                                role: body['loggedUser']['role']['namaRole'] ??
                                    '',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    _listButton(
                      context: context,
                      logoIcon: Icons.history,
                      info: 'Riwayat Transaksi',
                    ),
                    const SizedBox(height: 15),
                    _listButton(
                      context: context,
                      logoIcon: Icons.question_answer_rounded,
                      info: 'Pertanyaan dan Bantuan',
                    ),
                    const SizedBox(height: 15),
                    _listButton(
                      context: context,
                      logoIcon: Icons.star,
                      info: 'Pencapaian',
                    ),
                    const SizedBox(height: 15),
                    _listButton(
                      context: context,
                      logoIcon: Icons.settings,
                      info: 'Pengaturan',
                    ),
                    const SizedBox(height: 15),
                    _listButton(
                        context: context,
                        logoIcon: Icons.logout,
                        info: 'Logout',
                        onTap: () async {
                          SharedPreferences local =
                              await SharedPreferences.getInstance();
                          local.remove('token');
                          if (context.mounted) {
                            Navigator.pushReplacementNamed(
                                context, RouteNames.login);
                          }
                        }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _listButton({
    required BuildContext context,
    required IconData logoIcon,
    required String info,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
          color: Colors.white,
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Icon(
              logoIcon,
              color: Colors.grey,
              size: 30,
            ),
            Positioned(
              left: 42,
              child: Text(
                info,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            const Positioned(
              right: 0,
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
