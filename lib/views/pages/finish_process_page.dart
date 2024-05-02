import 'package:flutter/material.dart';
import 'package:sadar_app/routes/route_name.dart';
import 'package:sadar_app/views/widget/scaffold_custom.dart';

class FinishProcessPage extends StatelessWidget {
  final String title;
  const FinishProcessPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold.defaultScaffold(
      context: context,
      label: title,
      canBack: false,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              title == 'Pick Up'
                  ? 'images/badge-sukses.png'
                  : 'images/badge-tunggu.png',
              width: 125,
              height: 125,
            ),
            const SizedBox(height: 25),
            Text(
              title == 'Pick Up'
                  ? 'Pesanan Telah Berhasil'
                  : 'Pesanan Tahap Satu Berhasil',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title == 'Pick Up'
                  ? 'Silahkan Menunggu Driver'
                  : 'Silahkan Mengantar ke Tujuan',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Montserrat',
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 25),
            Material(
              child: InkWell(
                onTap: () {},
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Ink(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFF54BB8D),
                  ),
                  child: const Text(
                    'Melihat Proses',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Material(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteNames.home,
                    ModalRoute.withName(RouteNames.home),
                  );
                },
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Ink(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFF54BB8D),
                      width: 2,
                    ),
                    color: Colors.white,
                  ),
                  child: const Text(
                    'Kembali ke Menu',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ], 
        ),
      ),
    );
  }
}
