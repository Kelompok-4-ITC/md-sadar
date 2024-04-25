import 'package:flutter/material.dart';
import 'package:sadar_app/views/pages/check_data_page.dart';
import 'package:sadar_app/views/widget/scaffold_custom.dart';

class ChooseLocPage extends StatelessWidget {
  const ChooseLocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold.defaultScaffold(
      context: context,
      label: 'Drop Off',
      content: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: ListView(
          children: [
            const Text(
              'Pilih Alamat Tujuan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Silahkan pilih alamat yang akan dituju!',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
              ),
            ),
            const SizedBox(height: 15),
            _listLoc(),
            const SizedBox(height: 15),
            _listLoc(),
            const SizedBox(height: 15),
            _listLoc(),
            const SizedBox(height: 15),
            _listLoc(),
            const SizedBox(height: 15),
            _listLoc(),
            const SizedBox(height: 15),
            Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckDataPage(
                        isPickUp: false,
                      ),
                    ),
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
                    color: const Color(0xFF54BB8D),
                  ),
                  child: const Text(
                    "Lanjut",
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
          ],
        ),
      ),
    );
  }

  Widget _listLoc() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFF9F7F7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 3,
            offset: const Offset(-1, 2), // Shadow position
          ),
        ],
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.location_pin,
              color: Color(0xFF54BB8D),
              size: 30,
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pak Jhon - Jln. Babarsari',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  'Jalan Babarsari, Caturtunggal, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281',
                  maxLines: 5,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 3),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Link Google Maps',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF19553A),
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
